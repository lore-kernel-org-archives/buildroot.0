Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE956C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 15:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8450141690;
	Thu, 24 Feb 2022 15:45:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3k6dYo5elF_k; Thu, 24 Feb 2022 15:45:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9774941638;
	Thu, 24 Feb 2022 15:45:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EBE11BF309
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 15:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F14E4611CE
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 15:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKWVqfVvbkdO for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 15:45:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB83260E96
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 15:45:19 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d3so321203wrf.1
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 07:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=35Xp1qvX5GhMh3810M11x82hRNb6iLun+BNzxb90Xwk=;
 b=jsNF7kBG1CGpQUxUSyJNY+KRWlJRiDYyqq95sJapaf+TT/fX/zib+sMnkyCP9cfdTX
 z24QEiMoUkFTnL2Sc7P2HkXMJwG91Nx8nuMB4ecAoZWCbgpNRwr/iIsHswIixk5zQSJc
 7vvtr8A9B/rLGCS+pHfsJ4+jGKcfbo9nhSpyql1um4EoXrqkuspqLwzn9xOcqJ3VBpvo
 IeSgr/FYzXmbZePmtRPVwVYXxKZqhyB2190d+i+RhRYgSSX9NhuvIIsCo1NOfOiAUTmL
 GS89HrFeeZjJv8Wz3l6pY2VkB4AgK0ZId2sJjz1xlKiyi+/5d7rW3KT9531rASsDLtxJ
 yk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=35Xp1qvX5GhMh3810M11x82hRNb6iLun+BNzxb90Xwk=;
 b=HE+3mbbpP8IYYASbZaBUB1glpSs/WmU9Lve2+B97+h3SgTFxOJ3xUBwBby2eLV+bat
 bMRPKOcX3MPb4IFix9jW3N0N0t5kld6IxPOEBO271KlYzvShbPN0D+jNR9ygnGpHPl4p
 SUZTaCzpzbtb/Re9WFPRo5MhAl4RaiKQ0c7OPxk7W8fIYF2iX3MlWjNCFAtW7HJg3drN
 3jhahV8g0h8eP9MVu1SCMby7b+9qfl1WonwmHV/4e1ZuByImDGtmrmBhy5qBtqfbjjud
 qoRQ3YwbOOzOtWFz0cXMUNlT1e8CQ0PVw6O4tXKhxwuYDQ5TdeRvuHIYpKWY1BHYvkR4
 Jkug==
X-Gm-Message-State: AOAM530bazhYyKwndrGoVcYjyrm8m2uNq3CwDvAD6Vt6KO943QKqrCjj
 9dNUsD8IiWLE+mV8hUIs4dEIYpUejbU=
X-Google-Smtp-Source: ABdhPJx3DL+ue+kBgvDhHkEvEA6VZe95wKcCisrAQIWABoUfoPFS5eSqJ7iFssDbcv828H0/p+kHOA==
X-Received: by 2002:adf:fe0d:0:b0:1e3:3f5e:7469 with SMTP id
 n13-20020adffe0d000000b001e33f5e7469mr2709600wrr.61.1645717517961; 
 Thu, 24 Feb 2022 07:45:17 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a7bc4d0000000b0037bbe255339sm3118063wmk.15.2022.02.24.07.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:45:17 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 24 Feb 2022 16:45:12 +0100
Message-Id: <20220224154513.220976-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv2 1/2] support/testing: TestRust{Bin} use
 ripgrep package for testing
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TestRust and TestRustBin has been introduced at the time when there was
no cargo package infrastructure or any package using rust compiler
(Buildroot 2018.02).

Since then the ripgrep package has been introduced, initially using
the generic package infrastructure and converted later to the cargo
package infrastructure.

Due a recent change in rust/cargo removing the cargo config file [1]
the test TestRust and TestRustBin now fail to compile since they build
an hello-world crate outside of the cargo package infrastructure
without the correct environment for cross-compiling.

Replace the 'hello-world' crate by ripgrep package and check if it
can run properly in Qemu.

Fixes tests.package.test_rust.TestRustBin:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202545

But doesn't fixes tests.package.test_rust.TestRust due another bug:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202544

[1] b6378631c2609742382984f6f7b93c1d9d2cdb78

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
v2: no changes
---
 support/testing/tests/package/test_rust.py | 48 ++--------------------
 1 file changed, 4 insertions(+), 44 deletions(-)

diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index 884b40a4a3..a1abd20c09 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -8,9 +8,6 @@ import infra.basetest
 
 class TestRustBase(infra.basetest.BRTest):
 
-    target = 'armv7-unknown-linux-gnueabihf'
-    crate = 'hello-world'
-
     def login(self):
         img = os.path.join(self.builddir, "images", "rootfs.cpio")
         self.emulator.boot(arch="armv7",
@@ -18,43 +15,6 @@ class TestRustBase(infra.basetest.BRTest):
                            options=["-initrd", img])
         self.emulator.login()
 
-    def build_test_prog(self):
-        hostdir = os.path.join(self.builddir, 'host')
-        env = os.environ.copy()
-        env["USER"] = "br-user"
-        env["PATH"] = "{}:".format(os.path.join(hostdir, 'bin')) + env["PATH"]
-        env["CARGO_HOME"] = os.path.join(hostdir, 'usr', 'share', 'cargo')
-        env["RUST_TARGET_PATH"] = os.path.join(hostdir, 'etc', 'rustc')
-        cargo = os.path.join(hostdir, 'bin', 'cargo')
-        workdir = os.path.join(tempfile.mkdtemp(suffix='-br2-testing-rust'),
-                               self.crate)
-        manifest = os.path.join(workdir, 'Cargo.toml')
-        prog = os.path.join(workdir, 'target', self.target, 'debug', self.crate)
-
-        cmd = [cargo, 'init', '--bin', '--vcs', 'none', '-vv', workdir]
-        ret = subprocess.call(cmd,
-                              stdout=self.b.logfile,
-                              stderr=self.b.logfile,
-                              env=env)
-        if ret != 0:
-            raise SystemError("Cargo init failed")
-
-        cmd = [
-            cargo, 'build', '-vv', '--target', self.target,
-            '--manifest-path', manifest
-        ]
-        ret = subprocess.call(cmd,
-                              stdout=self.b.logfile,
-                              stderr=self.b.logfile,
-                              env=env)
-        if ret != 0:
-            raise SystemError("Cargo build failed")
-
-        shutil.copy(prog, os.path.join(self.builddir, 'target', 'usr', 'bin'))
-        self.b.build()
-        shutil.rmtree(workdir)
-
-
 class TestRustBin(TestRustBase):
     config = \
         """
@@ -68,12 +28,12 @@ class TestRustBin(TestRustBase):
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_PACKAGE_HOST_RUSTC=y
+        BR2_PACKAGE_RIPGREP=y
         """
 
     def test_run(self):
-        self.build_test_prog()
         self.login()
-        self.assertRunOk(self.crate)
+        self.assertRunOk("rg Buildroot /etc/issue")
 
 
 class TestRust(TestRustBase):
@@ -90,9 +50,9 @@ class TestRust(TestRustBase):
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_PACKAGE_HOST_RUSTC=y
         BR2_PACKAGE_HOST_RUST=y
+        BR2_PACKAGE_RIPGREP=y
         """
 
     def test_run(self):
-        self.build_test_prog()
         self.login()
-        self.assertRunOk(self.crate)
+        self.assertRunOk("rg Buildroot /etc/issue")
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
