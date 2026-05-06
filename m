Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB56FCD3436
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 10:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 852DC82320;
	Wed,  6 May 2026 10:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjapGexlsN3k; Wed,  6 May 2026 10:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8CBB81DFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778064492;
	bh=7hCH4zwL6tAxtZqD1iktekd4L4IQscv8U3qgl4e65Z4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iwnqj3NixOJQjPgNTCRF8vGBChcRrMXLU4bxIv/NYFkKVAuYJnByfG17mNJaPbuOZ
	 emKM0xgwFEnzI9KBNd657woybO6MPeg6qBULhj35CXLJ0OWgrX7Y5BBkiieQFo915P
	 0T06KO0jMfc2dmourvTtxpatMoW+rTTHY7Dz7fkd3qIGs7QaPgbLB4mOOMavIiOR8z
	 1KDsnzyjTg8LC2/k+a8sOSBgn3FaJpwQKhYtJ/3j0Z+G7ZS1NMvfoN4gx1iPOmM7Z/
	 1WGjVowi1BKBWcy4wl5lf4H2QTNsAqm/QXLIlFfhejmQfu9ARrfJ6XHgYkCMZFWvk6
	 fPdgOcdeIwtgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8CBB81DFC;
	Wed,  6 May 2026 10:48:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 934D9280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 10:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8582F40487
 for <buildroot@buildroot.org>; Wed,  6 May 2026 10:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsuhf7j3qqDT for <buildroot@buildroot.org>;
 Wed,  6 May 2026 10:48:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7265140484
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7265140484
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7265140484
 for <buildroot@buildroot.org>; Wed,  6 May 2026 10:48:10 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 822BC2C84123;
 Wed, 06 May 2026 12:48:07 +0200 (CEST)
Message-ID: <4a5f026f-6e96-42ff-8a55-c2465457b900@bubu1.eu>
Date: Wed, 6 May 2026 12:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20260505195834.1390763-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <20260505195834.1390763-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1778064487; bh=t/Iy5n4wcfoH5mOi1fXw01drvHLNp7P64U2+6FnIqBA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=WfzihaTrVHfSCO9PLtyq0QSbT7igmxueywizUYEF8Hm0QN9c8l7QUv1jqZremZBrs
 R+ClJ17tGdJf7fCeRev37wEqhLvttw2e9hBOjKVGCiqPtgZ/c9KR0LuDTB8xxq+Jxi
 XDVL3+2cyXdpt2ljvhjfw0LauvhURDog3j6mfmgGX7cHvUdgp57RJXRIvRpk7DCUTK
 q8nIvW59IJcmHfiY6a5EzPhWUG00EiOLuvO0hvsJY7WEb1PXKWREN5YvPWiEHnoMKc
 bVnp+SbhnqwetcjA1OJGuik30MMzkIoG4YwAfUI/sMLa7PpMsfHWAvbcqT9wey6X3K
 zBghqZydxzHOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=WfzihaTr
Subject: Re: [Buildroot] [PATCH] package/ffmpeg: bump version to 6.1.5
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On 5/5/26 21:58, Giulio Benetti wrote:
> https://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=cae4a8c6ded2d2cddbfc4bb247564ebf3f997479;hb=a44ab44236a99ae26594fb3e14fe0c956210673d

I've changed this to 
https://code.ffmpeg.org/FFmpeg/FFmpeg/src/tag/n6.1.5/Changelog, the 
videolan git is (now?) only a mirror of the upstream ffmpeg forgejo.

This is also a security release, though that wasn't that easy to spot. 
It fixes CVE-2026-30997, see 
https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/a44ab44236a99ae26594fb3e14fe0c956210673d

I also added a mention of why the license hash changed to the commit 
message.

> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
With that fixed, applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
