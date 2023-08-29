Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB948C83F12
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 21:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D8D60F2E;
	Tue, 29 Aug 2023 21:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95D8D60F2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rdDJUr3VXPXy; Tue, 29 Aug 2023 21:39:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7517F6115D;
	Tue, 29 Aug 2023 21:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7517F6115D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 005681BF5A8
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE33B8211D
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE33B8211D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ta0KvLtFbp_9 for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 21:37:40 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 099308210E
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 21:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 099308210E
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1c1f7f7151fso13558955ad.1
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 14:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693345059; x=1693949859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PS0uIQSbMfTdfpvGYQ0hhmV2z37Dq5IoOJ+zw6i2yMA=;
 b=Mj7c/LU36vlHqbzfQjmV84vazsJwpjLgM+9dav1oAyuV+BpVi/MIs0tZcTtXOYqW02
 gbiiTHGEQiveHMOPirOzW/g2hHFj6b5w+smxjxQy4Lwxtvx7ro7Nnl9iP98zrY9vSWS4
 1ZPnAyMREcSA9N8AF+aKmcu4ckHsouAC9Drda38Wl/5hV2KNPG+OA1XzMFjXaGHmcOI7
 nxL1xpZiOsf4XJzjBY3Z8MsPmWMjuctY/NTIyk/tIM0rZFOLz5q91hCuak1pt+TBjslO
 LBCtPcj8o2h8mQ9xcWtbx6WYRYEswdJD66eUJWuLkOZGwsrcrOBOCGfVuvVxRB2r6rmt
 z8fA==
X-Gm-Message-State: AOJu0YwTMBwFy0pepiFSO4bOVGZU7QjeWK+xKubmvGqRHhc28coFjBcT
 4y+9aR1WR+47cj5wQyUtUJ4EdTrTWn9avhfQkGs=
X-Google-Smtp-Source: AGHT+IFXHpwHmSFhX5vv6onVXx7MB0Hv1F/v6kVVhWuEhimgFlGf/qjbwBhEE6+M1vmLny4dwLp4qg==
X-Received: by 2002:a17:903:11d1:b0:1b8:78e:7c1 with SMTP id
 q17-20020a17090311d100b001b8078e07c1mr343008plh.51.1693345059083; 
 Tue, 29 Aug 2023 14:37:39 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170902a70500b001ae0152d280sm9691516plq.193.2023.08.29.14.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 14:37:38 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 15:37:26 -0600
Message-ID: <20230829213726.1957587-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829213726.1957587-1-adam.duskett@amarulasolutions.com>
References: <20230829213726.1957587-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693345059; x=1693949859;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PS0uIQSbMfTdfpvGYQ0hhmV2z37Dq5IoOJ+zw6i2yMA=;
 b=gMvEXchLWH0CBE36XR7fPtiRcko7ex9bZwo0KDwZvU8tjuMNB9vwPzv4nYEINhLwhP
 puTJ2oIVepfK+C1jPpP3HLcCmNT/evfMX3QZ8CsixBfDzcbvo7CAXBJyb5APq5KrQETr
 Lb9wVNRZ2zCNDcNJ3W0j3PH0FXFRZKp8X9ckQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=gMvEXchL
Subject: [Buildroot] [PATCH v7 7/7]
 support/testing/tests/package/test_flutter.py: new runtime test
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a simple test that builds and runs the futter-gallery application and
checks if the service is active.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
Changes v6 -> v7:
  - Call /usr/share/flutter/gallery/release/ in the flutter-gallery.service
    file.

 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_flutter.py | 56 +++++++++++++++++++
 .../package/test_flutter/linux-vkms.fragment  |  2 +
 .../flutter-gallery.service                   |  1 +
 .../systemd/system/flutter-gallery.service    | 11 ++++
 5 files changed, 71 insertions(+)
 create mode 100644 support/testing/tests/package/test_flutter.py
 create mode 100644 support/testing/tests/package/test_flutter/linux-vkms.fragment
 create mode 120000 support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
 create mode 100644 support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service

diff --git a/DEVELOPERS b/DEVELOPERS
index ff0e362496..ff9996f929 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -32,6 +32,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Duskett <aduskett@gmail.com>
 F:	package/firewalld/
diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
new file mode 100644
index 0000000000..05dd9de910
--- /dev/null
+++ b/support/testing/tests/package/test_flutter.py
@@ -0,0 +1,56 @@
+import os
+import time
+import infra.basetest
+
+
+class TestFlutter(infra.basetest.BRTest):
+    config = f"""
+        BR2_x86_64=y
+        BR2_x86_corei7_avx=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
+        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_flutter/overlay")}"
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_INIT_SYSTEMD=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.49"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{infra.filepath("tests/package/test_flutter/linux-vkms.fragment")}"
+        BR2_PACKAGE_LIBDRM=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_PACKAGE_FLUTTER_PI=y
+        BR2_PACKAGE_FLUTTER_PI_KEYBOARD_PLUGIN=y
+        BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN=y
+        BR2_PACKAGE_FLUTTER_GALLERY=y
+        BR2_PACKAGE_FLUTTER_ENGINE=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="328M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "bzImage")
+        self.emulator.boot(
+            arch="x86_64",
+            kernel=kern,
+            kernel_cmdline=["root=/dev/vda console=ttyS0"],
+            options=["-M", "pc",
+                     "-enable-kvm",
+                     "-cpu", "IvyBridge",
+                     "-m", "512M",
+                     "-vga", "virtio",
+                     "-drive", f"file={img},if=virtio,format=raw"])
+        self.emulator.login()
+        cmd = "systemctl is-active flutter-gallery"
+        output, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "active")
diff --git a/support/testing/tests/package/test_flutter/linux-vkms.fragment b/support/testing/tests/package/test_flutter/linux-vkms.fragment
new file mode 100644
index 0000000000..3fc7a5dded
--- /dev/null
+++ b/support/testing/tests/package/test_flutter/linux-vkms.fragment
@@ -0,0 +1,2 @@
+CONFIG_DEBUG_FS=y
+CONFIG_DRM_VKMS=y
diff --git a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
new file mode 120000
index 0000000000..40993fb16c
--- /dev/null
+++ b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
@@ -0,0 +1 @@
+../../../../usr/lib/systemd/system/flutter-gallery.service
\ No newline at end of file
diff --git a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
new file mode 100644
index 0000000000..88a2bcbf0b
--- /dev/null
+++ b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=flutter-gallery daemon
+After=dbus.service systemd-udevd.service
+
+[Service]
+ExecStart=/usr/bin/flutter-pi --release /usr/share/flutter/gallery/release/
+Restart=always
+KillMode=process
+
+[Install]
+WantedBy=multi-user.target
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
