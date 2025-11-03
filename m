Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61778CCFA03
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 22:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18CF160AB6;
	Mon,  3 Nov 2025 22:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iIDqooFGD49R; Mon,  3 Nov 2025 22:07:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23F7D60AB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23F7D60AB9;
	Mon,  3 Nov 2025 22:07:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A40F6222
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 22:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95A4E406F7
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 22:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2k03wavot70 for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 22:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E22ED406F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E22ED406F0
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 22:07:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D10BD83B64; Mon,  3 Nov 2025 22:07:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Nov 2025 22:14:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec1b8007181b9c4f66e5e24c32a52ac6b034f4e8
X-Git-Newrev: e3812ea5142bf0092a7d0f9830f0cd4c478b6431
X-Patchwork-Hint: ignore
Message-Id: <20251103220728.D10BD83B64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpam-pkcs11: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3812ea5142bf0092a7d0f9830f0cd4c478b6431
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Linux-PAM login module for X.509 certificate based user login.

https://github.com/OpenSC/pam_pkcs11

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/libpam-pkcs11/Config.in          | 19 +++++++++++++++++++
 package/libpam-pkcs11/libpam-pkcs11.hash |  3 +++
 package/libpam-pkcs11/libpam-pkcs11.mk   | 21 +++++++++++++++++++++
 5 files changed, 45 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
