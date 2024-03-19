Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C09C54E60
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 11:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7467581E4A;
	Tue, 19 Mar 2024 11:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ryovNkw-bt6P; Tue, 19 Mar 2024 11:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44F4C81E3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44F4C81E3B;
	Tue, 19 Mar 2024 11:22:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4BAA1BF976
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 11:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F5AF406B2
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 11:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hHVGa5PoBP2U for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 11:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E3CB40697
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E3CB40697
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 11:21:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D21F8345F; Tue, 19 Mar 2024 11:21:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 12:18:42 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: a0353ef806f34f5c47d89ed470c84902398ef1fd
X-Git-Newrev: bb9dd5564745d8ec878c42193b3d1d20ff4a09af
X-Patchwork-Hint: ignore
Message-Id: <20240319112159.7D21F8345F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/powertop: reorder
 variables in a more logical manner
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb9dd5564745d8ec878c42193b3d1d20ff4a09af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Group _CONF_{ENV,OPTS} together after the autreconf ones.
Keep AUTORECONF=YES close to AUTORECONF_OPTS

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit edde351cb8c13ffd54a369916da5f3f372edd4a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
