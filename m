Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DC7606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 11:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qoHmwZcN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 179E580FA1;
	Sun,  1 Nov 2026 11:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cZwB6lbj6b9; Sun,  1 Nov 2026 11:48:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1B85B80F8B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793533707;
	b=FldDSbN+2jJaAYUCiH2kAS4CO+J7y37XP+aMT5j1xmEsOkZuWtKpPdjJSFOLxzE7OdHo
	 qmecn0gPqp3M14PU7dlUuGfGBsd/qiQnf78sjEYLs9GprdjSamIA6InKbdzPSePJ03O2e
	 7XKumBayRDNY31iwoWHG+bFic4g7s0cdcSsbixklJCdTdukEjNF4u0LExHWduYBVz3GMQ
	 PTK5r4yk9Hwxikp7DrFumAlKDbTVo2SvZmiaNiDCjW9P0fUetEHy/5PEBFATywYWcoSIz
	 rsu71+50rd5evs/bdkAXFGl05zJhguinuMNBeYFJdaZvzgx7Ci4Q5MM6djyLlSl9Riw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793533707;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=mmm0G+qNCMSVXdiiT02h1Qw32ViYlzkqKHj9VyHIXxU=;
	b=WcxrRo1PRDT1LGaJMKE1cfKwlLMaXOHgS8Lncl5RXWJyPtHB37jSW4u9Tt2ZOd71ZHmq
	 E2Ps9/1dX7E9XEbGg55DqH6O+iOCICjxsAxa9pbxI0UsCV8WxycxAXx6Wd2zLa7d8Mb9T
	 tytJSWS8Fj1JTJCIWN3e6UjMp3ZujM/nBwC7ttyESfCnlCEjHYRZnm4y29GKiB50asb4q
	 c2oBd32ITOsjpN2V4bPEd3fbgB6vxXqqMXJqQOFK7ueYXYMwOS4ciJxkZWz5bjBo21rP3
	 1NB4xU3s0TGbBbp/9Px3uMnNBdPzZClEhADiMRb1E6D6XRCaGbalQKk8FroieMihJnw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793533707;
	bh=mmm0G+qNCMSVXdiiT02h1Qw32ViYlzkqKHj9VyHIXxU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qoHmwZcNVzHFCWjhQ7x9wbbNS+D7tAA09G3cfuDn/NponiJl7XEWpYoE10U/BvZ6w
	 ozF0u07CVr2ZkMrB42szvI7QIqt0nGJ9pl2oh2lInCiyFn7Cu8chlPuMkTheYmCndY
	 qLOEj2kIyUeIkYDyjOjLRRfG14OGWVGRroCfHGvDmk90uIrpykR9VTTEIDhyZTs9s7
	 tNwQD1X/NFNC+I07AeTqvasb7PPyI/EElmb9TA5kwd85tc94iF/m3AuAEiv9qUeaqI
	 vZyx/ZtIiH8XSS9TN5p3QqDNdje3LFr9VotqhYHpDJV5xecuaANnmk1YWxCxPiM4rL
	 5SXo3I4PisQDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B85B80F8B;
	Sun,  1 Nov 2026 11:48:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5288E2AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 11:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3832080F8B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 11:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DD17NdVmlvtl for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 11:48:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 889AE80AED
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793533703;
 b=OLhvbzJPKDBmNzn7sp696I0LIGMLttMOPmzhxajZkBZQMb2b4XvkKE2Nb5MidprmYbWO
 biJDukpCv0fAG7RWHs572mw7LT5tvmJXz1Bn/3mWJQTiTzjpV59jTzAt6ZhaVZWeBVjuZ
 sfjxFLTPtvMrWhF70L4wI/qoJF0F5ZdtYXHUdr1BOaRiorAuTEV8zxc2j86T2J8ZEvsRK
 8QPc4bKaRoOrT36ZbxXug3YQh4d+j/U3XulgwaiOE9c6uMrsjCBWA0X6C7yv3EewOmP9N
 PopeaFqj3E/OCVuXLWMNqi3PlBkhaIeOgF7+G7nGlwoT25x15BI3RAyJZ1i+KvN0ITg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793533703;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=AjuK91gmBWacq/aTcI2yaPxu4Ss/J/IxoU4AhGqN57A=;
 b=P1vMzC/Y0hGYQRvplQwL6161EUsqrsl8vuUdk0jiQAhINssaesvbJKFuNxZk/fhkJyol
 2ykB5UPGomhep61O8LVirYqpDDYShcbd61vIRa0HEXkl2VwQO9QoW0QQfqXZE4aW/HbIu
 WAUGwFu3whOs2QooAwoUP6hRSB3UKZdex+yx4zhimFGZU0sv0pCrTfN5PUM3KsBskbnYS
 4PfeELM4ZV4x0F6owrExAJpql54EKhRKqWkWDAx4vRC7hHcCL9M+kaQOLjGoB0Iw6PZ81
 opSgMq0K3PIAtUzz2pvQtO0jL+rpW5WwkobdB+mONSvBlPKnWew3Z44NdRfPk2OqtAg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pDZ9R3dK; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 889AE80AED
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 11:48:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 70F2E19F5AF;
 Sun,  1 Nov 2026 12:48:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 12:48:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 12:48:19 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031143559.444936-1-angelo.compagnucci@gmail.com>
References: <20261030114225.2918102-1-angelo.compagnucci@gmail.com>
 <20261031143559.444936-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <a4f4e9c7de45f1a7e591282c7c619fca@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2] package/python-pillow: security bump to
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,BOMB_FREEM,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 15:35, Angelo Compagnucci wrote:
> Fixes the following security issues:
> 
> - CVE-2026-96639, GHSA-v9pv-5gc8-w2m6: Stale native image storage 
> reused
>   after mode transitions
> - GHSA-5x8w-8jj5-q52h, GHSA-8g5g-8vmr-9782: JPEG decoder buffer 
> overflow
>   from scanlines wider than tile extents
> - CVE-2026-96644, GHSA-9v9v-9qvf-h2hj: WMF/EMF heap out-of-bounds read
>   from dimension truncation
> - CVE-2026-96637, GHSA-g842-9rc4-69pw: SPIDER decompression bomb bypass
>   via seek()
> - CVE-2026-96643, GHSA-g4qv-2jxx-769h: Unbounded Exif header 
> replacement
>   loop
> - CVE-2026-96778, GHSA-g7cr-3p24-7wf7: JPEG comment write after ICC
>   profile fills encoder buffer
> - GHSA-462x-pgg6-55fp, GHSA-c6hw-5grf-ff96: TIFF tile and YCbCr 
> decoding
>   out-of-bounds read from undersized libtiff buffers
> - GHSA-p4wg-p73j-c528: PDF parsing stack exhaustion from long trailer
>   chains and deep or cyclic page trees
> - CVE-2026-96640, GHSA-mrfp-p49p-3hf2: PDF append resource exhaustion
>   from repeated page tree references
> - GHSA-pchr-8j38-3x4p: TIFF encoder accepted an incorrectly sized
>   Colormap for non-8-bit images
> - GHSA-332p-7hrc-92wf: TIFF encoder heap buffer overflow when saving to
>   a file object
> - GHSA-xcvg-w56q-r89m: TIFF encoder heap buffer overflow when tags
>   override the image size
> - GHSA-xvh5-g6gv-559v: TIFF encoder memory disclosure and crash from
>   mismatched tag values
> - GHSA-q45j-58j2-45rg: TIFF decoding returned uninitialized memory for
>   short JPEG strips
> - GHSA-78g4-xqwv-q3g8: Bundled OpenJPEG heap buffer overflow when
>   reading tile-part data
> - GHSA-4rr5-89j8-mwwm: TIFF encoder use-after-free write
> - CVE-2026-96636, GHSA-p8hx-v2p6-rp84: MPO, DCX and MIC decompression
>   bomb bypass via seek()
> - GHSA-f2g6-542v-9j58: PDF page tree stack exhaustion via cyclic /Kids
>   reference
> - GHSA-5xm2-6676-qcp9: APNG decompression bomb bypass via delayed
>   disposal-frame sizing
> - CVE-2026-96642, GHSA-3j72-p6qg-6xp7: TarIO negative size field causes
>   infinite CPU-spin loop
> - CVE-2026-96638, GHSA-24rc-8hj2-v98c: BMP RLE decoder
>   memory-amplification denial of service
> - GHSA-gg2r-wvfm-q9rx: MSP RLE decoder expands a tiny file into
>   unbounded memory
> - GHSA-wqgw-9xfh-qf2g: TIFF and Exif IFD parsing memory and CPU
>   amplification from shared tag data
> - GHSA-jg86-v3jv-hrpm: Quadratic time when writing many objects to a 
> PDF
> - GHSA-254f-3936-288h: PdfParser unbounded recursion via deeply nested
>   objects
> - GHSA-rfgq-q3w2-pmv2: Image.quantize() crash from an empty target
>   palette
> - GHSA-xgh8-jp6q-p5x8: XBM header parsing regular expression denial of
>   service
> - GHSA-22hg-r758-rrw9, GHSA-74r2-7ff9-mjj2, GHSA-fc9g-5qg7-mf45: GIF
>   comment handling quadratic-time blowup from repeated concatenation
> - GHSA-27h8-gf7j-v5hc: Out-of-bounds read in rank-based filters for
>   zero-dimension images
> - CVE-2026-96641, GHSA-4rm8-3hmm-39fg: Integer underflow in PILfont 
> text
>   width calculation
> - GHSA-cp9v-662q-vvx9: Image.merge() buffer overflow when merging 
> 32-bit
>   images as narrower bands
> - GHSA-j4m9-6w36-pw47: Uninitialized glyph pointer freed on font
>   rendering error path
> - GHSA-7mwm-ghpf-9vrm: Double free in Image.transform() after an
>   allocation failure
> - GHSA-4558-3h8r-v8xp: P;2L and P;4L raw mode decoders read past the 
> end
>   of their input
> - GHSA-w889-685w-c8fh: EPS filename argument injection into Ghostscript
> - GHSA-65qm-jvmh-6pqg: GIF decompression bomb check used a size
>   discarded on failure
> - GHSA-vx6w-vv9f-6gvg: EPS decompression bomb bypass via Ghostscript
>   rendering
> - GHSA-58r4-6rv3-gfh8: ImageMorph.MorphOp.apply() out-of-bounds write 
> on
>   zero-width images
> 
> Fix the AVIF build option: Pillow names it avif, the -Clibavif setting
> was silently ignored, so AVIF support was only auto-detected instead of
> following BR2_PACKAGE_LIBAVIF.
> 
> Pillow 13.0.0 adds the Python installation include and library
> directories from sysconfig, which are /usr/include and /usr/lib when
> cross-compiling, so the build fails with:
> 
>   ERROR: unsafe header/library path used in cross-compilation: 
> '-I/usr/include'
> 
> Add a patch, backported from an upstream pull request, skipping those
> directories when building against an uninstalled Python, as done by
> Buildroot.
> 
> Release notes:
> https://pillow.readthedocs.io/en/stable/releasenotes/13.0.0.html
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
