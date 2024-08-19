Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6144FCE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B11C9810E3;
	Fri,  6 Sep 2024 20:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRik6jmOgBtr; Fri,  6 Sep 2024 20:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8742680CC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8742680CC1;
	Fri,  6 Sep 2024 20:11:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45EDE1BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0F2561123
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AiZCIUq6VwV for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64A7360E05
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64A7360E05
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D9A986EE4; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 22:29:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5a0f58640047738adb2bce8daef6c53ef36677f
X-Git-Newrev: 1e5abb71310e12be5fedb5bfea2aa6543e345aa5
X-Patchwork-Hint: ignore
Message-Id: <20240906195855.5D9A986EE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nushell: update to 0.96.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e5abb71310e12be5fedb5bfea2aa6543e345aa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For changes see the nushell blog:
https://www.nushell.sh/blog/

Broken since the update of rust in -next.
Patch for sparc64 no longer required.

Fixes:
 - http://autobuild.buildroot.org/results/f11/f11c62f504e9ce68ed9e3fb3533d53942cb87092

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-uucore-add-support-for-sparc64.patch      | 59 ----------------------
 package/nushell/nushell.hash                       |  2 +-
 package/nushell/nushell.mk                         |  9 +---
 3 files changed, 2 insertions(+), 68 deletions(-)

diff --git a/package/nushell/0001-uucore-add-support-for-sparc64.patch b/package/nushell/0001-uucore-add-support-for-sparc64.patch
deleted file mode 100644
index ad7e70a56d..0000000000
--- a/package/nushell/0001-uucore-add-support-for-sparc64.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 9f4330f94cc471d880df7d9089ee1105b27fd321 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 6 Jan 2024 10:26:54 +0100
-Subject: [PATCH] uucore: add support for sparc64
-
-Add support for sparc64 in uucore to avoid the following build failure
-with nushell:
-
-error[E0308]: mismatched types
-   --> /home/autobuild/autobuild/instance-7/output-1/build/nushell-0.85.0/VENDOR/uucore/src/lib/features/fs.rs:121:16
-    |
-111 |     pub fn number_of_links(&self) -> u64 {
-    |                                      --- expected `u64` because of return type
-...
-121 |         return self.0.st_nlink;
-    |                ^^^^^^^^^^^^^^^ expected `u64`, found `u32`
-    |
-help: you can convert a `u32` to a `u64`
-    |
-121 |         return self.0.st_nlink.into();
-    |                               +++++++
-
-For more information about this error, try `rustc --explain E0308`.
-error: could not compile `uucore` (lib) due to previous error
-
-Fixes:
- - http://autobuild.buildroot.org/results/f9f0287a8e39c65895014ca513ed25071f020add
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/uutils/coreutils/commit/d158f1a396d19cc2aed68131b80ec3b7325d108e
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- src/uucore/src/lib/features/fs.rs | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/VENDOR/uucore/src/lib/features/fs.rs b/VENDOR/uucore/src/lib/features/fs.rs
-index 20cc9e13d..3b9170bc3 100644
---- a/VENDOR/uucore/src/lib/features/fs.rs
-+++ b/VENDOR/uucore/src/lib/features/fs.rs
-@@ -116,6 +116,7 @@
-             not(target_os = "freebsd"),
-             not(target_arch = "aarch64"),
-             not(target_arch = "riscv64"),
-+            not(target_arch = "sparc64"),
-             target_pointer_width = "64"
-         ))]
-         return self.0.st_nlink;
-@@ -127,6 +128,7 @@
-                 target_os = "freebsd",
-                 target_arch = "aarch64",
-                 target_arch = "riscv64",
-+                target_arch = "sparc64",
-                 not(target_pointer_width = "64")
-             )
-         ))]
--- 
-2.43.0
-
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
index c125a6c652..8336054455 100644
--- a/package/nushell/nushell.hash
+++ b/package/nushell/nushell.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  9175b7e25a93a35c4f2690a63e7c36ac2dc31a9d762f59de01aac8ac1075b02f  nushell-0.85.0-cargo2.tar.gz
+sha256  592f3b74156be0e65f8ef01fbc2e947480b91407190f93761d7c9531f381bfac  nushell-0.96.1-cargo2.tar.gz
 sha256  2dc1f03f729c21902d869b4d8f8dc528fc730f4c6ad83fc128672bda0ad69196  LICENSE
diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
index 7b538da4e2..a05eaa9829 100644
--- a/package/nushell/nushell.mk
+++ b/package/nushell/nushell.mk
@@ -4,19 +4,12 @@
 #
 ################################################################################
 
-NUSHELL_VERSION = 0.85.0
+NUSHELL_VERSION = 0.96.1
 NUSHELL_SITE = $(call github,nushell,nushell,$(NUSHELL_VERSION))
 NUSHELL_LICENSE = MIT
 NUSHELL_LICENSE_FILES = LICENSE
 NUSHELL_DEPENDENCIES = host-pkgconf openssl ncurses
 
-# 0001-uucore-add-support-for-sparc64.patch
-define NUSHELL_PATCH_CHECKSUM_FILE
-	$(SED) 's/b0390ae7bca8b31f0db289a5d064bba36d45e4d137674e9df2c6ab6256f926f4/f8ce2ad571e1482f6833cb147eafeb724776e7887ebabf339a5f3e79860583cb/' \
-		$(@D)/VENDOR/uucore/.cargo-checksum.json
-endef
-NUSHELL_POST_PATCH_HOOKS += NUSHELL_PATCH_CHECKSUM_FILE
-
 # Add /usr/bin/nu to /etc/shells as in package/bash/bash.mk
 define NUSHELL_ADD_NU_TO_SHELLS
 	grep -qsE '^/usr/bin/nu$$' $(TARGET_DIR)/etc/shells \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
