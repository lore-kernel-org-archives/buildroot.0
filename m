Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885D8C4320A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:17:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E08260C3F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E08260C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2432783A77;
	Tue,  3 Aug 2021 21:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fg_FY-9fxjyG; Tue,  3 Aug 2021 21:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80438838ED;
	Tue,  3 Aug 2021 21:17:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10FA71BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D78482862
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FEJQnsY7_auj for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 749178354D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BDC198B43E; Tue,  3 Aug 2021 21:09:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 17 May 2021 09:19:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 020149e4cd53bdc0fd2c84c1e560b0bdec38f71e
X-Git-Newrev: 0b10ed0d581145cc1c35e1f1eb33581350db63b6
X-Patchwork-Hint: ignore
Message-Id: <20210803210939.BDC198B43E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lvm2: drop
 BR2_PACKAGE_LVM2_LVMETAD
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=0b10ed0d581145cc1c35e1f1eb33581350db63b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

lvmetad has been dropped since version 2.03.00 and
https://github.com/lvmteam/lvm2/commit/117160b27e510dceb1ed6acf995115c040acd88d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy       |  6 ++++++
 package/lvm2/Config.in | 17 -----------------
 package/lvm2/lvm2.mk   |  6 ------
 3 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ce6aeed87d..39a44f3026 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2021.05"
 
+config BR2_PACKAGE_LVM2_LVMETAD
+	bool "lvm2 lvmetad removed"
+	select BR2_LEGACY
+	help
+	  The lvm2 lvmetad was removed upstream.
+
 config BR2_PACKAGE_MONKEY
 	bool "monkey package removed"
 	select BR2_LEGACY
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index a9c5c453fc..de5b972e99 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -47,23 +47,6 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 comment "lvm2 application library needs a glibc or uClibc toolchain"
 	depends on BR2_TOOLCHAIN_USES_MUSL
 
-config BR2_PACKAGE_LVM2_LVMETAD
-	bool "install lvmetad"
-	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2-app-library
-	select BR2_PACKAGE_LVM2_APP_LIBRARY
-	help
-	  Install lvmetad
-
-	  The lvmetad daemon caches LVM metadata so that LVM commands
-	  can read metadata from the cache rather than scanning disks.
-	  This can be an advantage because scanning disks is time
-	  consuming and may interfere with the normal work of the
-	  system.  lvmetad can be a disadvantage when disk event
-	  notifications from the system are unreliable.
-
-comment "lvmetad daemon needs a glibc or uClibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
-
 endif
 
 comment "lvm2 needs a toolchain w/ threads, dynamic library"
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 1194044537..84ec75530a 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -61,12 +61,6 @@ else
 LVM2_CONF_OPTS += --disable-applib
 endif
 
-ifeq ($(BR2_PACKAGE_LVM2_LVMETAD),y)
-LVM2_CONF_OPTS += --enable-lvmetad
-else
-LVM2_CONF_OPTS += --disable-lvmetad
-endif
-
 ifeq ($(BR2_INIT_SYSTEMD),y)
 LVM2_INSTALL_TARGET_OPTS += install_systemd_units install_systemd_generators
 endif
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
