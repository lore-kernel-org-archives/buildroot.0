Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4193FCC068
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78BAF6147F;
	Fri,  6 Mar 2026 19:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5v59iN6DmtH6; Fri,  6 Mar 2026 19:52:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 285E661476
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826775;
	bh=uz9o3yoHbKTefRO3rXOygDvUGvayTdx/x3PWKyyjcWc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mp0F1pE6dVs3FOdTb1jDYNJ4Lxw4koaovgerBloRGUk+fnzDRQecLPKZvfbTlY0Ez
	 MRRtZOwoUeDLy10NVRfohFOKaMgE4B+WsrwalQsCJO9toARXzhXvJkR2q/Dwo8HuFe
	 sV2r5GsroycaSkjSWJirzkHbi+O3YUIN3v33DgQSwmF9uJ5E2HyHfTAQBq//O5GLwR
	 KV6qiN6lkA4hteyVWshbaYKSQyAUj7BuWHvOSehWhzUBuwsIYDhZLbDEHwUf0hNzjL
	 gdA2a/Ke2o4hOtQ9UlsNsLl7JW6tPrcFT9w8i8/RO7sMGPgktoY2/cdsHkZ6MtSRgw
	 Ia8BTjEelh45w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 285E661476;
	Fri,  6 Mar 2026 19:52:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A747223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33ECE82428
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUXtt7Wj7FCp for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F0DC8229B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F0DC8229B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 634CD86834; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 13:43:16 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5621393cc205ba014735e5d60ad0d7fa43188b80
X-Git-Newrev: a9e106312bfeeaac9ed78b206c1463426b6d5d5c
X-Patchwork-Hint: ignore
Message-Id: <20260306195222.634CD86834@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/imagemagick:
 security bump to v7.1.2-15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9e106312bfeeaac9ed78b206c1463426b6d5d5c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information on the version bump, see:
  - https://github.com/ImageMagick/Website/blob/main/ChangeLog.md
  - https://github.com/ImageMagick/ImageMagick/compare/7.1.2-12...7.1.2-15

Fixes the following vulnerabilities:

- CVE-2026-22770:
    The BilateralBlurImage method will allocate a set of double buffers
    inside AcquireBilateralTLS. But, in versions prior to 7.1.2-13, the
    last element in the set is not properly initialized. This will
    result in a release of an invalid pointer inside DestroyBilateralTLS
    when the memory allocation fails.

    https://www.cve.org/CVERecord?id=CVE-2026-22770

- CVE-2026-23874:
    Versions prior to 7.1.2-13 have a stack overflow via infinite
    recursion in MSL (Magick Scripting Language) `<write>` command when
    writing to MSL format.

    https://www.cve.org/CVERecord?id=CVE-2026-23874

- CVE-2026-23876:
    Prior to versions 7.1.2-13 and 6.9.13-38, a heap buffer overflow
    vulnerability in the XBM image decoder (ReadXBMImage) allows an
    attacker to write controlled data past the allocated heap buffer
    when processing a maliciously crafted image file. Any operation that
    reads or identifies an image can trigger the overflow, making it
    exploitable via common image upload and processing pipelines.

    https://www.cve.org/CVERecord?id=CVE-2026-23876

- CVE-2026-24481:
    Prior to versions 7.1.2-15 and 6.9.13-40, a heap information
    disclosure vulnerability exists in ImageMagick's PSD (Adobe
    Photoshop) format handler. When processing a maliciously crafted PSD
    file containing ZIP-compressed layer data that decompresses to less
    than the expected size, uninitialized heap memory is leaked into the
    output image.

    https://www.cve.org/CVERecord?id=CVE-2026-24481

- CVE-2026-25638:
    Prior to versions 7.1.2-15 and 6.9.13-40, memory leak exists in
    `coders/msl.c`. In the `WriteMSLImage` function of the `msl.c` file,
    resources are allocated. But the function returns early without
    releasing these allocated resources.

    https://www.cve.org/CVERecord?id=CVE-2026-25638

- CVE-2026-25794:
    `WriteUHDRImage` in `coders/uhdr.c` uses `int` arithmetic to compute
    the pixel buffer size. Prior to version 7.1.2-15, when image
    dimensions are large, the multiplication overflows 32-bit `int`,
    causing an undersized heap allocation followed by an out-of-bounds
    write. This can crash the process or potentially lead to an out of
    bounds heap write.

    https://www.cve.org/CVERecord?id=CVE-2026-25794

- CVE-2026-25795:
    Prior to versions 7.1.2-15 and 6.9.13-40, in `ReadSFWImage()`
    (`coders/sfw.c`), when temporary file creation fails, `read_info` is
    destroyed before its `filename` member is accessed, causing a NULL
    pointer dereference and crash.

    https://www.cve.org/CVERecord?id=CVE-2026-25795

- CVE-2026-25796:
    Prior to versions 7.1.2-15 and 6.9.13-40, in `ReadSTEGANOImage()`
    (`coders/stegano.c`), the `watermark` Image object is not freed on
    three early-return paths, resulting in a definite memory leak
    (~13.5KB+ per invocation) that can be exploited for denial of
    service.

    https://www.cve.org/CVERecord?id=CVE-2026-25796

- CVE-2026-25798:
    Prior to versions 7.1.2-15 and 6.9.13-40, a NULL pointer dereference
    in ClonePixelCacheRepository allows a remote attacker to crash any
    application linked against ImageMagick by supplying a crafted image
    file, resulting in denial of service.

    https://www.cve.org/CVERecord?id=CVE-2026-25798

- CVE-2026-25799:
    Prior to versions 7.1.2-15 and 6.9.13-40, a logic error in YUV
    sampling factor validation allows an invalid sampling factor to
    bypass checks and trigger a division-by-zero during image loading,
    resulting in a reliable denial-of-service.

    https://www.cve.org/CVERecord?id=CVE-2026-25799

- CVE-2026-25897:
    Prior to versions 7.1.2-15 and 6.9.13-40, an Integer Overflow
    vulnerability exists in the sun decoder. On 32-bit systems/builds, a
    carefully crafted image can lead to an out of bounds heap write.

    https://www.cve.org/CVERecord?id=CVE-2026-25897

- CVE-2026-25989:
    Prior to versions 7.1.2-15 and 6.9.13-40, a crafted SVG file can
    cause a denial of service. An off-by-one boundary check (`>` instead
    of `>=`) that allows bypass the guard and reach an undefined
    `(size_t)` cast.

    https://www.cve.org/CVERecord?id=CVE-2026-25989

- CVE-2026-26066:
    Prior to versions 7.1.2-15 and 6.9.13-40, a crafted profile contain
    invalid IPTC data may cause an infinite loop when writing it with
    `IPTCTEXT`.

    https://www.cve.org/CVERecord?id=CVE-2026-26066

- CVE-2026-26283:
    Prior to versions 7.1.2-15 and 6.9.13-40, a `continue` statement in
    the JPEG extent binary search loop in the jpeg encoder causes an
    infinite loop when writing persistently fails. An attacker can
    trigger a 100% CPU consumption and process hang (Denial of Service)
    with a crafted image.

    https://www.cve.org/CVERecord?id=CVE-2026-26283

- CVE-2026-26284:
    Prior to versions 7.1.2-15 and 6.9.13-40, ImageMagick lacks proper
    boundary checking when processing Huffman- coded data from PCD
    (Photo CD) files. The decoder contains an function that has an
    incorrect initialization that could cause an out of bounds read.

    https://www.cve.org/CVERecord?id=CVE-2026-26284

- CVE-2026-26983:
    Prior to versions 7.1.2-15 and 6.9.13-40, the MSL interpreter
    crashes when processing a invalid `<map>` element that causes it to
    use an image after it has been freed.

    https://www.cve.org/CVERecord?id=CVE-2026-26983

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 45e009ab4ad8c41365d02daaf2074677ca92d46d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/imagemagick/imagemagick.hash | 4 ++--
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index eead3a9f97..90383c4d17 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  521fa7a8c0f664a3f5cf7437cbcc219f12bd6d5fe0c1fb014f212fa145076e60  imagemagick-7.1.2-12.tar.gz
-sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
+sha256  bf646e7fffdf50b7d886eec6bbe51c3ced1c4d68fbabfcc534e014575359fe7f  imagemagick-7.1.2-15.tar.gz
+sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 0d5eb2aa34..5a03fbfd8f 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-12
+IMAGEMAGICK_VERSION = 7.1.2-15
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
