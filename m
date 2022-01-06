Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76948C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 16:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 023F440133;
	Thu,  6 Jan 2022 16:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fPYJKAjeoZG; Thu,  6 Jan 2022 16:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEAF140181;
	Thu,  6 Jan 2022 16:13:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD13B1BF3D1
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 16:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8BB28141F
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 16:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APZXpGOpvTiO for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 16:13:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AB738140C
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 16:13:06 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id o3so5730785wrh.10
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 08:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cH8EbwWovmT39UTaXlMM3mMeIduge/BO5PDNxXNC8H4=;
 b=ul7rRucJWUwE/evpvtPr6RuJoLvOff7PvsnyvSiy32anTkkYxsM4dK5UDsIDhy03wO
 kvt2WhfqfgUtFZfTLaTXTEcbQ0rs5hUL18B3WC+Tj8SMj4hVeNmTBGcd3R2j6z66SEI0
 Q0lIeT8zA2+bUs8Mc48K3/Wnd+keBAIPqDt3MP5RzrkCQebZs3YOVez5fN3Wydzqx52K
 j5E5cNOriGWFt6vs8K8YBP80RMQ1Wcy7ZnYa29Fog0Cz3Z8FbuJUYjxAjg+izzMPIJ0s
 oatVQy9ZTIFB+0/YqjhQpZ4lhksSM1gkKnSjXWEbFOgD6DKpPvXbOQj0kOzdD1L9Gubh
 C1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cH8EbwWovmT39UTaXlMM3mMeIduge/BO5PDNxXNC8H4=;
 b=o9gqaJXwT2talIhb6J3w8BOQEs06qq5WtUISFM5WUxAsSVqDWaZsKhROqWoApO7moR
 KTQSuudgOqOJ9tgrjZXYEbO07OCwMDOAntC/dnKY4QFOVzrCUcCsK/axlXPRmhXhNswd
 zcX/5fEHhLT398alANI3rjy/V+1bJ8aizX6LCaQ8GdkCeUdlUguRDMeHifAfFZD0WIRn
 iOkVBh5ZYi2k0aS6tksR9KRcAjYYph37u9ZdWfdytefzbek6LFrlQP+1TG0b/4rHD5Bc
 ur1sVbwM1VxQxsoKiXy65xqA7p57YlFEoOK5EiK9gWxjq65gRVTmeC39YuLeW2UVI/OR
 THjA==
X-Gm-Message-State: AOAM531M0AQ12/jfAcHjFYevDaUTMnM/vOQglUcoeR1yCvNkQVyr06lT
 ENu2QBHAC0fRZ8etthy0f3bFVEFnoFCG7g==
X-Google-Smtp-Source: ABdhPJwsMQfb60ZMLzYCx5+CmTs6JJLQ7VMCC7sd5hll4n/Gjbg36lByvNdmF7iJLnQKXoH7wtHVjg==
X-Received: by 2002:a05:6000:1c1c:: with SMTP id
 ba28mr11569561wrb.37.1641485584660; 
 Thu, 06 Jan 2022 08:13:04 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id p62sm2075340wmp.10.2022.01.06.08.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 08:13:04 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 17:13:01 +0100
Message-Id: <20220106161301.1910709-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv3 2/2] support/testing: add
 package/test_mender.py
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
Cc: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>,
 Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>

Create a test to check Mender client at runtime.

The aim of this test is:
  - to check the correct execution of simple Mender commands,
    in a minimal environment;
  - to validate there is no missing dependencies for runtime.

This test is not a board integration test for Mender,
including well-configured bootloader, partitioning, ...

Check:
  - the daemon is started;
  - the current 'artifact name' (name of the image or update) of the active
    partition is read, without error.

For that, we need to fake (see the 'overlay' directory):
  - some bootloader environment variables;
  - the name of an update.

Signed-off-by: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>
[Romain: remove single hyphen command (Mender 3.0.0)]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v3: remove single hyphen command (Mender 3.0.0)

Changes v1 -> v2:
  - Update the test by removing unnecessary 'build' option (Thomas P.)
  - Remove a useless test case (Thomas P.)
---
 support/testing/tests/package/test_mender.py  | 32 +++++++++++++++++++
 .../rootfs-overlay/etc/mender/artifact_info   |  1 +
 .../rootfs-overlay/usr/bin/fw_printenv        |  6 ++++
 3 files changed, 39 insertions(+)
 create mode 100644 support/testing/tests/package/test_mender.py
 create mode 100644 support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info
 create mode 100755 support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_printenv

diff --git a/support/testing/tests/package/test_mender.py b/support/testing/tests/package/test_mender.py
new file mode 100644
index 0000000000..fdf55ed616
--- /dev/null
+++ b/support/testing/tests/package/test_mender.py
@@ -0,0 +1,32 @@
+import os
+
+import infra.basetest
+
+
+class TestMender(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_MENDER=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_ROOTFS_OVERLAY="{}"
+        """.format(
+           # overlay to add a fake 'fw_printenv', used by Mender
+           infra.filepath("tests/package/test_mender/rootfs-overlay"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check if the Daemon is running
+        self.assertRunOk("ls /var/run/mender.pid")
+        self.assertRunOk("ps aux | egrep [m]ender")
+
+        # Check if a simple Mender command is correctly executed
+        self.assertRunOk("mender -log-level debug show-artifact")
+        self.assertRunOk("mender -log-level debug show-artifact | grep 'RUNTIME_TEST_ARTIFACT_NAME'")
+        cmd = "mender show-artifact 2>&1 | grep -i 'err'"  # Check if no 'error' among the traces
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 1)
diff --git a/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info
new file mode 100644
index 0000000000..4d54b8f89c
--- /dev/null
+++ b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info
@@ -0,0 +1 @@
+artifact_name=RUNTIME_TEST_ARTIFACT_NAME
diff --git a/support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_printenv b/support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_printenv
new file mode 100755
index 0000000000..c002a0f2b8
--- /dev/null
+++ b/support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_printenv
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# Fake 'fw_printenv' because UBoot is not installed: print some plausible 'key-value'
+echo "bootcount=0"
+echo "mender_boot_part=rootfs"
+echo "upgrade_available=0"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
