Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D59A606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 21:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WqpdtX3H
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 773B2606E5;
	Mon, 23 Nov 2026 21:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmr3PWzed2mU; Mon, 23 Nov 2026 21:50:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 99C5C606A5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795470623;
	b=ZlgAUeku+ZSi2RznMCRut0CzmQI7m773bIP4NlVMqbQA4vLYPuYSByg8e2tDBhe9A6iT
	 k7WXwXIsxgwzwGqi9Sr9cHg1YkjOqKlb2Zt5Ae/k2vG4cNA8XIOrI8GMla4pFNY1Hvnsw
	 Ng/GUKfQI4QBX30oeFZdHRbyx6N1hdy26B8IGVsbm8553VLIlAOxIBUhTp9bAWNg8VT3+
	 joi74boWNufRviCHw/188muJ/yUVrv20yldhN0qVPftLOgOOdnXuUVciLj+Htvqkv5Z0v
	 wYlAXHz51pxtuPC0rzE+B+l6rE5lxaITvkXWIWrQvZh814eeFFG6q92Rfl7ln4iFlbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795470623;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ykA1clnEylRzPIpvPwsre7plNbItWHexa3mD/j1PllA=;
	b=lrlbZtbaNDKCEXmkc0/TzRpAbaEtGstLVfHUgUFB9oMtifvGdbWZ0/qUP485gTeEPmr1
	 nTiYYMHxQBmFpfHTysDwN73huNdsEK9rS0SDR/jGxJuiEfBkfS8NwywdXgJ/2jjnJEoVl
	 hUSSZTKH2Qo9O/Giyvnf1desasoXYz621DQIoQn6kHwVDvFMLvN0eVuWCU9//BKrnttiS
	 Mt8qO8jhjCr53XtSS2JBKByhckThbBFoSJSM8fTwJCB+wk20xE9wcAU0gMNdTjKtk5isl
	 R4fOWi0iGVAb5QjBXmziphFMACPSJuL8lNAF6oGHa4Z4QfqVJGalj5K1bBdeDXrw7nw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795470623;
	bh=ykA1clnEylRzPIpvPwsre7plNbItWHexa3mD/j1PllA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WqpdtX3HZ6FuxQLvvkxSeOSkGSV2COKL3uFfT15RSKwZpoXiA89oUaL/L7V14v5QO
	 2Mz6ad6FWBi1XDLHEKGBaRyGzgrQYeG5Ca9s5YNLVi0hr1W2030cLUfxc66vklRLj9
	 3EpTpSKCTLaLg9FpZLQ6sow6WdisTUK957vE8LRjgph9EiGboNnhDTa75TsS2cObPD
	 iwlbwnLNcSkK346C2HtaPaCwdeqVprbHtTdo8g3/r24Ps6I0OYwBViz5hG3tN/SYX9
	 KkGBf4eX6zHbwUxENV3Tc/tnvfM4+v63jeeqInpQeQwBWn+HreE+e+R2xafn1HBCNp
	 zCrTaCwpOK9KA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99C5C606A5;
	Mon, 23 Nov 2026 21:50:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76BD3260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CFD4401F2
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0ohoDtL7GqW for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 21:50:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DA30E401BC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA30E401BC
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:50:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DD85F4E4160E;
 Mon, 23 Nov 2026 21:50:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AB50860480;
 Mon, 23 Nov 2026 21:50:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A3EB11E6AAB9; Mon, 23 Nov 2026 22:50:11 +0100 (CET)
Date: Mon, 23 Nov 2026 22:50:10 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Baxiche Su <baxiche@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <awS1BxqiCHZtFtOm@windsurf>
References: <20261122205404.3669909-1-angelo.compagnucci@gmail.com>
 <20261123212022.3748880-1-angelo.compagnucci@gmail.com>
 <20261123212022.3748880-2-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261123212022.3748880-2-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 2/2] package/qt6/qt6multimedia: fix
 license information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 10:20:22PM +0100, Angelo Compagnucci wrote:
> qt6multimedia bundles third-party code in src/3rdparty. The license
> information listed only GPL-3.0 and LGPL-3.0, with the eigen and pffft
> license files, also when they are not built. Complete it, following
> src/multimedia/CMakeLists.txt and the qt_attribution.json files:
> 
> - tlsf, always built: BSD-3-Clause;
> - dr_wav from dr_libs, always built: Unlicense or MIT-0;
> - signalsmith-stretch, built with the ffmpeg plugin: MIT;
> - resonance-audio with the SADIE HRTF database, pffft and eigen, built
>   with the spatial audio module: Apache-2.0, BSD-3-Clause, and MPL-2.0
>   and BSD-3-Clause.
> 
> src/3rdparty/ffmpeg only has the license files of the system ffmpeg,
> which the ffmpeg package already covers.
> 
> The license information was incomplete since the package was added.
> The bumps to 6.9.1 and 6.11.1 then added signalsmith-stretch, dr_libs
> and tlsf without updating it.
> 
> Fixes: 553c55e9bd3cfa05cb84fa4cdfc5d25d51c3486b ("package/qt6/qt6multimedia: new package") [2025.02.x, 2026.08.x]
> Fixes: 5ae304d96cb7c4df040ba1bdfedfb09b3d5a3417 ("package/qt6: bump version to 6.9.1") [2026.08.x]
> Fixes: 05cd38635a1c2a8e6c44170b5eae8488b0c7a104 ("package/qt6: bump version to 6.11.1") [2026.08.x]

Same comment here.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
