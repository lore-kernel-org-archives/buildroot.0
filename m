Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C59EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65126420F7;
	Fri, 13 Feb 2026 19:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttjSV1R_DeTD; Fri, 13 Feb 2026 19:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F66A42111
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011525;
	bh=ZUFemwUW220Y5OH3BsBjsmuCXxbnVUvqBUS69ak1ZS4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YPjSkLVyAg8PdgGcF1w6UQkygCXKDPhfW5hIDXfIgj8+wrfojn9EaF2moPdoQsCa0
	 UQ44uax1NnB3T2E5btVTY0xFUHqgsYAm1OPSCluze+57efiAhjw/d1b1sLzO7Oeps4
	 qKHotl2OvytHfJqWzvGq0v6wm1WV2gMgKXUPWule2/w40WISdTKYB+QLB39nbbihid
	 oDgkbs1Wb6Qx4s6Trpx+zxdB1Nktu+5rz7LmyA5xsHsnBHkaU0oQroxaNNzoNtOXRH
	 9ea3joUgL3jAwmrXqGR5KaPFoybLie/zX4JY1h2c3JEsKj9+l6wfoCe6gm/pu6Be3F
	 rmQ2XVGo/AeMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F66A42111;
	Fri, 13 Feb 2026 19:38:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 052CC69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 414AD41298
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpnswP-OMjfH for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B12F9412C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B12F9412C6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A64EC83593; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:26:18 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: cbb1f48a643c6427f25a4d0e188d263073fe0e8e
X-Git-Newrev: 8e30572079027bc82dfc0f0ef29427f04fbe2441
X-Patchwork-Hint: ignore
Message-Id: <20260213193701.A64EC83593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] linux: Add support for
 custom license files
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e30572079027bc82dfc0f0ef29427f04fbe2441
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The Linux package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 50958bcdac6775be5d0c36bb867bbac7a7eb2e49)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/Config.in | 8 ++++++++
 linux/linux.mk  | 8 ++------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a06cc9e650..66fea6fc19 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -150,6 +150,14 @@ config BR2_LINUX_KERNEL_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
 		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
 
+config BR2_LINUX_KERNEL_LICENSE_FILES
+	string "Kernel license files" if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || \
+		BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_TARBALL
+	default "COPYING LICENSES/preferred/GPL-2.0 LICENSES/exceptions/Linux-syscall-note"
+	help
+	  A space-separated list of license files related to the Linux
+	  kernel package.
+
 #
 # Patch selection
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 0520394931..c61089bfe0 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
