Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060CCCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0CC240E59;
	Fri, 16 Oct 2026 15:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-oPcPayw-Wa; Fri, 16 Oct 2026 15:06:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C4C3440E55
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163202;
	b=pc8cHyLpRNkBrGuBNshlpRdMlDMISw+Hn5b/JlB3k2ObtUed+BwbDpKsEL1bJ80ZyAqG
	 /HQ8vtc9BKuwhnugcNpeEOVDdQLIiYF3guRVV0xZN8zPZoLfA0fIEA+z3sQGonAUJhPD5
	 9n3XYeX6OaiZNeBX3D7c0VR5SnaAfULAKmsHTNOiYiNLnX0wrakqz6L/S0jAmImBdh7jw
	 o8m0CuwmIZ/kkcOi7s5Lt0B/tJBC6LapGg/5Vuzr5JS1L72+1epiLZnuw7C9SlFElYO21
	 wMjQuZOM8E/CllogQGxrnTKXINLsB+1Berf4xx7rHH41NOYrybeSJkkqbWIOjZj1oDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163202;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/2X+BcJ+H5vOpm1cQsbDZx2sMjEHlPygGt07nZluiUo=;
	b=pgTlonniBVPtAoyiDtmO4OWj7Uvr1CkbaWUoVSE9y6+5QPLlBNqVigRDaIdxor6ycxXi
	 9noAEH1w0FMQpWtuvlX1k6mLR8K+QqnrL2L4/Jz8AUUbZ615MiGYyc1jjZcd8kh+o3tR9
	 1Iy9zpq7iEusxrAfJscCiq6kpqcE7tzE4pJADD9ml1LlfFFrZ5AoIlVUqjOJzKSvyzh0X
	 wXrsF84NVVqltDUhje2t04iSll30Dw4irWeK9mpDsygu2EagQHdSDIukJ9KzaoNC7Aq2M
	 mNEElnz2Pls9fqDiU4NaS1Jfa9eMVcC7TTe5hWBnZkiTF30w98Vf69aFrMGMhhzh/8g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163202;
	bh=/2X+BcJ+H5vOpm1cQsbDZx2sMjEHlPygGt07nZluiUo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s+m2yuwLU+4HFpjvuMAv8a2xomu7ygLuI1t/VKE7FgrCgce27RSlsOKe1qlPBkz+Z
	 X5Suh8fdTrmsk+itW7r1td3m91tWyYaPLpQTytMPV1pdXpwZDMr7JqRKiXsdt71vE7
	 JOhu/tuym+zCHZTTCDbWX++PcbPq3OdrG/99v0ukA8uHnw4kyZEcrszflARkjcvB8R
	 +ftcP0XeI994pkbmhZf3md30d1qig84kczTWT9b02kwY6kH1V1epzyaP5wuo5lFjMA
	 PCV/6IE0eGfBbfHIjqMFdpCP2ky2l2433a/DBCKfvq31DOP9nTmWiyshyeRPc7q+OL
	 148cmW8yNe+lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4C3440E55;
	Fri, 16 Oct 2026 15:06:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 784417AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 621244016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mq57YKHuxVPm for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:06:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 889C040042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163197;
 b=Bb+mqobul7JB+LCVoaQxQVzpVHITlN0WUoHZQcOwGrUso6AMZNcrV4NzneVS2W1fcQbe
 2M93eNQppwGcTk1ncCc4B9udfJ4WSPXvPdY0voztxzXPgDszz0pt3cZC7DZPoetCTM3gw
 i9Miy4LfIhXruT3g+uv7uaOxPzt4YQK5MQTae301YHKyNE2ALgGl0gEBfJ0uq2i84v3Kg
 LxUQEqazYSlC41U4mKT+wjdghTEMtXakk2DXJ5BM3V1+zY1s81/tX0RsodA68/ugJI8xZ
 RQT1aPdUJD7y3NFhkNnzt/u//d+fr/LDxVuE7n0kF3l2/qooZD5iyvPLktwFGU7mc7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163197;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=nH8rQULDIiyn2XkLGSNVH5v3OpXW3s3pQ2BXQlA4fqg=;
 b=llUCNU7tO09zPlU7DXvcZZ66iL4oIDin7xPJ0+Big39/aM0qMcmShrXoyKQBgJtLaAqU
 1Cl12+3sSvaKOAH2Km3ivuNVa9gm+ZVqK0HjK/JW7ImeAe6EpUBftP4cPVv9YPYDezkI3
 MKtBBimqyFPLaVP8T7mKHDoRHVIRyvtIffELaNytzNXQwu1FaBb9MOZryCjxU2hJMZuXw
 +oXowS+AcEwuPzfTHbkby8jugSFVVV/gDH7t6Drk1OvV3U2hg3mL1F0bMDgpY4ezgkYzK
 wSq6JIgdbuJuvU0KwsGb3RXnIhVJavrTxA/m0v7KYznuKsK6gYm+OhdQaksJ/WXsRqQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FVWvESWF; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 889C040042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a0213948d3so330995e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163195; x=1792767995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nH8rQULDIiyn2XkLGSNVH5v3OpXW3s3pQ2BXQlA4fqg=;
 b=cnHS+rxk/lQ91Xm+o4bnVoq0dn1mDwTuPPKHvJDCbA3LPGObVz/NJoE6Tx701rhnz5
 6WtuVSMd9+mcXqHGn//8T2V4/OwN7lYK0brnk2mgvSw6BnQvP78ZI578QI7qLmD80e9z
 UvMLStjcI62/H6G34V8WomIjBTJB82JK3wKWYvXezyhD4L75WbChrASI1kSM0OlcwBJe
 fGZ3D+arb7CBBwfbloApneExYLypMMt5T2a4DJSccvp+43/kwJ3fwpaMta8QdAH21ePT
 WFEdS46Nsqy9bjSWndaHpGVttSehCq6yP1P56NvlzDJDo2BRq0XbTikrsilyCft/nf6O
 vW4A==
X-Gm-Message-State: AFq9FYJ3+a9uoBOqqqDC/B3fhKxaD/dETCoFZsUotD9Ku2iZPq0jM4PD
 uDdvMiUnvBfhM8AdTd4QdqrxNGhZE93ooEIejnjSsE911xkuSpVXr9AX0dCrkyKfFVX6tIjlMEz
 c7KvVPuY=
X-Gm-Gg: AYBFou3Q0ukdFh9YON+lrnmpH0E/EYp/uBh33fvlh9JRPiPDGCZ22Qw0jjOiXw2J56B
 R7tqgEMpdpFTIObcqUg7TUXGKYPFlA+zQG+eFPN79VG3Iu938SEbw7UPVy6j0nDplI0oIsicoZe
 wBzHlfWR2pcss3HcLGmATx/pJvVGyqrgXHSew7bJdrziuTVuRqMbq2DanPxwALmTFCgLT3+SzNw
 QdJXprzigofJV435qLY2uNRpOYCqFyQsqQzFPK0Sywzt8K4IWBlYwDKyz2PFkuZIgK+pmtWaijL
 KYN34sH+PMT/zP3aL8164at0dyeP28aycKTf/FTuHt+OMGrBmpR8sOMGHscOZXCW0zMnQSylI6Z
 ZK+WuTa/lN5prrdDE34Ih/ad5YLR09hSBmyvfwIuW31lajgRv3fhLZQAZx+nZWA4tRhtVy6XF+a
 m7RdxG8O0/AdJdkNK/cZ/IkToMxR1urz+AJ3G8ZsIzDNz4dxygNOQmXL1NVshFFEa1cidQTtg2i
 CD0zAVUnXBSVl0MhyuBj9JgwLHhtQw4MTmDrvV4OOs=
X-Received: by 2002:a05:600d:4444:20b0:4a1:b027:99dc with SMTP id
 5b1f17b1804b1-4a1d760098dmr1432625e9.18.1792163195452; 
 Fri, 16 Oct 2026 08:06:35 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8a56233sm53678165e9.0.2026.10.16.08.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:06:34 -0700 (PDT)
To: buildroot@buildroot.org,
	Francesco Mancino <francesco@tutus.se>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:06:32 +0200
Message-ID: <20261016150634.77156-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <63ae167d7dd7b0b5ce48234b4d749e9250fb2878.camel@tutus.se>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-headers: avoid sub-make
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> As a reaction to behaviour changes in Make 4.4.1, linux kernel
> (in commit 5fc10e76fa2a9) will do a sub-make to "reset" no-print-
> directory.
> Command line arguments (including INSTALL_HDR_PATH) will get lost
> because buildroot sets MAKEOVERRIDES to empty.
> Note that "--no-print-directory" might be already set, if buildroot has
> done a sub-make itself to set umask/CURDIR/O.
> 
> Signed-off-by: Francesco Mancino <francesco.mancino@tutus.se>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/linux-headers/linux-headers.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
>  			HOSTCFLAGS="$(HOSTCFLAGS)" \
> @@ -151,6 +152,7 @@ endef
>  define LINUX_HEADERS_INSTALL_STAGING_CMDS
>  	(cd $(@D); \
>  		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
> +			--no-print-directory \
>  			ARCH=$(KERNEL_ARCH) \
>  			HOSTCC="$(HOSTCC)" \
>  			HOSTCFLAGS="$(HOSTCFLAGS)" \
> 
> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-
> headers/linux-headers.mk
> index b4b5a5b47d..16ded915e1 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -140,6 +140,7 @@ LINUX_HEADERS_DEPENDENCIES =
> $(BR2_MAKE_HOST_DEPENDENCY)
>  define LINUX_HEADERS_CONFIGURE_CMDS
>  	(cd $(@D); \
>  		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
> +			--no-print-directory \
>  			ARCH=$(KERNEL_ARCH) \
>  			HOSTCC="$(HOSTCC)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
