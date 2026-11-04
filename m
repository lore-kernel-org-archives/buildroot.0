Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3700606A329
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jYd6Z0wu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7D2C607D5;
	Wed,  4 Nov 2026 22:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rz0vN0a8tkHx; Wed,  4 Nov 2026 22:39:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8ABCD6082D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793831960;
	b=Nf7kXMxofCPqnHb/ogsBV6k38KtV8wKGHUg2f618xWk3eQ6ZPhGutJSGOya84KB9I5jA
	 T4cPhex5xqzuTfQ9K3buoRTP+/JmUWfqMrpzlXrsmdtXSitkf1M0M0kFTraQTfmF2GRVf
	 crPRRehWLuIZUZWch4vgGe9U00qsD4gUgZ3FR2H9UkQIU5sV35vmYrtVmyL8REcPoNNah
	 JrYhhfuMcgamPAVpzmnJmQjKQr7hi5ZpZ2odof0KmsdAOCDgLUvKzkTwwjvCIoy6xkXto
	 zV1wZ6sFORqG+OuqpS+cm4FcKCFInMy+iu8Mt153MwiWKLKwp5YOjL5+Q+nJA8jkKaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793831960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/QG3iB1cs7gTKLzc3cZjfSM87mNXQ6gjs0hoZ85zt1c=;
	b=sIcarn8Eh3b6i8gDbaO1/EPp3qaqf9/8h8+FrKNeGE40WgryoPoJxZ6RM3TLDr9N4Y72
	 pRd6umIx4dvm1RkliCFkSUS8BC4wID3eJN1qpWvBdSkyZudPD7nq+szBkjxIDIzR0RuvO
	 8at4Ur6zRKGUQIeeEH1k9LOFoR7BrUgyy5SsTzgwfbxRrByFrcwrZlO/ZI65KVDff18sy
	 +TvDiYTWK7xU93F0/5EqlmXLHRArJiID1+I/6SrnZk4y85upJoz0PaV5K2BpfpMruOmEd
	 iAnz/lOHOTjtWZXz9i0LLY5RknLsZ/SUUGN/bW5d/X7Gh1hmFP2ULBIIsq1XTa7kGBA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793831960;
	bh=/QG3iB1cs7gTKLzc3cZjfSM87mNXQ6gjs0hoZ85zt1c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jYd6Z0wuIkhiyNXQLNho6H3HGBTE8B1BEH7aGsV1UkKaaI+0rz/foIRvN7iOgj9Aj
	 3zmcd6RAg1UIgKCJtvVFQvMzu1XtAveF+OGbnMgB/YvjWvvUmZsjr/8zGJ06BN1272
	 +zj6+nCuqshkvQ4vjZCT9kfYpOis5QCHbDHwKVuuC8/dpySPOSEO82POvYbHUgJUDF
	 8+ppJ76oiZg9FUaOB8iAyNuFWD01YZcmPlyma7+umxz+qRyQ2cfZSxs8J/4mSjhQK1
	 1Fan1dpqzbdbKgdiJeqUnTJo0wfwDrEAEe2xWuvxC7TF1LuGtfigvKtjpnTGD4nxtA
	 7zEByLNCXzLmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ABCD6082D;
	Wed,  4 Nov 2026 22:39:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9022D362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75C706082D
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jz3K-4i89IDk for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:39:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 72E86607D5
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72E86607D5
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:39:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83AB49DCF0; Wed,  4 Nov 2026 22:37:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 23:38:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47d9c8aa1b873dc7c0fa751dc856d8138dccf60c
X-Git-Newrev: 6df483656000c1fdc262038d3011e5dfc2c25f6b
X-Patchwork-Hint: ignore
Message-Id: <20261104223747.83AB49DCF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtai: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6df483656000c1fdc262038d3011e5dfc2c25f6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Building kernels > 4.19 is broken, for example:

No RTAI patch for your kernel version
make: *** [package/pkg-generic.mk:237:
 /home/autobuild/autobuild/instance-13/output-1/build/linux-6.6.161/.stamp_patched]
 Error 1

In 2023 the maintainer laid out some future plans:
https://www.freelists.org/archive/rtai/05-2023

The last mailing list entries date back to 2024:
https://www.freelists.org/archive/rtai/11-2024

As the future of the project is unclear and the package is broken with
newer kernels we remove the package from buildroot.

Fixes:
https://autobuild.buildroot.net/results/800/800854f679cacdb2f5311dae62f7cd4db4efefa2/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   | 12 ++++++++
 .../adding-packages-linux-kernel-spec-infra.adoc   |  4 +--
 linux/Config.ext.in                                | 10 -------
 linux/linux-ext-rtai.mk                            | 30 --------------------
 package/Config.in                                  |  1 -
 package/rtai/Config.in                             |  8 ------
 package/rtai/rtai.hash                             |  2 --
 package/rtai/rtai.mk                               | 32 ----------------------
 8 files changed, 14 insertions(+), 85 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 970b587a94..a28c8eeef8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_RTAI
+	bool "RTAI userspace has been removed"
+	select BR2_LEGACY
+	help
+	  RTAI is unmaintained and has been removed
+
+config BR2_LINUX_KERNEL_EXT_RTAI
+	bool "RTAI Real-time kernel patch has been removed"
+	select BR2_LEGACY
+	help
+	  RTAI is unmaintained and has been removed
+
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	bool "Latest CIP RT SLTS version has been removed"
 	select BR2_LEGACY
diff --git a/docs/manual/adding-packages-linux-kernel-spec-infra.adoc b/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
index 22ffc5496f..c7fbb6184d 100644
--- a/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
+++ b/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
@@ -98,8 +98,8 @@ the kernel tree, or in the form of new files to be added to the
 tree. The Buildroot's Linux kernel extensions infrastructure provides
 a simple solution to automatically do this, just after the kernel
 sources are extracted and before the kernel patches are
-applied. Examples of extensions packaged using this mechanism are the
-real-time extensions Xenomai and RTAI.
+applied. An example of an extension packaged using this mechanism is the
+real-time extension Xenomai.
 
 Let's look at an example on how to add a new Linux extension +foo+.
 
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index f598326121..86af4c338b 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -44,16 +44,6 @@ comment "xenomai needs a uClibc or glibc toolchain w/ threads"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
 
-#-------------------------------------------------------------------------------
-# RTAI
-config BR2_LINUX_KERNEL_EXT_RTAI
-	bool "RTAI Real-time patch"
-	depends on !BR2_LINUX_KERNEL_LATEST_VERSION
-	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	select BR2_PACKAGE_RTAI
-	help
-	  RTAI Kernel part.
-
 # kernel extensions from br2-external trees, if any
 source "$BR2_BASE_DIR/.br2-external.in.linux"
 
diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
deleted file mode 100644
index 50f79f8d50..0000000000
--- a/linux/linux-ext-rtai.mk
+++ /dev/null
@@ -1,30 +0,0 @@
-################################################################################
-#
-# Patch the linux kernel with RTAI extension
-#
-################################################################################
-
-LINUX_EXTENSIONS += rtai
-
-ifeq ($(KERNEL_ARCH),i386)
-RTAI_ARCH = x86
-else ifeq ($(KERNEL_ARCH),x86_64)
-RTAI_ARCH = x86
-else ifeq ($(KERNEL_ARCH),powerpc)
-RTAI_ARCH = ppc
-else
-RTAI_ARCH = $(KERNEL_ARCH)
-endif
-
-# Prepare kernel patch
-define RTAI_PREPARE_KERNEL
-	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
-	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
-		$(APPLY_PATCHES) $(LINUX_DIR) \
-			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ \
-			hal-linux-$${kver}-*patch ; \
-	else \
-		echo "No RTAI patch for your kernel version" ; \
-		exit 1 ; \
-	fi
-endef
diff --git a/package/Config.in b/package/Config.in
index b79f4dcca1..a24c73c2ca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2736,7 +2736,6 @@ comment "-------------------------------------------------------"
 endmenu
 
 menu "Real-Time"
-	source "package/rtai/Config.in"
 	source "package/xenomai/Config.in"
 endmenu
 
diff --git a/package/rtai/Config.in b/package/rtai/Config.in
deleted file mode 100644
index 14b1854837..0000000000
--- a/package/rtai/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_RTAI
-	bool "rtai"
-	depends on BR2_LINUX_KERNEL_EXT_RTAI
-	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
-	help
-	  RTAI - the RealTime Application Interface for Linux.
-
-	  http://www.rtai.org
diff --git a/package/rtai/rtai.hash b/package/rtai/rtai.hash
deleted file mode 100644
index f2eb7f33ad..0000000000
--- a/package/rtai/rtai.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256  57acd3ad46cc8f1e01dc21089a24587c59e7328cbac06abb62bb0152de0b9df7  rtai-5.3.tar.bz2
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
deleted file mode 100644
index 6e189bf27b..0000000000
--- a/package/rtai/rtai.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# rtai
-#
-################################################################################
-
-RTAI_VERSION = 5.3
-RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
-RTAI_SITE = https://raw.githubusercontent.com/mmorandi/RTAI/cb3c52f056559c9aaa54d0e1c8c0b47467ae5f3e/userfiles/downloads/RTAI
-RTAI_INSTALL_STAGING = YES
-
-# The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config
-define RTAI_POST_PATCH_FIXUP
-	$(SED) 's%^staging=.*%staging=$(STAGING_DIR)%' $(STAGING_DIR)/usr/bin/rtai-config
-endef
-
-RTAI_POST_INSTALL_STAGING_HOOKS += RTAI_POST_PATCH_FIXUP
-
-RTAI_DEPENDENCIES = linux
-
-RTAI_CONF_OPTS = \
-	--includedir=/usr/include/rtai \
-	--with-linux-dir=$(LINUX_DIR) \
-	--disable-leds \
-	--enable-usi \
-	--enable-align-priority \
-	--disable-rtailab \
-	--with-module-dir=/lib/modules/$(LINUX_VERSION_PROBED)/rtai
-
-RTAI_MAKE = $(MAKE1)
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
