Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B232DD2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87FF682A0B;
	Tue, 13 Jan 2026 19:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfDze4L3h6-4; Tue, 13 Jan 2026 19:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE75183495
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333240;
	bh=ikLl1xB7Of813xZ+ZQUW9MyLH5quKrAu38MvM2pjgpM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aVcibZmq7x17hpLWwQzp07KYRnjPTAmgaKxAZRPoGkfSGvd0QORNx1urNnc202e4B
	 wBc9eo7USoeVAfR8pjmxwh8YEuQ+yLsM46gnsTHuHOPtICxrZ3XCnZeckApEZ3/2uR
	 nbo6gRm9s2uwQ+NogxkeCD7uCKHqwsb06acQZ7cCfL65/gfJZwYiqUzNVcp4xJY3eJ
	 gJlT3VOqm4m4IUwT6nAIL3NeR03gzkTKqWkCXrpD8MTaPFfGgZXnEEGqXN/9/0CTlI
	 qUOxJuPTO9nM93Ni4fA3r1OzG52ZU7Rg838LGE/I/5HxSGkmRTUtqBW6ZXkvujs0nq
	 XCIxwo6tE9GCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE75183495;
	Tue, 13 Jan 2026 19:40:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C081231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD8A240B25
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g79WUsBHHo_A for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8960B40B16
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8960B40B16
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 756078125F; Tue, 13 Jan 2026 19:40:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 15:57:02 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f510a02f93be1971610b8ae910c6a74266da824d
X-Git-Newrev: 838449ec2004729235e407e3ad3293e88379aa8a
X-Patchwork-Hint: ignore
Message-Id: <20260113194031.756078125F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libfreeimage:
 various vulnerability patches
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
Content-Type: multipart/mixed; boundary="===============4208314814854670377=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4208314814854670377==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=838449ec2004729235e407e3ad3293e88379aa8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

This package’s last release dates back to July 2018. Since then, a
number of CVEs have accumulated. This patch applies several
vulnerability fixes from the Fedora project. Not all vulnerabilities are
addressed by this patch.

- CVE-2019-12211

    When FreeImage 3.18.0 reads a tiff file, it will be handed to the
    Load function of the PluginTIFF.cpp file, but a memcpy occurs in
    which the destination address and the size of the copied data are
    not considered, resulting in a heap overflow.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2019-12211

- CVE-2019-12213

    When FreeImage 3.18.0 reads a special TIFF file, the
    TIFFReadDirectory function in PluginTIFF.cpp always returns 1,
    leading to stack exhaustion.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2019-12213

- CVE-2020-24292

    Buffer Overflow vulnerability in load function in PluginICO.cpp in
    FreeImage 3.19.0 [r1859] allows remote attackers to run arbitrary
    code via opening of crafted ico file.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2020-24292
  - https://sourceforge.net/p/freeimage/discussion/36111/thread/afb98701eb/

- CVE-2020-24293

    Buffer Overflow vulnerability in psdThumbnail::Read in PSDParser.cpp
    in FreeImage 3.19.0 [r1859] allows remote attackers to run arbitrary
    code via opening of crafted psd file.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2020-24293
  - https://sourceforge.net/p/freeimage/discussion/36111/thread/afb98701eb/

- CVE-2020-24295

    Buffer Overflow vulnerability in PSDParser.cpp::ReadImageLine() in
    FreeImage 3.19.0 [r1859] allows remote attackers to ru narbitrary
    code via use of crafted psd file.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2020-24295
  - https://sourceforge.net/p/freeimage/discussion/36111/thread/afb98701eb/

- CVE-2021-33367

    Buffer Overflow vulnerability in Freeimage v3.18.0 allows attacker
    to cause a denial of service via a crafted JXR file.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2021-33367
  - https://sourceforge.net/p/freeimage/discussion/36109/thread/1a4db03d58/

- CVE-2021-40263

    A heap overflow vulnerability in FreeImage 1.18.0 via the ofLoad
    function in PluginTIFF.cpp.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2021-40263
  - https://sourceforge.net/p/freeimage/bugs/336/

- CVE-2021-40266

    FreeImage before 1.18.0, ReadPalette function in PluginTIFF.cpp is
    vulnerabile to null pointer dereference.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2021-40266
  - https://sourceforge.net/p/freeimage/bugs/334/

- CVE-2023-47995

    Memory Allocation with Excessive Size Value discovered in
    BitmapAccess.cpp::FreeImage_AllocateBitmap in FreeImage 3.18.0
    allows attackers to cause a denial of service.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2023-47995

- CVE-2023-47997

    An issue discovered in BitmapAccess.cpp::FreeImage_AllocateBitmap in
    FreeImage 3.18.0 leads to an infinite loop and allows attackers to
    cause a denial of service.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2023-47997

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6750719a20ff58bba61936320ce4c76b02eefc7a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0007-CVE-2019-12211_2019-12213.patch           | 188 +++++++++++++++++++++
 package/libfreeimage/0008-CVE-2020-24292.patch     |  17 ++
 package/libfreeimage/0009-CVE-2020-24293.patch     |  18 ++
 package/libfreeimage/0010-CVE-2020-24295.patch     |  25 +++
 package/libfreeimage/0011-CVE-2021-33367.patch     |  23 +++
 package/libfreeimage/0012-CVE-2021-40263.patch     |  18 ++
 package/libfreeimage/0013-CVE-2021-40266.patch     |  18 ++
 package/libfreeimage/0014-CVE-2023-47995.patch     |  18 ++
 package/libfreeimage/0015-CVE-2023-47997.patch     |  20 +++
 package/libfreeimage/libfreeimage.mk               |  27 +++
 10 files changed, 372 insertions(+)

diff --git a/package/libfreeimage/0007-CVE-2019-12211_2019-12213.patch b/package/libfreeimage/0007-CVE-2019-12211_2019-12213.patch
new file mode 100644
index 0000000000..394827e1da
--- /dev/null
+++ b/package/libfreeimage/0007-CVE-2019-12211_2019-12213.patch
@@ -0,0 +1,188 @@
+CVE: CVE-2019-12211
+CVE: CVE-2019-12213
+Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/78980acf39f02b88e70f27e37e5a191c9a9ead47/f/CVE-2019-12211_2019-12213.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff -rupN a/Source/FreeImage/PluginTIFF.cpp b/Source/FreeImage/PluginTIFF.cpp
+--- a/Source/FreeImage/PluginTIFF.cpp
++++ b/Source/FreeImage/PluginTIFF.cpp
+@@ -122,9 +122,14 @@ static void ReadThumbnail(FreeImageIO *i
+ static int s_format_id;
+ 
+ typedef struct {
++	//! FreeImage IO functions
+     FreeImageIO *io;
++	//! FreeImage handle
+ 	fi_handle handle;
++	//! LibTIFF handle
+ 	TIFF *tif;
++	//! Count the number of thumbnails already read (used to avoid recursion on loading)
++	unsigned thumbnailCount;
+ } fi_TIFFIO;
+ 
+ // ----------------------------------------------------------
+@@ -184,10 +189,8 @@ Open a TIFF file descriptor for reading
+ */
+ TIFF *
+ TIFFFdOpen(thandle_t handle, const char *name, const char *mode) {
+-	TIFF *tif;
+-	
+ 	// Open the file; the callback will set everything up
+-	tif = TIFFClientOpen(name, mode, handle,
++	TIFF *tif = TIFFClientOpen(name, mode, handle,
+ 	    _tiffReadProc, _tiffWriteProc, _tiffSeekProc, _tiffCloseProc,
+ 	    _tiffSizeProc, _tiffMapProc, _tiffUnmapProc);
+ 
+@@ -460,12 +463,10 @@ CreateImageType(BOOL header_only, FREE_I
+ 			}
+ 			
+ 		}
+-		else {
+-
+-			dib = FreeImage_AllocateHeader(header_only, width, height, MIN(bpp, 32), FI_RGBA_RED_MASK, FI_RGBA_GREEN_MASK, FI_RGBA_BLUE_MASK);
++		else if (bpp <= 32) {
++			dib = FreeImage_AllocateHeader(header_only, width, height, bpp, FI_RGBA_RED_MASK, FI_RGBA_GREEN_MASK, FI_RGBA_BLUE_MASK);
+ 		}
+ 
+-
+ 	} else {
+ 		// other bitmap types
+ 		
+@@ -1050,9 +1051,12 @@ static void * DLL_CALLCONV
+ Open(FreeImageIO *io, fi_handle handle, BOOL read) {
+ 	// wrapper for TIFF I/O
+ 	fi_TIFFIO *fio = (fi_TIFFIO*)malloc(sizeof(fi_TIFFIO));
+-	if(!fio) return NULL;
++	if (!fio) {
++		return NULL;
++	}
+ 	fio->io = io;
+ 	fio->handle = handle;
++	fio->thumbnailCount = 0;
+ 
+ 	if (read) {
+ 		fio->tif = TIFFFdOpen((thandle_t)fio, "", "r");
+@@ -1108,6 +1112,27 @@ check for uncommon bitspersample values
+ */
+ static BOOL 
+ IsValidBitsPerSample(uint16 photometric, uint16 bitspersample, uint16 samplesperpixel) {
++	// get the pixel depth in bits
++	const uint16 pixel_depth = bitspersample * samplesperpixel;
++
++	// check for a supported pixel depth
++	switch (pixel_depth) {
++		case 1:
++		case 4:
++		case 8:
++		case 16:
++		case 24:
++		case 32:
++		case 48:
++		case 64:
++		case 96:
++		case 128:
++			// OK, go on
++			break;
++		default:
++			// unsupported pixel depth
++			return FALSE;
++	}
+ 
+ 	switch(bitspersample) {
+ 		case 1:
+@@ -1148,6 +1173,8 @@ IsValidBitsPerSample(uint16 photometric,
+ 		default:
+ 			return FALSE;
+ 	}
++
++	return FALSE;
+ }
+ 
+ static TIFFLoadMethod  
+@@ -1237,15 +1264,30 @@ Read embedded thumbnail
+ static void 
+ ReadThumbnail(FreeImageIO *io, fi_handle handle, void *data, TIFF *tiff, FIBITMAP *dib) {
+ 	FIBITMAP* thumbnail = NULL;
+-	
++
++	fi_TIFFIO *fio = (fi_TIFFIO*)data;
++
++	/*
++	Thumbnail loading can cause recursions because of the way
++	functions TIFFLastDirectory and TIFFSetSubDirectory are working.
++	We use here a hack to count the number of times the ReadThumbnail function was called.
++	We only allow one call, check for this
++	*/
++	if (fio->thumbnailCount > 0) {
++		return;
++	}
++	else {
++		// update the thumbnail count (used to avoid recursion)
++		fio->thumbnailCount++;
++	}
++
+ 	// read exif thumbnail (IFD 1) ...
+ 	
+-	/*
+-	// this code can cause unwanted recursion causing an overflow, it is thus disabled until we have a better solution
+-	// do we really need to read a thumbnail from the Exif segment ? knowing that TIFF store the thumbnail in the subIFD ...
+-	// 
+ 	toff_t exif_offset = 0;
+ 	if(TIFFGetField(tiff, TIFFTAG_EXIFIFD, &exif_offset)) {
++
++		// this code can cause unwanted recursion causing an overflow, because of the way TIFFLastDirectory work
++		// => this is checked using
+ 		
+ 		if(!TIFFLastDirectory(tiff)) {
+ 			// save current position
+@@ -1256,15 +1298,15 @@ ReadThumbnail(FreeImageIO *io, fi_handle
+ 			int page = 1;
+ 			int flags = TIFF_DEFAULT;
+ 			thumbnail = Load(io, handle, page, flags, data);
++
+ 			// store the thumbnail (remember to release it before return)
+ 			FreeImage_SetThumbnail(dib, thumbnail);
+-			
++
+ 			// restore current position
+ 			io->seek_proc(handle, tell_pos, SEEK_SET);
+ 			TIFFSetDirectory(tiff, cur_dir);
+ 		}
+ 	}
+-	*/
+ 	
+ 	// ... or read the first subIFD
+ 	
+@@ -1281,11 +1323,14 @@ ReadThumbnail(FreeImageIO *io, fi_handle
+ 				const long tell_pos = io->tell_proc(handle);
+ 				const uint16 cur_dir = TIFFCurrentDirectory(tiff);
+ 				
++                // this code can cause unwanted recursion causing an overflow, because of the way TIFFSetSubDirectory work
++
+ 				if(TIFFSetSubDirectory(tiff, subIFD_offsets[0])) {
+ 					// load the thumbnail
+ 					int page = -1; 
+ 					int flags = TIFF_DEFAULT;
+ 					thumbnail = Load(io, handle, page, flags, data);
++
+ 					// store the thumbnail (remember to release it before return)
+ 					FreeImage_SetThumbnail(dib, thumbnail);
+ 				}
+@@ -2041,7 +2086,7 @@ Load(FreeImageIO *io, fi_handle handle,
+ 				}
+ 
+ 				// calculate src line and dst pitch
+-				int dst_pitch = FreeImage_GetPitch(dib);
++				unsigned dst_pitch = FreeImage_GetPitch(dib);
+ 				uint32 tileRowSize = (uint32)TIFFTileRowSize(tif);
+ 				uint32 imageRowSize = (uint32)TIFFScanlineSize(tif);
+ 
+@@ -2071,7 +2116,7 @@ Load(FreeImageIO *io, fi_handle handle,
+ 						BYTE *src_bits = tileBuffer;
+ 						BYTE *dst_bits = bits + rowSize;
+ 						for(int k = 0; k < nrows; k++) {
+-							memcpy(dst_bits, src_bits, src_line);
++							memcpy(dst_bits, src_bits, MIN(dst_pitch, src_line));
+ 							src_bits += tileRowSize;
+ 							dst_bits -= dst_pitch;
+ 						}
diff --git a/package/libfreeimage/0008-CVE-2020-24292.patch b/package/libfreeimage/0008-CVE-2020-24292.patch
new file mode 100644
index 0000000000..780f93640e
--- /dev/null
+++ b/package/libfreeimage/0008-CVE-2020-24292.patch
@@ -0,0 +1,17 @@
+CVE: CVE-2020-24292
+Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2020-24292.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff -rupN a/Source/FreeImage/PluginICO.cpp b/Source/FreeImage/PluginICO.cpp
+--- a/Source/FreeImage/PluginICO.cpp
++++ b/Source/FreeImage/PluginICO.cpp
+@@ -301,6 +301,9 @@ LoadStandardIcon(FreeImageIO *io, fi_han
+ 	int width  = bmih.biWidth;
+ 	int height = bmih.biHeight / 2; // height == xor + and mask
+ 	unsigned bit_count = bmih.biBitCount;
++	if (bit_count != 1 && bit_count != 2 && bit_count != 4 && bit_count != 8 && bit_count != 16 && bit_count != 24 && bit_count != 32) {
++	  return NULL;
++	}
+ 	unsigned line   = CalculateLine(width, bit_count);
+ 	unsigned pitch  = CalculatePitch(line);
+ 
diff --git a/package/libfreeimage/0009-CVE-2020-24293.patch b/package/libfreeimage/0009-CVE-2020-24293.patch
new file mode 100644
index 0000000000..16466e881a
--- /dev/null
+++ b/package/libfreeimage/0009-CVE-2020-24293.patch
@@ -0,0 +1,18 @@
+CVE: CVE-2020-24293
+Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2020-24293.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff -rupN a/Source/FreeImage/PSDParser.cpp b/Source/FreeImage/PSDParser.cpp
+--- a/Source/FreeImage/PSDParser.cpp
++++ b/Source/FreeImage/PSDParser.cpp
+@@ -780,6 +780,10 @@ int psdThumbnail::Read(FreeImageIO *io,
+ 		FreeImage_Unload(_dib);
+ 	}
+ 
++	if (_WidthBytes != _Width * _BitPerPixel / 8) {
++	  throw "Invalid PSD image";
++	}
++
+ 	if(_Format == 1) {
+ 		// kJpegRGB thumbnail image
+ 		_dib = FreeImage_LoadFromHandle(FIF_JPEG, io, handle);
diff --git a/package/libfreeimage/0010-CVE-2020-24295.patch b/package/libfreeimage/0010-CVE-2020-24295.patch
new file mode 100644
index 0000000000..295791a26e
--- /dev/null
+++ b/package/libfreeimage/0010-CVE-2020-24295.patch
@@ -0,0 +1,25 @@
+CVE: CVE-2020-24295
+Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2020-24295.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff -rupN a/Source/FreeImage/PSDParser.cpp b/Source/FreeImage/PSDParser.cpp
+--- a/Source/FreeImage/PSDParser.cpp
++++ b/Source/FreeImage/PSDParser.cpp
+@@ -1466,6 +1466,7 @@ FIBITMAP* psdParser::ReadImageData(FreeI
+ 	const unsigned dstBpp =  (depth == 1) ? 1 : FreeImage_GetBPP(bitmap)/8;
+ 	const unsigned dstLineSize = FreeImage_GetPitch(bitmap);
+ 	BYTE* const dst_first_line = FreeImage_GetScanLine(bitmap, nHeight - 1);//<*** flipped
++	const unsigned dst_buffer_size = dstLineSize * nHeight;
+ 
+ 	BYTE* line_start = new BYTE[lineSize]; //< fileline cache
+ 
+@@ -1481,6 +1482,9 @@ FIBITMAP* psdParser::ReadImageData(FreeI
+ 				const unsigned channelOffset = GetChannelOffset(bitmap, c) * bytes;
+ 
+ 				BYTE* dst_line_start = dst_first_line + channelOffset;
++				if (channelOffset + lineSize > dst_buffer_size) {
++					throw "Invalid PSD image";
++				}
+ 				for(unsigned h = 0; h < nHeight; ++h, dst_line_start -= dstLineSize) {//<*** flipped
+ 					io->read_proc(line_start, lineSize, 1, handle);
+ 					ReadImageLine(dst_line_start, line_start, lineSize, dstBpp, bytes);
diff --git a/package/libfreeimage/0011-CVE-2021-33367.patch b/package/libfreeimage/0011-CVE-2021-33367.patch
new file mode 100644
index 0000000000..2754d91e86
--- /dev/null
+++ b/package/libfreeimage/0011-CVE-2021-33367.patch
@@ -0,0 +1,23 @@
+CVE: CVE-2021-33367
+Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2021-33367.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff -rupN a/Source/Metadata/Exif.cpp b/Source/Metadata/Exif.cpp
+--- a/Source/Metadata/Exif.cpp
++++ b/Source/Metadata/Exif.cpp
+@@ -719,8 +719,13 @@ jpeg_read_exif_dir(FIBITMAP *dib, const
+ 	//
+ 
+ 	const WORD entriesCount0th = ReadUint16(msb_order, ifd0th);
+-	
+-	DWORD next_offset = ReadUint32(msb_order, DIR_ENTRY_ADDR(ifd0th, entriesCount0th));
++
++	const BYTE* de_addr = DIR_ENTRY_ADDR(ifd0th, entriesCount0th);
++	if(de_addr+4 >= (BYTE*)(dwLength + ifd0th - tiffp)) {
++		return TRUE; //< no thumbnail
++	}
++
++	DWORD next_offset = ReadUint32(msb_order, de_addr);
+ 	if((next_offset == 0) || (next_offset >= dwLength)) {
+ 		return TRUE; //< no thumbnail
+ 	}
diff --git a/package/libfreeimage/0012-CVE-2021-40263.patch b/package/libfreeimage/0012-CVE-2021-40263.patch
new file mode 100644
index 0000000000..8ab97f5702
--- /dev/null
+++ b/package/libfreeimage/0012-CVE-2021-40263.patch
@@ -0,0 +1,18 @@
+CVE: CVE-2021-40263
+Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2021-40263.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff -rupN a/Source/FreeImage/PluginTIFF.cpp b/Source/FreeImage/PluginTIFF.cpp
+--- a/Source/FreeImage/PluginTIFF.cpp
++++ b/Source/FreeImage/PluginTIFF.cpp
+@@ -2090,6 +2090,10 @@ Load(FreeImageIO *io, fi_handle handle,
+ 				uint32 tileRowSize = (uint32)TIFFTileRowSize(tif);
+ 				uint32 imageRowSize = (uint32)TIFFScanlineSize(tif);
+ 
++				if (width / tileWidth * tileRowSize * 8 > bitspersample * samplesperpixel * width) {
++				  free(tileBuffer);
++				  throw "Corrupted tiled TIFF file";
++				}
+ 
+ 				// In the tiff file the lines are saved from up to down 
+ 				// In a DIB the lines must be saved from down to up
diff --git a/package/libfreeimage/0013-CVE-2021-40266.patch b/package/libfreeimage/0013-CVE-2021-40266.patch
new file mode 100644
index 0000000000..0c2620e477
--- /dev/null
+++ b/package/libfreeimage/0013-CVE-2021-40266.patch
@@ -0,0 +1,18 @@
+CVE: CVE-2021-40266
+Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2021-40266.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff -rupN a/Source/FreeImage/PluginTIFF.cpp b/Source/FreeImage/PluginTIFF.cpp
+--- a/Source/FreeImage/PluginTIFF.cpp
++++ b/Source/FreeImage/PluginTIFF.cpp
+@@ -366,6 +366,10 @@ static void
+ ReadPalette(TIFF *tiff, uint16 photometric, uint16 bitspersample, FIBITMAP *dib) {
+ 	RGBQUAD *pal = FreeImage_GetPalette(dib);
+ 
++	if (!pal) {
++	  return;
++	}
++
+ 	switch(photometric) {
+ 		case PHOTOMETRIC_MINISBLACK:	// bitmap and greyscale image types
+ 		case PHOTOMETRIC_MINISWHITE:
diff --git a/package/libfreeimage/0014-CVE-2023-47995.patch b/package/libfreeimage/0014-CVE-2023-47995.patch
new file mode 100644
index 0000000000..48456c3650
--- /dev/null
+++ b/package/libfreeimage/0014-CVE-2023-47995.patch
@@ -0,0 +1,18 @@
+CVE: CVE-2023-47995
+Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2023-47995.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff -rupN a/Source/FreeImage/PluginJPEG.cpp b/Source/FreeImage/PluginJPEG.cpp
+--- a/Source/FreeImage/PluginJPEG.cpp
++++ b/Source/FreeImage/PluginJPEG.cpp
+@@ -1196,6 +1196,10 @@ Load(FreeImageIO *io, fi_handle handle,
+ 
+ 			jpeg_read_header(&cinfo, TRUE);
+ 
++			if (cinfo.image_width > JPEG_MAX_DIMENSION || cinfo.image_height > JPEG_MAX_DIMENSION) {
++				throw FI_MSG_ERROR_DIB_MEMORY;
++			}
++
+ 			// step 4: set parameters for decompression
+ 
+ 			unsigned int scale_denom = 1;		// fraction by which to scale image
diff --git a/package/libfreeimage/0015-CVE-2023-47997.patch b/package/libfreeimage/0015-CVE-2023-47997.patch
new file mode 100644
index 0000000000..6ba5ad3f4e
--- /dev/null
+++ b/package/libfreeimage/0015-CVE-2023-47997.patch
@@ -0,0 +1,20 @@
+CVE: CVE-2023-47997
+Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2023-47997.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff -rupN a/Source/FreeImage/PluginTIFF.cpp b/Source/FreeImage/PluginTIFF.cpp
+--- a/Source/FreeImage/PluginTIFF.cpp
++++ b/Source/FreeImage/PluginTIFF.cpp
+@@ -1444,6 +1444,12 @@ Load(FreeImageIO *io, fi_handle handle,
+ 				(int)bitspersample, (int)samplesperpixel, (int)photometric);
+ 			throw (char*)NULL;
+ 		}
++		if (planar_config == PLANARCONFIG_SEPARATE && bitspersample < 8) {
++			FreeImage_OutputMessageProc(s_format_id,
++				"Unable to handle this format: bitspersample = 8, TIFFTAG_PLANARCONFIG = PLANARCONFIG_SEPARATE"
++			);
++			throw (char*)NULL;
++		}
+ 
+ 		// ---------------------------------------------------------------------------------
+ 
diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
index 4775f92109..86362bc1c4 100644
--- a/package/libfreeimage/libfreeimage.mk
+++ b/package/libfreeimage/libfreeimage.mk
@@ -13,6 +13,33 @@ LIBFREEIMAGE_CPE_ID_VENDOR = freeimage_project
 LIBFREEIMAGE_CPE_ID_PRODUCT = freeimage
 LIBFREEIMAGE_INSTALL_STAGING = YES
 
+# 0007-CVE-2019-12211_2019-12213.patch
+LIBFREEIMAGE_IGNORE_CVES += CVE-2019-12211 CVE-2019-12213
+
+# 0008-CVE-2020-24292.patch
+LIBFREEIMAGE_IGNORE_CVES += CVE-2020-24292
+
+# 0009-CVE-2020-24293.patch
+LIBFREEIMAGE_IGNORE_CVES += CVE-2020-24293
+
+# 0010-CVE-2020-24295.patch
+LIBFREEIMAGE_IGNORE_CVES += CVE-2020-24295
+
+# 0011-CVE-2021-33367.patch
+LIBFREEIMAGE_IGNORE_CVES += CVE-2021-33367
+
+# 0012-CVE-2021-40263.patch
+LIBFREEIMAGE_IGNORE_CVES += CVE-2021-40263
+
+# 0013-CVE-2021-40266.patch
+LIBFREEIMAGE_IGNORE_CVES += CVE-2021-40266
+
+# 0014-CVE-2023-47995.patch
+LIBFREEIMAGE_IGNORE_CVES += CVE-2023-47995
+
+# 0016-CVE-2023-47997.patch
+LIBFREEIMAGE_IGNORE_CVES += CVE-2023-47997
+
 define LIBFREEIMAGE_EXTRACT_CMDS
 	$(UNZIP) $(LIBFREEIMAGE_DL_DIR)/$(LIBFREEIMAGE_SOURCE) -d $(@D)
 	mv $(@D)/FreeImage/* $(@D)

--===============4208314814854670377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4208314814854670377==--
