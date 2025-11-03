Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CF9CCFA03
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 09:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BC5384269;
	Mon,  3 Nov 2025 09:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtdGWN3IykmO; Mon,  3 Nov 2025 09:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04A998426D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04A998426D;
	Mon,  3 Nov 2025 09:00:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D8F01A6
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 09:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5419184264
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 09:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nw2EFMejWRG4 for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 09:00:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAF058424D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAF058424D
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAF058424D
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 09:00:42 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B85CE31E0B9B; Mon, 03 Nov 2025 10:00:37 +0100 (CET)
Date: Mon, 3 Nov 2025 10:00:37 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aQhvNVC-JHBnPfLK@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1762160437; bh=GYVfiEf/DaKFVDjnm2OJkV4flTe3SViUx/n428t7L3s=;
 h=Date:From:To:Subject:From;
 b=bQH/7x6uQukfG/qkFSHUwkIMjQ0fW0QF3YXePwYXUtosx7p0QCvKOhZr4bUjVC6TT
 8DC3MK3ymFom5n+IPjKzlDJkvIUu20StEQ34nABOHlh8UrfALOMzrrT2so8GEXCoyC
 ThaohQGdkRmySWyuZKBwca+phWVoC6UageI0ZpHBoPw2RGIAmqdBHaL+UmL/FhZQaZ
 qLOgw7cF0kr81a+WEdj6lvNRjexejNIhoqlbOVabbCEqMXaQqF+ab6bYC/HgFR86vV
 CBrgXv/X/lSftzvdtj4MzQVxOJRh8OqTmNK5DliGGA65DYrViUsU2snV4/EXyVdBY5
 P1uy5R36BG37Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=bQH/7x6u
Subject: [Buildroot] [PATCH v2] package/libpam-pkcs11: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Linux-PAM login module for X.509 certificate based user login.

https://github.com/OpenSC/pam_pkcs11

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
  - fix check-package warnings (Julien)
  - add LICENSE information and hash (Julien)
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/libpam-pkcs11/Config.in          | 19 +++++++++++++++++++
 package/libpam-pkcs11/libpam-pkcs11.hash |  3 +++
 package/libpam-pkcs11/libpam-pkcs11.mk   | 21 +++++++++++++++++++++
 5 files changed, 45 insertions(+)
 create mode 100644 package/libpam-pkcs11/Config.in
 create mode 100644 package/libpam-pkcs11/libpam-pkcs11.hash
 create mode 100644 package/libpam-pkcs11/libpam-pkcs11.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7c2967f41d..b14c6e3875 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3421,6 +3421,7 @@ F:	package/asterisk/
 F:	package/evilwm/
 F:	package/fbv/
 F:	package/libjwt/
+F:	package/libpam-pkcs11/
 F:	package/mksh/
 F:	package/ruby/
 F:	package/uclibc/
diff --git a/package/Config.in b/package/Config.in
index 47d56f813a..930f368058 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2285,6 +2285,7 @@ menu "Other"
 if BR2_PACKAGE_LINUX_PAM
 comment "linux-pam plugins"
 	source "package/libpam-nfc/Config.in"
+	source "package/libpam-pkcs11/Config.in"
 	source "package/libpam-radius-auth/Config.in"
 	source "package/libpam-tacplus/Config.in"
 endif
diff --git a/package/libpam-pkcs11/Config.in b/package/libpam-pkcs11/Config.in
new file mode 100644
index 0000000000..8db34090b2
--- /dev/null
+++ b/package/libpam-pkcs11/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBPAM_PKCS11
+	bool "libpam-pkcs11"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # pcsc-lite -> fork()
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite -> _Atomic keyword
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_PCSC_LITE
+	help
+	  The Linux-PAM login module for X.509 certificate
+	  based user login.
+
+	  https://github.com/OpenSC/pam_pkcs11
+
+comment "libpam-pkcs11 needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libpam-pkcs11/libpam-pkcs11.hash b/package/libpam-pkcs11/libpam-pkcs11.hash
new file mode 100644
index 0000000000..95747afc08
--- /dev/null
+++ b/package/libpam-pkcs11/libpam-pkcs11.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  8a853f4e6e136ceecdcffad798570e3d6af2fde08e975656b2dc931989c35aff  pam_pkcs11-0.6.13.tar.gz
+sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/libpam-pkcs11/libpam-pkcs11.mk b/package/libpam-pkcs11/libpam-pkcs11.mk
new file mode 100644
index 0000000000..4bad47f69a
--- /dev/null
+++ b/package/libpam-pkcs11/libpam-pkcs11.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# libpam-pkcs11
+#
+################################################################################
+
+LIBPAM_PKCS11_VERSION = 0.6.13
+LIBPAM_PKCS11_SOURCE = pam_pkcs11-$(LIBPAM_PKCS11_VERSION).tar.gz
+LIBPAM_PKCS11_SITE = https://github.com/OpenSC/pam_pkcs11/archive/refs/tags
+LIBPAM_PKCS11_LICENSE = LGPL-2.1
+LIBPAM_PKCS11_LICENSE_FILES = COPYING
+
+LIBPAM_PKCS11_AUTORECONF = YES
+
+LIBPAM_PKCS11_CONF_OPTS = \
+	--libdir=/lib \
+	--without-docbook \
+	--without-ldap
+LIBPAM_PKCS11_DEPENDENCIES = linux-pam openssl pcsc-lite
+
+$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
