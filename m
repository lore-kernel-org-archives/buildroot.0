Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6E1CD8C81
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF6F241FD6;
	Fri,  5 Jun 2026 12:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HbQv3xMMT18T; Fri,  5 Jun 2026 12:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DD7241FE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663850;
	bh=Ck65ofa7/C11gmTPfNomjqKJhGKX3Y3ymVEaH/gUw3A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jL/mNNfyIfT9VF9cRkFPvmN8wfwunszbFFcrcwlTCWhoLt9mHXDowScziv88DDjfl
	 AY+56ZVAWjLWBQ63LWCXNWww1MlfX2MGLWv+FL7F/PjwqJ+9bjlFcaCKnOpPuxmmaH
	 /5SfhQOwtg3yGiyyq7URq56jy9KVieYEAZ6KOkNdATzrxgoUqHJd3a1OvwczsQWDFF
	 E6xzr/DNFCDHw0Q/PwpTOM0VgEGgEKoqMDDINV0j7pu0LJk1ePB7uDtk94risixXfa
	 /xX9HujZ74uuQF5lEQbkRnVrGp6tW/wlfhouuOV6ToqXiqnx0kHdbbGmGryaDj6Y6g
	 +ctAuW6aBmAjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DD7241FE3;
	Fri,  5 Jun 2026 12:50:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04D58F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAEEE41FD2
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QCvmjaRVGsF for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 71FFA41FC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71FFA41FC1
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71FFA41FC1
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso20510515e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663842; x=1781268642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SXEnBzcp6mhdonvjIRGFPjEatx/BGNwtmLUZMOalXsk=;
 b=rfRLDiDacgekqBkmLLI+CBtyc9laVYpcOZKp94Maz1iIXvaZr3QOguX59ci/v+w5/S
 ntOfcguhO1FjPUFmRnyyeejpfnj1N9Oahg3dSePMwh5/vCLPO9ayFT3E5c24k4M97B7E
 dqK5oXzt0YMeIQ0lRLBEjzVC9ZwPWyHwnu+9RxEopigpyq8dJCxizMxgK4F+pxs/Szs1
 vG0zb+Bcfr3FNgWgsGkA3wg0LUNFf2fY8PVo74Elh3DBezKSDBa9IZHPkyQJj89+LDcm
 FV7zcwChvnIlHIaOvWfpbbbgq5jNNr9fyviFrdHii6rvUIeXe1l7pCVOkAGZorqiC3Ba
 vPuw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9pIXNZXB0SN2ZEu1SVtIbaffJi1/Funz2ADSyhCCNtflAGPGNbA4jI4HduxKpipLThWL+o0Wi2hEw=@buildroot.org
X-Gm-Message-State: AOJu0YxXyvdWrUo5kVDW3LFha713Uh44OEm3JpGl3tir2dGEk8f3R6ND
 9EzTcL80ehJtsP4szTzh8DW+eSZuNuXPNz/ArTy3yXde/kq7L7iBGann6fnippr0JfIFBgVLcNB
 LxSSg
X-Gm-Gg: Acq92OFM3ebp+1XhNCGX39JjzEGVvXylgHTnarQOlvvVqCSkql5QkzJzrX1qmkbSuBm
 Uc2B9WmKCvrt4KtPutqqQeSTHyErl7dUAywn40HPeX/alFr3Pcc9XwaxTF7CDyC7f2RJZTkHhWC
 TMVupaKNDUpef8ZvOqNSzWNSH57VVWnlDNFJUEbTCe11/3O8E6KA3wrZAw6wKxjRbLnUuhx6Jzm
 ds+LyNkYaKJJaap/W534c1f5L6xn3qsI7QmCw4PY9F8qTj1ixGH1M/WJkpsu4dus+rFio5MYsVP
 qrtcL86H45Xqdxl6mSqd8c/pe+5DJA74MNGLJXkV9ZOlORjKKzCqd6SLP0sLV77PzQ2frf00nvo
 DZxJMTQEK3ZZSL9hXLeh77UIqsAqSzUqACs3/EPpkBZoLb82Ng+TI7Dc1SdHVrpYSVaV2BKxll5
 +ZvhZ56dtLCU5sWjkOd3YNtWJr7g==
X-Received: by 2002:a05:600c:314b:b0:490:548e:b854 with SMTP id
 5b1f17b1804b1-490c25f5e25mr52691655e9.26.1780663842564; 
 Fri, 05 Jun 2026 05:50:42 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3c1149sm133698495e9.4.2026.06.05.05.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:42 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:41 +0200
Message-ID: <20260605125041.274157-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526200641.939539-4-bernd@kuhls.net>
References: <20260526200641.939539-4-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663842; x=1781268642; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SXEnBzcp6mhdonvjIRGFPjEatx/BGNwtmLUZMOalXsk=;
 b=e8bUndHypdfo1HmbTl4slJu7bA45DHtLBrUerCp8B63nvQQ/K4TbtIXdak5Bb8Oz95
 PZUNh0oj84ydX58h0W6psvbQJXvzpf9XUC6Ddt/ByFm/ohG29MR1hrwP5mWJ8XhFFR58
 Z5boTEBtIdSMJPauidUBqHowJOa5BqmkRk+9eW5KQssWlUbLJOsZm8fCZXWX2vuAUuld
 enhlg4Faq7TbTYQURKeiicVA9ckkEPgbzhXItx1Z7614eb0UEPCSlLDx62dTbHljoW0T
 /gm4DUJLsFz8zidvfNJNyIHm7LNOCq0Tj9diI3MqfRHqtPqM96HmVXGPJsk78AEVyqr3
 BtFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e8bUndHy
Subject: Re: [Buildroot] [PATCH 4/4] package/libde265: security bump version
 to 1.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://github.com/strukturag/libde265/releases/tag/v1.1.0
> 
> "Security fixes
> 
> - CVE TBD (GHSA-g2rg-wj66-w594) - Out-of-bounds write in
>  process_reference_picture_set via predicted short-term RPS
> - CVE TBD (GHSA-vv8h-932h-7r86) - Heap buffer overflow in
>  de265_image_get_buffer via SPS dimension integer overflow
> - CVE TBD (GHSA-g5hj-rf9f-7vxm) - Unbounded memory accumulation via
>  orphaned slice headers in read_slice_NAL
> - (GHSA-x27c-jp65-g395) - Quadratic CPU consumption in NAL parser
>  (remove_stuffing_bytes, resize)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Series passed Gitlab pipeline:
> https://gitlab.com/bkuhls/buildroot/-/pipelines/2554360744
> 
>  package/libde265/libde265.hash | 4 ++--
>  package/libde265/libde265.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
> index 0412936d42..71a0221089 100644
> --- a/package/libde265/libde265.hash
> +++ b/package/libde265/libde265.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/strukturag/libde265/releases/tag/v1.0.19
> -sha256  bb19a0b485d2643e0eeb7e91f3ab32d1ad617e7c487dbedc91214ca3dbd8d7eb  libde265-1.0.19.tar.gz
> +# From https://github.com/strukturag/libde265/releases/tag/v1.1.0
> +sha256  afc19dd28e2fc523de5952bba5224ee1d28e286c72436d2843df126cca1181fd  libde265-1.1.0.tar.gz
>  # Locally computed
>  sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
> diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
> index b559a9f607..2a10dce6d0 100644
> --- a/package/libde265/libde265.mk
> +++ b/package/libde265/libde265.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBDE265_VERSION = 1.0.19
> +LIBDE265_VERSION = 1.1.0
>  LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
>  LIBDE265_LICENSE = LGPL-3.0+
>  LIBDE265_LICENSE_FILES = COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
