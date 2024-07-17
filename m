Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40D9C3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8225340C56;
	Wed, 17 Jul 2024 21:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UedLLlmDQBia; Wed, 17 Jul 2024 21:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F47440E85
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F47440E85;
	Wed, 17 Jul 2024 21:44:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 252451BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EA8640E85
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42DI6nbZG_ff for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10D0340C56
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10D0340C56
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:44:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05AD686D94; Wed, 17 Jul 2024 21:44:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 23:36:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23fd1f85543f2aa048914834252a659989c81db2
X-Git-Newrev: c624eee120b6ee0c81e636bd47abe92452610cf7
X-Patchwork-Hint: ignore
Message-Id: <20240717214425.05AD686D94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-openssl: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c624eee120b6ee0c81e636bd47abe92452610cf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/tpm2-openssl/Config.in         | 17 +++++++++++++++++
 package/tpm2-openssl/tpm2-openssl.hash |  3 +++
 package/tpm2-openssl/tpm2-openssl.mk   | 19 +++++++++++++++++++
 5 files changed, 41 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e51d56daa2..7d6b364e58 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2834,6 +2834,7 @@ F:	package/supertux/
 F:	package/supertuxkart/
 F:	package/terminology/
 F:	package/tk/
+F:	package/tpm2-openssl/
 F:	package/upower/
 F:	package/waffle/
 F:	package/xenomai/
diff --git a/package/Config.in b/package/Config.in
index d6658f185f..5f0e7491c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1584,6 +1584,7 @@ menu "Crypto"
 	source "package/pkcs11-helper/Config.in"
 	source "package/rhash/Config.in"
 	source "package/tinydtls/Config.in"
+	source "package/tpm2-openssl/Config.in"
 	source "package/tpm2-pkcs11/Config.in"
 	source "package/tpm2-tss/Config.in"
 	source "package/trousers/Config.in"
diff --git a/package/tpm2-openssl/Config.in b/package/tpm2-openssl/Config.in
new file mode 100644
index 0000000000..0e151a94d3
--- /dev/null
+++ b/package/tpm2-openssl/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_TPM2_OPENSSL
+	bool "tpm2-openssl"
+	depends on !BR2_STATIC_LIBS # tpm2-tss
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_TPM2_TSS
+	help
+	  Provider for integration of TPM 2.0 to OpenSSL 3.0.
+
+	  tpm2-openssl is based on a major refactoring of the
+	  tpm2-tss-engine. The code is still there, but largely
+	  reshuffled to match the new OpenSSL API.
+
+	  https://github.com/tpm2-software/tpm2-openssl
+
+comment "tpm2-openssl needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tpm2-openssl/tpm2-openssl.hash b/package/tpm2-openssl/tpm2-openssl.hash
new file mode 100644
index 0000000000..ee15ee885f
--- /dev/null
+++ b/package/tpm2-openssl/tpm2-openssl.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  2ee15da2dceae1466ffba868e75a00b119d752babc1b6a2792286336a3324fb0  tpm2-openssl-1.2.0.tar.gz
+sha256  7ffba9d66226eb67abb9747ce1cd47477d566143a8ded597bbd974c6fb5fe9f5  LICENSE
diff --git a/package/tpm2-openssl/tpm2-openssl.mk b/package/tpm2-openssl/tpm2-openssl.mk
new file mode 100644
index 0000000000..ed590c2f47
--- /dev/null
+++ b/package/tpm2-openssl/tpm2-openssl.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# tpm2-openssl
+#
+################################################################################
+
+TPM2_OPENSSL_VERSION = 1.2.0
+TPM2_OPENSSL_SITE = https://github.com/tpm2-software/tpm2-openssl/releases/download/$(TPM2_OPENSSL_VERSION)
+TPM2_OPENSSL_LICENSE = BSD-3-Clause
+TPM2_OPENSSL_LICENSE_FILES = LICENSE
+TPM2_OPENSSL_INSTALL_STAGING = YES
+TPM2_OPENSSL_DEPENDENCIES = host-pkgconf openssl tpm2-tss
+
+# Provide --with-modulesdir to avoid using abs_builddir and DESTDIR
+# (also defined as absolute path) at the same time to define modules
+# install path (am__installdirs).
+TPM2_OPENSSL_CONF_OPTS = --with-modulesdir="/usr/lib/ossl-modules"
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
