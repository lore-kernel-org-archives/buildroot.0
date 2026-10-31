Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB87A606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 14:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hvyJLPUO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pt7QPrCm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EDEB80DCB;
	Sat, 31 Oct 2026 14:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 711WvK_kPu0Y; Sat, 31 Oct 2026 14:36:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6B7C280FF4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793457367;
	b=WAHSQiKSsgP7nlqsTewdfqgwhNgPjfvwZzNfgeLvJHfaWIevth2CAwJeQ3d8HQdtyIu0
	 S4N2awbQllia5iFPf+8vtMo9enJfKd/B+Du0NOcSsvJJHE/ZAacvIDQmp1va4h29XPZrh
	 gK1hd48M6xXm5IIOT92cEjd7fpcPsc5VZ1YiyZWz9uV3/VAY5yApntD0xqBKRuYp/iYdu
	 qZqfa5X4QB+mVnpYC9CMKbGMb1a1PsD7hlMUf+40/Uwkc54X9NteYeAb8mmwke4vl2PE6
	 FfIuStsItJjaC2reTy0R6hkGbLDlNRG2vzTESUcwxXuQxefrm5v/xSrLMfxzOYwT7YQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793457367;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Pb1DTZ+VPM84m3wUDWfkzRTiLEpjpPx7rfRLQdoc6aI=;
	b=Bmvt3SkLvxN1i/5185/9cU+mCjIpyUKRvPtIHQV038VnO6nvbf6VYhNUux+xm/nl+1+X
	 VYqnNIEDMEgm6IR7qrBjUWeId48qlWiPRiyI4Ff3POjqynFv0LOsnB5YzpsN0c6+53W3y
	 nrPxiDyLECV3XPhWagmSSBLb6ZK+UdsLgfH3F6TW0VPqBuzhMMqSh1F9MHPKjXkm1qK9X
	 hBeRvcNhM53RBO0JBNHrdpKU7YI5cs3T03t5wH7nHdKOeQNzoMV+fOruLgGPtCkRRN3Wp
	 3kI5/Uzp2Xc/nwrQ2600sXvCM0aNaOZG6weJLIkj9HaR4oJNACNDX73mcALxDSj9sFA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793457367;
	bh=Pb1DTZ+VPM84m3wUDWfkzRTiLEpjpPx7rfRLQdoc6aI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hvyJLPUOKHRypXW2v2haE25G7hihLTFOrZfct14591JPi1Nj1PJqjbAJX9a7VnnWq
	 5IQ/BepMuZFAxcdwGBPgugeqA1nOUazqi28uhfJBQaW1dA1D3XmTmAVfKY/x1Z8/SU
	 3P30gHl7iRjpY6HSPW8lP3h/6sKUOOvT6NgUfpyuZbWY9HEwirw0SndtzpgZ8C3kjq
	 rFL+soEOTMIoEE8THM0ZiCukobhJhoDefuNXY1S4pN8a5hJ6RNBnpgdxWwEG/6OO/F
	 niqpevHu2FPk/cQu5WnHfUOwwsWNelQy5r+4zpVotH7C39nuyXHVpkH9NIOFADXVgh
	 EoRARHkuGR5Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B7C280FF4;
	Sat, 31 Oct 2026 14:36:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BF0D380
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F7BB40A95
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lno1GC2RkeGt for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 14:36:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9837940A93
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793457365;
 b=RobW4LeqSHxyaRhVY4+Bo70ZVSZw+qQk+XeJ1sHrr0CYSeihW306gsHRKi4HNdEdwyO/
 CRZD7w1+BNGZMP1CMoQuoZn2PvwAUevJXeyKFXWLjARIsiqppD6EfaUgw6I9TXVyQf+Hc
 LW3H6pQkJPa9bf2bzIPVKgACCbwq82Yhduto8iUC6bqEZUuhXq0TM087en/PD1hXciuYX
 0Rvqr/0EqQxkXekRsHF1cxdkABKwgbvp/h1qPETQMSCRXDlffWON+okgtlmlsnuN/AqeG
 jk74d88CUgboTTf/71zxY2rgFbczeV9C7yGBATFgI0JpGlsJV6e3hdlcLemZY4Clc0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793457365;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Q9YLfH5WkzNWV+7mc+d83SrdziK63ujP31ZpvoeAHhE=;
 b=YZdkZ+7Njz+dAIXRCbyrVUwRc4f4dUnpJ8Y+g0AjJe+mfCik7zDNPvhbok25a3hxVe/b
 lfg5PxRNU2js6YTeApHbxE7d0h/5BqjR59Au/Vd8RFw56JTwtS0Isg8cA4uJ/Z/pUb/ug
 VHPH1MCqf7K89GRUHnXyPMQUMx+xY0d5C4s1lcFNSKbkQteJVVFvW6gZ+n7LgVHg8ilUu
 rUnBE0JtfvIp42nm11DvxmNU5xoShzLaCRFjbzmQRAp5gE1OLc8RFhavEaEoJbuzNJcMw
 S4tbg4Un6J+cv7EAVqcBPDFp4vVLvb2Z/76zZ9qmBQrf2llVu9Lsy5MvPQBBiXi546w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Pt7QPrCm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Pt7QPrCm
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9837940A93
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:04 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so16896205e9.3
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793457362; x=1794062162; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q9YLfH5WkzNWV+7mc+d83SrdziK63ujP31ZpvoeAHhE=;
 b=Pt7QPrCm3H6fRk/Ratsgr7oV8zmwi6L1rPadX5ftQsnoc0QYLlLi6CNBpz3IcuibNs
 89RP1ep3Qfzit8g4rowP00QvHCIxA9UsXb2+y8xUm+aat+bTZ2SKth9l3krXhRkPkQWQ
 8I8M9+KX6qOtdPAx8+slgr8ZFJ71KYLafObdBG/fUKSDuOj0gOn73qX2bAiuPIKHRQJx
 EKpwqiRWA9Ym3UpA8UHQVhiNGurqsAqzVxhoTglgqBlXxSNtr2pS5z8yDI9bkJDcgDpN
 9rlFDpc4CMsdNJZB71iFDQfi3kOEKyut6xkdzBhqsH4mJ8cOLuSzvqiB6KnhLz5kDc34
 llgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793457362; x=1794062162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Q9YLfH5WkzNWV+7mc+d83SrdziK63ujP31ZpvoeAHhE=;
 b=hjP2vrqQsqll5r93+GtVGWDOqZhZ3WAp6zSZYgwPmH9TPX6GxHe9Z3NsMBjzMzyXpH
 HlkgpugStwQPrU3bE/kFkPIJPkMlUEt6RUh897JrPxJWC4FH4VpzklplXor41HIIrD0K
 w/8Iz7PyIad4eUTKK4hK/VhycBtQdbDqzRka1pgji1P2CJn+aeDX0tqO4SuDs2jH0ed4
 ChbYi9fAfrfOZt4e6INloH6mFkKTnsnMp4+MkLfd3CryaSi4nPBng9p8qFsN+Xi21NZH
 6vlNSwnsW7+CKof8S+8nbLmJg6BxT/sBSm7twPBm/0EteMHp/gx/5rc3xOAbKSR8auG6
 Ns2w==
X-Gm-Message-State: AFq9FYKH6ypt3tNXPZ94yUt8V1PbOOhhRGoOeVQTlxYFspwlQni3fWOa
 P7g2Hv7uC1Namqz+9qjZS71qXWapiBjfA3/sSIPzYderKKF36/wGk0CQ9tWjDw==
X-Gm-Gg: AYBFou0hGE4oNN/ibP3EWyqDGkdj3ylqdvu97rx0T/mXHSWsjBVeS08muoLjfL/sDIA
 cJklAoBiU7EjE6dfs0fLLMyC9a2EOx8zYdYCWS8tI8SG+1kVBhfmmtiM5A7+3r2iVv/DHW15EpO
 SVpfLpLtUuaX8aCa3p2gG+57yzTlpCDK4YetquQ77ARIYrnpeswsgOCzBXUh9tt+xPD3j5+jfKn
 1IYYAcR8t4n8p+u9iDNRX0VtWMCWU2ruV98OudP6Faqvv9TgKU/TznRqtho2Sha3oVjdRkpt5x5
 dxNUjydH8JEUMxrL6BGQwHfYiY3GbUBX8zJt7jxTs0Gwfkv/6XP7PfhSG6up76O4fFh1nI0a+Wu
 Ifkh4Anw63UUAl4xmnk5Ryyn7I/OaC4x6yo1bUAxpmbrUUfi1jaBkr+S9/rXQbMKqgcFrW1y1Q0
 oRYzjsmbQRl4nC20svp+lM8C0i/EMqBKy6d3vRvF2JAyJI8uCLhhG2BzLj1QHUZM0h5g3eSdKBA
 52QzSgh8eH0IeOvU1yw3DMkVAO9zErSLPsqo2r/+emAYf/zTWUauGEwdBC1IhdKq+jkfCVDDThY
 hJKR2dOd816lEyvvD17ZNl8UXgk6c/FRT01fF0rCEYWgwSgEx34V0HJ2IPMoh7PhCFfSZbgeEg8
 =
X-Received: by 2002:a05:600c:34d6:b0:4a2:a9:ed5a with SMTP id
 5b1f17b1804b1-4ac17b2bc58mr113640705e9.8.1793457361717; 
 Sat, 31 Oct 2026 07:36:01 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ab61d8b9f4sm173457335e9.12.2026.10.31.07.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 07:36:01 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 31 Oct 2026 15:35:59 +0100
Message-Id: <20261031143559.444936-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030114225.2918102-1-angelo.compagnucci@gmail.com>
References: <20261030114225.2918102-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/python-pillow: security bump to
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
---
Changes v1 -> v2:
  - add a patch fixing the "unsafe header/library path" build failure
    [Julien]
---
 ...allation-paths-for-build-tree-Python.patch | 48 +++++++++++++++++++
 package/python-pillow/python-pillow.hash      |  4 +-
 package/python-pillow/python-pillow.mk        |  8 ++--
 3 files changed, 54 insertions(+), 6 deletions(-)
 create mode 100644 package/python-pillow/0001-Skip-Python-installation-paths-for-build-tree-Python.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
