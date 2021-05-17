Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01913C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:20:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3FB060240
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3FB060240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F94060879;
	Tue,  3 Aug 2021 21:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id if9_xRQFMSYp; Tue,  3 Aug 2021 21:20:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C147160896;
	Tue,  3 Aug 2021 21:20:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 157B81BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADF1F60747
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSvAtW-5jFhw for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D43CD60653
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2AB7485E95; Tue,  3 Aug 2021 21:09:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 17 May 2021 22:20:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 378e9f4b11631725937d343ed58a091536575d65
X-Git-Newrev: eb251b30084e38e539c004a7e2ebe305ae16a3f3
X-Patchwork-Hint: ignore
Message-Id: <20210803210940.2AB7485E95@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lvm2: drop
 BR2_PACKAGE_LVM2_APP_LIBRARY
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb251b30084e38e539c004a7e2ebe305ae16a3f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The application library (liblvm2app) has been dropped since version
2.03.00 and
https://github.com/lvmteam/lvm2/commit/0d22b58172808f050abeacdb5d6a7b7132b91a8c

It should be noted that lvm2 support must be dropped from udisks until
a bump to at least version 2.7.0 and
https://github.com/storaged-project/udisks/commit/4c0709a893be49a0db5b2839e4766621e2c1bb98

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - slightly expand help text for legacy BR2_PACKAGE_UDISKS_LVM2
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy         | 14 ++++++++++++++
 package/lvm2/Config.in   | 11 -----------
 package/lvm2/lvm2.mk     |  7 -------
 package/udisks/Config.in | 15 ---------------
 package/udisks/udisks.mk |  6 +-----
 5 files changed, 15 insertions(+), 38 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 39a44f3026..bc7cb8e32a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,20 @@ endif
 
 comment "Legacy options removed in 2021.05"
 
+config BR2_PACKAGE_UDISKS_LVM2
+	bool "udisks lvm2 support removed"
+	select BR2_LEGACY
+	help
+	  The lvm2 support was removed because udisks < 2.7.0 still
+	  depends on lvm2 application library, which was removed
+	  in was removed lvm2.
+
+config BR2_PACKAGE_LVM2_APP_LIBRARY
+	bool "lvm2 application library removed"
+	select BR2_LEGACY
+	help
+	  The lvm2 application library was removed upstream.
+
 config BR2_PACKAGE_LVM2_LVMETAD
 	bool "lvm2 lvmetad removed"
 	select BR2_LEGACY
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index de5b972e99..f8bcdffb38 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -36,17 +36,6 @@ config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 comment "lvm2 standard install needs a glibc or uClibc toolchain"
 	depends on BR2_TOOLCHAIN_USES_MUSL
 
-config BR2_PACKAGE_LVM2_APP_LIBRARY
-	bool "install application library"
-	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
-	depends on !BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_LVM2_STANDARD_INSTALL
-	help
-	  Install application library (liblvm2app).
-
-comment "lvm2 application library needs a glibc or uClibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
-
 endif
 
 comment "lvm2 needs a toolchain w/ threads, dynamic library"
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 84ec75530a..224dbf5d54 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -55,12 +55,6 @@ LVM2_INSTALL_STAGING_OPTS += install
 LVM2_INSTALL_TARGET_OPTS += install
 endif
 
-ifeq ($(BR2_PACKAGE_LVM2_APP_LIBRARY),y)
-LVM2_CONF_OPTS += --enable-applib
-else
-LVM2_CONF_OPTS += --disable-applib
-endif
-
 ifeq ($(BR2_INIT_SYSTEMD),y)
 LVM2_INSTALL_TARGET_OPTS += install_systemd_units install_systemd_generators
 endif
@@ -75,7 +69,6 @@ HOST_LVM2_CONF_OPTS = \
 	--enable-pkgconfig \
 	--disable-cmdlib \
 	--disable-dmeventd \
-	--disable-applib \
 	--disable-fsadm \
 	--disable-readline \
 	--disable-selinux
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index efd3b619bf..9d3eb240e6 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -31,21 +31,6 @@ config BR2_PACKAGE_UDISKS
 
 	  http://www.freedesktop.org/wiki/Software/udisks
 
-if BR2_PACKAGE_UDISKS
-
-config BR2_PACKAGE_UDISKS_LVM2
-	bool "lvm2 support"
-	# The lvm app library can't compile against musl
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_LVM2_APP_LIBRARY
-	help
-	  Enable LVM2 support
-
-comment "lvm2 support needs a glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
-endif
-
 comment "udisks needs udev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index af25c2b8e2..9f7a02e10c 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -24,10 +24,6 @@ UDISKS_DEPENDENCIES = \
 	sg3_utils \
 	udev
 
-UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages
-
-ifeq ($(BR2_PACKAGE_UDISKS_LVM2),y)
-UDISKS_CONF_OPTS += --enable-lvm2
-endif
+UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages --disable-lvm2
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
