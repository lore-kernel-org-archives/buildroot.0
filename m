Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BEACCD199
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 04:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1291A8417C;
	Mon, 20 Oct 2025 04:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVaoqCV29fQC; Mon, 20 Oct 2025 04:52:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04DDE84180
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04DDE84180;
	Mon, 20 Oct 2025 04:52:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B6A01CD
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 04:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E608C40614
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 04:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-uqlMsOofWL for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 04:52:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A335401C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A335401C1
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A335401C1
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 04:52:42 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id BC49631E0AB7; Mon, 20 Oct 2025 06:52:37 +0200 (CEST)
Date: Mon, 20 Oct 2025 06:52:37 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aPXAFU-a1sl_aHck@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1760935957; bh=/OpH4W2DGkpf151Pc2jJzBQxcwaPlzA30d//hhWWpLE=;
 h=Date:From:To:Subject:From;
 b=suY7SY9Vukw6opY3hZijHxssMB0ABKbUSnzTFmM/JDnUpci4P9KCgzp9+PrZzVYdA
 b1RZsXAARPbf8y9/0CthzhtNktJlM8U4hAdaixUlZKhGFKNa6s80If2CMRqvQ0Sfx5
 YXPI8iZoRwUculY4W2+dA9qqRyiXY9QJ4bGIwGBklAPBLrFxsW/LZg39iurSZNRbXt
 I2ryJh9DCOu9ZcPX55ZRPAeDZSa4x2fEi1vYwz/HjO9xoeFwfpLRg3gdd9cqnV1gT5
 OHNrTRvcHxn0cyx08ak8JVMmB7RkkAKgiH1AHwYGnomAx6h3qugz7q3z5b+SbhVMYW
 doau7yXzYT+9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=suY7SY9V
Subject: [Buildroot] [PATCH] package/libpam-pkcs11: new package
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
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/libpam-pkcs11/Config.in          | 18 ++++++++++++++++++
 package/libpam-pkcs11/libpam-pkcs11.hash |  2 ++
 package/libpam-pkcs11/libpam-pkcs11.mk   | 18 ++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100755 package/libpam-pkcs11/Config.in
 create mode 100755 package/libpam-pkcs11/libpam-pkcs11.hash
 create mode 100755 package/libpam-pkcs11/libpam-pkcs11.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 66199a5b72..8f3ef4fc38 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3407,6 +3407,7 @@ F:	package/asterisk/
 F:	package/evilwm/
 F:	package/fbv/
 F:	package/libjwt/
+F:	package/libpam-pkcs11/
 F:	package/mksh/
 F:	package/ruby/
 F:	package/uclibc/
diff --git a/package/Config.in b/package/Config.in
index 161d61728b..42b9acb807 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2286,6 +2286,7 @@ menu "Other"
 if BR2_PACKAGE_LINUX_PAM
 comment "linux-pam plugins"
 	source "package/libpam-nfc/Config.in"
+	source "package/libpam-pkcs11/Config.in"
 	source "package/libpam-radius-auth/Config.in"
 	source "package/libpam-tacplus/Config.in"
 endif
diff --git a/package/libpam-pkcs11/Config.in b/package/libpam-pkcs11/Config.in
new file mode 100755
index 0000000000..6678c48ab9
--- /dev/null
+++ b/package/libpam-pkcs11/Config.in
@@ -0,0 +1,18 @@
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
+	  The Linux-PAM login module for X.509 certificate based user login.
+
+	  https://github.com/OpenSC/pam_pkcs11
+
+comment "libpam-pkcs11 needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libpam-pkcs11/libpam-pkcs11.hash b/package/libpam-pkcs11/libpam-pkcs11.hash
new file mode 100755
index 0000000000..9ab133f51b
--- /dev/null
+++ b/package/libpam-pkcs11/libpam-pkcs11.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 8a853f4e6e136ceecdcffad798570e3d6af2fde08e975656b2dc931989c35aff  pam_pkcs11-0.6.13.tar.gz
diff --git a/package/libpam-pkcs11/libpam-pkcs11.mk b/package/libpam-pkcs11/libpam-pkcs11.mk
new file mode 100755
index 0000000000..9947e58e1a
--- /dev/null
+++ b/package/libpam-pkcs11/libpam-pkcs11.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libpam-pkcs11
+#
+################################################################################
+
+LIBPAM_PKCS11_VERSION = 0.6.13
+LIBPAM_PKCS11_SOURCE = pam_pkcs11-$(LIBPAM_PKCS11_VERSION).tar.gz
+LIBPAM_PKCS11_SITE = https://github.com/OpenSC/pam_pkcs11/archive/refs/tags
+
+LIBPAM_PKCS11_AUTORECONF = YES
+
+LIBPAM_PKCS11_CONF_OPTS += --libdir=/lib
+LIBPAM_PKCS11_CONF_OPTS += --without-docbook
+LIBPAM_PKCS11_CONF_OPTS += --without-ldap
+LIBPAM_PKCS11_DEPENDENCIES = openssl pcsc-lite linux-pam
+
+$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
