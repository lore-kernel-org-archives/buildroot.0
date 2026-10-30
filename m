Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB7F606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 11:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NBn+Bcei;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YTTC285j
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B216605F7;
	Fri, 30 Oct 2026 11:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BRMrf4Oa39M; Fri, 30 Oct 2026 11:42:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 201DA60679
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793360575;
	b=NP1DDRTOPkcsmPWjB1yfc1ia3R/bl1Zr0EchUi0Xqkkvfd7OQZBwYYhi5mY9tpwoNovd
	 DXxUp0kpZ+rVaEZ+FkYOmH4k6PMWOWnaOi1YZeIRkQ+oKJVEW2IihSQfCVrq69tY6ws8p
	 H4teU7O1YRGOBRbnFD4ASD/kN8acaV1gUzuyatZxwkYgke54edodCXG9lv82Y0PpIx5Bs
	 jRiV02oL1roNDrMKAsedcEqC58Mz4PL80tvUk7ReaS6TT3cyVRHevZpcvJfKzT1Hu+ioP
	 rQaWy7r66hSa/a2pNwg/Rxdh8eer/gRSblKqg0c1xgxsJqHvvwDLhtaGPVKC3EkIUKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793360575;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hLACfVUcWCf2HtJzYkprIfMr1mk/sgmCxexfxCo5tIE=;
	b=byg9LKFUs1/tvomg9yx0ZTn4CyPOKult/k5fa8wSCetvmAMP2gwum3+HtAqyjqX9GTlJ
	 apKJ99t2GToASQYaIG7futMJixqiprFwFMgWAf3s0OimRe6eWyv8PUVHO85GXq598yiFx
	 Jp7mWSGYhJ0ILYAMf1Px0MniIU+5eYEFAW6hv5+IEJhbs6iVAjVDFlzPQYt6WSZcP6Zj0
	 2Lhrf+t4f/G4gY7nHXVnIwHJCuWSG+BkXMkoWOpfAvoF+pJSoaeJMhejrh7bOrzymR5Ny
	 gd2gbkwMkaHZNNZxfxVozoyZqiPO/PqdzvopNrYdK2ZBG3s2wb9W7qC7qFSQICsfAKA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YTTC285j;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793360575;
	bh=hLACfVUcWCf2HtJzYkprIfMr1mk/sgmCxexfxCo5tIE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NBn+BceipP0oy7zKxQ1ixehPgBieyjBhuCi1oY2iXHxxP3eMQNtiDZD7sVE6IUUfp
	 GmRw1rhLnnYGX9GgQcuwLXej/xxgL0tHCn1IoQq+M3Aum+IrFaW9UvSNSTPphyWpH8
	 wzTTZG5H8wEhCzQgevxoHYwYSKj2pTj1/CY4Pua/AGOmWTobN5Pdi0QFCxYuszziLr
	 yCR7cVJWYGCiGtRI0NTJo9+GXjA8xPCxINBaV5YM+9uxnF1eZQ7pVTWH8/hhnApklG
	 IK3k5Yu6aRVUdACDgp4VepoH+JGACtmo0SjCrkkqEYaSqtY7yadaTbtne0/5iuWnmo
	 MCkfDxD5SMiCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 201DA60679;
	Fri, 30 Oct 2026 11:42:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 939174BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8564F60679
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHR3YjjhrwN9 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 11:42:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 363A3605F7
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793360572;
 b=XHZ3Y09wyYPV11x1zWgJbhi5P+qTf8F1JmvAt2W7byrffFbMs/QyH9gVQ7jO71yS/0RZ
 qJKxspIefEkzSYWc0KADhgza1Yyk4hZ0He7pXgGk2Iq/liI3uUA/n+Jo7eWkO+LQCGMJL
 GMcQMBymYq79nbF0PINyUbpQX8zuTNtXpF+aSW8lC+GPNqyKeiwPW3Gfvm4PvvtlLMLef
 KIriXTwZx0QVcUl/Qw5XXCUA0blvkxq87MSaAT1dXNvER1G0nrmcbd8svUgCDxC6NB4mZ
 4cHMmK/f8FHHTr6uB+aMztC8FLoxNVYUaXrIcAt7iGi0PdCu4EmpQMhHsVzIro3BpjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793360572;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=vwFXk0NPjAuPiY8KDFFfskdxgw8gWQt1BMjotiizSH4=;
 b=ULuCqpCAkBTXTHAoVWqWt86O8SVamr2drA2izLM1TdR2sn/W6Y15yTV5PBmXSaZ5qV3S
 u0nK8U1EyDVb5Pbmci/eHpvsgTlpAArSRu9sWHRZBbSvf4AOuBvra67ROjmuEONT66sV3
 rD2jMluGC8geddntFyg4oGaeQTzywzuJ+cHO4v1jPVDWJcKudY8JkNHp6zDvyFwBwYUcw
 44HENC2VdBK70daoP5la/bd7flMyka0N2uI0CIsLqSMEd8siOAPo7zN9Ii7c+x4Xj1Vt5
 r/PrusnZ7uAhSka9B1VBHX9GGcNl8otVLr6sCvWx6+VMyeO12AR89K+RkqXzNbQx8lg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=YTTC285j; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=YTTC285j
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 363A3605F7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:42:50 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48afcd7ba9bso418873f8f.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 04:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793360569; x=1793965369; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vwFXk0NPjAuPiY8KDFFfskdxgw8gWQt1BMjotiizSH4=;
 b=YTTC285jC3cjh2p6gzcIJ1TVBChMH913pLXoPwbuSXUoTRlKxoVod4kXqoNvS9qZrK
 eoWlTpOWJsfFi9KtCg/3q3LTCcMLD4bUz+HPhaFNmKo0qHOd5WT8u30eU2utTx6sFtxz
 b8uEl0ApCl1KA7HPNaLOYMR/Jus1+S4f+ENcZL+sfMb2OWvWPJWhj1AJtiTQ7YVFUidV
 qwMe7C4czjQbF0rd2Ly09dPE2ofhZ9SwKUUf+thdMr7M/0nsj+yn75EH2S+dpAHOfv09
 tSU4X/SvVutKQ7C6GuiBelkbweAIraAyznuBjQERZkYBmXYNhqXjj9NIYfHHYaDl5+pU
 BHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793360569; x=1793965369;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vwFXk0NPjAuPiY8KDFFfskdxgw8gWQt1BMjotiizSH4=;
 b=FK5AiEe3OoxnuQohsjZLu8Qp275XEQwyjRjuWWwrob79zu13It6++851nvY9PTIbqh
 6KugZ/Q3U27GWhXUQE1gsNrzczpdfaIELXGh8924vDxCskkCc72OzlW/NJICoNmey0sM
 uJskwhaAxp06qAjkD/PexaFh8oHi6VbEO8+YSsCK3km9SJgePlEsUWxJZK/Y6dvViy/O
 GIoa+/SY8eEN0brZtpaxD0e2CE3lL9y/Pzd1qA9ci8WUkHQrzGxdZXvI9GluzChL12ST
 nmDCXzMnniHyMw0dDM0giQkYVa7mjITmlkOL5MXRpe/xTQO4xVP7R9DtaUEZutSk4+9R
 mMLA==
X-Gm-Message-State: AFq9FYLcCaDxUNa4vgdIdg8ui2xjptJID11xO3JRaBo8F+VpSpvVwDLu
 NrHdOc8lRijJ637x82f2nbuIKl2IJRCQriPSIa1DJquSoj7CJolXLHToNdePZA==
X-Gm-Gg: AYBFou0BKVf3JF5DSDDQwlDBPPgCrIY4fHI48gGShgyKvsx/EMZ44chzNjW6kYuZdX5
 Do2rcwfnt9goAgBZpIMqSFPydQ7+qK5qpbo3UdbX5PUgAs9brM7HhZyAReO3d0ssp0LkPLDsuzK
 C0vojmBpzbcH/pL2DPIbIMPq8kFHm3Mch9RSfFf2ZPYa6jyQs19LW8u+YZ2HfzyOEzOFhrkRKKp
 pZXXHLAPp3DjQBrD9Li4ItW/QkiKsfJM8smwYDw+bBeSi7Y1gmEJdIWc/G3RVzH2Z7H+cDUuR4U
 m9DRqJILfSpeSR1FsREHfqDlYuLbkkU6RK16J3cVEQsOfxGXEbLwM8ZhCblgSmmHeWGOmawqacy
 c70Q77llqtcE1vSppBsqVsHhyrOrHWOG/uD58MPpcCMhXrBnGAzOHgofKXhmCbDzHCcpJgu1iZr
 uDIgKwQ7qpB7j5sKClneJm+tLzjyRfYTKOvPAF4hX/AIHO+jB/QiwUEE6PSWqiNlSoEE9S+n4wu
 iu/E6HaLUv05UrJ1LymlvMxKopTdnRyw0Va+w57giDFTjXjK7bXdfUniP8eY/2/fWaz7DOg+Y4j
 p4Ymu2UhKFxTq8Ve+b3QMMnvE9UZLfM5QsOLc9QNGPN8atU23PTqC9g=
X-Received: by 2002:a05:600c:8b06:b0:4a2:d:5ccc with SMTP id
 5b1f17b1804b1-4ac17b2bc63mr45102425e9.10.1793360568637; 
 Fri, 30 Oct 2026 04:42:48 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf6c7852esm51471615e9.11.2026.10.30.04.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 04:42:48 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 12:42:25 +0100
Message-Id: <20261030114225.2918102-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pillow: security bump to version
 13.0.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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

Release notes:
https://pillow.readthedocs.io/en/stable/releasenotes/13.0.0.html

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

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
