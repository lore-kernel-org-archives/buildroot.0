Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEC0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 00:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C26F404FE;
	Thu, 24 Feb 2022 00:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 59pHCzFlq3V5; Thu, 24 Feb 2022 00:15:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EC0440176;
	Thu, 24 Feb 2022 00:15:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDAF81BF9CB
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 00:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA598816F5
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 00:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWSCrrJEf9Xi for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 00:15:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D08918144B
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 00:15:01 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 n13-20020a05600c3b8d00b0037bff8a24ebso2548791wms.4
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 16:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HXGIIdRk7Gv9Bm/SJv7+gPCuQ+Npq9pPIbfJoj6L2IU=;
 b=VHrLO/8c2rcc/tJm3nJnGzKK8tkFcfsZZOgqsAlkBwiq2Bxt2H+e9kkKfgxh9nhxyp
 tWZRT/J9vmRQCjYHuesQJQBMSjwMLyd5xwQCV1K5AzLb8m0b3haYat1AhsrfLmsED7il
 zcOvO7cuKGsXRLci6obZOtfxayGDy9L/c7HbSF7gduceNWg0fAQtyKDtPB2IN88qg1J/
 b0dPhZE5uJA8Zu+63dAFv0DtulDH6iwpLugI8Ev55P2st1nNsqQ3xRX/9Zj19il0C5HP
 AJUncxMhjT2nia3YxxwP8l3t4DaOYFABHC693+C/hjuFI37G5g/qzx2gWh6R6U6q4lKh
 oNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HXGIIdRk7Gv9Bm/SJv7+gPCuQ+Npq9pPIbfJoj6L2IU=;
 b=KbkfgVVqiSJk1FLNV5zK7KsGebCIi9KbOkrgcGMs/h6qx2DxhkeFsMi5zD18RhEZ8N
 Bj0JofoGxKCRueG45lKcdeEcPrNi8iH6VbAp2lyh0+vrIh411nwCuAWhSTDkOIHBXoFS
 BFI2uA1/xv5DAqUemLeTZirUck2OzdsCCD8T72a2m7UCSjNQEYfzTGcioJnkTIU1HZZa
 Jm7aickOkvqWVe2P8TxYA7FtEx3gRs27vjMl+Rd3onOVxFPRGRs9SZE8BZQnCVXyVsZ8
 qqZvmsv2Fnp+oaC4PucGssPp/Fx3UtntWc3wJAdGyk7CR75MS3GRb2Aia/W9icMKpemH
 31bQ==
X-Gm-Message-State: AOAM530ZMv6wrUzm7KqV2eRNKd/PTvQQIttTMvwT1GAVqdgYm3w94l4D
 h00XbdaOiuugxrzlciC99cSL5JG+xjg=
X-Google-Smtp-Source: ABdhPJxvj37K+zM5bARia7LO1tlklNEsnJXTPA4UABc20wyH6EVpHx/dIX76/yM1nsCsnypfsnkwzQ==
X-Received: by 2002:a05:600c:a47:b0:37c:965:2b6f with SMTP id
 c7-20020a05600c0a4700b0037c09652b6fmr142195wmq.31.1645661699951; 
 Wed, 23 Feb 2022 16:14:59 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id t16sm1104769wrg.99.2022.02.23.16.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 16:14:59 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 24 Feb 2022 01:14:55 +0100
Message-Id: <20220224001455.206249-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: TestRust{Bin} use ripgrep
 package for testing
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
Cc: Romain Naour <romain.naour@gmail.com>
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
---

Using ripgrep or bat package trigger an issue while using rustc:

error[E0514]: found crate `core` compiled by an incompatible version of rustc
  |
  = help: please recompile that crate using this compiler (rustc 1.58.1) (consider running `cargo clean` first)
  = note: the following crate versions were found:
          crate `core` compiled by rustc 1.58.1 (db9d1b20b 2022-01-20): TestRust/host/lib/rustlib/x86_64-unknown-linux-gnu/lib/libcore-6cfcec236d576603.rlib

error[E0514]: found crate `std` compiled by an incompatible version of rustc

The problem is not really a cross-compilation issue (we are building
for an armv7 on x86_64 host) but a problem with rustc libraries (rlib).

We can notice that "rustc 1.58.1 (db9d1b20b 2022-01-20)" is the same
version as the prebuilt rustc:

TestRust/host/bin/rustc --version
rustc 1.58.1
TestRustBin/host/bin/rustc --version
rustc 1.58.1 (db9d1b20b 2022-01-20)

Indeed we are using host-rust-bin to bootstrap the host-rust compiler
package built by Buildroot. The problem is that the
libcore-6cfcec236d576603.rlib file come from host-rust-bin and is not
removed before installing host-rust built by Buildroot. We notice
that host-rust can't override libcore-6cfcec236d576603.rlib because
it use another hash libcore-79e5699dd357edbd.rlib

To fixes the ripgrep build we have to copy manually (for now) all rlib
files from
TestRust/build/tmp/tarball/rust-std/x86_64-unknown-linux-gnu/image/lib/rustlib/x86_64-unknown-linux-gnu/lib
to TestRust/host/lib/rustlib/x86_64-unknown-linux-gnu/lib

(Indeed we spent a lot of time to build host-rust and some important
libraries are not installed to HOST_DIR)

When Buildroot build its rust compiler we probably need to avoid
installing in HOST_DIR the rust compiler used to bootstrap.
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
