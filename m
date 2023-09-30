Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB4BE77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 066DA4063B;
	Sat, 30 Sep 2023 13:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 066DA4063B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MBa1IBVZ4KXc; Sat, 30 Sep 2023 13:12:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8BE74159F;
	Sat, 30 Sep 2023 13:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8BE74159F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB7EC1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0119813FF
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0119813FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oRLeHhb6PKzD for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51258813D6
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51258813D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EBA3839F3; Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 14:49:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfcddf057099d25e2f19aeb43c31af0f772006dc
X-Git-Newrev: 952e320a1b30b41c26fc547ec500e99520d869ea
X-Patchwork-Hint: ignore
Message-Id: <20230930131103.3EBA3839F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: add license information
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

commit: https://git.buildroot.net/buildroot/commit/?id=952e320a1b30b41c26fc547ec500e99520d869ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds the licensing information for the host-gcc-initial,
host-gcc-final and gcc-final packages.

For host-gcc-initial and host-gcc-final, instead of duplicating the
information, we use common variables coming from gcc.mk.

Of course for the target gcc-final, we use a different license than
for host-gcc-final, as it's the whole point of this series: be able to
describe that the target side of gcc is GPL-3.0 with linking
exception.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gcc/gcc-final/gcc-final.mk     | 4 ++++
 package/gcc/gcc-initial/gcc-initial.mk | 2 ++
 package/gcc/gcc.hash                   | 7 +++++++
 package/gcc/gcc.mk                     | 3 +++
 4 files changed, 16 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index bd18d9ea71..11104167af 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -7,6 +7,10 @@
 GCC_FINAL_VERSION = $(GCC_VERSION)
 GCC_FINAL_SITE = $(GCC_SITE)
 GCC_FINAL_SOURCE = $(GCC_SOURCE)
+GCC_FINAL_LICENSE = GPL-3.0-with-GCC-exception
+GCC_FINAL_LICENSE_FILES = COPYING.RUNTIME
+HOST_GCC_FINAL_LICENSE = $(HOST_GCC_LICENSE)
+HOST_GCC_FINAL_LICENSE_FILES = $(HOST_GCC_LICENSE_FILES)
 
 GCC_FINAL_DEPENDENCIES = host-gcc-final
 GCC_FINAL_ADD_TOOLCHAIN_DEPENDENCY = NO
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index a8ac20c5d8..1f8b76a942 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -7,6 +7,8 @@
 GCC_INITIAL_VERSION = $(GCC_VERSION)
 GCC_INITIAL_SITE = $(GCC_SITE)
 GCC_INITIAL_SOURCE = $(GCC_SOURCE)
+HOST_GCC_INITIAL_LICENSE = $(HOST_GCC_LICENSE)
+HOST_GCC_INITIAL_LICENSE_FILES = $(HOST_GCC_LICENSE_FILES)
 
 # We do not have a 'gcc' package per-se; we only have two incarnations,
 # gcc-initial and gcc-final. gcc-initial is just an internal step that
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index d5f8135ff6..478b0b1620 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -13,3 +13,10 @@ sha512  d99e4826a70db04504467e349e9fbaedaa5870766cda7c5cab50cdebedc4be755ebca5b7
 sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
+
+# Locally calculated
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  9d6b43ce4d8de0c878bf16b54d8e7a10d9bd42b75178153e3af6a815bdc90f74  COPYING.RUNTIME
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b5bc15963f..4a3b780618 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -18,6 +18,9 @@ GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.xz
 endif
 
+HOST_GCC_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
+HOST_GCC_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
+
 #
 # Xtensa special hook
 #
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
