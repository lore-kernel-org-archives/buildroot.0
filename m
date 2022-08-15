Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C75C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 11:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FFC6400CB;
	Mon, 15 Aug 2022 11:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FFC6400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGgKJZcz2O7C; Mon, 15 Aug 2022 11:17:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F1FA40185;
	Mon, 15 Aug 2022 11:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F1FA40185
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59C9D1BF34A
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 11:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3248560DC2
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 11:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3248560DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1DA-E953eyoH for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 11:17:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77E4660D4D
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77E4660D4D
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 11:17:22 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id w19so12978300ejc.7
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 04:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=uGpGFu9V6pRalNPwU7JOlIR8S8CH+R1yFc+cnMUAXC8=;
 b=hqYSvVIV3bWKOQ6VAAh0NFnxVTLynZaKWDi+vjKk4vJe8qecACNcamxnCZ3nU/cC9h
 lrwgPgRDTluuaPanMWqti5y/x4BDMRO1pPhKlwwVzlMbyuwPWR4JYDm/coZ9sPYLZvXP
 tv1yzncVsEUIFnW9dvAYa5YSdbGvHavoSII3fbCUeoDEkJO0O5M7vOX5uTdm93cFaOi7
 XrAUbhjMdk88at4xNyHbGNPqxhfF5Bon1JswnL3Gi8DM7gE1flMF4SBgbTfNwcldaF+x
 88k1qyoPWuQOJ8en2dbVyHpB2UGIRggsAWQB5h1qT5uQsJTWD4wYtJP1F9bvT+jNXq2i
 6vug==
X-Gm-Message-State: ACgBeo2GuR9B1EFhmo7suwzQ02wTz8fgGXhS/R8pY2U+An+CWrPkNtBc
 6ACg7SSZ/eNAgo7lMEK78zGePDOfFPa8Ia3g
X-Google-Smtp-Source: AA6agR6EACRWjov9qCrsAkbom3hBNA39sFJt0Lkvz3ioaVuYmucVrZ4Lm6ZOh+K5894n+1UgBAr72g==
X-Received: by 2002:a17:907:a063:b0:730:750b:bb62 with SMTP id
 ia3-20020a170907a06300b00730750bbb62mr10207526ejc.612.1660562240651; 
 Mon, 15 Aug 2022 04:17:20 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 eu18-20020a170907299200b00731582babcasm3961871ejc.71.2022.08.15.04.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 04:17:20 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 13:17:10 +0200
Message-Id: <20220815111710.1459820-3-arnout@mind.be>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815111710.1459820-1-arnout@mind.be>
References: <20220815111710.1459820-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=uGpGFu9V6pRalNPwU7JOlIR8S8CH+R1yFc+cnMUAXC8=;
 b=NV2r3qB86sXF6W55a48LFuzELQLYTR+KyHwraRJZM8S5tFP8tWDaDTERLyAR2g7hFA
 qWB7asgLmma4EpKO08i8xTNPv5D0u4EgDstjAA0rSzZwg23Pfp4a/taum7uUss9ZCve0
 m17Di6eZRBxWn3g2lzaImcap27xbq83c5PoQco8nkNuciTUWMcnOtCm3JeJbeV5ohbB9
 vFRE4llundcnRmXsra4GmHrgjZ4A7aPbeqJYdN9J2TvdFIg0oBhGafYRd/fEx8Tb8NR7
 E+E0VWM5nK/BRy60uR5yX5piLalxjMJrLl19QmGQFT3AUQrSOc2S4A7AjJ9mCtctxJiF
 T8Dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NV2r3qB8
Subject: [Buildroot] [PATCH next v5 3/3]
 support/testing/tests/fs/test_cpio.py: new runtime test
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thierry Bultel <thierry.bultel@linatsea.fr>

It includes a simple test for the full cpio image, and a test of the
dracut image. To validate that the dracut image is a subset of the full
image, 'pv' is added to the image, and the test verifies that pv is not
part of the image. Note that the real rootfs is not mounted at the
moment, so pv is never available in the running image.

Systemd and other init systems are currently untested.

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v4 -> v5 (Arnout)
  - move runtime test to separate patch;
  - add tests for all libcs;
  - remove tar;
  - add pv and test that it's not included in cpio.
---
 support/testing/tests/fs/test_cpio.py | 93 +++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 support/testing/tests/fs/test_cpio.py

diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
new file mode 100644
index 0000000000..98620ebc06
--- /dev/null
+++ b/support/testing/tests/fs/test_cpio.py
@@ -0,0 +1,93 @@
+import os
+import infra.basetest
+import subprocess
+
+CHECK_FS_CMD = "mount | grep 'rootfs on / type rootfs'"
+
+
+def boot_img(emulator, builddir):
+    img = os.path.join(builddir, "images", "rootfs.cpio")
+    emulator.boot(arch="armv7",
+                  kernel="builtin",
+                  options=["-initrd", "{}".format(img)])
+    emulator.login()
+    _, exit_code = emulator.run(CHECK_FS_CMD)
+    return exit_code
+
+
+class TestCpioFull(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_INIT_BUSYBOX=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_FULL=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+
+        exit_code = boot_img(self.emulator,
+                             self.builddir)
+        self.assertEqual(exit_code, 0)
+
+
+class TestCpioDracutBase(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_INIT_BUSYBOX=y
+        BR2_PACKAGE_PV=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_DRACUT=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def check_dracut(self):
+        out = subprocess.check_output(["cpio", "--list"],
+                                      stdin=open(os.path.join(self.builddir, "images/rootfs.cpio")),
+                                      stderr=open(os.devnull, "w"),
+                                      cwd=self.builddir,
+                                      env={"LANG": "C"},
+                                      universal_newlines=True)
+        # pv should *not* be included in cpio image
+        self.assertEqual(out.find("bin/pv"), -1)
+
+        exit_code = boot_img(self.emulator,
+                             self.builddir)
+        self.assertEqual(exit_code, 0)
+
+        # No pivot_root is done, so pv shouldn't be there
+        _, exit_code = self.emulator.run("ls -l /usr/bin/pv")
+        self.assertNotEqual(exit_code, 0)
+
+
+class TestCpioDracutUclibc(TestCpioDracutBase):
+    config = TestCpioDracutBase.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_dracut()
+
+
+class TestCpioDracutGlibc(TestCpioDracutBase):
+    config = TestCpioDracutBase.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_dracut()
+
+
+class TestCpioDracutMusl(TestCpioDracutBase):
+    config = TestCpioDracutBase.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_dracut()
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
