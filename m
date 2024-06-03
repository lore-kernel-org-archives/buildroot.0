Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D227C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E97060EE2;
	Mon,  3 Jun 2024 07:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I7VXq4m-owgH; Mon,  3 Jun 2024 07:18:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0F6160EED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0F6160EED;
	Mon,  3 Jun 2024 07:18:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDBCD1BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B537E606DB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MhnrPy4KfTq for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:17:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C56260711
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C56260711
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C56260711
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:17:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94FC6C0008;
 Mon,  3 Jun 2024 07:17:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sE1wq-002Ee3-0S;
 Mon, 03 Jun 2024 09:17:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 09:17:26 +0200
Message-Id: <20240603071726.532652-23-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603071726.532652-1-peter@korsgaard.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 23/23] package/on2-8170-modules: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the corresponding binary library and gstreamer 0.10 plugin removed, the
package for the kernel module does not make a lot of sense, so remove the
package.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                               |  7 +++++++
 package/Config.in                              |  1 -
 package/on2-8170-modules/Config.in             | 13 -------------
 package/on2-8170-modules/on2-8170-modules.hash |  2 --
 package/on2-8170-modules/on2-8170-modules.mk   | 14 --------------
 5 files changed, 7 insertions(+), 30 deletions(-)
 delete mode 100644 package/on2-8170-modules/Config.in
 delete mode 100644 package/on2-8170-modules/on2-8170-modules.hash
 delete mode 100644 package/on2-8170-modules/on2-8170-modules.mk

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
