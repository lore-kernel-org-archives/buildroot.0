Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9BEC5AD48
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 23:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4CB880AD5;
	Sat,  8 Aug 2026 23:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyAXgkYu3qnI; Sat,  8 Aug 2026 23:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD36E80ADE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786230263;
	bh=FZAeVjj+1LARnh36prEm/mVOAnrYh7QnaVG2tqOD2ZQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WW8IvyunGTY+6tiXKiCv3d0zmk0iqBXoLlGtkvsMaA3sTSFq+E9+dmuf/6e9B2/Nz
	 aB0fSGsI28vpOzyoHZ7vNW8bJgROc56waOYqS3HHE1klBrr1gOY6xOkWmF0xFq0Ujp
	 Qc7tjoO/GLJ1F1i5bbExw8xSCWNqDFweJLTLE6OdbviH55Kf1Alg1+8y94SAanimbC
	 Olr+6Adfchtq7yNO3MnLLYNKjzfWJYO32e4Bocpy7effqpAZeneaBlr9y2Rfq7VFtD
	 KPNw/HLMnDmGq04d60pl6hqDCdnRwdRyihfwwginbt9Q8EaSgbiscIf73C0ZkG66ag
	 zaFT8nhwg0BIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD36E80ADE;
	Sat,  8 Aug 2026 23:04:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FD9640A
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65D3D4056F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isuB53EStQHi for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 23:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65F2340545
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65F2340545
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:04:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F80C87093; Sat,  8 Aug 2026 23:03:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 00:52:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ebaab7ecc0684d900795ae157675a8ff3b78e21
X-Git-Newrev: 8aa301fc8154f2317dc87957a2bc8a945513c3e2
X-Patchwork-Hint: ignore
Message-Id: <20260808230333.1F80C87093@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/genext2fs: bump version to 1.6.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8aa301fc8154f2317dc87957a2bc8a945513c3e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream doesn't provide any useful changelog, but the number of
1.5.0..1.6.2 commits is reasonable:

bfc28c7 Define {MAX_,}RESERVED_BLOCKS as floats
5b93731 Recover automatic block number calculation
d6e659d Correct message for minimum block count
1b2a30e Correct also commented code to take into account reserved blocks
944a4fd Indirect blocks must be taken into account for stats
3e2fce1 Restore (MAX_)RESERVED_BLOCKS to integer division
b571221 Add missing newlines on error messages.
cd4ff51 don't call ftruncate() on stdout
6909cde Enable system locale - change from the standard (C) to system locale.
9651f5d Fix alignment issues for strict architectures
4a99c22 Hardcode length of hardcoded char array instead of sizeof(long)
1f38ba4 Add ordered directory traversal
84c2d01 Add ordered directory traversal test
467ebe5 Fix formatting of man page references
810c12e Fix auto-block calculation from PR #5 merge
28988bd Skip device table entry when parent path is not a directory (from PR #33)
45191ab Fix ordered directory traversal from PR #34 merge
b615521 configure.ac: teach autoreconf to detect and install macros in m4
81028ca configure.ac: upgrade ancient snprintf macro to modern autoconf-archive edition
67661a1 Fix EXTRA_DIST: reference new ax_func_snprintf.m4 instead of deleted ac_func_snprintf.m4
907737e Remove incorrect address
4c4343d Add licensing information
cb5f584 Add license information
a60ccd9 Use strrchr to split path:dest so host paths may contain colons (fixes #23)
44ff03d Implement sparse_super feature with superblock/GDT backups (fixes #29)
8b8f2d1 Add extended attributes (xattr) support (fixes #9)
d0a9274 Optimize block/inode allocation for large filesystems (fixes #31)
b69c34e Fix -d dir:/path destination: restore colon after stats pass, auto-create intermediate dirs
2c38700 Add 9 functional tests for previously untested features
3d3bcb6 remove useless NEWS file
03dee74 Bump version to 1.6.0 (fixes #28)
c8f41b9 Make xattr copying opt-in with -X/--xattrs flag (fixes #40)
3324695 Bump version to 1.6.1
4e5d8ae Update README: add -X/--xattrs, SOURCE_DATE_EPOCH, and missing device table types
bf5b1a0 Bump version to 1.6.2

This commit also updates the COPYING license file hash, after an update
of the FSF, in upstream commit:
https://github.com/bestouff/genext2fs/commit/907737e4e817632867279f02b1da2e14c0501120

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: fix COPYING license file hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/genext2fs/genext2fs.hash | 4 ++--
 package/genext2fs/genext2fs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/genext2fs/genext2fs.hash b/package/genext2fs/genext2fs.hash
index 20bb1c641b..2ed73472de 100644
--- a/package/genext2fs/genext2fs.hash
+++ b/package/genext2fs/genext2fs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d3861e4fe89131bd21fbd25cf0b683b727b5c030c4c336fadcd738ada830aab0  genext2fs-1.5.0.tar.gz
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  b8aba9af48e664fa60134af696a57b3bb4ebd2b2878533d7611734e90b883ecc  genext2fs-1.6.2.tar.gz
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index adfa412e66..c2c7abbaf5 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENEXT2FS_VERSION = 1.5.0
+GENEXT2FS_VERSION = 1.6.2
 GENEXT2FS_SITE = $(call github,bestouff,genext2fs,v$(GENEXT2FS_VERSION))
 GENEXT2FS_LICENSE = GPL-2.0
 GENEXT2FS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
