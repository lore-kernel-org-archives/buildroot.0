Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC63C5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B75C81BCF;
	Fri, 21 Aug 2026 15:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfI136D_a70l; Fri, 21 Aug 2026 15:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325116;
	bh=8glfM4+2RbjLA65qLUBXxHnk2SLEgQl+Xkm+2ll0xAo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Xvkjlu52IWvwaigSEyt/QQXIsI6Xlj5zn/iH5wFz3GrE3nVh+uk8+I73C3K5rsNuI
	 cjKqrATnaSmZHntJZo2pMhANcAKM+tajZGFMDRyZzGkkOpmWwHcHsDj6197yfyj+4n
	 /DSs1ohgbPDC2vnqKf6bbAzBkBxu1rM6jwj7LsT7tURIX3YMLSy1m4b/MLxjXrYVcb
	 ep+JVPQCXS5oyYi3mRbJxc9AZ9iD5/HLO0mcE+M12x1ItoSyaxWozKViPR5nEAZkQW
	 LjMIkIdZcJ0JPDJyKfNi0fyNQjgwwB926r6xfFh7rCqU7eoEt6Jf4fVTSEicxUMMgu
	 SQCBf8nkEZ+hA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A7C581B71;
	Fri, 21 Aug 2026 15:11:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D63EEA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F5EE81151
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WbXXBuyuKpeU for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D07AA81138
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F5708E132; Fri, 21 Aug 2026 15:10:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 14:18:32 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 6f5e5881005d53439b9b19bece0555294916f8c4
X-Git-Newrev: b5628e2437bad7bdafd6e4f5465f670718eee86a
X-Patchwork-Hint: ignore
Message-Id: <20260821151017.4F5708E132@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/cramfs: bump to
 version 2.2
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b5628e2437bad7bdafd6e4f5465f670718eee86a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Changes:

Security and robustness release.  Notable cramfsck changes:

  * Reject dirent names containing "/", "." or ".." to close a path
    traversal during `cramfsck -x` (reported in issue #12).
  * Open regular files with O_CREAT|O_EXCL during extraction to
    prevent duplicate-dirent attacks from truncating files reached
    via a previously-extracted symlink.
  * Fix outbuffer NUL termination and a 1-byte overflow in
    do_symlink when running with both -v and -x.
  * Harden romfs_read against truncated/malformed images by
    zero-filling the window buffer and checking lseek/read returns.
  * Reject directory entries that extend past their parent's size.

Documentation: README now documents cramfsck and lists all current
mkcramfs options; stale hard-link and endianness claims corrected;
NOTES trimmed of the 25-year-old Future Development section.

(See https://github.com/npitre/cramfs-tools/releases/tag/v2.2)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2c96a67d9ba53dc152dce72e8ff08b5078a77b8c)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/cramfs/cramfs.hash | 2 +-
 package/cramfs/cramfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cramfs/cramfs.hash b/package/cramfs/cramfs.hash
index 672266b468..3795c862c9 100644
--- a/package/cramfs/cramfs.hash
+++ b/package/cramfs/cramfs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  cdb7a4ecad034f063b6456b37cdf653ae31758a224c32161e54712a9d7f01cc3  cramfs-2.1.tar.gz
+sha256  6217c93cbfa79ae720bad4139739c1bd7a665928a9bfc2dd820b98df27c66da2  cramfs-2.2.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 85706d1a8e..a6196ca85e 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRAMFS_VERSION = 2.1
+CRAMFS_VERSION = 2.2
 CRAMFS_SITE = $(call github,npitre,cramfs-tools,v$(CRAMFS_VERSION))
 CRAMFS_LICENSE = GPL-2.0+
 CRAMFS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
