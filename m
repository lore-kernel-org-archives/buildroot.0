Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228AD606D81A
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oUDZlg5w;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=gVgas/vw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2BAD407BA;
	Fri,  6 Nov 2026 15:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2M2IZr0ibmS; Fri,  6 Nov 2026 15:21:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D6B5E4061A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793978461;
	b=LaCA8M7hCw9vRgR7z9E304KT1qp9pYZ/jWnPBs4gQLsDaGQY2B+sySmL0Nq2TV0E+QSc
	 zCxKqUZXHRcwJOuaJVfxqpc5FHu2TIpIBE+XsK8wqVVdRLm8Glt1Ss2rq6Na464NN9JqR
	 HGM8kduEyXNeG0AURNPFDSrs4RQFjSWfiMsiNj9IYjsBgXknaRwJqCPaIgu/rKrjHvDeG
	 qoYwgMu+TWmV4BTVU7aoIB4+YSeErLt/NbCzFcMmmECoeVhiY4QH1XO4U35bw/Dzwo6z2
	 sGIFiBSraVR5ywFSZeM6t+M3mJSlwU/BeQHQCm3V2qo+NbpyGVoNMqPBjTLrtQx1pIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793978461;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=PL3SaGuaWAZH6HCpKl5fPtiYUCvA7iabuwPprvohX9U=;
	b=n8P3JAblDCp+glpe3GP6OIG4B9p+AeggjS4y2JpJv62KUFhaulVQ/OIEa1T2PkyWautr
	 bWD1HUWYT4boyv/y0qpkYT8ezII4ZwpBo5Bk5Capez0bdmDmWSGedSSPZOlbRIEzm8AEQ
	 bIDqs9Sw4W9RNjX4HJU3tChpQtyOMtk3qlVilKPfQTeG++nSMC/FaP8R6dY+UBSFfh1+Y
	 Zwk90/XwJr10c0vKC852g6H5jEjjdkr2Zzk+21OTXf5wvAGbIBsD/dN0jYcQG2uWAHsQw
	 VLLIHR+phCddapnjYNYBAM9/p46prxtEK6io0gX7i5tly1+CewfSDGvJhuM0Ep666vA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793978460;
	bh=PL3SaGuaWAZH6HCpKl5fPtiYUCvA7iabuwPprvohX9U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oUDZlg5woEQx8oSAjszQzTqSFfVM48dCJ4CxhzNju0jyPmgMDBafLV9ljLUiffU3R
	 1R0LmMugBere6ipC7isW6/2nDiDQaNEgagxkjuY8o62ORQ6bL+JUDTq7jRcsZOym6a
	 7eo0xBI0Dfng3JtYHb2EMxJMBz6u0GVMqG9AFwj5XUleT8JT6C9TFr+onnN9zdk9vv
	 v+CtnVE+1ROyOlIpxAeUrFU5lvWlsUSPyfpVvBh7TuNzrYyQWujzbLZumpuvKtqJZ7
	 aF64Bh+qn13iQHufC3LB8itAfVXB/Ya6KI/CfAiVcBIgjhiE2LYN1kMCz6CEJ432+X
	 BpXRe/yl1psyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6B5E4061A;
	Fri,  6 Nov 2026 15:21:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6C21362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCE604016D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7HcoIrcdPkA for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:20:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B20AA400AF
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=gVgas/vw
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B20AA400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:20:57 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c4d30639709so95905166b.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 07:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793978455; x=1794583255; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NQqMJVkmXG0PHGUwH/NJHD9o/LTIDsi7TCfSi+2EscQ=;
 b=gVgas/vwej3M+dYRa/bw6lqVdD5Ly+6LZ22q4lp0DZ5SduDd8Cijs6SyiKzeR/u5fn
 lsO8Q3m53ZY+DMD6J4qKqVeX5tnKQK06wFgS39vKBOplCPVcFFoJs2tF6eWBEW9rBXaS
 bzQ/qYTZy/lQ5LXVTgN6TvyS4QK9EG4dbtWajCLsAd/ohVvFindKPZgF8K4IaBTFnRuR
 lbnZgZZj4dUrrScxlDzftILEcsviWPkn/CNuReqBmohZrCIusqiGlAGt6q+9RdHi02wb
 hSPDmkJcoAXE0ravxri5OMJWPPaMrkSvE5N+pf83mSvRCn/fxRxExRdq+v0dcUY1is7f
 cpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793978455; x=1794583255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NQqMJVkmXG0PHGUwH/NJHD9o/LTIDsi7TCfSi+2EscQ=;
 b=aCoqEX0Rd8oz0LpYkfqnRKdRWapO+ne8g9DxRMrz4RWq84m350E+6Ua2KuUYRQw9A/
 NumvcxwaCMxT+ysRm+AUbWQ6AqEeycx5d56imCaC57V4CFnEMt5onpkX2h/1K3g5QRLt
 ENG6J+Z9pxgM56jLGiSbsTv2kGMDPaZkg3AmzetUKXYaNm8VSrGqfi7ELSal46kLFQd3
 99d5U4uLPXzfHY0Ocp2gFWo36Q/xmAsgo7Rid348F1yIyWD8KYL6dlQu0FWwGabUnULX
 Wm6SRR6FtM446A75jPRH/NYRtKrFLKkrgiuqwsaDas/NZbgVan48DBjBmtn6FPfK3TG3
 lAxQ==
X-Gm-Message-State: APuU4Z9sMpKG/viV8TStMJG9DcKZ8I01B2KsvyoB/vkJKiTCZCWyxHV7
 TePnH+vz+q5x5A+OdzTs2r/UM/JWnPMkXJgo67hwxmH+DqNlOAc7qg38tSZJGQ==
X-Gm-Gg: AYBFou2PhERg0C6kCXkPRqFPb+eSZRGg5v1PX9AFq13DqiJIZoamk9bm3hv9l6vKlCe
 3+eXASDJPGGnxVc6gNbFQiHpTZazI0LM2sKpvxd9Uw8BBqtUXdfaXVSM9nT75OaAMvf81vrNyXu
 uWvRO7VwBH7gj5Rh5FHhSd5+9bSsnwXTT3YSojF2GYGBYkmZvTBVC5BcLSyGFO8aK+vZqO7hWro
 QlDlBUw5GVFNQ71UsAGuM6KpiffeJeT6XdW9QPu00l2x3dIiQVGSFCqAxzHVYoWDscnwHb+6DiB
 9k3cFhsvwgfumv1lgxX8qA5Uk6FPv/2pbKxI4kGpFIxeRIybH65V3T2Ws/Ui0dnAYlCgnLJQXXF
 hlLVFqZo75MBrFffZSAX2Fj9y0Nb0ADoevd/MOC1dFsoZEa6rVVFXqH1shQaBeNjoe4nXuvmlmp
 FlpE5EP/F1YxsBPGgINSat0lXbWDrrG3lhT02dMbZHVrY+LbLw8to/vk15EMn7iRi9vwakONrAe
 yadRRO42egCaeZZg5K0sBBStVsKqcX+nDlq2t6ZZ+qzBIn8Z7qYyBjDbiWwHRHrAoywRn5ujT2o
 V+kCTNMqeWa1KACaZ2K2so3s5XFY4+UU9ln7MhyPeob99WZIPjyRmwpeZ1/pXLtX7Wq/cgBfess
 QVNofiWsF1qOuTdzchksI9G2Den1VXg==
X-Received: by 2002:a17:907:8e9a:b0:c4d:4ce5:7733 with SMTP id
 a640c23a62f3a-c4d4ce57fd1mr44628666b.30.1793978454994; 
 Fri, 06 Nov 2026 07:20:54 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d3562ec79sm89928766b.25.2026.11.06.07.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 07:20:54 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 16:20:52 +0100
Message-Id: <20261106152052.3856860-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106152052.3856860-1-yegorslists@googlemail.com>
References: <20261106152052.3856860-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/xz: work around GCC bug 127142
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT,WEIRD_PORT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With GCC 16 on hppa, building xz fails with an internal compiler error
in the LRA register allocator:

  coder.c: In function 'coder_run':
  coder.c:1456:1: error: unable to find a register to spill
  coder.c:1456:1: error: this is the insn:
  (insn 673 2069 679 91 (set (mem/f/c:SI (reg/f:SI 823) [11 strm.next_out+0 S4 A64])
          (reg/f:SI 824)) "coder.c":1189:16 42 {*pa.md:2195}

The failure happens with non-PIE code at -O2, -O3 and -Ofast. As there
is no fix available upstream yet, build xz with -O0 when
BR2_TOOLCHAIN_HAS_GCC_BUG_127142 is set, as is done for other GCC bugs.

This issue has been present since commit 1b290781cf37 ("package/gcc:
add version 16.1.0"), as GCC 16 was the first version to use LRA by
default on hppa. It therefore affects 2026.08 and later.

Fixes:
https://autobuild.buildroot.org/results/d543e6c0456a491ddefa44f1ad613bc70c120b26

Fixes: 1b290781cf3782576091dbeacdd7d1a30b051856 ("package/gcc: add version 16.1.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/xz/xz.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index c3232966ee..37262b75f7 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -18,6 +18,10 @@ XZ_AUTORECONF = YES
 # The package is a dependency to ccache so ccache cannot be a dependency
 HOST_XZ_ADD_CCACHE_DEPENDENCY = NO
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_127142),y)
+XZ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+endif
+
 XZ_CONF_OPTS = \
 	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
 	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
