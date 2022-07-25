Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B18FC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 06:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D88AC61016;
	Mon, 25 Jul 2022 06:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D88AC61016
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCIlYfUj_AjR; Mon, 25 Jul 2022 06:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6EBC60E21;
	Mon, 25 Jul 2022 06:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6EBC60E21
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A83F1BF38C
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 06:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32B1C403EA
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 06:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32B1C403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5iVaX_wuDH-V for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 06:34:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FB90401C2
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 06:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FB90401C2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 762CE84AF2; Mon, 25 Jul 2022 06:21:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 08:30:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44128acc3cfa7a2dd5598f938094addb321161c7
X-Git-Newrev: 321cec7b9c0b6d5aa43c0f71a52f3ddf83636399
X-Patchwork-Hint: ignore
Message-Id: <20220725062104.762CE84AF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hyperfine: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=321cec7b9c0b6d5aa43c0f71a52f3ddf83636399
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

hyperfine is a benchmark tool written in Rust. It evaluates
execution time of a command passed in arguments and make
a relative comparison if multiple arguments are used at the
same time.
It can be convinient for purposes of Rust-written systems as
it runs in a stable version of Rust.

The package has been checked with correct formatting and
without typos:
./utils/check-package package/hyperfine/*

A CI test was run on gitlab.com to verify toolchain compatibilities.

Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/hyperfine/Config.in      | 11 +++++++++++
 package/hyperfine/hyperfine.hash |  4 ++++
 package/hyperfine/hyperfine.mk   | 12 ++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 628b5cf456..cd1e0e69a6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2173,6 +2173,9 @@ N:	Nicolas Serafini <nicolas.serafini@ik.me>
 F:	package/exiv2/
 F:	package/ofono/
 
+N:	Nicolas Tran <nicolas.tran@smile.fr>
+F:	package/hyperfine/
+
 N:	Niklas Cassel <niklas.cassel@wdc.com>
 F:	configs/qemu_riscv64_nommu_virt_defconfig
 
diff --git a/package/Config.in b/package/Config.in
index 3a70fe3f9f..455c69bac9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -106,6 +106,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/fwts/Config.in"
 	source "package/gdb/Config.in"
 	source "package/google-breakpad/Config.in"
+	source "package/hyperfine/Config.in"
 	source "package/iozone/Config.in"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
diff --git a/package/hyperfine/Config.in b/package/hyperfine/Config.in
new file mode 100644
index 0000000000..527e978146
--- /dev/null
+++ b/package/hyperfine/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HYPERFINE
+	bool "hyperfine"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  hyperfine is a benchmark tool written in Rust. It evaluates
+	  execution time of a command passed in arguments and make a
+	  relative comparison if multiple arguments are used at the
+	  same time.
+
+	  https://github.com/sharkdp/hyperfine
diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
new file mode 100644
index 0000000000..50cc7694b3
--- /dev/null
+++ b/package/hyperfine/hyperfine.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  28fcd72c556b4ca2150577217a4d7d51907b7e00ff86b764943d068202a92ace  hyperfine-1.14.0.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
+sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.mk b/package/hyperfine/hyperfine.mk
new file mode 100644
index 0000000000..62246f002e
--- /dev/null
+++ b/package/hyperfine/hyperfine.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# hyperfine
+#
+################################################################################
+
+HYPERFINE_VERSION = 1.14.0
+HYPERFINE_SITE = $(call github,sharkdp,hyperfine,v$(HYPERFINE_VERSION))
+HYPERFINE_LICENSE = Apache-2.0 or MIT
+HYPERFINE_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
