Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC18C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 07:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B15942563;
	Fri,  1 Apr 2022 07:42:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uBH5rG8zZ2tf; Fri,  1 Apr 2022 07:42:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D250424EF;
	Fri,  1 Apr 2022 07:42:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4A51BF378
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 07:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1774640025
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 07:42:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NR2OoqbLksU for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 07:42:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E89C40002
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 07:42:09 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id m3so3281574lfj.11
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 00:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=K+XEYQvgAcW4oi79Ab/N5h8Nt7N+T7Z7I3h9hkpaFkQ=;
 b=p98NuVFwPfSGIZqKF3W7fkrYYXuC5EcL+5PWsSD1/+l0VmHmvHfuXwSUDoYOTVfjgZ
 zkco3D2kGqBefyD+sqg8HG1fLMav/yJaG3huyXKv7nG4gM+Tz7r8Si2wzb1QJyARiFoZ
 tNibDwT1mqFlQJ5hxsRd5QaS+Va/2bPOjU1qAYDn/KFQtAEMI19Cd+ze7bD6nwkMVedg
 +sA3RkumQZWGuKxPKEcQ7u++TicLaVLh/jQfYGWUohnF4phsM5STWEf2h+2G/GZY/QgX
 ry0oq5y/Jg+NH0dfRQuU7JMVxhW9HIfgUiss3c6fZ1qCbtNwHNM9zgupBVUyBdftDwSQ
 7fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=K+XEYQvgAcW4oi79Ab/N5h8Nt7N+T7Z7I3h9hkpaFkQ=;
 b=3MH1SrUyAhl84gR/7Cxot4eV/EnIzgc/5dCay1CQ9wxMLO3e92KLrRCFK9Y5SqXWa5
 Bu9nZmyXKaWoceiHzSHQKzSacNmV9dwYoXCAUpfDcqXrXSmrkc8IRlfOofh6a/+mHF4k
 ez5UUJWH6KEJek4eaIMytj8Cb544Ugvm5msZ3LqH8keK3rm/6qs9mAlBM1mASfWf9oml
 94JyGlB2hqWSw+ZCwxpCitJF51bkPU5Rl086bG+0aPHFlwr/3rHIWS2bQxTOyy1Bpr9k
 6PZtboiBzChjH97xlbjj7F4CdlArtfxGRpBhntiZkge6f6UkRfjC4ALXzfbe+jq/91/L
 pyGg==
X-Gm-Message-State: AOAM533cSaIKrFvF14lLUAVa7yo1NpqrhREU0Mwm5vH2M3IwxFhHCPKy
 8yfIlvdjqjQEtMgFqsety6g=
X-Google-Smtp-Source: ABdhPJwxO+/jFfQIcKnAlxI6+SEugWWZUBXRnm6ixxtORi+1+5tc7vC/77/ZmnQSuI3D8wZMfEh5Hw==
X-Received: by 2002:ac2:4ec3:0:b0:443:6504:ee19 with SMTP id
 p3-20020ac24ec3000000b004436504ee19mr12944890lfr.260.1648798927049; 
 Fri, 01 Apr 2022 00:42:07 -0700 (PDT)
Received: from wbg (h-158-174-22-57.NA.cust.bahnhof.se. [158.174.22.57])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a056512234e00b0044a54de0d1bsm158513lfu.258.2022.04.01.00.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 00:42:06 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: =?utf-8?Q?J=C3=B6rgen?= Sigvardsson <jorgen.sigvardsson@gmail.com>,
 buildroot@buildroot.org
In-Reply-To: <20220211081357.40439-1-jorgen.sigvardsson@gmail.com>
References: <20220211081357.40439-1-jorgen.sigvardsson@gmail.com>
Date: Fri, 01 Apr 2022 09:42:05 +0200
Message-ID: <87a6d5dzci.fsf@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: option for
 building with LWS_WITH_ZIP_FOPS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?utf-8?Q?J=C3=B6rgen?= Sigvardsson <jorgen.sigvardsson@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBGZWIgMTEsIDIwMjIgYXQgMDk6MTMsIErDtnJnZW4gU2lndmFyZHNzb24gPGpvcmdl
bi5zaWd2YXJkc3NvbkBnbWFpbC5jb20+IHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IErDtnJnZW4g
U2lndmFyZHNzb24gPGpvcmdlbi5zaWd2YXJkc3NvbkBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTog
Sm9hY2hpbSBXaWJlcmcgPHRyb2dsb2JpdEBnbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
