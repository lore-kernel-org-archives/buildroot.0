Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46870FDEE47
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 20:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18E69821D9;
	Thu, 23 Apr 2026 20:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AfPho2CmHnLi; Thu, 23 Apr 2026 20:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26092821DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776974777;
	bh=h5qZ8HRdtYdc01DQ6vEHFgTtGnMRXgHmJTjNy/Hdbc0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rA1PMUzk01jaTyRFZMbBZFgNwiPH8p/VUYb2srEdw/7kwjUtBUpu/H2u2nuZrqGzT
	 aztfj0SV+PFUpUIadktQFGcC70Dp5xZHmIJwgk2DYz1P6yXSej+bhr7xSvnJdm8s2E
	 eojHHUD/Pcvr+jTNj0CDPz5bT639yPDXIMsi1yWB6BjCC7w3mvYmmOihxuFGjN9kBs
	 qI2fbN4ORTgl7fkIq3jpbvYUEh/1jlLJ8H8cYdrrCmNGhY+0an2e2njs/q0SftkpsR
	 8YnzJY+wO1xYkBqxZk3C3iz18/zKTyaspouYC+AIiaR9nxxlJfhanbjon/AWvhu+Ue
	 BnwFWt50KTbaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26092821DA;
	Thu, 23 Apr 2026 20:06:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25073231
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C313408E3
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjN6yJs79yqC for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 20:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AD5E40108
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AD5E40108
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:06:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2F4E82889; Thu, 23 Apr 2026 20:06:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 22:04:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 757bf45a57eb4662d0a9b6d3e0cb38198d118149
X-Git-Newrev: d966da35812c943fff6dd7be55284966626c4fc9
X-Patchwork-Hint: ignore
Message-Id: <20260423200613.B2F4E82889@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcap-ng: bump version to 0.9.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d966da35812c943fff6dd7be55284966626c4fc9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/stevegrubb/libcap-ng/blob/v0.9.3/ChangeLog

The source tarball is not distributed on the project site anymore so we
switch to the github helper and need to enable autoreconf.

Added dependency to BR2_TOOLCHAIN_HAS_SYNC_4 to fix a build error:

/home/bernd/buildroot/test-libcap/bootlin-sparc-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 ../src/.libs/libcap-ng.so: undefined reference to `__sync_bool_compare_and_swap_4'

due to this upstream commit added in version 0.9.2:
https://github.com/stevegrubb/libcap-ng/commit/ba2e9e03199541b1c07f3e925ffc5b23774bd18f

Added _POST_EXTRACT_HOOKS and dependency to host-pkgconf to fix
autoreconf errors.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dbus-broker/Config.in     |  2 ++
 package/libcap-ng/Config.in       |  2 ++
 package/libcap-ng/libcap-ng.hash  |  2 +-
 package/libcap-ng/libcap-ng.mk    | 16 ++++++++++++++--
 package/linux-tools/Config.in     |  2 ++
 package/openvpn/Config.in         |  1 +
 package/policycoreutils/Config.in |  2 ++
 package/util-linux/Config.in      |  1 +
 8 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/package/dbus-broker/Config.in b/package/dbus-broker/Config.in
index aa6584c392..634a3ee62c 100644
--- a/package/dbus-broker/Config.in
+++ b/package/dbus-broker/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DBUS_BROKER
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libcap-ng
 	depends on BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBCAP_NG if BR2_PACKAGE_AUDIT
@@ -21,4 +22,5 @@ config BR2_PACKAGE_DBUS_BROKER
 
 comment "dbusbroker needs systemd and a toolchain w/ threads"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_SYSTEMD
diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
index bee66b3357..18a527ee08 100644
--- a/package/libcap-ng/Config.in
+++ b/package/libcap-ng/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBCAP_NG
 	bool "libcap-ng"
+	# uses __sync_val_compare_and_swap_4
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  The libcap-ng library is intended to make programming with
 	  posix capabilities much easier than the traditional libcap
diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index 022dd1f895..d79ef54d07 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff  libcap-ng-0.8.5.tar.gz
+sha256  fe11ebbb55904763b3532f19069f13ec319042634620180a03bd4653d301563e  libcap-ng-0.9.3.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index e544e27696..31e0ff8d64 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,13 +4,25 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.8.5
-LIBCAP_NG_SITE = https://people.redhat.com/sgrubb/libcap-ng
+LIBCAP_NG_VERSION = 0.9.3
+LIBCAP_NG_SITE = $(call github,stevegrubb,libcap-ng,v$(LIBCAP_NG_VERSION))
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 LIBCAP_NG_CPE_ID_VALID = YES
 LIBCAP_NG_INSTALL_STAGING = YES
 
+# github tarball does not include configure
+LIBCAP_NG_AUTORECONF = YES
+# needed for autoreconf
+LIBCAP_NG_DEPENDENCIES = host-pkgconf
+HOST_LIBCAP_NG_DEPENDENCIES = host-pkgconf
+
+define LIBCAP_NG_CREATE_MISSING_FILES
+	touch $(@D)/NEWS
+endef
+LIBCAP_NG_POST_EXTRACT_HOOKS += LIBCAP_NG_CREATE_MISSING_FILES
+HOST_LIBCAP_NG_POST_EXTRACT_HOOKS += LIBCAP_NG_CREATE_MISSING_FILES
+
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPTS = --without-python3
 
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 20131b0d9f..b9adc25ad5 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -153,6 +153,7 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	depends on BR2_USE_MMU  # bash, util-linux-schedutils
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # util-linux schedutils
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libcap-ng
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_BASH # runtime
 	select BR2_PACKAGE_NCURSES
@@ -177,6 +178,7 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 
 comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and a toolchain w/ dynamic library and headers >= 3.14"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 77afc9eaf4..e2735dae03 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libcap-ng
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index db9eb9f6b5..7050fc3fad 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -1,5 +1,6 @@
 comment "policycoreutils needs a toolchain w/ threads, dynamic library, gcc >= 5"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
@@ -9,6 +10,7 @@ config BR2_PACKAGE_POLICYCOREUTILS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux, libsemanage, libsepol
 	depends on !BR2_STATIC_LIBS # libselinux, libsemanage, libsepol
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsemanage -> libselinux -> libsepol
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libcap-ng
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_LIBSEMANAGE
 	select BR2_PACKAGE_LIBSEPOL
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index dfebaa0947..c63cec2a9c 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -395,6 +395,7 @@ comment "scheduling utilities need a toolchain w/ headers >= 3.14"
 config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 	bool "setpriv"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libcap-ng
 	select BR2_PACKAGE_LIBCAP_NG
 	help
 	  Run a program with different Linux privilege settings
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
