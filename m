Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1ACC02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A90584259C;
	Sat, 14 Sep 2024 14:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HnUHsEU1Lgs; Sat, 14 Sep 2024 14:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4F8441E0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4F8441E0B;
	Sat, 14 Sep 2024 14:01:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C17601BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5422E606C0
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7U51u90hQ6Z for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:01:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=35.89.44.33;
 helo=omta34.uswest2.a.cloudfilter.net; envelope-from=parthiban@linumiz.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D141F6073B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D141F6073B
Received: from omta34.uswest2.a.cloudfilter.net
 (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D141F6073B
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:01:01 +0000 (UTC)
Received: from eig-obgw-6007a.ext.cloudfilter.net ([10.0.30.247])
 by cmsmtp with ESMTPS
 id pTIAsodUBVpzppTKfsFHJ0; Sat, 14 Sep 2024 14:01:01 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id pTKbsfZeryhfgpTKcsa64Z; Sat, 14 Sep 2024 14:00:59 +0000
X-Authority-Analysis: v=2.4 cv=U+WUD/ru c=1 sm=1 tr=0 ts=66e5971b
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=KQxIpTB3o4ugnisqEuDnxA==:17
 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=BoJB4dgYAAAA:8 a=YRHvXXt1AAAA:8 a=DcZslMNVA2AqAjrU8LsA:9 a=QEXdDO2ut3YA:10
 a=rsP06fVo5MYu2ilr0aT5:22 a=zGR_d48pMUbmtCY1HACo:22 a=9bw_jnHfPby8klRCszyn:22
 a=ZCPYImcxYIQFgLOT52_G:22
Received: from roof.metalab.wien.funkfeuer.at ([78.41.112.119]:58072
 helo=[10.20.32.92])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1spTKa-002c8X-0T;
 Sat, 14 Sep 2024 19:30:56 +0530
Message-ID: <b121fe8f-181e-45e8-9c2b-3cb9ea454d01@linumiz.com>
Date: Sat, 14 Sep 2024 19:30:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240914125406.3026002-1-parthiban@linumiz.com>
 <20240914151609.520c70e7@windsurf>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20240914151609.520c70e7@windsurf>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 78.41.112.119
X-Source-L: No
X-Exim-ID: 1spTKa-002c8X-0T
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: roof.metalab.wien.funkfeuer.at ([10.20.32.92])
 [78.41.112.119]:58072
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 1
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNS8MBe/GHYK1jZWHkzDI1H/nGVuhJUUEV7FyvJQE+7u7BxqZHiP3RuPDkETvjKJhJG5GsiHk7W2OlwcCk7ngLm2LXFJUj3vvPJMTN/eardypxxMJln/
 oFZmqLNOk51LLynEb9mQrYn9aB4/zs98uafwAXgeBZp2WUeKhVhMxe1ZBsjsoOpNBVoJCmKZy3Ing35uDtcFDI6c2U1f+RnXbz8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=linumiz.com
 ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cJQrh+VvqaDbWVBcbjLegB6wYk8pXO9Vwo4LRnTq8Bs=; b=IPT2qsxRYZtvmET6nbx2J2yR12
 9sSHPtxqNNFXJaWrDsA1i0TBiTgipbi+AFZc9Q4PBGKvdjf6APH5xkFIN7IhGaBPqUMCVrIKwAul6
 CKaQcjfnMnQjEG2n96sQZQNKsABPL/hGENL/fEtZbtdSj5tqmf2uVUr+IU0116LBsqbIoSFghjveV
 Qb1fxXBrpYjtZcV1y0oCrYczJhvRqfB0A8vwYdwsx/7Pu+ug4L5Dw+hbfJp9nBJyLIGoy9yeCeW+A
 HijWN8FgzptNBWaSTHBxkskf24o7TdHNviyICNekUuNDz+Fzpmc8cpM+FMCVdIAHWNMFBSG1djA4y
 Mdke+YcA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linumiz.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linumiz.com header.i=@linumiz.com header.a=rsa-sha256
 header.s=default header.b=IPT2qsxR
Subject: Re: [Buildroot] [PATCH] bluez5_utils: disable asha profile
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
Cc: parthiban@linumiz.com, buildroot@buildroot.org, marcin@bis.org.pl
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 9/14/24 6:46 PM, Thomas Petazzoni via buildroot wrote:> Hello Parthiban,
> 
> On Sat, 14 Sep 2024 18:24:05 +0530
> Parthiban Nallathambi <parthiban@linumiz.com> wrote:
> 
>> asha profile as it depends on audio profile which isn't selected
>> by default (BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO), results in
>> below linking failure.
>>
>> ld: profiles/audio/bluetoothd-asha.o: in function `get_transport':
>> asha.c:(.text.get_transport+0x2c): undefined reference to `media_transport_get_path'
>>
>> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> 
> Thanks for the patch! I believe it's fixing an autobuilder failure,
> isn't it? If that's the case, then we like to have:
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/75cd510e55d50a1a2da6e9e285ec7a09201d854a/
> 
> in the commit message. Of course the reference above is a random build
> failure. Could you provide that information? I don't think you really
> need to send a new iteration of this patch, just provide a reference to
> the autobuilder build failure. But for next patches, you will know it's
> something we like to have :-)

Missed it, it fixes: http://autobuild.buildroot.org/results/317bf4ad2593b1d1a8aec82cc0b3265285f00b7b/

Thanks,
Parthiban N

> 
> Best regards,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
