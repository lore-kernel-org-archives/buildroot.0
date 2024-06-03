Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31096C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBD48414C9;
	Mon,  3 Jun 2024 09:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VdV74LTxPq3Z; Mon,  3 Jun 2024 09:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF959414BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF959414BF;
	Mon,  3 Jun 2024 09:21:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09E4E1BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4AEC40689
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLiryXd3x9MY for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E04204068A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E04204068A
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD05D87988; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 11:11:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d0d809a28d802873c3ebd209791bfdeaa2a6353
X-Git-Newrev: 083a66e1f8b46c5a79082717e59740a4dbd7cfeb
X-Patchwork-Hint: ignore
Message-Id: <20240603091957.DD05D87988@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/on2-8170-modules: remove package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=083a66e1f8b46c5a79082717e59740a4dbd7cfeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the corresponding binary library and gstreamer 0.10 plugin removed, the
package for the kernel module does not make a lot of sense, so remove the
package.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                               |  7 +++++++
 package/Config.in                              |  1 -
 package/on2-8170-modules/Config.in             | 13 -------------
 package/on2-8170-modules/on2-8170-modules.hash |  2 --
 package/on2-8170-modules/on2-8170-modules.mk   | 14 --------------
 5 files changed, 7 insertions(+), 30 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a1650733a9..b5a87d4e88 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_PACKAGE_ON2_8170_MODULES
+	bool "on2-8170-modules removed"
+	select BR2_LEGACY
+	help
+	  The corresponding library and gstreamer 0.10 plugin are no
+	  longer available.
+
 config BR2_PACKAGE_ON2_8170_LIBS
 	bool "on2-8170-libs removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 2ec4e70566..bfbec1c21d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -574,7 +574,6 @@ endmenu
 	source "package/nvme/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
-	source "package/on2-8170-modules/Config.in"
 	source "package/open2300/Config.in"
 	source "package/openfpgaloader/Config.in"
 	source "package/openipmi/Config.in"
diff --git a/package/on2-8170-modules/Config.in b/package/on2-8170-modules/Config.in
deleted file mode 100644
index 8c51e0c8d4..0000000000
--- a/package/on2-8170-modules/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_ON2_8170_MODULES
-	bool "on2-8170-modules"
-	depends on BR2_LINUX_KERNEL
-	depends on BR2_arm926t
-	help
-	  Kernel modules for Hantro x170 hardware video decompression
-	  support.
-
-	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
-
-comment "on2-8170-modules needs a Linux kernel to be built"
-	depends on BR2_arm926t
-	depends on !BR2_LINUX_KERNEL
diff --git a/package/on2-8170-modules/on2-8170-modules.hash b/package/on2-8170-modules/on2-8170-modules.hash
deleted file mode 100644
index cfb1272dd3..0000000000
--- a/package/on2-8170-modules/on2-8170-modules.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  d04d3acb8755281f6721d2a2efe04014060f83f38972208f356a486d52ca8bfc  on2-8170-modules-73b08061d30789178e692bc332b73d1d9922bf39.tar.gz
diff --git a/package/on2-8170-modules/on2-8170-modules.mk b/package/on2-8170-modules/on2-8170-modules.mk
deleted file mode 100644
index 98643134be..0000000000
--- a/package/on2-8170-modules/on2-8170-modules.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# on2-8170-modules
-#
-################################################################################
-
-ON2_8170_MODULES_VERSION = 73b08061d30789178e692bc332b73d1d9922bf39
-ON2_8170_MODULES_SITE = $(call github,alexandrebelloni,on2-8170-modules,$(ON2_8170_MODULES_VERSION))
-
-ON2_8170_MODULES_LICENSE = GPL-2.0+
-#There is no license file
-
-$(eval $(kernel-module))
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
