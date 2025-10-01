Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77E3CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 14:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD19282778;
	Wed,  1 Oct 2025 14:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjaT7a0mwJuu; Wed,  1 Oct 2025 14:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91B7583D94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91B7583D94;
	Wed,  1 Oct 2025 14:58:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C7052A6
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94EAB61348
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCZY7Vq1xcKR for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 14:58:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A217761131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A217761131
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A217761131
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:58:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9694D1A1080;
 Wed,  1 Oct 2025 14:58:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6E68E606BF;
 Wed,  1 Oct 2025 14:58:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1EBDF102F1A46; 
 Wed,  1 Oct 2025 16:58:43 +0200 (CEST)
Date: Wed, 01 Oct 2025 14:58:23 +0000
MIME-Version: 1.0
Message-Id: <20251001-fix_license-v2-1-bf18911c835d@bootlin.com>
References: <20251001-fix_license-v2-0-bf18911c835d@bootlin.com>
In-Reply-To: <20251001-fix_license-v2-0-bf18911c835d@bootlin.com>
To: buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>, 
 Alistair Francis <alistair@alistair23.me>, Dick Olsson <hi@senzilla.io>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Simon Dawson <spdawson@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1759330724; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AWkmObbDh7YAUv7CHnyLId9t2O0bGuXWFoPcGgkFYF4=;
 b=VxSw6CKxyojK0go8H/fU0+RijGdRgsHteu9Hg0RlpysP2WaxofGhMI/XqbhjMPy49uwsqu
 Jm+/6aR7ycost2L1qZnbZz3JxxNy11rM00+Wt74gwuRHdXtOBW2o/HxjkbNZqDehF2sJak
 5oWNvLsKqMrqPzSpOgYRg0zaLXmhv4n0CkL7xtkY7BcBuFrI1hcgUuR+sbFPquzLg48q9n
 HRNMeRRgWTxAtpuBoHRjr/326Vv4geaNPu9LYEt/G5gYJ7EjZUqPU2EBb4oqVeoTUm/mDG
 xG5Wkr5BmUYMv5Y5VUZXkSU03dQPppFHxL5TKGwsP0I4bpPDugOd4NvCOCeywQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VxSw6CKx
Subject: [Buildroot] [PATCH v2 1/7] linux: Add support for custom license
 files
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Linux package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- Do not show license option if it is not a custom repo
---
 linux/Config.in | 16 ++++++++++++++++
 linux/linux.mk  |  8 ++------
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1f1c014ba21fe8ca5f06993f08c6707f6501d9af..6352260cd7d90520964d5ea6fb2714fbf827557d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -150,6 +150,22 @@ config BR2_LINUX_KERNEL_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
 		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
 
+config BR2_LINUX_KERNEL_CUSTOM_LICENSE_FILES
+	string "Kernel license files"
+	default "COPYING LICENSES/preferred/GPL-2.0 LICENSES/exceptions/Linux-syscall-note"
+	depends on BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || \
+		   BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_TARBALL
+	help
+	  A space-separated list of license files related to the Linux
+	  kernel package.
+
+config BR2_LINUX_KERNEL_LICENSE_FILES
+	string
+	default BR2_LINUX_KERNEL_CUSTOM_LICENSE_FILES \
+		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || \
+		   BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_TARBALL
+	default "COPYING LICENSES/preferred/GPL-2.0 LICENSES/exceptions/Linux-syscall-note"
+
 #
 # Patch selection
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 0520394931ce7950a750d4f57dab451377886612..c61089bfe040ba9dee9efc00c0ec3cf4f9ef0167 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -6,12 +6,8 @@
 
 LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPL-2.0
-ifeq ($(BR2_LINUX_KERNEL_LATEST_VERSION),y)
-LINUX_LICENSE_FILES = \
-	COPYING \
-	LICENSES/preferred/GPL-2.0 \
-	LICENSES/exceptions/Linux-syscall-note
-endif
+LINUX_LICENSE_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_LICENSE_FILES))
+
 LINUX_CPE_ID_VENDOR = linux
 LINUX_CPE_ID_PRODUCT = linux_kernel
 LINUX_CPE_ID_PREFIX = cpe:2.3:o

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
