Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8514ACAC5B0
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 20:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EDAB41494;
	Wed, 24 Sep 2025 20:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxs9Gv8Al-yd; Wed, 24 Sep 2025 20:52:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58BE041328
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58BE041328;
	Wed, 24 Sep 2025 20:52:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2CB612D
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8954D837C9
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Usb-1tujOXTw for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 20:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA5F6837AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA5F6837AD
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:52:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA7C7863E8; Wed, 24 Sep 2025 20:52:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Sep 2025 22:27:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d40c1725b2010c4daf568dc8e04ffaafd47bcd2f
X-Git-Newrev: 78d58820a5a053b3e574aeaf29c2d64ff7f494f2
X-Patchwork-Hint: ignore
Message-Id: <20250924205233.AA7C7863E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils-bare-metal: bump to
 binutils 2.45
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

commit: https://git.buildroot.net/buildroot/commit/?id=78d58820a5a053b3e574aeaf29c2d64ff7f494f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps the binutils-bare-metal package to version 2.45. In the
process, it also decouples binutils-bare-metal from the binutils package
since the binutils package does not yet have support for version 2.45.

With the decoupling, the 3 downstream binutils 2.44 patches were evaluated.

Patches not needed for binutils-bare-metal:
0001-sh-conf.patch
0002-poison-system-directories.patch

Patches already included with binutils version 2.45:
0003-objdump-memleak.patch
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d

Since none of these patches need to be applied to binutils-bare-metal 2.45,
the link to the binutils patch directory is deleted.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/binutils-bare-metal/2.44                     | 1 -
 package/binutils-bare-metal/binutils-bare-metal.hash | 7 ++++++-
 package/binutils-bare-metal/binutils-bare-metal.mk   | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/binutils-bare-metal/2.44 b/package/binutils-bare-metal/2.44
deleted file mode 120000
index b8164295cf..0000000000
--- a/package/binutils-bare-metal/2.44
+++ /dev/null
@@ -1 +0,0 @@
-../binutils/2.44
\ No newline at end of file
diff --git a/package/binutils-bare-metal/binutils-bare-metal.hash b/package/binutils-bare-metal/binutils-bare-metal.hash
deleted file mode 120000
index e0655d3af3..0000000000
--- a/package/binutils-bare-metal/binutils-bare-metal.hash
+++ /dev/null
@@ -1 +0,0 @@
-../binutils/binutils.hash
\ No newline at end of file
diff --git a/package/binutils-bare-metal/binutils-bare-metal.hash b/package/binutils-bare-metal/binutils-bare-metal.hash
new file mode 100644
index 0000000000..7cf24141f7
--- /dev/null
+++ b/package/binutils-bare-metal/binutils-bare-metal.hash
@@ -0,0 +1,6 @@
+# From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
+sha512  c7b10a7466d9fd398d7a0b3f2a43318432668d714f2ec70069a31bdc93c86d28e0fe83792195727167743707fbae45337c0873a0786416db53bbf22860c16ce7  binutils-2.45.tar.xz
+
+# locally computed
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index bb04b79c2f..f7ee96ef97 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BINUTILS_BARE_METAL_VERSION = 2.44
+BINUTILS_BARE_METAL_VERSION = 2.45
 BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
 BINUTILS_BARE_METAL_SOURCE = binutils-$(BINUTILS_BARE_METAL_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
