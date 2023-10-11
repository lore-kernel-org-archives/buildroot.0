Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23BACD6E56
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 09:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 223F1415D1;
	Wed, 11 Oct 2023 09:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 223F1415D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O-7VBSjqFQp7; Wed, 11 Oct 2023 09:23:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17BAD4059B;
	Wed, 11 Oct 2023 09:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17BAD4059B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5D421BF2C7
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 09:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEC624059B
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 09:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEC624059B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ta7W_DKq-Rz for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 09:23:09 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7370403C0
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 09:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7370403C0
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9b9a494cc59so1097822066b.3
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 02:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697016186; x=1697620986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3rHwbevEB0o7vFnLSuFfowsH/NaAtuDEiXXlAWlgMS0=;
 b=Xgl4EtMjbAwh3CJK3URU6Nqmwqc3jSWnBCU51DDrbICo9jes5uDz+ANjnNcUXcSffo
 Al/NPZ7YBx0UslR3fHSVHYfcrt28UoLQPBWXKkx/HkalmstbmCBl4FE92EwEpA7HxGB0
 XxA40UFE7iho1Xj9X2rLJU1DVYpIyYZd/U1EDS2ZL2G1eEHvG0iQfj7R+Y3cfE8213Qf
 LcEMfScQFAf/5Usi3TJqWyuWm64ygeUeOL1s+h434TdYLa1nEOMMAes04mQ5s2mwMpHK
 5mc7PdoMGf0rpMTvYBK5sxLXcMyBVDNOHC0v+wZe0qit4r0zR6ZY1GzMlRblqGtYFuL+
 hLmg==
X-Gm-Message-State: AOJu0Yz4M0+NClrpPft8H8L5m0LIbE6yx4UEek7dxPEUbLYjFVVV1IuC
 tGDODFW1kJ9rbWC0lrIsFpquWq9PGlFUoGzCvQaOlA==
X-Google-Smtp-Source: AGHT+IEUp0pOMgoL7uftoZvV8hZc0Iv1cc7S+tZ93C3lwuagL3bbtl7lIBe8nXln0LXKztwjAL2Eww==
X-Received: by 2002:a17:906:1d:b0:9ae:505d:310b with SMTP id
 29-20020a170906001d00b009ae505d310bmr18320883eja.39.1697016186569; 
 Wed, 11 Oct 2023 02:23:06 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 rp19-20020a170906d97300b009b95b46bbd1sm9535825ejb.133.2023.10.11.02.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 02:23:06 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 11:22:50 +0200
Message-ID: <20231011092250.3739529-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011092250.3739529-1-adam.duskett@amarulasolutions.com>
References: <20231011092250.3739529-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697016186; x=1697620986;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3rHwbevEB0o7vFnLSuFfowsH/NaAtuDEiXXlAWlgMS0=;
 b=cmrSS7/Tahuny8rHTPkdhEhwFcEOXKQV0HeRYfJU0fGeK+L33rFPSpzvMJCE8MNSJP
 gpLNVWH12iHWfuuHbvLFUOY3NeCucaBozLvKCXMfhCofo4eiRFZ1+tZM6U5szmdXVV78
 ou4nY8PHPcTBloUOcC5oJ7d2CbSbKkmBU/KMs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cmrSS7/T
Subject: [Buildroot] [PATCH 2/2]
 support/testing/tests/package/test_firewalld.py: new test
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This test case runs firewalld using both system and sysvinit.

run `firewalld-cmd --state` and ensure the output is "running" with a return
code of 0.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_firewalld.py   | 94 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 support/testing/tests/package/test_firewalld.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 3fffc4346c..349f609e64 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	support/testing/tests/package/test_firewalld.py
 F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Heinrich <adam@adamh.cz>
diff --git a/support/testing/tests/package/test_firewalld.py b/support/testing/tests/package/test_firewalld.py
new file mode 100644
index 0000000000..4b0282d3e4
--- /dev/null
+++ b/support/testing/tests/package/test_firewalld.py
@@ -0,0 +1,94 @@
+"""Test firewalld for both systemd and sysvinit."""
+import os
+import infra.basetest
+
+
+class TestFirewalldSystemd(infra.basetest.BRTest):
+    """Build the kernel as firewalld requires several the nftable options."""
+
+    __test__ = True
+    config: str = """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_INIT_SYSTEMD=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.57"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_FIREWALLD=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kernel_file = os.path.join(self.builddir, "images", "zImage")
+        dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        self.emulator.boot(arch="armv7",
+                           kernel=kernel_file,
+                           kernel_cmdline=["console=ttyAMA0,115200"],
+                           options=[
+                               "-initrd", cpio_file,
+                               "-dtb", dtb_file,
+                               "-M", "vexpress-a9"
+                           ])
+        # It takes quite some time for the system to boot with firewalld,
+        self.emulator.timeout_multiplier *= 10
+        self.emulator.login()
+        cmd = "firewall-cmd --state"
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertIn("running", output[0])
+        self.assertEqual(exit_code, 0)
+
+
+class TestFirewalldSysVInit(infra.basetest.BRTest):
+    """Build the kernel as firewalld requires several nftable options."""
+
+    __test__ = True
+    config: str = """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.57"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_FIREWALLD=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kernel_file = os.path.join(self.builddir, "images", "zImage")
+        dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        self.emulator.boot(arch="armv7",
+                           kernel=kernel_file,
+                           kernel_cmdline=["console=ttyAMA0,115200"],
+                           options=[
+                               "-initrd", cpio_file,
+                               "-dtb", dtb_file,
+                               "-M", "vexpress-a9"
+                           ])
+        # It takes quite some time for the system to boot with firewalld.
+        self.emulator.timeout_multiplier *= 10
+        self.emulator.login()
+        cmd = "firewall-cmd --state"
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertIn("running", output[0])
+        self.assertEqual(exit_code, 0)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
