Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59C2CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC33D613A3;
	Mon, 17 Nov 2025 20:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KO8tVsofnmRk; Mon, 17 Nov 2025 20:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2A1B61438
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2A1B61438;
	Mon, 17 Nov 2025 20:08:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E47D2D3
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9C8183D71
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Nls2gmFUl_h for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7280818C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7280818C0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B98F584000; Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 16:47:55 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 8a4770581fea0352ff8ea47580b2c15a1b6e0e37
X-Git-Newrev: fcc7e9c92e6c132366c80998cf14b301e960e08f
X-Patchwork-Hint: ignore
Message-Id: <20251117200752.B98F584000@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/imagemagick:
 security bump to v7.1.2-8
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fcc7e9c92e6c132366c80998cf14b301e960e08f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

For more details on the version bump, see:
  - https://github.com/ImageMagick/ImageMagick/compare/7.1.2-3...7.1.2-8

Fixes the following vulnerability:

- CVE-2025-62171

    ImageMagick is an open source software suite for displaying,
    converting, and editing raster image files. In ImageMagick versions
    prior to 7.1.2-7 and 6.9.13-32, an integer overflow vulnerability
    exists in the BMP decoder on 32-bit systems. The vulnerability
    occurs in coders/bmp.c when calculating the extent value by
    multiplying image columns by bits per pixel. On 32-bit systems with
    size_t of 4 bytes, a malicious BMP file with specific dimensions can
    cause this multiplication to overflow and wrap to zero. The overflow
    check added to address CVE-2025-57803 is placed after the overflow
    occurs, making it ineffective. A specially crafted 58-byte BMP file
    with width set to 536,870,912 and 32 bits per pixel can trigger this
    overflow, causing the bytes_per_line calculation to become zero.
    This vulnerability only affects 32-bit builds of ImageMagick where
    default resource limits for width, height, and area have been
    manually increased beyond their defaults. 64-bit systems with size_t
    of 8 bytes are not vulnerable, and systems using default ImageMagick
    resource limits are not vulnerable. The vulnerability is fixed in
    versions 7.1.2-7 and 6.9.13-32.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-62171
  - https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-9pp9-cfwx-54rm
  - https://github.com/ImageMagick/ImageMagick/commit/cea1693e2ded51b4cc91c70c54096cbed1691c00

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3b3b2d1b727596085e5993da559eb8e17e2c5727)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index f260a0e0fb..3dbea6d8bc 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b16415e8694a2e15e5282d64fc7b358f309ff3a514a90eb5da268676c772de3d  imagemagick-7.1.2-3.tar.gz
+sha256  acf76a9dafbd18f4dd7b24c45ca10c77e31289fc28e4da0ce5cc3929fd0aef16  imagemagick-7.1.2-8.tar.gz
 sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 30cacc7f1a..4e6a810631 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-3
+IMAGEMAGICK_VERSION = 7.1.2-8
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
