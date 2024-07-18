Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9340C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 21:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B3C580C8E;
	Thu, 18 Jul 2024 21:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUqBTK0hYEUk; Thu, 18 Jul 2024 21:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC76581F7C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC76581F7C;
	Thu, 18 Jul 2024 21:26:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B057A1BF3A1
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BB076079E
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9Ew0jBEiIPw for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 21:26:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C787D607B2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C787D607B2
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:26:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0DA284650; Thu, 18 Jul 2024 21:26:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 23:26:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4533db8f6460c9b945afeddac864a4f4d6f61a75
X-Git-Newrev: c72c6f26ed706474f6607f97be2925834c8baa03
X-Patchwork-Hint: ignore
Message-Id: <20240718212641.C0DA284650@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tpm2-pytss: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c72c6f26ed706474f6607f97be2925834c8baa03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-tpm2-pytss/Config.in              | 14 ++++++++++++++
 package/python-tpm2-pytss/python-tpm2-pytss.hash |  5 +++++
 package/python-tpm2-pytss/python-tpm2-pytss.mk   | 22 ++++++++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ab6482703d..c4f1565edd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2828,6 +2828,7 @@ F:	package/physfs/
 F:	package/piglit/
 F:	package/python-libevdev/
 F:	package/python-pkgconfig/
+F:	package/python-tpm2-pytss/
 F:	package/qemu/
 F:	package/solarus/
 F:	package/stress-ng/
diff --git a/package/Config.in b/package/Config.in
index 3b66ee2900..f2e10b2b5e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1403,6 +1403,7 @@ menu "External python modules"
 	source "package/python-tomlkit/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-tortoise-orm/Config.in"
+	source "package/python-tpm2-pytss/Config.in"
 	source "package/python-tqdm/Config.in"
 	source "package/python-trafaret/Config.in"
 	source "package/python-traitlets/Config.in"
diff --git a/package/python-tpm2-pytss/Config.in b/package/python-tpm2-pytss/Config.in
new file mode 100644
index 0000000000..60d9e8b9d3
--- /dev/null
+++ b/package/python-tpm2-pytss/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_TPM2_PYTSS
+	bool "python-tpm2-pytss"
+	depends on !BR2_STATIC_LIBS # tpm2-tss
+	select BR2_PACKAGE_PYTHON_ASN1CRYPTO # runtime
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_TPM2_TSS
+	help
+	  TPM 2.0 TSS Bindings for Python.
+
+	  https://github.com/tpm2-software/tpm2-pytss
+
+comment "python-tpm2-pytss needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/python-tpm2-pytss/python-tpm2-pytss.hash b/package/python-tpm2-pytss/python-tpm2-pytss.hash
new file mode 100644
index 0000000000..10a9f112b7
--- /dev/null
+++ b/package/python-tpm2-pytss/python-tpm2-pytss.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tpm2-pytss/json
+md5  069a02c99d3203fada940c3dd43b699c  tpm2-pytss-2.2.1.tar.gz
+sha256  b8f15473422f377f59c7217dcd1479165cce62dfa33934ec976a278baf2e9efe  tpm2-pytss-2.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/python-tpm2-pytss/python-tpm2-pytss.mk b/package/python-tpm2-pytss/python-tpm2-pytss.mk
new file mode 100644
index 0000000000..80491aac46
--- /dev/null
+++ b/package/python-tpm2-pytss/python-tpm2-pytss.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-tpm2-pytss
+#
+################################################################################
+
+PYTHON_TPM2_PYTSS_VERSION = 2.2.1
+PYTHON_TPM2_PYTSS_SOURCE = tpm2-pytss-$(PYTHON_TPM2_PYTSS_VERSION).tar.gz
+PYTHON_TPM2_PYTSS_SITE = https://files.pythonhosted.org/packages/13/e5/8d4a9ac91579c741ec9fb63befcf6577107f22f3508c364fd53e277d7237
+PYTHON_TPM2_PYTSS_SETUP_TYPE = setuptools
+PYTHON_TPM2_PYTSS_LICENSE = BSD-2-Clause
+PYTHON_TPM2_PYTSS_LICENSE_FILES = LICENSE
+
+PYTHON_TPM2_PYTSS_DEPENDENCIES = host-pkgconf \
+	host-python-asn1crypto \
+	host-python-cffi \
+	host-python-cryptography \
+	host-python-pkgconfig \
+	host-python-pycparser \
+	tpm2-tss
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
