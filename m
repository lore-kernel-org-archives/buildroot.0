Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFD8D10BF7
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 12:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25FEF40189;
	Sat, 26 Oct 2024 12:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlIj0u7TiHN9; Sat, 26 Oct 2024 12:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD1064003A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD1064003A;
	Sat, 26 Oct 2024 12:56:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC6485C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E33A80B42
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUKuqBWhgocT for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 12:56:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF45F80B2B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF45F80B2B
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:56:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB81083A49; Sat, 26 Oct 2024 12:56:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 14:55:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e72ecc2b5fd105dad6f62ab80508f7ff377c72a
X-Git-Newrev: a7eaefbbcb31e6d0a3cc7525a2a119ec55bfe652
X-Patchwork-Hint: ignore
Message-Id: <20241026125614.AB81083A49@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils-bare-metal: bump to
 binutils 2.43.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a7eaefbbcb31e6d0a3cc7525a2a119ec55bfe652
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

package/binutils-bare-metal: bump to 2.43.1

See here the release announcement for changes:
https://sourceware.org/pipermail/binutils/2024-August/136396.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils-bare-metal/2.42                   | 1 -
 package/binutils-bare-metal/2.43.1                 | 1 +
 package/binutils-bare-metal/binutils-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils-bare-metal/2.42 b/package/binutils-bare-metal/2.42
deleted file mode 120000
index dfad0ed2f4..0000000000
--- a/package/binutils-bare-metal/2.42
+++ /dev/null
@@ -1 +0,0 @@
-../binutils/2.42
\ No newline at end of file
diff --git a/package/binutils-bare-metal/2.43.1 b/package/binutils-bare-metal/2.43.1
new file mode 120000
index 0000000000..f605915e35
--- /dev/null
+++ b/package/binutils-bare-metal/2.43.1
@@ -0,0 +1 @@
+../binutils/2.43.1/
\ No newline at end of file
diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 778a5235f4..f2f223387e 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_BINUTILS_BARE_METAL_VERSION = 2.42
+HOST_BINUTILS_BARE_METAL_VERSION = 2.43.1
 HOST_BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
 HOST_BINUTILS_BARE_METAL_SOURCE = binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
