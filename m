Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440F8C77B7C
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 15:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D356C42439;
	Fri, 18 Aug 2023 15:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D356C42439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANb-eo0yveWK; Fri, 18 Aug 2023 15:53:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0239424DE;
	Fri, 18 Aug 2023 15:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0239424DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 993501BF2EC
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 15:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E8974198F
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 15:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E8974198F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbRmDEHSn4jV for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 15:52:47 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3EB841979
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 15:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3EB841979
Received: from pwmachine.numericable.fr (85-170-34-233.rev.numericable.fr
 [85.170.34.233])
 by linux.microsoft.com (Postfix) with ESMTPSA id A3265211F7D8;
 Fri, 18 Aug 2023 08:52:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A3265211F7D8
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 17:52:18 +0200
Message-Id: <20230818155219.71054-4-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818155219.71054-1-flaniel@linux.microsoft.com>
References: <20230818155219.71054-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1692373967;
 bh=8234EYB54dbReZI50p5nsgfN2P4KEeiUxCi0s/ciFOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qDDXd2M6SL6WTeDwnNWusDWxMoC8Qg/DwYhM9cytcZZNiDGHesv7pBSaGNzXUVUhh
 QXLJAfRMRIwJU0ZMqvHQjIRTnz4Q7bcAywRU+YiE41hhpMMehPiyjE17sqVWKUfIcT
 egjJrPMFHntqw0q3BJuxZth3So6pJ1SPFex2UOEc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=qDDXd2M6
Subject: [Buildroot] [RFC PATCH v3 3/3] support/testing/package: add new
 test for sysdig
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 .../testing/tests/package/test_sysdig.config  |  1 +
 support/testing/tests/package/test_sysdig.py  | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 support/testing/tests/package/test_sysdig.config
 create mode 100644 support/testing/tests/package/test_sysdig.py

diff --git a/support/testing/tests/package/test_sysdig.config b/support/testing/tests/package/test_sysdig.config
new file mode 100644
index 0000000000..6450f34933
--- /dev/null
+++ b/support/testing/tests/package/test_sysdig.config
@@ -0,0 +1 @@
+CONFIG_IPV6=y
diff --git a/support/testing/tests/package/test_sysdig.py b/support/testing/tests/package/test_sysdig.py
new file mode 100644
index 0000000000..f27114c539
--- /dev/null
+++ b/support/testing/tests/package/test_sysdig.py
@@ -0,0 +1,46 @@
+import os
+
+import infra.basetest
+
+
+class TestSysdig(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{linux_fragment}"
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_GLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+        BR2_TOOLCHAIN_GCC_AT_LEAST_5=y
+        BR2_TOOLCHAIN_HAS_THREADS=y
+        BR2_TOOLCHAIN_HAS_SYNC_4=y
+        BR2_INSTALL_LIBSTDCPP=y
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_5_1=y
+        BR2_PACKAGE_SYSDIG=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(linux_fragment=infra.filepath("tests/package/test_sysdig.config"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kernel_file = os.path.join(self.builddir, "images", "zImage")
+        dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        self.emulator.boot(arch="armv7", kernel=kernel_file,
+                           kernel_cmdline=[
+                                        "console=ttyAMA0,115200"],
+                           options=["-initrd", cpio_file,
+                                    "-dtb", dtb_file,
+                                    "-M", "vexpress-a9", "-m", "1024"])
+        self.emulator.login()
+
+        self.assertRunOk("sysdig --version")
+        # Run sysdig for 3 seconds.
+        self.assertRunOk("sysdig -M 3")
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
