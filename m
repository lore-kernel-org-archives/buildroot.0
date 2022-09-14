Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57494ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 09:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C0D3408A5;
	Wed, 14 Sep 2022 09:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C0D3408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrzWVttooij0; Wed, 14 Sep 2022 09:15:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3472401FF;
	Wed, 14 Sep 2022 09:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3472401FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62FEA1C1148
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BE6E404AF
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BE6E404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4KEncjt-i5t for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 09:14:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC311400C4
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 09:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC311400C4
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DBCEE838DA; Wed, 14 Sep 2022 09:14:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 10:46:34 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 0f44b89e5e66c3e435b01004576189051a48691a
X-Git-Newrev: 8a9e0d650f4a8ddd1a85ac44ce502f9ab0af4f99
X-Patchwork-Hint: ignore
Message-Id: <20220914091447.DBCEE838DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/gocryptfs: fix
 build against riscv
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8a9e0d650f4a8ddd1a85ac44ce502f9ab0af4f99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Replace dependency jacobsa/crypto with a fork with support for riscv64.

Fixes:
- http://autobuild.buildroot.net/results/caa60874781c4077273884eb37281cc9e02ef9ac/
- https://github.com/rfjakob/gocryptfs/issues/666

Upstream PR: https://github.com/jacobsa/crypto/issues/13

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 33c1ad44a12118a5c4b69c3584831ad0d901e84f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...o.mod-fix-jacobsa-crypto-build-on-riscv64.patch | 152 +++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch b/package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch
new file mode 100644
index 0000000000..90e3cc262d
--- /dev/null
+++ b/package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch
@@ -0,0 +1,152 @@
+From e9b64ab75e8539a52d60ecb299fc5425f0d27dc7 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Sat, 25 Jun 2022 14:57:38 -0700
+Subject: [PATCH] go.mod: fix jacobsa/crypto build on riscv64
+
+Replace dependency jacobsa/crypto with a fork with support for riscv64.
+
+Issue: https://github.com/rfjakob/gocryptfs/issues/666
+
+Upstream PR: https://github.com/jacobsa/crypto/issues/13
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ go.mod                                        |  9 ++---
+ go.sum                                        |  4 +-
+ .../jacobsa/crypto/cmac/hash_generic.go       | 40 +++++++++++++++++++
+ vendor/modules.txt                            | 13 +-----
+ 4 files changed, 48 insertions(+), 18 deletions(-)
+ create mode 100644 vendor/github.com/jacobsa/crypto/cmac/hash_generic.go
+
+diff --git a/go.mod b/go.mod
+index 29f7c2c..533fcdd 100644
+--- a/go.mod
++++ b/go.mod
+@@ -2,19 +2,18 @@ module github.com/rfjakob/gocryptfs/v2
+ 
+ go 1.16
+ 
++// Fixes build against risc-v
++// See: https://github.com/jacobsa/crypto/issues/13
++replace github.com/jacobsa/crypto => github.com/aperturerobotics/jacobsa-crypto v0.0.0-20220403053904-77863254e607 // xorblock-generic-1
++
+ require (
+ 	github.com/hanwen/go-fuse/v2 v2.1.1-0.20210825171523-3ab5d95a30ae
+ 	github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115
+-	github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd // indirect
+-	github.com/jacobsa/oglemock v0.0.0-20150831005832-e94d794d06ff // indirect
+-	github.com/jacobsa/ogletest v0.0.0-20170503003838-80d50a735a11 // indirect
+-	github.com/jacobsa/reqtrace v0.0.0-20150505043853-245c9e0234cb // indirect
+ 	github.com/pkg/xattr v0.4.3
+ 	github.com/rfjakob/eme v1.1.2
+ 	github.com/sabhiram/go-gitignore v0.0.0-20201211210132-54b8a0bf510f
+ 	github.com/spf13/pflag v1.0.5
+ 	golang.org/x/crypto v0.0.0-20210817164053-32db794688a5
+-	golang.org/x/net v0.0.0-20210813160813-60bc85c4be6d // indirect
+ 	golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
+ 	golang.org/x/term v0.0.0-20210615171337-6886f2dfbf5b
+ )
+diff --git a/go.sum b/go.sum
+index be0be5f..c26b80e 100644
+--- a/go.sum
++++ b/go.sum
+@@ -1,9 +1,9 @@
++github.com/aperturerobotics/jacobsa-crypto v0.0.0-20220403053904-77863254e607 h1:N8UVJlxKDhrvHTKXC7oVVfhVvGbgaw2mmlnCgGkfOFc=
++github.com/aperturerobotics/jacobsa-crypto v0.0.0-20220403053904-77863254e607/go.mod h1:Om5VFfyh5VipAEOOVoHAUa4hebUCKxQUjggFPTLeH08=
+ github.com/davecgh/go-spew v1.1.0 h1:ZDRjVQ15GmhC3fiQ8ni8+OwkZQO4DARzQgrnXU1Liz8=
+ github.com/davecgh/go-spew v1.1.0/go.mod h1:J7Y8YcW2NihsgmVo/mv3lAwl/skON4iLHjSsI+c5H38=
+ github.com/hanwen/go-fuse/v2 v2.1.1-0.20210825171523-3ab5d95a30ae h1:4CB6T4YTUVvnro5ba8ju1QCbOuyGAeF3vvKlo50EJ4k=
+ github.com/hanwen/go-fuse/v2 v2.1.1-0.20210825171523-3ab5d95a30ae/go.mod h1:B1nGE/6RBFyBRC1RRnf23UpwCdyJ31eukw34oAKukAc=
+-github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115 h1:YuDUUFNM21CAbyPOpOP8BicaTD/0klJEKt5p8yuw+uY=
+-github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115/go.mod h1:LadVJg0XuawGk+8L1rYnIED8451UyNxEMdTWCEt5kmU=
+ github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd h1:9GCSedGjMcLZCrusBZuo4tyKLpKUPenUUqi34AkuFmA=
+ github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd/go.mod h1:TlmyIZDpGmwRoTWiakdr+HA1Tukze6C6XbRVidYq02M=
+ github.com/jacobsa/oglemock v0.0.0-20150831005832-e94d794d06ff h1:2xRHTvkpJ5zJmglXLRqHiZQNjUoOkhUyhTAhEQvPAWw=
+diff --git a/vendor/github.com/jacobsa/crypto/cmac/hash_generic.go b/vendor/github.com/jacobsa/crypto/cmac/hash_generic.go
+new file mode 100644
+index 0000000..235e3fc
+--- /dev/null
++++ b/vendor/github.com/jacobsa/crypto/cmac/hash_generic.go
+@@ -0,0 +1,40 @@
++// Copyright 2012 Aaron Jacobs. All Rights Reserved.
++// Author: aaronjjacobs@gmail.com (Aaron Jacobs)
++//
++// Licensed under the Apache License, Version 2.0 (the "License");
++// you may not use this file except in compliance with the License.
++// You may obtain a copy of the License at
++//
++//     http://www.apache.org/licenses/LICENSE-2.0
++//
++// Unless required by applicable law or agreed to in writing, software
++// distributed under the License is distributed on an "AS IS" BASIS,
++// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++// See the License for the specific language governing permissions and
++// limitations under the License.
++
++// +build riscv64
++
++// This code doesn't require that it's safe to perform unaligned word-sized loads, but has a poor performance.
++
++package cmac
++
++import (
++	"unsafe"
++)
++
++// XOR the blockSize bytes starting at a and b, writing the result over dst.
++func xorBlock(
++	dstPtr unsafe.Pointer,
++	aPtr unsafe.Pointer,
++	bPtr unsafe.Pointer) {
++	// Convert.
++	a := (*[blockSize]byte)(aPtr)
++	b := (*[blockSize]byte)(bPtr)
++	dst := (*[blockSize]byte)(dstPtr)
++
++	// Compute.
++	for i := 0; i < blockSize; i++ {
++		dst[i] = a[i] ^ b[i]
++	}
++}
+diff --git a/vendor/modules.txt b/vendor/modules.txt
+index 662f0c3..9b47daa 100644
+--- a/vendor/modules.txt
++++ b/vendor/modules.txt
+@@ -5,19 +5,11 @@ github.com/hanwen/go-fuse/v2/fuse
+ github.com/hanwen/go-fuse/v2/internal
+ github.com/hanwen/go-fuse/v2/internal/utimens
+ github.com/hanwen/go-fuse/v2/splice
+-# github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115
++# github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115 => github.com/aperturerobotics/jacobsa-crypto v0.0.0-20220403053904-77863254e607
+ ## explicit
+ github.com/jacobsa/crypto/cmac
+ github.com/jacobsa/crypto/common
+ github.com/jacobsa/crypto/siv
+-# github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd
+-## explicit
+-# github.com/jacobsa/oglemock v0.0.0-20150831005832-e94d794d06ff
+-## explicit
+-# github.com/jacobsa/ogletest v0.0.0-20170503003838-80d50a735a11
+-## explicit
+-# github.com/jacobsa/reqtrace v0.0.0-20150505043853-245c9e0234cb
+-## explicit
+ # github.com/pkg/xattr v0.4.3
+ ## explicit
+ github.com/pkg/xattr
+@@ -40,8 +32,6 @@ golang.org/x/crypto/pbkdf2
+ golang.org/x/crypto/poly1305
+ golang.org/x/crypto/scrypt
+ golang.org/x/crypto/ssh/terminal
+-# golang.org/x/net v0.0.0-20210813160813-60bc85c4be6d
+-## explicit
+ # golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
+ ## explicit
+ golang.org/x/sys/cpu
+@@ -52,3 +42,4 @@ golang.org/x/sys/windows
+ # golang.org/x/term v0.0.0-20210615171337-6886f2dfbf5b
+ ## explicit
+ golang.org/x/term
++# github.com/jacobsa/crypto => github.com/aperturerobotics/jacobsa-crypto v0.0.0-20220403053904-77863254e607
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
