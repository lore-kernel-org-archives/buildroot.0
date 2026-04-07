Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBDBFF5136
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 20:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ECAC60E0E;
	Tue,  7 Apr 2026 20:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLm5T2Id7TZu; Tue,  7 Apr 2026 20:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8551260E2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775592165;
	bh=IhdSO3UHkGeeD1qq4PAA3iQqEQk2FJTlTb1Qy5TdKsU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LMhofPvgO1ffD33um2ZoALtpBry8BUfHkwG1AllPiv4elna+NnO5I+nGycXKp6vTb
	 ZUAJMeI/2/BGDs8E3EZLQo8hqXGcLQ3Gu94gKKhcKmiK91//DbmS8zDGOjVzVMnOQb
	 3Xqa8Y2JLs0ghyxcbZRknCFBhCwCDVrIQK4L2o1NGukZisb/kGd9mXSdWhcHfW7o4t
	 LmwG+RWuoZMsMQgkJI9x2wqTnOKvkV7WgYyzDHhA76kIlDcgwpU/MY1frAdvHWOKEl
	 Uj3KfpzfVRBKf48IrCG0508KiHywD0ressrU94ttPtcUnCvl8bWLlSzrZEs4PAY3lZ
	 kRsf0Tc1WZI8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8551260E2A;
	Tue,  7 Apr 2026 20:02:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63D1C2C7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5611140207
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weJWvjEYj3Qx for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 20:02:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22353406DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22353406DE
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F412807EC; Tue,  7 Apr 2026 20:02:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Apr 2026 21:48:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8503d08b98872c4469d70eca93ff2e1273a0ebad
X-Git-Newrev: d24b2517894195fa4625dcda245c78f90ac3c720
X-Patchwork-Hint: ignore
Message-Id: <20260407200239.8F412807EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openswan: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d24b2517894195fa4625dcda245c78f90ac3c720
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

last release: Jan 2021
last commit: Feb 2021
open issues: 122 (youngest from Aug 2024)
open PR: 2 (youngest from Feb 2021)

Debian removed the package in 2014:
https://tracker.debian.org/pkg/openswan

Fedora removed the package in 2013:
https://src.fedoraproject.org/rpms/openswan/commits/rawhide
"Obsoleted by libreswan"

https://github.com/libreswan/libreswan
"Libreswan was forked from Openswan 2.6.38"

The Openswan package causes autobuilder errors with gcc 14.x.
The earliest build error to be found dates back to Jul 2024:
https://autobuild.buildroot.net/results/8f1/8f109654affea46a18d42bf494d1f3a83084fcdc/build-end.log

/home/autobuild/autobuild/instance-7/output-1/build/openswan-3.0.0/programs/pluto/crypto.c:99:18:
 error: initialization of 'void (*)(void *, const u_char *, size_t)'
 {aka 'void (*)(void *, const unsigned char *, unsigned int)'} from
 incompatible pointer type 'void (*)(void *, const unsigned char *,
 long unsigned int)' [-Wincompatible-pointer-types]
   99 |     hash_update: osMD5Update,

Fixes:
https://autobuild.buildroot.net/results/bac/bacc1790d17992413503a4d62fe11ec56d0a8edc/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .checkpackageignore                                |  1 -
 Config.in.legacy                                   |  7 ++++
 package/Config.in                                  |  1 -
 ...swan-constants.c-workaround-missing-ns_t_.patch | 29 --------------
 package/openswan/Config.in                         | 15 --------
 package/openswan/openswan.hash                     |  4 --
 package/openswan/openswan.mk                       | 44 ----------------------
 7 files changed, 7 insertions(+), 94 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3622341e74..7f54d8195d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -720,7 +720,6 @@ package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch lib_pa
 package/openrc/0004-init.d-agetty-start-agetty-after-all-sevices.patch lib_patch.Upstream
 package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch lib_patch.Upstream
 package/openrc/0006-Also-create-run-lock-subsys-directory.patch lib_patch.Upstream
-package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch lib_patch.Upstream
 package/opentyrian/0001-Move-definitions-that-don-t-need-to-be-exposed-from-opl-h-to-opl-c.patch lib_patch.Upstream
 package/openvmtools/0001-no_cflags_werror.patch lib_patch.Upstream
 package/openvmtools/0002-dont-force-cppflags.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index fb1938b6e3..64112f97c5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_OPENSWAN
+	bool "openswan removed"
+	select BR2_LEGACY
+	help
+	  Openswan was no longer maintained upstream, so it has
+	  been dropped.
+
 config BR2_PACKAGE_RUBIX
 	bool "rubix removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index dc68e1b912..774f77c106 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2577,7 +2577,6 @@ endif
 	source "package/openobex/Config.in"
 	source "package/openresolv/Config.in"
 	source "package/openssh/Config.in"
-	source "package/openswan/Config.in"
 	source "package/openvpn/Config.in"
 	source "package/p910nd/Config.in"
 	source "package/parprouted/Config.in"
diff --git a/package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch b/package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch
deleted file mode 100644
index ea50dd11ad..0000000000
--- a/package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 66f8abe037970dda50fbc460edb2a2fa9f391d8a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 3 Aug 2022 19:14:25 +0200
-Subject: [PATCH] lib/libopenswan/constants.c: workaround missing ns_t_tkey
- definition in uClibc < 1.0.41
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- lib/libopenswan/constants.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/lib/libopenswan/constants.c b/lib/libopenswan/constants.c
-index 90c973b5f..04e68da42 100644
---- a/lib/libopenswan/constants.c
-+++ b/lib/libopenswan/constants.c
-@@ -1411,7 +1411,9 @@ static const char *const rr_qtype_name[] = {
- 	NULL
-     };
- 
--enum_names rr_qtype_names = { ns_t_tkey, ns_t_any
-+/* ns_t_tkey is 249, but its definition is missing from uClibc <
-+ * 1.0.41, so let's hardcode it */
-+enum_names rr_qtype_names = { 249 /* ns_t_tkey */, ns_t_any
- 			      , rr_qtype_name, &rr_type_names };
- 
- static const char *const rr_class_name[] = {
--- 
-2.37.1
-
diff --git a/package/openswan/Config.in b/package/openswan/Config.in
deleted file mode 100644
index 31c4a66b35..0000000000
--- a/package/openswan/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_OPENSWAN
-	bool "openswan"
-	depends on BR2_USE_MMU # iproute2
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2
-	select BR2_PACKAGE_GMP
-	select BR2_PACKAGE_IPROUTE2
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
-	help
-	  Openswan is an implementation of IPsec for Linux
-
-	  http://www.openswan.org
-
-comment "openswan needs a toolchain w/ headers >= 3.4"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
diff --git a/package/openswan/openswan.hash b/package/openswan/openswan.hash
deleted file mode 100644
index 574009ebfb..0000000000
--- a/package/openswan/openswan.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated
-sha256  69fe7a71e54aaf0ea93b874db4963057c1ff4904b3617b36f2c9be2010c23331  openswan-3.0.0.tar.gz
-sha256  1c36ae1e7b0f6cce4b4ffe969b71f83635734804acdd38544443564b00f8783a  COPYING
-sha256  d7d012ef3be47faffba4d97a83d4986c9f4a63ac997ebf5961d33852e5f1801a  LICENSE
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
deleted file mode 100644
index 64218810f8..0000000000
--- a/package/openswan/openswan.mk
+++ /dev/null
@@ -1,44 +0,0 @@
-################################################################################
-#
-# openswan
-#
-################################################################################
-
-OPENSWAN_VERSION = 3.0.0
-OPENSWAN_SITE = $(call github,xelerance,Openswan,v$(OPENSWAN_VERSION))
-OPENSWAN_LICENSE = GPL-2.0+, BSD-3-Clause
-OPENSWAN_LICENSE_FILES = COPYING LICENSE
-OPENSWAN_CPE_ID_VENDOR = xelerance
-
-OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
-OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" POD2MAN="" XMLTO="" \
-	USERCOMPILE="$(TARGET_CFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
-	USERLINK="$(TARGET_LDFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
-	INC_USRLOCAL=/usr USE_KLIPS=false USE_MAST=false USE_NM=false \
-	USE_NOMANINSTALL=true WERROR=""
-
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
-OPENSWAN_DEPENDENCIES += libcurl
-OPENSWAN_MAKE_OPTS += USE_LIBCURL=true
-endif
-
-ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
-OPENSWAN_DEPENDENCIES += libxcrypt
-endif
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-OPENSWAN_DEPENDENCIES += openssl
-OPENSWAN_MAKE_OPTS += HAVE_OPENSSL=true
-endif
-
-define OPENSWAN_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
-		$(OPENSWAN_MAKE_OPTS) programs
-endef
-
-define OPENSWAN_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
-		$(OPENSWAN_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
