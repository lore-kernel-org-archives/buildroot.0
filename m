Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB5FC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 21:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F4CE81F76;
	Thu, 18 Jul 2024 21:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rw6PMl1aZXEV; Thu, 18 Jul 2024 21:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBEB681F7C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBEB681F7C;
	Thu, 18 Jul 2024 21:26:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFFDA1BF3A1
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BCF9607AD
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kz22QE0dIBRe for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 21:26:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEE79607C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEE79607C0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:26:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7CB486E51; Thu, 18 Jul 2024 21:26:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 23:26:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c72c6f26ed706474f6607f97be2925834c8baa03
X-Git-Newrev: 89e3b2fb846506217b4767fe9165f1641a407314
X-Patchwork-Hint: ignore
Message-Id: <20240718212641.D7CB486E51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-pkcs11: install tpm2_ptool
 utility
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

commit: https://git.buildroot.net/buildroot/commit/?id=89e3b2fb846506217b4767fe9165f1641a407314
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tpm2_ptool script appears on several TPM2 tutorials and it's
packaged as the "tpm2-pkcs11-tools" package in several Linux
distribution.

Add a new tpm2-pkcs11 option to install tpm2_ptool script along with
its dependencies.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-pkcs11/Config.in      | 22 ++++++++++++++++++++++
 package/tpm2-pkcs11/tpm2-pkcs11.mk | 20 ++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/package/tpm2-pkcs11/Config.in b/package/tpm2-pkcs11/Config.in
index 5d45703223..93aa4a847a 100644
--- a/package/tpm2-pkcs11/Config.in
+++ b/package/tpm2-pkcs11/Config.in
@@ -11,5 +11,27 @@ config BR2_PACKAGE_TPM2_PKCS11
 
 	  https://github.com/tpm2-software/tpm2-pkcs11
 
+if BR2_PACKAGE_TPM2_PKCS11
+
+config BR2_PACKAGE_TPM2_PKCS11_PYTHON_TOOLS
+	bool "Install python tools (tpm2_ptool)"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-bcrypt, python-cryptography
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
+	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
+	select BR2_PACKAGE_PYTHON_TPM2_PYTSS # runtime
+	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
+	help
+	  Enable Python-related tools (tpm2_ptool)
+
+comment "python tools needs python3"
+	depends on !BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+
+endif
+
 comment "tpm2-pkcs11 needs a toolchain w/ dynamic library, threads"
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
index 18f04157e3..c6218d772e 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
@@ -44,4 +44,24 @@ TPM2_PKCS11_CONF_OPTS += \
 	--with-p11kitconfigdir=/usr/share/p11-kit/modules
 endif
 
+ifeq ($(BR2_PACKAGE_TPM2_PKCS11_PYTHON_TOOLS),y)
+TPM2_PKCS11_DEPENDENCIES += python-tpm2-pytss
+
+define TPM2_PKCS11_BUILD_TOOLS
+	(cd $(@D)/tools; \
+	$(PKG_PYTHON_SETUPTOOLS_ENV) \
+		$(HOST_DIR)/bin/python setup.py build)
+endef
+TPM2_PKCS11_POST_BUILD_HOOKS += TPM2_PKCS11_BUILD_TOOLS
+
+define TPM2_PKCS11_INSTALL_TARGET_TOOLS
+	(cd $(@D)/tools; \
+	$(PKG_PYTHON_SETUPTOOLS_ENV) \
+		$(HOST_DIR)/bin/python setup.py install \
+		$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
+		--root=$(TARGET_DIR))
+endef
+TPM2_PKCS11_POST_INSTALL_TARGET_HOOKS += TPM2_PKCS11_INSTALL_TARGET_TOOLS
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
