Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892CBCD8C81
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FB0241EC8;
	Fri,  5 Jun 2026 12:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyioshs1r8BZ; Fri,  5 Jun 2026 12:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B068741EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663781;
	bh=WqAzW3LEMoXt62azS7fDHW7nhNfxRboMaASKiGm/n1I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AJzEvqA41ujL9uk4faK+vOFxogkJbGSx3zbGnvdL0Pb013v24Dy+hxSa/BnpUAGcE
	 V+KR8YG6bFJR8NDt/FaJE+69kIdv/Wxufw7dcMjOSR4QyAtJPrmO/dy3+Ei5RUqxfr
	 F5TQ2suKF+e3iY5Ao3ZkNSkHVYi6zh1za+a1rPD1YLmZNORNBjSfulAuWic3o3Zh7M
	 M59w8e89Fd4JP7NIKfK2utZ7dsj93uSB8grYa/d3nRh7K20dLzg4D0jePkJoXU0M93
	 FY+xsZ5zGyTJYdzr7vygQKJiaUK5HMZoWNk4g8mDrl1n3bwyDmfTTe4T26oRWWkpaq
	 7XFZ/DYvCKN5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B068741EC7;
	Fri,  5 Jun 2026 12:49:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02C9B388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A06E41E9A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AiW7isGo_K-v for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04C2B41E96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04C2B41E96
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04C2B41E96
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-45eecb8bf67so1420337f8f.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663773; x=1781268573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vkzGDn6gJFJ7fU7IGlAJ2n5j3f8trC1MVLpA8+Fn/JU=;
 b=DOpj8It1yVYIR+jqaLfLB08yWAhmMK1QkFF3VZsDr+PAVG6EySMroRlLZ+ALXxsK59
 tZ5fukouinQdJqYqJzzDrEvMbCFWeWSuhzoOVeXOo5b+m/7lyNNIqbtyzbRHxuAxw4X1
 75+hrY8iSFP/8OB+rkSvEUZ3ubsfT5pOK2AMD3kXpygCQx7CIkMUKAkZ05CWRT7DGgQk
 DSrpVRzPQVu039tWlFc/KaSUa60BUi4PnPS6j6dl9ZDb1mWTqIwye/PnaExBiceV40Wl
 sp+3Nyk9Hvc+2etTr1qP4xfdj7CRrILGnZlcPJF+EfdMk+K4tziXicuerI6yQhvsXRU1
 a39A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8T3S5f9gZsIsrc0G1BkDa1UmbwIleNcczwFLIJ+RoZyaeZJbxCKOkrJJnRHs0+zT5aBbd/8a2xrdg=@buildroot.org
X-Gm-Message-State: AOJu0Yz9YKIPESy3QLttqiJkArDIVkZ1QaNWqSOxBQTykrikZeDp8D5H
 klYkpWSzcgvhoad56YKwT/fVXDXt/P/wMr7zZ9t+Y/KfCP4kAlY8z0nXbA3n93I8uvc=
X-Gm-Gg: Acq92OGYdbVLeC4HiGQJLimugMbAfS8IzZBdC4ukmL3+qlYCXAvnrHK4FEETPWZLh/E
 5T4S3VKPsqbW4H08Oim3mJDnebCBWTmOSh8ME937UmIfuiJ1G7kv7Vc6Bv8uwitY5xJ11hPsTF7
 nrWHSxv8jAlEEMgcP68F/DzbXu1ztOplvhZsP11f5uChM8oU9x88AIgkEcaBc45E8ss6+O6hy5y
 ThcIkyTYXt+hME31kdcP0NbiSmSe2WsHPXcxAEIynmksD38kwuLG2mQ6wdR3cX/51PM/p/AGIwd
 j1uFgGNhtNTJmHRV3gWY9/iqRlTuPewh0Us6WYJSl80yLzfVZWZ4lhBUJmewvWJpPgyLUk4p57I
 tQGh8b1p/OHi1z1jSzyCex7pU4fNPu21Ao/TWqw99ZefrnOf75voyx/Ftn5Upjl764/lM2gVXRf
 5/w8d0AnD99junn4ncGL+Y9RKsgg==
X-Received: by 2002:a5d:4712:0:b0:441:1e41:194 with SMTP id
 ffacd0b85a97d-460302eca25mr4003127f8f.17.1780663772928; 
 Fri, 05 Jun 2026 05:49:32 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2f2710sm19878668f8f.14.2026.06.05.05.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:32 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:32 +0200
Message-ID: <20260605124932.271527-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530090906.1130247-1-peter@korsgaard.com>
References: <20260530090906.1130247-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663773; x=1781268573; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vkzGDn6gJFJ7fU7IGlAJ2n5j3f8trC1MVLpA8+Fn/JU=;
 b=O1P33tLPn00XAyDvykL9xilHJ3jeL1MLLzdHNsPG1InmmVN7j0+c3RpKkRwcnGUsHP
 z2bnB38LluGw4xOTx6mvMGHDcsLLthaWyEgfk67Psc/YU7lTfiWTas/gQsXJniWVSCn/
 ZrLVhossSjw1eySkbDSYwZnGTSf2tsNjbqBf9R4fVvQT760VLOrYuZA4WQuRfUSDUMDi
 /H7VeK82nRFRuKu1lIaPErAcHRTb6HspZ32xZihyx3MctZdZohCzBZMfTjmXIkI07LNY
 fuN/hry9ikN2VLb303athfqBCbsNnYnuC3oucJX8gyKdRYSgpD7fH9LyLXCP1VX3TK6H
 bZ6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=O1P33tLP
Subject: Re: [Buildroot] [PATCH] package/icu: drop outdated comment about
 git tags format
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
> Commit 5bf0db998b ("package/icu: bump version to 78.1") dropped the
> dash-to-dot conversion logic as upstream now uses dots in the tags names
> (E.G.  release-78.1), but forgot to drop the comment explaining why we were
> doing the conversion - So drop the now outdated comment.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2026.02.x. Thanks

> ---
>  package/icu/icu.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/icu/icu.mk b/package/icu/icu.mk
> index ee1ede6f2c..9b97011f55 100644
> --- a/package/icu/icu.mk
> +++ b/package/icu/icu.mk
> @@ -4,9 +4,6 @@
>  #
>  ################################################################################
>  
> -# Git tags (and therefore versions on release-monitoring.org) use the
> -# XX-Y format, but the tarballs are named XX_Y and the containing
> -# directories XX.Y.
>  ICU_VERSION = 78.2
>  ICU_SOURCE = icu4c-$(ICU_VERSION)-sources.tgz
>  ICU_SITE = \
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
