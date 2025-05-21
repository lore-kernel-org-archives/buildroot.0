Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40081C2D0CD
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 17:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFB0580CAC;
	Wed, 21 May 2025 17:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id if2ZrMDCKAYY; Wed, 21 May 2025 17:26:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07F7880C6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07F7880C6C;
	Wed, 21 May 2025 17:26:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A18161
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00666400E0
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x1BzfGgLpRuO for <buildroot@buildroot.org>;
 Wed, 21 May 2025 17:26:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98E3C4006C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98E3C4006C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98E3C4006C
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:26:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.117.134]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mnpns-1uk1Uk22Ru-00okNa; Wed, 21
 May 2025 19:26:52 +0200
Message-ID: <d7da3b10-da07-4718-b043-d645d35897d9@gmx.de>
Date: Wed, 21 May 2025 19:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@cairnwater.com
Cc: Buildroot <buildroot@buildroot.org>
References: <ddbed9a95b8f787377152092229828fd@cairnwater.com>
 <b1d889ab-e5ce-4ff5-aaef-210e10c2c1cf@gmx.de>
 <ce099431e6ef3f34d075533934004d29@cairnwater.com>
 <94c4f329-b903-49df-a1c2-8e91185469cc@gmx.de>
 <e147c44847cdb3c965cbf99e41751d26@cairnwater.com>
 <06288a46ae8ca333eb295497dece6254@cairnwater.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <06288a46ae8ca333eb295497dece6254@cairnwater.com>
X-Provags-ID: V03:K1:5P7IL3JHvCt5NVnzS1tG9PsD19zhHL1gshTIFF7MW6EWI1ZIHXs
 kxm0RNCkMxYg9TblcC05LlbNfGAde0dUo3MvzNKZM9WmJRBl9Fs1fWmt2IeKDbs0/G/JD3+
 M+ZsENb9+SakD9mow9vSpK3IVQORCwIVmMvcib5LLDnpQyKKtmCcGKTX6kKOcI9zr1G+N9F
 tZ4h5dhNo+zfEI7m+4hCg==
UI-OutboundReport: notjunk:1;M01:P0:9inUPIRmcH0=;is5i6a2aiUl0nO5urz0ORWkTFdz
 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
 bvuc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747848412; x=1748453212; i=fiona.klute@gmx.de;
 bh=6LiagJDFCjKy3SupMIvc4VkuN52ipY/muYGBUJyiiBI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Y1igFtQxRNYScLdutYxVgOiU6C2WnbbKVQOgrJFRRwJCDvMLp6QLKEw/R0qL673f
 fkSSbsp7Ayg1BnOGagGWZBWW2ogP1JCDEfspKQfmdoTh1EKWa8Uj+/Trl7Lu3xw7O
 N6zsSYrruSqMmXtQ/fShtVMn8OhLKDJvxlLbm9IFnimM/SAUtQUc08iG4nPca/1Oq
 t0o+9+MIyd42MtZp502f0OeVWFEshhqnIlv9sBp3eQk3flPMNEwTZNiBfMnQROXHC
 Chs68MUebtVrabkdUmMSuiTyHsGFTE9HuN9ypGB+RKYmeHvx3oVPiDjD3Etb12QTa
 /7kvq4RBefqF1ZsY2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Y1igFtQx
Subject: Re: [Buildroot] Adding Device Tree Overlays for MIPI-CSI2 Camera
 and libcamera to a buildroot Build
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 14.05.25 um 19:36 schrieb buildroot@cairnwater.com:
>> Either way you may have to enable overlay support in the U-Boot build 
>> config (if it isn't by default).
> 
> I looked in
> 
> https://github.com/buildroot/buildroot/blob/master/configs/ 
> polyhex_debix_model_a_defconfig
> 
> but couldn't work out how to enable overlay support. Is that usually an 
> existing line in the defconfig that should be amended or a new line that 
> should be added?

U-Boot build config is separate from Buildroot config. In your Buildroot 
config you can either choose a U-Boot defconfig (part of the U-Boot 
sources) to use, or set a custom U-Boot (def-)config file to use. There 
are also make commands to open the U-Boot config editor and save a 
U-Boot defconfig (same idea as saving a custom Buildroot defconfig). The 
same applies for the Linux kernel and a few other components. See 
"Configuration of other components" in the docs, it lists both make 
commands and config options:
https://nightly.buildroot.org/#_configuration_of_other_components

Mind that I wrote you *may* need to enable device tree overlay support 
because I don't know all the U-Boot defconfigs, it's very well possible 
that the one for your board already enables it by default and you don't 
need to change a thing in that regard.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
