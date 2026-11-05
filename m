Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785EA606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 23:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GagCGF/Y
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CDE2605DF;
	Thu,  5 Nov 2026 23:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IocDA1L63ULc; Thu,  5 Nov 2026 23:50:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EEEF46085B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793922648;
	b=I3CXJ9eLBnPPjExQk752kZ+Oww+t1j1RhKQ/B9704m9PFdQoiruO4sFV2T2fPHlLtrNV
	 9ZIwSlDFtcFJGtSFsoCffjNY8miznvArBeQZfvJvA8TMMVeErKRwtpJm3sSc6ZRn7yRrl
	 gmP9TBWzjIDljo5rjyOUO3Qael49x6+1lsHcCTQYp3/CsF4yn2RAgslSHj45rnyOr+dYc
	 zSgWI4SruEIqn4eyIM/Scc5eLeA8ky3IRUzaFJydvRH703+uMcg0ybcBr8fefhbokloLw
	 icJF5arf6+GJ+bQQdFVe9irZm8cHbYoDuCgKndJ39EeWe3Vx7xEocyOt+h6AEETT9Sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793922648;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cwgbxz6w8Xi0IxhNxKyyv+bHK5XT/aKLDgZJxw/fwX0=;
	b=Xt3utfLWGom8Qpr//0P/S67wag1OP4mI5QtGYhZIUucrjGXNSSk+S3s5qOsbCfpUnzY7
	 Y2uuTnF3M0pv2/ww7w8c3N+76auT5V1J/YYhMuOlqW7jnzwSgGeuufJlRiuDc10uQr8Ps
	 /3cPybKSPm9Yb1AqB6AUhZZNdwfPzQFnPpLsPy9g82Ie173PAoZoaHz51kmpy8UpWe2St
	 aEm75hV554BtpRaKpNyXO42GvjMJBNegmYvJaRAky0vW91+JCUdUNlM9ex3bt6jsFljru
	 Nmc5LiQU8R1dGVGX4bYwsY7ZPBgP7aCN20uHTURLliYk4YVmTJsk6F6w1Kc7nNIowVw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793922648;
	bh=cwgbxz6w8Xi0IxhNxKyyv+bHK5XT/aKLDgZJxw/fwX0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GagCGF/Yw4fZF1AUm9fDHs+KKla7WYqndS4YQvOZi+dSMeDUZ12nX9S7qFSJVoi0H
	 HeVd4IPHPiwD2raY43crT0wXBaBsg6EMNQgdm7vGpQOjYT8FwA16Kr/u9tUbxXiNp8
	 2bRd9QwCMTn4hxRUosp5YKzi7vtDazRNRGbSyQhBudBV9riGdb2KKIpFg2njjz6Zsx
	 cNio4FMuYfSk9sgh62SVwUucaXa+fKm31eF+xwS0DubTScZISTuLdIWjsYHCWwgb0b
	 xXyalWKqVzj6jvLQ1IfZveJdQgUMesKoitSKetas9lBQTbiqrrXiKavGXwzWhyTH+T
	 JnhCmgcZ9RCqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEEF46085B;
	Thu,  5 Nov 2026 23:50:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74CCF95F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59E974010C
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFVu20fEIYnv for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 23:50:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 006FE400F9
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 006FE400F9
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:50:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A2FD9D971; Thu,  5 Nov 2026 23:49:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 00:42:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bd8b009c1f201d28eedf17dd1fb5671b1a62797
X-Git-Newrev: 8be4ea1bb3ab599d6f8ad4ff3da2e8659ee656bb
X-Patchwork-Hint: ignore
Message-Id: <20261105234911.7A2FD9D971@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imagemagick: security bump to
 version 7.1.2-35
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
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8be4ea1bb3ab599d6f8ad4ff3da2e8659ee656bb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issues:

- CVE-2026-62363, GHSA-422r-8c97-xcg4: Heap Buffer Over-Write in fx
  operation
- GHSA-93x9-jq8c-cwcc: issue in the TIM2 coder
- GHSA-xv2g-79vc-75qf: issue in the PDB coder
- GHSA-g568-j2hh-jr58: issue in the PDB coder
- GHSA-cvxf-g9w2-7mcx: issue in the CALS coder
- CVE-2026-62946, GHSA-h22j-f9xw-xjjm: Integer Overflow in JNX decoder
  causes heap buffer over-write when processing extremely large files on
  32-bit builds
- CVE-2026-64685, GHSA-7rgw-xg25-prjm: Heap Buffer Over-Read in BGR
  decoder due to mising end-of-file check
- GHSA-cvhv-g4rq-3hmw: Memory Leak when providing invalid options to the
  cli
- GHSA-6rvv-36hw-5rgf: issue in the distributed pixel cache
- CVE-2026-106572, GHSA-wxw6-98rj-hjfr: Stack Overflown CALS decoder due
  to missing depth check
- GHSA-chf5-8rv9-gjqr: Heap-use-after-free in Layer method of PerlMagick
  could result in a crash
- GHSA-9x6f-98x9-rx6g: Path Policy TOCTOU symlink race bypass in the
  video decoder
- GHSA-5m9j-96ff-j6qc: Heap-use-after-free in the GetList method of
  PerlMagick could result in a crash
- CVE-2026-107210, GHSA-3j4w-pvxj-fpjc: Policy Bypass in MAT decoder
  when reading highly compressed data
- GHSA-x8g2-7r3w-h44p: Path Policy TOCTOU symlink race bypass on Windows
- CVE-2026-107209, GHSA-f2r2-qw7g-3c8x: Use-After-Free in RSVG decoder
  that is build without cairo support
- GHSA-4mwf-mggw-29vp: Denial of service when exhausting the process
  memory budget
- CVE-2026-107208, GHSA-27m9-54jx-fgvq: Denial of service with crafted
  XMP profile
- GHSA-4jv7-q6xw-6f4x, GHSA-j657-rmv3-4m94: Memory Leak in MSL decoder
- GHSA-4gg2-hfgh-6f5c: Division by Zero in FLIF encoder
- GHSA-7hjx-392p-f8cm: Policy Bypass in UHDR encoder
- CVE-2026-106580, GHSA-r868-pmwh-fv2c: Policy Bypass in CUT encoder
- CVE-2026-106579, GHSA-vcjj-32hg-qpx5: Policy Bypass when using coder
  as the domain
- CVE-2026-106578, GHSA-6xf5-c3jx-rp39: Invalid Memory Free in MVG
  decoder
- CVE-2026-106577, GHSA-5rg6-j44q-q892: Code Injection in the postscript
  coders
- CVE-2026-106574, GHSA-4fq9-vrx7-gv92: Heap Buffer Over-Write in
  distributed pixel cache server will result in a crash
- CVE-2026-106575, GHSA-2w4h-697j-4vrm: Unclosed file pointer in magick
  script
- CVE-2026-106573, GHSA-qr53-hc3p-fc62: Denial of service in MVG decoder
- CVE-2026-106576, GHSA-v45j-x8p4-3mh4: Denial of service possible when
  parsing an XMP profile
- GHSA-89wq-f8f6-2j2v: Policy Bypass in PCD, CUBE and HALD decoder when
  using a specific command line option.
- GHSA-92rw-c5mw-27v4: Null Pointer Dereference in PNM coder when
  hitting a memory limit
- GHSA-3rjr-534c-8v67: Use after free in ImagesToBlob method
- CVE-2026-106571, GHSA-jvjm-9f73-fhpq: Heap Buffer Over-Write in
  GetVirtualPixels api will result in a crash
- GHSA-p6j5-2qwh-6486: Trim labels to prevent code injection
- GHSA-8xmr-6q99-c4x8: Undefined Behavior in the INFO, JSON and YAML
  encoders when writing it in a compressed format
- GHSA-cvgp-q487-j22w: Heap Buffer Over-Read possible when using the -fx
  option.
- GHSA-8x3v-wr32-qqh4: Heap Buffer Over-Write possible when multiple
  threads read/write the security policy
- GHSA-jjp4-3fwf-393j: Policy Bypass possible when DOCTYPE is changed in
  policy.xml
- GHSA-9f9w-84g3-vp2c: Memory Leak in wavelet-denoise operation when
  resource cannot be acquired
- GHSA-v2x3-wpmg-c4w6: Use After Free in -fx option when memory
  allocation fails
- GHSA-vv56-wmgw-m36w: Policy Bypass in script operation due to missing
  checks
- CVE-2026-106570, GHSA-2vwg-3g4g-qprm: Denial of service in distributed
  pixel cache server
- GHSA-q6h4-6f2h-8hfq: issue in MagickCore/attribute.c
- GHSA-4h52-f5gr-2w2h: issue in the distributed pixel cache
- CVE-2026-106568, GHSA-9p7q-63hw-mcr4: Infinite Loop when reading a
  crafted XMP profile
- GHSA-f983-243h-9x4r: Temporary File Leak in the JNG decoder
- GHSA-233r-2p53-wqf5: Code Injection in MVG decoder when postscript
  renderer is used
- GHSA-7q74-r26w-fwcx: Path Policy TOCTOU symlink race bypass in magick
  script
- GHSA-5j8x-vq8c-vrp9: Information Disclosure in the postscript decoder
  of a single byte
- GHSA-58h4-rwr6-wj72: Null Pointer Dereference in postscript decoder
- GHSA-2fgx-26mg-j4f4: issue in the delegate handling
- GHSA-vxwm-jfjc-3r4x: Use After Free in WBINFO decoder
- CVE-2026-106569, GHSA-gwj6-pm7x-3r63: Denial of service in ASE decoder
  because of missing security checks
- CVE-2026-106567, GHSA-g6p6-3ggg-3w7j: Infinite Loop in PSD decoder on
  32-bit systems
- GHSA-f32c-2v6j-wvh5: Memory Leak in -process option
- GHSA-w6hf-vvx5-4qmj: issue in MagickWand mogrify
- CVE-2026-106566, GHSA-54hm-vrmh-75qj: Policy Bypass in delegate
  symlink cleanup due to missing check
- GHSA-9hqg-c52m-2h83: issue in the blob policy checks
- CVE-2026-106565, GHSA-m9c7-gf3j-hx6h: Infinite Loop in bzip2
  compressed images
- GHSA-92p2-h75x-hg82: issue in the distributed pixel cache
- GHSA-j39j-wmxg-j8mv: Use After Free in PDF writer when a CMYK image is
  written with JPEG2000 compression
- GHSA-xxrx-rjp3-27rj: Information Disclosure in JPEG decoder.
- GHSA-rvv7-5mh8-vcfc: Information Disclosure in GIF decoder
- GHSA-3429-f84m-8qhw: Code Injection in CIP encoder
- GHSA-462x-739v-qvq2: Stack Overflown in MSL decoder due to incorrect
  depth check
- GHSA-jph3-37cg-79wg: Heap Buffer Over-Read via XMP profile could
  result in a crash
- GHSA-pmqj-84pr-qc7c, GHSA-x258-xjqf-6j3f: Stack Overflow in MVG
  decoder
- GHSA-69jx-j2x2-g5w4: Memory Leak in YUV encoder when an operation
  fails
- GHSA-w288-jj5x-hhvp: Memory Leak in MVG encoder
- GHSA-w68r-6fmr-cvg4: Memory leak in GIF encoder when quantization
  fails
- GHSA-hvwf-wmm6-hvc3: Memory Leak in PNG encoder when libpng
  initialization fails
- CVE-2026-106564, GHSA-54rx-5x9g-g465: Heap Buffer Over-Write in EXR
  decoder
- GHSA-h499-883p-vph8: Information Disclosure in TGA decoder.
- GHSA-pv8x-gq6w-gp4r: Invalid Memory Free in fx operation
- GHSA-6p6q-wfrv-ffhh: Heap Buffer Over-Write when using X11 animate
  with crafted image
- GHSA-c2qq-jqw7-q4mx: Memory leak in CDL option
- GHSA-h9g3-4qvr-rx8h: issue in the limited security policy
- GHSA-m938-565c-h9qf: Memory Leak in compare when an operation fails
- GHSA-5jf2-9gcp-q234: Memory leak when parsing crafted XMP profile
- GHSA-7r5g-p7ff-jgcp: Memory leak in -set profile option
- CVE-2026-34238, GHSA-vm77-q83h-5fhg: Incomplete fix of  CVE-2026-34238
  for 32-bit systems
- GHSA-pj4h-g4pf-66v3: Memory leak in PerlMagick when reading properties
- GHSA-8ghq-p369-g395: Memory Leak when hitting depth limit while
  parsing xml
- GHSA-7438-vh5v-v52h: Heap Buffer Over-Write when requesting
  convex-hull information on 32-bit systems
- GHSA-83w9-w85j-h9jc: Memory Leak in MAT decoder in an error path
- GHSA-mqmp-r5jh-jx7w: Heap Buffer Over-Write in PICT decoder on 32-bit
  systems
- GHSA-8w9c-hj38-8pf9: Memory Leak in FPX encoder
- GHSA-v9q4-cm37-q2jm: Memory Leak in JNG encoder
- GHSA-pwpf-8799-94cj: Stack Buffer Over-Write when reading bzip2
  compressed images
- GHSA-v5f5-4v9x-p3f2: Null Pointer Dereference in DJVU decoder
- GHSA-qq8x-fq3x-43h4: Code Injection in MVG encoder when specifying
  drawing options
- GHSA-2wwj-grp2-3fp5: issue in the SVG coder
- GHSA-79p5-w6jv-r997: Policy Bypass in with a symlink via
  IsRightsAuthorizedByName
- GHSA-vj7g-384h-64fv: issue in the XML tree parser
- GHSA-4wfv-467j-fqh9: Policy Bypass due to an incomplete fix of
  GHSA-jjp4-3fwf-393j
- GHSA-fp46-842c-2v83: Policy Bypass of list length in the PS, PDF and
  XPS decoders
- GHSA-5222-mhv9-26rg: Heap Buffer Over-Read when specifying a
  minimum-bounding-box
- GHSA-h3qx-937j-245g: Policy Bypass in UHDR decoder because the extent
  checks happens to late
- GHSA-rm4p-xqw3-f45f: issue in the websafe security policy
- GHSA-528x-2384-jmxp: Policy Bypass possible through a delegate when an
  executable is blocked in the policy
- CVE-2025-55154, GHSA-j2rp-5r6m-f7x8: Heap Buffer Over-Write in MGN
  decoder on 32-bit systems
- GHSA-x48p-6655-8qgv: Heap Buffer Over-Write when using the -morph
  option
- GHSA-vmj6-qx38-9gf5: issue in the INLINE coder
- GHSA-g5j8-ff59-wp88: Stack Overflow in TIFF decoder when DNG decoder
  is disabled
- GHSA-7f2w-c8wf-xvf8: Null Pointer Dereference in -subimage when the
  image list has only one image
- GHSA-wvfx-g9wq-253w: Invalid Memory Free when using the DPC compare
  metric
- GHSA-gr4q-6v79-qj3g: Heap Buffer Over-Read in the TIFF decoder that
  can result in a Heap Buffer Over-Write
- GHSA-pp97-v3gv-9vh4: Policy Bypass when reading XMP profile
- GHSA-6xcw-8jvx-wh63: Heap Buffer Over-Read when importing BGRO data
- GHSA-v86v-4xf8-xjq4: Use After Free in EXR decoder when memory
  allocation fails
- GHSA-3pf7-cjfr-3fpq: Heap Buffer Over-Write in stream operation
- GHSA-2pc3-3339-3qc9: Code Injection in MAGICK, XBM, XPM and UIL
  encoder could result in injecting additonal headers or code
- GHSA-mf84-8w53-2f2c: Use After Free in MSL decoder
- GHSA-x3j8-cjwr-m4pv: Policy Bypass in ASE decoder
- GHSA-m9p2-wqc3-mj22: Heap Buffer Over-Read in MVG decoder
- GHSA-2h6m-67xh-cm4p: Added new security option that can be used to
  limit the number of profiles an image can have
- GHSA-q66g-3m63-78mh: Infinite Loop in SVG decoder
- GHSA-p58q-7cv7-7w3m: Information Disclosure in RLA decoder
- GHSA-m2p5-qpx9-5mx6: Information Disclosure in MNG decoder
- GHSA-67p3-xhc7-g797: Denial of service in BGR, CMYK, GRAY, RGB, YCBCR
  and YUV decoders
- GHSA-hg5r-hf2p-g9xq: issue in the UIL and XPM coders
- GHSA-5jwm-r7f4-4m53: Policy Bypass when decoding MPC files
- GHSA-hpjv-7vmp-f58w: Policy Bypass on Windows when matching a path
- GHSA-c764-55gw-gj6c: Heap Buffer Over-Read in -copy operation
- GHSA-5v9f-r478-x7vx: Data Tampering in Distributed Pixel Cache via
  pixel data modification
- GHSA-h9f8-qmvx-p39m: Stack Overflow in MSVG decoder

Release notes:
https://imagemagick.org/changelog/

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 2330507566..8064895322 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d63594e334e1c410f600fb9370d78d49e4dc6f315722ca4ba083e864e5c354cb  imagemagick-7.1.2-26.tar.gz
+sha256  40b6fefa88fe16ca5a4b3d3db5133eaebfb0157f21f98530bde8aec5dd5b0776  imagemagick-7.1.2-35.tar.gz
 sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 1cae5c83fa..a9d908d507 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-26
+IMAGEMAGICK_VERSION = 7.1.2-35
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
