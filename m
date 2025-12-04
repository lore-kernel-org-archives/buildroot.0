Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FC7D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B60483F47;
	Fri, 12 Dec 2025 07:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7oNSkmQ81AO; Fri, 12 Dec 2025 07:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCE3D83F54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526270;
	bh=ehtSVkIXWfg75wAIxt7MORVWiBK9h0FZhXoDR8xAW6M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J0LnNkBp+Ch29H3FLSOnRtqE18QH+iQViFgsjXF8X40btmMdaRVVEmyx9Z00simkq
	 uWglE7pwXD0/wPzRiaPFc281z6PB9FQgb60Td5cOrb6nUw1A0BrlcmHD/vgWl2AlLP
	 JogiACNOM21fHxUISDr0FjTQBrf9rfJNdKHtbVNVK0lE2Pz2MVwzDi1BDvUhAjdBpi
	 dRHYoITKFsVvZtFwvvkbA90hUoB/V1ovZ4weqHorkzwdaWg/0UpdoS+5ZsfvWvsVl2
	 v/lAa51S4nya00NM/Czy7hMhCtk8DJmc/1dJzB1meE+h2t1w3jdedh0rbDOCrJ/Gso
	 XdlI+Z744sD5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCE3D83F54;
	Fri, 12 Dec 2025 07:57:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5046AE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3331D41165
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scAW59AwnhEF for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08F144111A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08F144111A
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0803781674; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 22:44:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 150bb46a0483736aebf44b6026ffa621049c01ad
X-Git-Newrev: 251063eca0a74a9bb57217748e13f7bab7badecb
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.0803781674@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump to version
 21.1.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=251063eca0a74a9bb57217748e13f7bab7badecb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://discourse.llvm.org/t/llvm-21-1-7-released/89029

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llvm-project/clang/clang.hash                   | 2 +-
 package/llvm-project/compiler-rt/compiler-rt.hash       | 4 ++--
 package/llvm-project/libclc/libclc.hash                 | 2 +-
 package/llvm-project/lld/lld.hash                       | 2 +-
 package/llvm-project/llvm-cmake/llvm-cmake.hash         | 2 +-
 package/llvm-project/llvm-libunwind/llvm-libunwind.hash | 2 +-
 package/llvm-project/llvm-project.mk                    | 2 +-
 package/llvm-project/llvm-runtimes/llvm-runtimes.hash   | 2 +-
 package/llvm-project/llvm/llvm.hash                     | 4 ++--
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/llvm-project/clang/clang.hash b/package/llvm-project/clang/clang.hash
index 5ac73a252c..72efe1e09d 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  348ace5d715c4caa6fb89b4c6fe07c21650e10b2fac37d8b0db75c0b11be9011  clang-21.1.6.src.tar.xz
+sha256  eeb5296f46eacc0a1fe6c47a1af9e8d4eb2a5da7254fd8dbc4fc1f1be74315a1  clang-21.1.7.src.tar.xz
 sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
index b9ec906595..47a90af9be 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  bdd904f3aac9f4c4424f3440aff498cc04d66f243e37156b6d167ffb7b599f89  compiler-rt-21.1.6.src.tar.xz
-sha256  8d09dc219cdb3da7dafd2161836aacdd6e02c1a113498ab5f37688599406dc8a  third-party-21.1.6.src.tar.xz
+sha256  4358e4476ab89b6ca9e4174f05f4a2c2c10e4a41c3c7febd25afe96bc27b5758  compiler-rt-21.1.7.src.tar.xz
+sha256  5fe212feb27f325fa29530eb38e746a73d18205bf6a36d9800778a94108d2ee5  third-party-21.1.7.src.tar.xz
 sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
index 92b51fc1fa..41c440cebc 100644
--- a/package/llvm-project/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  a1a09ccfa17f2d5fbe5e54271a4a9fbe396950f29f80f52b67a7083fee73120c  libclc-21.1.6.src.tar.xz
+sha256  de1c8dbffdce898a4c5e70fb7f5aa6dea1e429f63471773da8cb3cdf9e945403  libclc-21.1.7.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
index b05f1e30f9..d3a2d22b68 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  5b297faecdddc9581c260a1570b4c0ec8810d1213e23d7aa84732c0e2feea85f  lld-21.1.6.src.tar.xz
+sha256  607395fc8a5f4d14eb27b219a279558a172d1e3a34ddd2a3509c12b560f1930a  lld-21.1.7.src.tar.xz
 sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
index 402a5f4ef7..ae2d1737d1 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.hash
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  e364f135fa14c343d70cac96f577f44e8e20bf026682f647f8c3c5687a0bebd1  cmake-21.1.6.src.tar.xz
+sha256  f25ca011e4453ac035e940aa729d482d08eb83a91b4aaf1f230dc9ea28cadfa4  cmake-21.1.7.src.tar.xz
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
index 7326a0d863..e34c79b728 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  25d8bf5bd0d95641c738ea690b18564f5fc9fb7e7bbab17329b391988e71ae8c  libunwind-21.1.6.src.tar.xz
+sha256  ac6ac43b6d54c6f6725a286ce36acff7a94123a8f2a54c161f866b94fcaa3a9b  libunwind-21.1.7.src.tar.xz
 sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 268367d6bd..15b1076d82 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 21
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.6
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.7
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
index c68f1c13ff..9f2784b731 100644
--- a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  3b2dcaec1163caf067988228c1d21a75334c47d22610956dd9699ea0631bce45  runtimes-21.1.6.src.tar.xz
+sha256  7f87971685100bc2bd0fe54042c5140da100b0e37fa12fca888cf1d8d06a8e25  runtimes-21.1.7.src.tar.xz
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
index 1738c94d29..afa270b83e 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,4 +1,4 @@
 # locally calculated
-sha256  908bce97be0275943414b45af2e2b20e8f6d5d9266fdc120bd59f096ebc547ad  llvm-21.1.6.src.tar.xz
-sha256  8d09dc219cdb3da7dafd2161836aacdd6e02c1a113498ab5f37688599406dc8a  third-party-21.1.6.src.tar.xz
+sha256  8657ee188b673a3285b991131abe905b4129a18d52d334f9d122463164ecd000  llvm-21.1.7.src.tar.xz
+sha256  5fe212feb27f325fa29530eb38e746a73d18205bf6a36d9800778a94108d2ee5  third-party-21.1.7.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
