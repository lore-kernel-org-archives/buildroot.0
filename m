Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3719C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 18:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A97E9405CC;
	Sun, 24 Mar 2024 18:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idTYG6qaJARs; Sun, 24 Mar 2024 18:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE831405FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE831405FA;
	Sun, 24 Mar 2024 18:01:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3F4A1BF40A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE87C40104
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7NqkQ0BnuHK for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 18:01:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32AF14026A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32AF14026A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32AF14026A
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 18:01:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24187240003;
 Sun, 24 Mar 2024 18:01:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1roSA2-006ftd-1p;
 Sun, 24 Mar 2024 19:01:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 19:01:29 +0100
Message-Id: <20240324180130.1590984-4-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240324180130.1590984-1-peter@korsgaard.com>
References: <20240324180130.1590984-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 4/4] configs/nezha_defconfig: add hashes for
 Linux/opensbi/u-boot
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

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/nezha/patches/linux-headers/linux-headers.hash | 1 +
 board/nezha/patches/linux/linux.hash                 | 2 ++
 board/nezha/patches/opensbi/opensbi.hash             | 2 ++
 board/nezha/patches/uboot/uboot.hash                 | 2 ++
 configs/nezha_defconfig                              | 2 ++
 5 files changed, 9 insertions(+)
 create mode 120000 board/nezha/patches/linux-headers/linux-headers.hash
 create mode 100644 board/nezha/patches/linux/linux.hash
 create mode 100644 board/nezha/patches/opensbi/opensbi.hash
 create mode 100644 board/nezha/patches/uboot/uboot.hash

diff --git a/board/nezha/patches/linux-headers/linux-headers.hash b/board/nezha/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/nezha/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/nezha/patches/linux/linux.hash b/board/nezha/patches/linux/linux.hash
new file mode 100644
index 0000000000..899adefd07
--- /dev/null
+++ b/board/nezha/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  23e3e7b56407250f5411bdab95763d0bc4e3a19dfa431d951df7eacabd61a2f4  linux-6.6.22.tar.xz
diff --git a/board/nezha/patches/opensbi/opensbi.hash b/board/nezha/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..bc4058abe6
--- /dev/null
+++ b/board/nezha/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  319b62a4186fbce9b81a0c5f0ec9f003a10c808397a72138bc9745d9b87b1eb1  opensbi-1.4.tar.gz
diff --git a/board/nezha/patches/uboot/uboot.hash b/board/nezha/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..7d05185938
--- /dev/null
+++ b/board/nezha/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  36db7c20b179f03aa29009565c6b34380d5629fd5c57ed110244594d9930dfed  uboot-2e89b706f5c956a70c989cd31665f1429e9a0b48.tar.gz
diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
index e717c8a08d..c234b3e243 100644
--- a/configs/nezha_defconfig
+++ b/configs/nezha_defconfig
@@ -1,5 +1,7 @@
 BR2_riscv=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/nezha/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/nezha/overlay"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
