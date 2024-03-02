Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E51FC54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 22:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5290E409FB;
	Sat,  2 Mar 2024 22:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xtFxr4TMHXei; Sat,  2 Mar 2024 22:20:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A97F40A01
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A97F40A01;
	Sat,  2 Mar 2024 22:20:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D9A51BF57C
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A77540A03
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VSquu7kT0_WV for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 22:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF2A5409FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF2A5409FB
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 22:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6BA987ED5; Sat,  2 Mar 2024 22:20:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Mar 2024 23:18:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83a4c6f4fbedefb7aa12a887c2c073d9ade20c6e
X-Git-Newrev: 6849d17cf4d65f3c8dcc986a7a68ce51619f8508
X-Patchwork-Hint: ignore
Message-Id: <20240302222055.A6BA987ED5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/powertop: fix gettext build
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

commit: https://git.buildroot.net/buildroot/commit/?id=6849d17cf4d65f3c8dcc986a7a68ce51619f8508
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix gettext build raised since bump to version 2.15 in commit
d65b960859046be486ced6c490d3671bd1392661:

*** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.18 but the autoconf macros are from gettext version 0.20

Fixes: d65b960859046be486ced6c490d3671bd1392661
 - http://autobuild.buildroot.org/results/bb80a7842d18651e5069f3a91f06a9c23218d260

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/powertop/powertop.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index 0481caee07..a7a57939e0 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -20,6 +20,7 @@ POWERTOP_DEPENDENCIES = \
 POWERTOP_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 # 0001-add-disable-stack-protector-option.patch
 POWERTOP_AUTORECONF = YES
+POWERTOP_AUTOPOINT = YES
 POWERTOP_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 POWERTOP_CONF_OPTS = --disable-stack-protector
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
