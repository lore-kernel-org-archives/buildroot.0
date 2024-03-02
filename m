Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0742C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 22:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A115140A01;
	Sat,  2 Mar 2024 22:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vOQM0KrcoCdF; Sat,  2 Mar 2024 22:22:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE36240A7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE36240A7A;
	Sat,  2 Mar 2024 22:22:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEC851BF57C
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B83D640491
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jM1KJF6EkOHY for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 22:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D22C840377
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D22C840377
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 22:22:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4654F87EE2; Sat,  2 Mar 2024 22:22:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Mar 2024 23:20:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6849d17cf4d65f3c8dcc986a7a68ce51619f8508
X-Git-Newrev: edde351cb8c13ffd54a369916da5f3f372edd4a2
X-Patchwork-Hint: ignore
Message-Id: <20240302222218.4654F87EE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/powertop: reorder variables in a
 more logical manner
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=edde351cb8c13ffd54a369916da5f3f372edd4a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Group _CONF_{ENV,OPTS} together after the autreconf ones.
Keep AUTORECONF=YES close to AUTORECONF_OPTS

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/powertop/powertop.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index a7a57939e0..aa7d251b90 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -17,11 +17,12 @@ POWERTOP_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
 	$(TARGET_NLS_DEPENDENCIES)
 
-POWERTOP_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 # 0001-add-disable-stack-protector-option.patch
-POWERTOP_AUTORECONF = YES
 POWERTOP_AUTOPOINT = YES
+POWERTOP_AUTORECONF = YES
 POWERTOP_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+
+POWERTOP_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 POWERTOP_CONF_OPTS = --disable-stack-protector
 
 # fix missing config.rpath (needed for autoreconf) in the codebase
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
