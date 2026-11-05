Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EAD606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 21:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gQP1w03m;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIpmDsic
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1BE3408E0;
	Thu,  5 Nov 2026 21:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4chCzNC0_Pc; Thu,  5 Nov 2026 21:00:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E2574408D4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793912428;
	b=teJIajHETQIC+s4HC6SU/Ht/3ED5cS+SYc5aDPsvWnlryzYJbReTV6uxXapBpgTTELzL
	 7cAHRMNbcbyNEzSyvaSgG+IQLYkpFGPfBtWc36fqSMZ/8iIo+De7tyFYuDoKlfCEWWUVR
	 kfG/TFoQOQngXsXjkmu82AkR+aPjm0jevdhDUZBh7EZr2VtPTA3JmegRBoI6DewJ8LvJ6
	 Qa1+j736qWyd5b+UUONbJVOQM75y2G8Dy/JCnGLVDiGmwM6fRcVr/EzhjAHkailgDQXvg
	 acD/V7p9C0VCBSygBETcdVA4DEYMFW8vZFM+G/uJHd5Iao0woZYsILeqGeNIH87UR6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793912428;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9fIw8bk9TuFVQyOG74TBWvgHpIXwzrKxOCOca7mqX4E=;
	b=RgDlptDCtoFhG++VghMuiDYWklb8NDjMRe5HxCOqjK40CE7FFjVpCUDMm95ir/PU2vyW
	 rzA/XFZVglyCjuDORYyIfkMGJaT+sWG91MVmZIGHlhc4tUK+R2rBZ4w91chix4DQy04jr
	 HcECytr5Xoh/V62w7IU2UjYR0SjXhNmc6xj/XaB0B7XUCs39hMrG4rQmQF7nMuD+YQ7Ms
	 iBma1RJo38bmMxokz8Uhn6tKTvQIOEClM56i9EJTmF7QkQYvd72wvSdDvLIxZj6gBpvoW
	 /72fr3OkoDxKOcL3XYn/e7A0te4YzuBoB9r8vZd+pBjBGQPhG7x5NJ8T5GSEv9iOFyw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIpmDsic;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793912428;
	bh=9fIw8bk9TuFVQyOG74TBWvgHpIXwzrKxOCOca7mqX4E=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gQP1w03mzwCAqpXqPX4bGxdJlWpruPx9gipy9OvZRL7+yZuykVOlDIkwyvNqWM+zD
	 Y6mTzLioyf+oTM3bHmqq/zjJfM1NuJHdsbHyn9D074yFuWzp+vxpcEvV3+bpUt7Hqi
	 qNmg0Ke/iYmdoLnMJRjWJhx9VHckXPYdSpRIsrB7t8QhdBWym+n9iGEOJ6/vlglJfM
	 NmSq+mi0JXGQxJ64hYR+KfLSDWuiSoXkldfSkSqI/9wFbdG1pvYMIYJC8X5LKBJIeR
	 vSFKMC8u38mEptTyThtg0j7/1B8+00hGzhrepLGd+IHZdbZpFcJ7uqKzOJSGi0smwE
	 GrFKxB7H9Zs0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2574408D4;
	Thu,  5 Nov 2026 21:00:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 29A39F07
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F015408D4
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5ibC-_FvMla for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 21:00:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1416640718
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=wIpmDsic
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1416640718
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:00:25 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4ae34ad9bb6so2666425e9.2
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 13:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793912423; x=1794517223; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=M3NE8rCv7z9yE8srEGpwx6N3Gt4v/fOLHM8x12b5exg=;
 b=wIpmDsicrct0XCk2l7la2Lb9+MOV1cHBmE2OnYGtLVmrQRcEfCz6fjNVLdKwZJhFxr
 2AWoPiMTuMGzShbDhxSGvvcG4z3D27c8Vs9P5zuOGYBhyL3OaN/2Ga5HnrBmLo/NDqle
 Xr5VOSztXij3kNPU+QfDSE1OC5oJl5nL6UExVqHNqyG/mrO45nJafNM4Y6k2ScfnSb2+
 qZ9rCPrNw392sqsAKF5EqlPBrXrHGcUvmHon/6V6U8CvGwkEHQJ6630b/n8+AU1/j5fq
 z7r0HbygHVxI0nxre9umJCZ5TT3jB+v6x5EbKMIaReMiMdP8vhlkBKsjdaxBcFOk2m8+
 q6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793912423; x=1794517223;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=M3NE8rCv7z9yE8srEGpwx6N3Gt4v/fOLHM8x12b5exg=;
 b=h5dii5P5HZBU8GTpO0b0bkd8LLN/xdVARRBDnNd6swZmNx7ejOmsXHz4OpzAuom0Qi
 ez7QzusPL7afpmjt6PMV/mn/Lu0VhNw5YtmtN6R2SR9gsEPr+DcPUhAZP8CbPZHRPFi4
 wuUBln/XIOB2PKwIv4tjWkTb1F4gA3jFfBl+2DD2MAlgZO5DHoKTrhAZe2DX97vheEKQ
 Lqx2f1hSAQ8W5EC2CM8H5M4zGrkZThwo3hiiMAzLvxXt5ZM4XpLf9Nqy0buyaDs0r7LJ
 0o4bDkgZMRVwTM+TPGVI/nKZHwkIGp8/pF4GTSfPcTZpQ5No0WWkVL0uxEK0Vfyv/+dA
 w5/A==
X-Gm-Message-State: APuU4Z9j+Ax1VzwHuTjkY5EZKF5Vf234qaVIiHQRB7MkNjKlNj9ksnG8
 y1pFLHIrxaH2l6a/6KRXxL/me4YCpoq46LipS6VKm7NDIKWfm+T1H6J0
X-Gm-Gg: AYBFou0Gs249ryUV87PC60kCfO0J09kuZNsbielwnDbJj0fFKEj8BggJiW/f1dKI/wg
 rSwGsTqqbGSy/79uQG+JUWYxV5ZnePKdMwn0eb4ENlQaCZrzoDsS6I2TUHNaBUixdCG7OP4DYpD
 7tx7Y2gnGfKreONRovYMrSYNe2uyBwBACuxOpzJbwpftJkJIZ532/CeQ4xMQwJNeDMXZKLGgL7z
 dRr7/H1ZF6/rHNBqnj3IPFZTDe8kdBzC7CdMubzZGC92GTDbe+7fFK6GVLTTH9ShtIxonWTSrvE
 EmFHI1qY4roncWWcm/gZ7oUkkgk0cLH/+zKVDUWIQCX3M2R2R/3j9EaL49GX/B96VMX+vuP/u37
 kWxVxdQVn6PCmNaRHkGAxwdwaoQdEf/8jk0kG9NYeOxyPVAVag6gnGYAvhMM6Ylk1PPXBpGp2RU
 Y+1OKEFv7ZClLHjv1VXnflykVgYsc6ed/50xPKJpJo/6d7HbPvXFHaL83dE0oyWnZRRcdvRDkOy
 HqCVcVMzwZc36HM89uoHO/SJrGlErzVeNnNS6wvY26hv/F7Qe0xaCkkSRwJg9jy2hS6bE9Abu+K
 4uKFcdWvNAXrp9A1tGM1
X-Received: by 2002:a05:6000:41c3:b0:490:3f9a:5173 with SMTP id
 ffacd0b85a97d-4927845529dmr1414553f8f.4.1793912423042; 
 Thu, 05 Nov 2026 13:00:23 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:bb65:56f7:9f07:19bc])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fece998absm12746852f8f.22.2026.11.05.13.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 13:00:21 -0800 (PST)
Date: Thu, 5 Nov 2026 23:00:18 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Vladimir Oltean <leo.denieul.yoshino@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Leroy <maxime@leroys.fr>, Vincent Jardin <vjardin@free.fr>
Message-ID: <auzuNoPUXTFUidwJ@skbuf>
References: <auIW8EW-9Qo0NFXv@skbuf>
 <auyijJkgbV87YT38@leo-ThinkPad-P16s-Gen-4-AMD>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auyijJkgbV87YT38@leo-ThinkPad-P16s-Gen-4-AMD>
Subject: Re: [Buildroot] [PATCH v8 1/2] board/lx2160ardb: new platform
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 04:36:44PM +0100, Vladimir Oltean wrote:
> Add Buildroot support for the NXP LX2160A-RDB (reference design board).
> This is configured here to boot from the SD card. To my surprise, NXP
> RCWs for LX2160A rev2 silicon don't have a pre-existing example for SD
> boot, so until one is available, include the RCW through board files.
> 
> The boot uses U-Boot's bootstd framework with extlinux.conf. The DPAA2
> Management Complex firmware is loaded from the filesystem during U-Boot
> board init. EFI boot support is disabled since we use extlinux.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Vincent Jardin <vjardin@free.fr>
> Tested-by: Maxime Leroy <maxime@leroys.fr>
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> Tested-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: Leo DENIEUL <leo.denieul.yoshino@gmail.com>
> ---

Please fix your email client, it is still sending emails as "From:
Vladimir Oltean <leo.denieul.yoshino@gmail.com>".
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
