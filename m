Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC52EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA1F68456C;
	Fri, 13 Feb 2026 19:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCw3BUN_eAWy; Fri, 13 Feb 2026 19:35:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FD0584560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011332;
	bh=KKWXzzDyHI76LGl+rpXz5UnWPCSLBERvB0JKXUezkYI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qspeM3okEGXRuhA3g8EhZNG0ZzBWaWibHWuNAlITD+zz/wwJIV48DHv0KcQh2UyT1
	 oC59ETuyViZljh3Ohipf1BfxA1WXzR6wTdBCXYEhm8ooTme8Y9S+U7Xz1SkDNn6Tgc
	 FPNlgyi/zoELTe+6eH3Wl5lRjutRYt6EGy8QLGKBA6kDVEgAD2rDEYw6J3kbjqqw+3
	 FPztdGicoib31DwOflv+h1Ar00GQ+8cx9t33bdJxQlYXeKz4TVhwtrhCpgExuOXd60
	 cRIT5M14Zlpdl+KT/XQq1/qDSsnxEs/oznOT4r8oWfIWguEsWuh+x9zMVMmARGIWgh
	 Ys2U1gVjRtXFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FD0584560;
	Fri, 13 Feb 2026 19:35:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A18569
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F8A5844BF
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-b7lEr4aBz8 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DC1F844B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DC1F844B5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2134783B01; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Feb 2026 12:07:05 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 44034d73fe9702368ab41b59410bab17f9ff1550
X-Git-Newrev: 29bec887165e149114b9e854c099ee86b3056a20
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.2134783B01@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libpam-pkcs11:
 new package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/29bec887165e149114b9e854c099ee86b3056a20
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The Linux-PAM login module for X.509 certificate based user login.

https://github.com/OpenSC/pam_pkcs11

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry-picked from commit e3812ea5142bf0092a7d0f9830f0cd4c478b6431)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/libpam-pkcs11/Config.in          | 19 +++++++++++++++++++
 package/libpam-pkcs11/libpam-pkcs11.hash |  3 +++
 package/libpam-pkcs11/libpam-pkcs11.mk   | 21 +++++++++++++++++++++
 5 files changed, 45 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d9ab74a96a..5743ad5131 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3318,6 +3318,7 @@ F:	package/asterisk/
 F:	package/evilwm/
 F:	package/fbv/
 F:	package/libjwt/
+F:	package/libpam-pkcs11/
 F:	package/mksh/
 F:	package/ruby/
 F:	package/uclibc/
diff --git a/package/Config.in b/package/Config.in
index d64d915997..bd44e8e988 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2256,6 +2256,7 @@ menu "Other"
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
