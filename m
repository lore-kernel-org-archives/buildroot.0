Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC84D1CA01
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 22:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EA5A402D7;
	Mon,  4 Nov 2024 22:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id viv4RFxWIdGt; Mon,  4 Nov 2024 22:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D97574038D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D97574038D;
	Mon,  4 Nov 2024 22:07:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7990AB8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AD7A40100
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oth52DKtoaLd for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 22:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69DD54059E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69DD54059E
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:06:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5638585D00; Mon,  4 Nov 2024 22:06:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 23:03:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc0823c2d14321b91b94801834050331f5ea28e1
X-Git-Newrev: c58a2a9687c045379c0f768c8c6c1c1a41842a85
X-Patchwork-Hint: ignore
Message-Id: <20241104220651.5638585D00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_aarch64_sbsa_defconfig:
 switch to neoverse-n1 (armv8.2a)
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c58a2a9687c045379c0f768c8c6c1c1a41842a85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The SBSA Reference Platform was updated to neoverse-n1 (armv8.2a) in
Qemu v8.1 [1].

BR2_cortex_a57:
  # cat /proc/cpuinfo
  processor       : 0
  BogoMIPS        : 2000.00
  Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
  CPU implementer : 0x41
  CPU architecture: 8
  CPU variant     : 0x1
  CPU part        : 0xd07
  CPU revision    : 0
[...]

BR2_neoverse_n1:
  # cat /proc/cpuinfo
  processor       : 0
  BogoMIPS        : 2000.00
  Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp ssbs
  CPU implementer : 0x41
  CPU architecture: 8
  CPU variant     : 0x4
  CPU part        : 0xd0c
  CPU revision    : 1
[...]

Tests test_fwts.py test_edk2.py using
BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA=y are not updated to neoverse-n1 by
this commit. Those tests were disabled in a previous commit. Those
tests will be updated and fixed in followup commits.

Note: SBSA Reference Platform was recently updated again to neoverse-n2
(armv9.0a) in Qemu v9.1 [2]. But there is no armv9.0a support yet in
Buildroot.

[1] https://gitlab.com/qemu-project/qemu/-/commit/1877272bad7b08b67312503ee66184279876c7bd
[2] https://gitlab.com/qemu-project/qemu/-/commit/b1d592e7b0a7301eae8e3baa99744ac35db3cd2a

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Julien: add a small comment in commit log about tests]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/qemu/aarch64-sbsa/readme.txt  | 2 +-
 configs/qemu_aarch64_sbsa_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/readme.txt
index cf5f66d4d6..7d97d7f6ab 100644
--- a/board/qemu/aarch64-sbsa/readme.txt
+++ b/board/qemu/aarch64-sbsa/readme.txt
@@ -17,7 +17,7 @@ Run the emulation with:
 
   qemu-system-aarch64 \
     -M sbsa-ref \
-    -cpu cortex-a57 \
+    -cpu neoverse-n1 \
     -smp 4 \
     -m 1024 \
     -nographic \
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 23d274b529..6df2b2e273 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_cortex_a57=y
+BR2_neoverse_n1=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
