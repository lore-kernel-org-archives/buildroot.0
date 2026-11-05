Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06F0606D82C
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L4Y7B4jB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ljP2IdaI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E99280C67;
	Thu,  5 Nov 2026 15:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihvB7spWGyah; Thu,  5 Nov 2026 15:47:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C712780A8C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793893649;
	b=bQzNjtidnjTNmm6/BdPXCmb6LFIOoK2ZANJ2m+rTNjGDJNGY67+gDHBAq8+14A68KseM
	 MzeLXb60VoC/IAgydN42eZ45WKQ3M7PlC5Xdg+NxSGSVhKidWQ9xmE9c8qvTiVvq86BW2
	 H5SqUk6bgK4HsKURB/TZA4XVMvkOD4k6JfYP1PoBZXyqpASaSSbzOqK8AVYbrXvUAC4G7
	 lzURv1xV8XjdtwNjLelsNt7+Q25qFRwDwubgYO5ASe+IJ6oZcq0hrcMdJ2cty0XlfoOH5
	 SooUCBZ97dPmEKivEW8CpehqNTWey9zfMGYVGXJbkByYGOlwd/baj6Fr26yICNNfSEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793893649;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Wg3T5Uq+ZBQwfLf1IpXDT1YMATaRHBr0J6m/7vxurjk=;
	b=lyMw3hr89sD/FfS5M5IG2YKQGvt4GnMj0+vl6I4ZR9/Yq5El3TevpRlK0zJF6zaks6AU
	 PoEdrfw7frsYCwJwHblOpMD/hc4B8b+1mG4DNjjg3c3XdFT1iKqKWhsYnX437yOPVzV+9
	 9BFPS2hzGejyXaoZyIdo4RF1DoJWPLP46esDUMkp841Qg7DYDiUG9QtkTQ/USP2FGKNmJ
	 RqUf601Kb20v8U6PyaiOUkI1R2XhbzKXtt3ovikbMehVI76S0UGV5MTQXeA148jxcBer5
	 xDpdnOg6EYAag/58zLoWWDHHyVK8ePQh3hvS5J9LSA1sZjALZ6aZl2+AAKoohZj4gKQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793893649;
	bh=Wg3T5Uq+ZBQwfLf1IpXDT1YMATaRHBr0J6m/7vxurjk=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L4Y7B4jBskOimF8Vr4v0LmchbcDNNZuDAqnbNmV9bs+ehYVf4JGY+mJKdDiT9x42T
	 kkuSxqo4deDwDGuIbztQZkNDh/sfxdw+b8ceEXKk3kLoTPiUbMDyFAt+M4I/uuiBae
	 PTOgJZFLhQL6bA96uoBmx3dc8UtgwPAu46b1Rl+OYI11+71UNaPdX+FtF7YRJVQMp8
	 p3azjf7GNhC8rmnfZaQU3akkPI2+FeZ45XjGVfYGurhSKyY764mEmpgSPn+jQDONn/
	 nJDehfMWBFNG7OjKZTALBQSwEcq1zJr89IHGuNhWFoS5QJFIjblXY4l59RVZaUeZVh
	 EnKS1OoxbvmhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C712780A8C;
	Thu,  5 Nov 2026 15:47:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A177C235
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 15:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 872FE6085E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 15:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mo1V4ntNZb7C for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 15:47:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9D35A60721
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ljP2IdaI
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D35A60721
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 15:47:26 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a59100fa83so20071625e9.0
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 07:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793893645; x=1794498445; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5gJ97y5khmizOTdkbyWSop9QA9g1sQanu4AcJXSarCI=;
 b=ljP2IdaIlgAn9xUscFZY+ckkKnZeQIX7IXEMK22/oZrkwcNTVTOu21S1kBTOaIXu5f
 H0kmLeO6P7HH3s9+f9L7FwCXmmkkHGhThc6SUUaSHKa/oHPgmgMD8NWxmcnyrVpkk5o3
 Qg+wpbWlRDFWRpWVJ3/TGh9UP1pk60GL+H0CL+wziJ5fg3NzAkEpfdKwuP2ryjdKhuC5
 sCDfWzlPhMaaQ/Q5LExYPJg9tCA0hoFMlCd735xBgN1IHVq9okp04ppCAOlC4K+JksCv
 g3+hg4V4XbiWMlB3dS5GvaYLrzw7LrzXiMljUTOfWR2uiKN/gINwGB6atZtcZ00+2aLt
 KxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793893645; x=1794498445;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=5gJ97y5khmizOTdkbyWSop9QA9g1sQanu4AcJXSarCI=;
 b=NwO2DRXiIPQJTNpQaT+PtxBkpx8GGlcTwu+cstLfeLihmRjgYDSvAftueLUlw2SecK
 iySwU2bJpmtTZffCW4IIg4cP/G3L4coHhgF6Y4RpkhmRjsz6eIWEorhTY3Pnj/QhvF1Q
 9LaWyX0/Ewr+N6f217Wd0qipz6u/OgpzOnpLgr8GloQh7Wct8QXo3abgBvxhw1SIGXPP
 oxvCE4eUyDSsD+W+uiGeyxjr3GRglr1p/ib4eJx+yxYFvExEOSla/D0e5s0lW3ujuM+Q
 3u66zB4Vpl2Lbv93Uq6GrdMH7VogTNfaHB+VqMpCcZVLYh8CblTfyqAL4oPIID7bjk+N
 cnmw==
X-Gm-Message-State: APuU4Z8OcLGuizhCO4T/8TijUm0XK+GC89s6viUc4G15u61oj2tuqMM1
 Bee0kRB2sU0Ca7c32Dz+BGo7uC64Lrg7OnnfqWT6vwVl4OsVabeD79l+PqXmy0B+
X-Gm-Gg: AYBFou28DbFm+Tu+TKoh+1L0v4bEzDSBHLAm9X4BQ63Hh+wslw6AfRqOZewE3Hf1eh5
 QsBVkLtI4ylYdqrtLxvDRxBzHS7odCxzlWCKs8Y5wqvBpHMsgYLvJ1+XAZMR/HFqUzqFbw0l8nG
 tAgOYqRWDrbEUTNKbWqimhBJcTmj3uKUrfLm71qWkJih5nlq6QsSDjXhdZgGTdNoQwRSfqB2ld/
 XyfTDApNzKN5xyWNeiMmKg97Wbcj3PzO6iIpPz3jRbUdzuq/Prumd4EC6qojSyRajEPcs8ZSzal
 Csu+KEJrJVTHNc3BhBy9A4KOfjT9HDjz0a+5jUO1eLYv7ou5w1qCnp64ECYrL6tMUsTm/+/37Fc
 voX55Ds2dzyuFmbPiRStJVttH3vHkGbwPRLj8dX4zn0v+rHSpQJ5pS2QB7ylskpI3UU4sYSXPEv
 vYcVzSBvgcJp4ajjxeAb76BcbK4MpDtnuaYUtiRr6UZL6Npwxa9DmVRMAKdRXDzJ8GC++raY+5O
 wx9uKOeuu0sc6lw+iZVCzv12Ni0ry8rk1GEr2Tjcu599waO6N/ZaWxyhRbUHTvyUlbavZnI5GQI
 Y1efIotYIIhpk/t+vfbYnQjDeOz7tSiSxTjMkWD47FkAl2GRcvGioM7j0fwPZQ5Slig95eEJXL/
 DB3ieSLHzBGnFUTvBKlzhJLvzj+EHIdR9jwZT3s8uYg==
X-Received: by 2002:a05:600c:5246:b0:4a1:f377:5c6c with SMTP id
 5b1f17b1804b1-4ac16acfe48mr435387365e9.10.1793893644608; 
 Thu, 05 Nov 2026 07:47:24 -0800 (PST)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b572bba0f3sm70664295e9.9.2026.11.05.07.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 07:47:24 -0800 (PST)
Date: Thu, 5 Nov 2026 16:47:23 +0100
From: Leo DENIEUL <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Maxime Leroy <maxime@leroys.fr>, Vincent Jardin <vjardin@free.fr>
Message-ID: <auylC9RyEItt74y2@leo-ThinkPad-P16s-Gen-4-AMD>
References: <auIW8EW-9Qo0NFXv@skbuf>
 <auyie4Vfeb0nzi5l@leo-ThinkPad-P16s-Gen-4-AMD>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auyie4Vfeb0nzi5l@leo-ThinkPad-P16s-Gen-4-AMD>
Subject: Re: [Buildroot] [PATCH v8 0/2] board/lx2160ardb board/lx2160a-rdb
 new platform and newconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 04:36:29PM +0100, L=E9o DENIEUL wrote:
> - patch 1/2 is v7 3/3 with the DEVELOPERS entries Thomas asked for
>   (Vladimir Oltean and myself).

For the record, patch 1/2 is authored by Vladimir Oltean but was sent
by me, with his From: header kept as is. Sorry for any confusion.

L=E9o

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
