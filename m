Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AE1C0015E
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7362860D79;
	Sat, 22 Jul 2023 21:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7362860D79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vAa6kU_PeLCR; Sat, 22 Jul 2023 21:06:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C89660D94;
	Sat, 22 Jul 2023 21:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C89660D94
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58EB11BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 326BE60D94
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 326BE60D94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g2gpH6-MZGF0 for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:06:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE9D060D79
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE9D060D79
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCD3181F7F; Sat, 22 Jul 2023 21:06:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 23:01:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 651835dbd7c68f3873a63b4f70c9aca9769c019e
X-Git-Newrev: 78d80aa395a59cf6187ca1da1d83e0f6b6d2db93
X-Patchwork-Hint: ignore
Message-Id: <20230722210646.CCD3181F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: bump to version 1.20.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=78d80aa395a59cf6187ca1da1d83e0f6b6d2db93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest Go release, version 1.20, arrives six months after Go 1.19. Most of
its changes are in the implementation of the toolchain, runtime, and libraries.

https://go.dev/doc/go1.20
https://go.dev/doc/devel/release#go1.20.6
https://github.com/golang/go/issues?q=milestone%3AGo1.20.6+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-runtime-support-riscv64-SV57-mode.patch   | 65 ----------------------
 package/go/go.hash                                 |  2 +-
 package/go/go.mk                                   |  4 +-
 3 files changed, 3 insertions(+), 68 deletions(-)

diff --git a/package/go/0003-runtime-support-riscv64-SV57-mode.patch b/package/go/0003-runtime-support-riscv64-SV57-mode.patch
deleted file mode 100644
index f51c2ca093..0000000000
--- a/package/go/0003-runtime-support-riscv64-SV57-mode.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 6618c7af436488fa12018cdcd31eeedb3a698745 Mon Sep 17 00:00:00 2001
-From: Dmitry Vyukov <dvyukov@google.com>
-Date: Fri, 27 May 2022 18:55:35 +0200
-Subject: [PATCH] runtime: support riscv64 SV57 mode
-
-Riscv64 has SV57 mode when user-space VA is 56 bits.
-Linux kernel recently got support for this mode and Go binaries started crashing as:
-
-runtime: lfstack.push invalid packing: node=0xffffff5908a940 cnt=0x1
-packed=0xffff5908a9400001 -> node=0xffff5908a940
-
-Adjust lfstack code to use only 8 top bits of pointers on riscv64.
-
-For context see:
-https://groups.google.com/g/syzkaller-bugs/c/lU0GQTZoNQQ/m/O_c3vmE3AAAJ
-
-Update #54104
-
-Change-Id: Ib5d3d6a79c0c6eddf11618d73fcc8bc1832a9c25
-Signed-off-by: Christian Stewart <christian@paral.in>
----
-
-Upstream: https://go-review.googlesource.com/c/go/+/409055/4
----
- src/runtime/lfstack_64bit.go | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/runtime/lfstack_64bit.go b/src/runtime/lfstack_64bit.go
-index 154130cf63..39fa647b9e 100644
---- a/src/runtime/lfstack_64bit.go
-+++ b/src/runtime/lfstack_64bit.go
-@@ -36,12 +36,21 @@ const (
- 	// We use one bit to distinguish between the two ranges.
- 	aixAddrBits = 57
- 	aixCntBits  = 64 - aixAddrBits + 3
-+
-+	// Riscv64 SV57 mode gives 56 bits of userspace VA.
-+	// lfstack code supports it, but broader support for SV57 mode is incomplete,
-+	// and there may be other issues (see #54104).
-+	riscv64AddrBits = 56
-+	riscv64CntBits  = 64 - riscv64AddrBits + 3
- )
- 
- func lfstackPack(node *lfnode, cnt uintptr) uint64 {
- 	if GOARCH == "ppc64" && GOOS == "aix" {
- 		return uint64(uintptr(unsafe.Pointer(node)))<<(64-aixAddrBits) | uint64(cnt&(1<<aixCntBits-1))
- 	}
-+	if GOARCH == "riscv64" {
-+		return uint64(uintptr(unsafe.Pointer(node)))<<(64-riscv64AddrBits) | uint64(cnt&(1<<riscv64CntBits-1))
-+	}
- 	return uint64(uintptr(unsafe.Pointer(node)))<<(64-addrBits) | uint64(cnt&(1<<cntBits-1))
- }
- 
-@@ -54,5 +63,8 @@ func lfstackUnpack(val uint64) *lfnode {
- 	if GOARCH == "ppc64" && GOOS == "aix" {
- 		return (*lfnode)(unsafe.Pointer(uintptr((val >> aixCntBits << 3) | 0xa<<56)))
- 	}
-+	if GOARCH == "riscv64" {
-+		return (*lfnode)(unsafe.Pointer(uintptr(val >> riscv64CntBits << 3)))
-+	}
- 	return (*lfnode)(unsafe.Pointer(uintptr(val >> cntBits << 3)))
- }
--- 
-2.35.1
-
diff --git a/package/go/go.hash b/package/go/go.hash
index 6d4c718a40..135d1ad37b 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  e25c9ab72d811142b7f41ff6da5165fec2d1be5feec3ef2c66bc0bdecb431489  go1.19.11.src.tar.gz
+sha256  62ee5bc6fb55b8bae8f705e0cb8df86d6453626b4ecf93279e2867092e0b7f70  go1.20.6.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 2a3b7825b7..efa47e5781 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.11
+GO_VERSION = 1.20.6
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
@@ -151,7 +151,7 @@ define HOST_GO_INSTALL_CMDS
 	cp -a $(@D)/lib $(HOST_GO_ROOT)/
 
 	mkdir -p $(HOST_GO_ROOT)/pkg
-	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
+	cp -a $(@D)/pkg/include $(HOST_GO_ROOT)/pkg/
 	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
 
 	# The Go sources must be installed to the host/ tree for the Go stdlib.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
