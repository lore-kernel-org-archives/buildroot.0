Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEC0EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 16:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BC0140291;
	Thu, 22 Jun 2023 16:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BC0140291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2RhyN9I0iLy; Thu, 22 Jun 2023 16:03:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F43442136;
	Thu, 22 Jun 2023 16:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F43442136
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DCBC1BF3D1
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4233B42052
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4233B42052
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id usm5JvtEcq50 for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 16:02:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C503542045
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C503542045
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 16:02:18 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MG2HS9070355
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 11:02:17 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MG2HBw022550
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 11:02:17 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 11:02:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 11:02:16 -0500
Received: from dasso.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MG2Giu107613;
 Thu, 22 Jun 2023 11:02:16 -0500
To: <buildroot@buildroot.org>
Date: Thu, 22 Jun 2023 11:02:02 -0500
Message-ID: <20230622160212.2063472-2-dannenberg@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622160212.2063472-1-dannenberg@ti.com>
References: <20230622160212.2063472-1-dannenberg@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1687449737;
 bh=benGHyC1ZE0jvkXwCxn7qZFWCikoi4eG2TyZD72QEF4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=fIJNt9IMr1SDg7ikFyLQnzA7Yyjr1eTcV2KirEMf8G+qhhJKfZJUzD3eVGOSdo2ce
 u+Ic2XXt6g3lIWnHnqPFyK82RsnPdo9h2hfhdWmf7DPY2iz5LgINpyDMAzP66qrymx
 P4KBOA6kwVjFOwIF07Py+YHVky396M0DKfNmwNUU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=fIJNt9IM
Subject: [Buildroot] [PATCH v9 01/11] boot/ti-k3-r5-loader: allow for full
 build source customization
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The TI K3 R5 loader package essentially is a wrapper to build a special
version of U-boot SPL used as part of a multi-stage boot flow on TI K3
devices, and as such needs full flexibility as to specifying the U-Boot
sources used for the build. To accomodate this, add the same options as
already available in the regular U-Boot package. For most use cases, the
same source settings (repo URL, versions, etc.) should be used for both
ti-k3-r5-loader and uboot packages.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
---
 boot/ti-k3-r5-loader/Config.in          | 65 +++++++++++++++++++++++--
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 32 +++++++++++-
 2 files changed, 93 insertions(+), 4 deletions(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 10602c8df3..2419babe70 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -1,14 +1,73 @@
 config BR2_TARGET_TI_K3_R5_LOADER
-	bool "ti-k3-r5-loader"
+	bool "TI K3 R5 Loader"
 	depends on BR2_aarch64
 	help
-	  Separate U-Boot build for R5 cores on TI's k3 boards.
+	  Separate U-Boot SPL build for R5 core on TI's K3 processors.
 	  Usually used to build tiboot3.bin with k3-image-gen.
 
 if BR2_TARGET_TI_K3_R5_LOADER
 
 choice
-	prompt "Configuration"
+	prompt "U-Boot Version"
+	help
+	  Select the specific U-Boot version you want to use to build the
+	  initial SPL running on the R5 core. Note that for most use cases
+	  you'd want to use the exact same configuration here as it is used
+	  to build the main U-Boot package.
+
+config BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
+	bool "2022.10"
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific official versions
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
+	bool "Custom tarball"
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT
+	bool "Custom Git repository"
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG
+	bool "Custom Mercurial repository"
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN
+	bool "Custom Subversion repository"
+
+endchoice
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE
+	string "U-Boot version"
+	depends on BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL_LOCATION
+	string "URL of custom U-Boot tarball"
+	depends on BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
+
+if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT || BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG || BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by
+	  Git/Mercurial/Subversion E.G. a sha id, a tag, branch, ..
+
+endif
+
+config BR2_TARGET_TI_K3_R5_LOADER_VERSION
+	string
+	default "2022.10"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
+	default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE \
+		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
+	default "custom"	if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
+	default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_VERSION \
+		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT || BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG || BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN
+choice
+	prompt "U-Boot Configuration"
 	default BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
 
 config BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index afa309aa98..341888623e 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -2,11 +2,41 @@
 #
 # ti-k3-r5-loader
 #
+# The ti-k3-r5 loader package should really be built from the same U-Boot
+# sources as the uboot package itself, so for most users so all LOADER_SITE /
+# LOADER_SOURCE type definitions should be set the same for both packages.
+# However it still makes sense to keep the ti-k3-r5-loader package somewhat
+# separated and independent from the uboot package to allow for special use
+# cases such as Falcon boot (which would skip the uboot package completely).
+#
 ################################################################################
 
-TI_K3_R5_LOADER_VERSION = 2022.10
+TI_K3_R5_LOADER_VERSION = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_VERSION))
+
+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL),y)
+# Handle custom U-Boot tarballs as specified by the configuration
+TI_K3_R5_LOADER_TARBALL = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL_LOCATION))
+TI_K3_R5_LOADER_SITE = $(patsubst %/,%,$(dir $(TI_K3_R5_LOADER_TARBALL)))
+TI_K3_R5_LOADER_SOURCE = $(notdir $(TI_K3_R5_LOADER_TARBALL))
+else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT),y)
+TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
+TI_K3_R5_LOADER_SITE_METHOD = git
+else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG),y)
+TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
+TI_K3_R5_LOADER_SITE_METHOD = hg
+else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN),y)
+TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
+TI_K3_R5_LOADER_SITE_METHOD = svn
+else
+# Handle stable official U-Boot versions
 TI_K3_R5_LOADER_SITE = https://ftp.denx.de/pub/u-boot
 TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.bz2
+endif
+
+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER)$(BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(TI_K3_R5_LOADER_SOURCE)
+endif
+
 TI_K3_R5_LOADER_LICENSE = GPL-2.0+
 TI_K3_R5_LOADER_LICENSE_FILES = Licenses/gpl-2.0.txt
 TI_K3_R5_LOADER_CPE_ID_VENDOR = denx
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
