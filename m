Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217F1606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BUvZbd38
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E146C80E46;
	Sun,  1 Nov 2026 11:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmDdNna_W0EO; Sun,  1 Nov 2026 11:48:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B633E80F7B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793533688;
	b=VYE9qgNXl4IAWpMCRx4IAufPCDASDUjb/4GTCqOJWe2Giu0JqlX4cP+XBqLKG9nKc9RE
	 VwhhDhrIGhN/eSrppv6NxY6LExLFRXoU/0Z4lJHNFU28tqTWKa5TiytxZTK8dJsvLzTKt
	 hJG+8ZWMcjsZR5RTSFAPT2CntwD2hmMJsh+v8fcovc3VC8e9u/eMHdIoZMeQKgoTeW+Iv
	 6xBkNX2mfQ5xTg1jVvDElyLM5w3MPNHCrG1CZWx+dFermL7CJnwqp2MwGxALkyl7YPtax
	 TOJ4Tw/DfgIg1mIOqXzh9lRVb/eZ1B7LvUcrLd52FqSRrS8hL6W7DszInRVMlS8J78A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793533688;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ce1LV+lv/8QhC7fhjswq4LLlwQp3J8DbwEmziulaE3A=;
	b=E5WedIq5RrjcggTApJJB1WYcZHodfbnwMfFEtLpolWhtHN0huy+kX2g9hPiAQoiGV/yE
	 J4zOazV86unr7xCQdhNFVUodNVQi9j4TvfeGlR64cwctk4LcMnSs1hy23SGFYjBhMRH0z
	 XwTHqJUNHorb1zXywQXYTTE0RJdB3RPcRzh2o7e6ZbguetDpeybjxkk1EXuIKt4UKi2ki
	 jdYdk7SqkbrBEqmRp7Ggi6U2Tn9WjygGCMn8a54zrVqvElqYdlgjXn6T2BSzhGhZm8yo4
	 yo6j8UfY+p6Z94DxTfqueAKAxQFT3xseUdRo85KIYW3kPizlpUV84XETUgZLpqxOQ8w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793533688;
	bh=ce1LV+lv/8QhC7fhjswq4LLlwQp3J8DbwEmziulaE3A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BUvZbd38qze9dPsJxqzZuesGqTKcdLvcHALpVtdjRCNMjnCcafcrVEkCZ4CgvRh5O
	 OI/7CwoXIGK0Omlv34P1RWNbs4l4KA9WXu+tgeg6PbnWRakHqVjK6UfqiFabEYfSXu
	 qDPnU3SBxsoNIDBWe0X9nVD4AxsSu96/26YYjKCZkVOEKsTWo14ZRfvl5xoim9nOVT
	 hECdxDu6ZL1oH+cj9Xcv5F5JdYoEz5e8Po0ylvsDHrD0L/savtg1NIx/lB3EPT2W8A
	 onpqn/CxEy2HIXU+11ACdfQQBogsqyjhKjVaYsVHF/ieyqDMqjV3RZ06aYNXpwFl0K
	 j1vtEkvvyJMNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B633E80F7B;
	Sun,  1 Nov 2026 11:48:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88AF6323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 11:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E4D680F7D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 11:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7KLGDhjV0yg for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 11:48:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3112880E46
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793533686;
 b=ZL3z6mqCFFD2I1QKf5SCdyz/FCf86/Teo4UCTiIbZXZ9PDHIrquo7ARXoSnbf39h845i
 1SZKO5/Js1vcW6tQzRQ6PcTS2apMdibsgqJLOwPgDApl96kt0GdEwOAhPjpPeZva0SGJd
 1eo++2n5BpUV1z7ESctTSD6QgVqKnUahWHpvUygLfavYKnkWvH4moqWMtOabB5jDP3T0I
 IL0L4NPiLsFWFaff7qPlhYb61nA9rSJ2yelavYD41QqRqEwz59Ilz31hWKnLiRgSFgyZH
 Anamdd/0iEepfpGqRUFByrPaQXdSVxbucePacdVLHQSSruQCCpzaQqUr/2t5RA47Ixg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793533686;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YLsOwKjZnNB6i+UAaCAUceAD5hyharsf6FxjE07HpEo=;
 b=fckgOI7J/+RW9t3j0vC9iAL0vQJMuwq18moG0DqWWs14IIj6bhulUFdSoH/491zL3+gv
 QB2lH95ecPSKCRgN0xKuJWkCv6lzNZGMAU76EXdSpVbmemCPYjBrX14WTrHKpyFmcgI7w
 wEfbxjJz4QYqsiFv0cvHH2J4JTWKmXkgsgQF4WWx47nrkE6w6q08Foe5iLyt0D2TcSHFl
 3upSXuoGx7/8LR32+zSTpkVNzhdYo2PnF0ubobqFHrFafrWuvKCWfhe4ZiXWTgo/YjYh0
 vmwtP2jDkrTMCIO+/iEpkjZpafw7z0j29ThhkDbT0rFYxLAVTlKqKyBSsFHADAISzZg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3112880E46
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 11:48:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 095589D438; Sun,  1 Nov 2026 11:46:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 11:57:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15b0457158bbe24264ab241cbe87c52b4d659f4e
X-Git-Newrev: 2b8e5fe2c7ace7b89d02d9d4203d716a1bf54ed8
X-Patchwork-Hint: ignore
Message-Id: <20261101114637.095589D438@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: security bump to
 version 13.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,BOMB_FREEM,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2b8e5fe2c7ace7b89d02d9d4203d716a1bf54ed8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issues:

- CVE-2026-96639, GHSA-v9pv-5gc8-w2m6: Stale native image storage reused
  after mode transitions
- GHSA-5x8w-8jj5-q52h, GHSA-8g5g-8vmr-9782: JPEG decoder buffer overflow
  from scanlines wider than tile extents
- CVE-2026-96644, GHSA-9v9v-9qvf-h2hj: WMF/EMF heap out-of-bounds read
  from dimension truncation
- CVE-2026-96637, GHSA-g842-9rc4-69pw: SPIDER decompression bomb bypass
  via seek()
- CVE-2026-96643, GHSA-g4qv-2jxx-769h: Unbounded Exif header replacement
  loop
- CVE-2026-96778, GHSA-g7cr-3p24-7wf7: JPEG comment write after ICC
  profile fills encoder buffer
- GHSA-462x-pgg6-55fp, GHSA-c6hw-5grf-ff96: TIFF tile and YCbCr decoding
  out-of-bounds read from undersized libtiff buffers
- GHSA-p4wg-p73j-c528: PDF parsing stack exhaustion from long trailer
  chains and deep or cyclic page trees
- CVE-2026-96640, GHSA-mrfp-p49p-3hf2: PDF append resource exhaustion
  from repeated page tree references
- GHSA-pchr-8j38-3x4p: TIFF encoder accepted an incorrectly sized
  Colormap for non-8-bit images
- GHSA-332p-7hrc-92wf: TIFF encoder heap buffer overflow when saving to
  a file object
- GHSA-xcvg-w56q-r89m: TIFF encoder heap buffer overflow when tags
  override the image size
- GHSA-xvh5-g6gv-559v: TIFF encoder memory disclosure and crash from
  mismatched tag values
- GHSA-q45j-58j2-45rg: TIFF decoding returned uninitialized memory for
  short JPEG strips
- GHSA-78g4-xqwv-q3g8: Bundled OpenJPEG heap buffer overflow when
  reading tile-part data
- GHSA-4rr5-89j8-mwwm: TIFF encoder use-after-free write
- CVE-2026-96636, GHSA-p8hx-v2p6-rp84: MPO, DCX and MIC decompression
  bomb bypass via seek()
- GHSA-f2g6-542v-9j58: PDF page tree stack exhaustion via cyclic /Kids
  reference
- GHSA-5xm2-6676-qcp9: APNG decompression bomb bypass via delayed
  disposal-frame sizing
- CVE-2026-96642, GHSA-3j72-p6qg-6xp7: TarIO negative size field causes
  infinite CPU-spin loop
- CVE-2026-96638, GHSA-24rc-8hj2-v98c: BMP RLE decoder
  memory-amplification denial of service
- GHSA-gg2r-wvfm-q9rx: MSP RLE decoder expands a tiny file into
  unbounded memory
- GHSA-wqgw-9xfh-qf2g: TIFF and Exif IFD parsing memory and CPU
  amplification from shared tag data
- GHSA-jg86-v3jv-hrpm: Quadratic time when writing many objects to a PDF
- GHSA-254f-3936-288h: PdfParser unbounded recursion via deeply nested
  objects
- GHSA-rfgq-q3w2-pmv2: Image.quantize() crash from an empty target
  palette
- GHSA-xgh8-jp6q-p5x8: XBM header parsing regular expression denial of
  service
- GHSA-22hg-r758-rrw9, GHSA-74r2-7ff9-mjj2, GHSA-fc9g-5qg7-mf45: GIF
  comment handling quadratic-time blowup from repeated concatenation
- GHSA-27h8-gf7j-v5hc: Out-of-bounds read in rank-based filters for
  zero-dimension images
- CVE-2026-96641, GHSA-4rm8-3hmm-39fg: Integer underflow in PILfont text
  width calculation
- GHSA-cp9v-662q-vvx9: Image.merge() buffer overflow when merging 32-bit
  images as narrower bands
- GHSA-j4m9-6w36-pw47: Uninitialized glyph pointer freed on font
  rendering error path
- GHSA-7mwm-ghpf-9vrm: Double free in Image.transform() after an
  allocation failure
- GHSA-4558-3h8r-v8xp: P;2L and P;4L raw mode decoders read past the end
  of their input
- GHSA-w889-685w-c8fh: EPS filename argument injection into Ghostscript
- GHSA-65qm-jvmh-6pqg: GIF decompression bomb check used a size
  discarded on failure
- GHSA-vx6w-vv9f-6gvg: EPS decompression bomb bypass via Ghostscript
  rendering
- GHSA-58r4-6rv3-gfh8: ImageMorph.MorphOp.apply() out-of-bounds write on
  zero-width images

Fix the AVIF build option: Pillow names it avif, the -Clibavif setting
was silently ignored, so AVIF support was only auto-detected instead of
following BR2_PACKAGE_LIBAVIF.

Pillow 13.0.0 adds the Python installation include and library
directories from sysconfig, which are /usr/include and /usr/lib when
cross-compiling, so the build fails with:

  ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'

Add a patch, backported from an upstream pull request, skipping those
directories when building against an uninstalled Python, as done by
Buildroot.

Release notes:
https://pillow.readthedocs.io/en/stable/releasenotes/13.0.0.html

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-installation-paths-for-build-tree-Python.patch | 48 ++++++++++++++++++++++
 package/python-pillow/python-pillow.hash           |  4 +-
 package/python-pillow/python-pillow.mk             |  8 ++--
 3 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/package/python-pillow/0001-Skip-Python-installation-paths-for-build-tree-Python.patch b/package/python-pillow/0001-Skip-Python-installation-paths-for-build-tree-Python.patch
new file mode 100644
index 0000000000..ecbff40e2f
--- /dev/null
+++ b/package/python-pillow/0001-Skip-Python-installation-paths-for-build-tree-Python.patch
@@ -0,0 +1,48 @@
+From d32fb4da510c91ba3596fad8d3d73074b1b287ac Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 18 Oct 2026 12:37:23 -0600
+Subject: [PATCH] Skip Python installation paths for build-tree Python
+
+Upstream: https://github.com/python-pillow/Pillow/pull/10236
+[Angelo: drop the docs/releasenotes/13.1.0.rst change, the file is not
+in the 13.0.0 release]
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ setup.py | 24 ++++++++++++++----------
+ 1 file changed, 14 insertions(+), 10 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 2d02cf129ca..7de22bb78eb 100644
+--- a/setup.py
++++ b/setup.py
+@@ -572,16 +572,20 @@ def build_extensions(self) -> None:
+                 for d in os.environ[k].split(os.path.pathsep):
+                     _add_directory(library_dirs, d)
+ 
+-        _add_directory(
+-            library_dirs,
+-            (sys.prefix == sys.base_prefix and sysconfig.get_config_var("LIBDIR"))
+-            or os.path.join(sys.prefix, "lib"),
+-        )
+-        _add_directory(
+-            include_dirs,
+-            (sys.prefix == sys.base_prefix and sysconfig.get_config_var("INCLUDEDIR"))
+-            or os.path.join(sys.prefix, "include"),
+-        )
++        if not sysconfig.is_python_build():
++            _add_directory(
++                library_dirs,
++                (sys.prefix == sys.base_prefix and sysconfig.get_config_var("LIBDIR"))
++                or os.path.join(sys.prefix, "lib"),
++            )
++            _add_directory(
++                include_dirs,
++                (
++                    sys.prefix == sys.base_prefix
++                    and sysconfig.get_config_var("INCLUDEDIR")
++                )
++                or os.path.join(sys.prefix, "include"),
++            )
+ 
+         #
+         # add platform directories
diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 6f9c5d2cb1..2bc0206258 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  c714771477fa686ba789092cf84234c7  pillow-12.3.0.tar.gz
-sha256  3b8182a766685eaa002637e28b4ec8d6b18819a0c71f579bf0dbaa5830297cce  pillow-12.3.0.tar.gz
+md5  c774e5aef5897704ccd528d0781a9b37  pillow-13.0.0.tar.gz
+sha256  cdcd1ba258178f7356d74170c9a81ba4eab6a5d55748bc402a5a2a6fe6be3510  pillow-13.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  15181e7363dca9aed78b79bebebc7fde7f1814b8bd311ea3b87ae8ccadfc185b  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 433cbae5e5..240353eda3 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 12.3.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/1c/3d/bb7fca845737cf9d7dbde16ed1843984665ff2e0a518f5db43e77ec540b9
+PYTHON_PILLOW_VERSION = 13.0.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/ce/a4/9cc30690a394a8305e8be4c9036aa16d0dfddadd09079860b582f562496d
 PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = MIT-CMU
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
@@ -43,9 +43,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBAVIF),y)
 PYTHON_PILLOW_DEPENDENCIES += libavif
-PYTHON_PILLOW_BUILD_OPTS += -Clibavif=enable
+PYTHON_PILLOW_BUILD_OPTS += -Cavif=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -Clibavif=disable
+PYTHON_PILLOW_BUILD_OPTS += -Cavif=disable
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
