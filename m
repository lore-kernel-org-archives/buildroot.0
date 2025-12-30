Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FB9EE4992
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A30E60A97;
	Tue, 30 Dec 2025 18:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvHmeV9VsWuB; Tue, 30 Dec 2025 18:08:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55ED860B44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118116;
	bh=hH23BtdzWANCRLTMxAczwR1O+Sao/Cfuu9ooKf3WN+s=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Of7Mr1lkpSSSMIKNQsxdZJ7avua4LcWJdJ3AN1hOuKNXm/pFsNhMLJL+juKZLwyM4
	 QipBqGWWB6IhD7w/RikGg1AEr+bnsS64GzrloV8UXxsfhgRgHEjPublppO1X5OnaNQ
	 Os8BhXQ+WGirvvmbecJ0pRAXWh5pxu6s3CibTjAqulyUjSw5u0wUm4rYZb1GVqoYDj
	 Jk88+Oz/ukU4/IE1nJXECCtHOaOLPsRfprmH/BMhQMtnpcF6poqAYDnEcxUvtIjDG4
	 wUGWa6W6ZYSSkt29AFAqGvH34tBxRp6GaxpnxE/To7X7/NOItag6ky6ySVIAaYOpN6
	 UQM+IIt4ydrgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55ED860B44;
	Tue, 30 Dec 2025 18:08:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E073277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F8AB60B44
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MucNuksbCmdR for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:08:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04AC160A97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04AC160A97
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04AC160A97
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:08:33 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id ae91vr0GBclBZae91vEuua; Tue, 30 Dec 2025 19:08:31 +0100
Message-ID: <1090d85d-da27-4a5f-9c2c-c961733be798@benettiengineering.com>
Date: Tue, 30 Dec 2025 19:08:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kris Bahnsen <kris@embeddedts.com>, Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Christian Stewart <christian@aperture.us>,
 Sergey Matyukevich <geomatsi@gmail.com>
References: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
 <20250908192435.214306-5-giulio.benetti@benettiengineering.com>
 <e6e23b2657445822512e036a7f8876b8@free.fr>
 <46cb2cf3-e3be-45d0-ab5f-53fbee9b263b@benettiengineering.com>
 <6d56490e-3b6e-4c11-be84-c81b6f33ae47@embeddedTS.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <6d56490e-3b6e-4c11-be84-c81b6f33ae47@embeddedTS.com>
X-CMAE-Envelope: MS4xfLNv1jhoeLhERIz7TvixXcfsYLIKHAvMAMweRFEjUUcZYwgYST68ItGuu9fx+XKXwUi6gadzmtDu8beoyYiZZQurigcwhuh3VZayXgNIhy1UzowY17pd
 giz2sTor79pZjpXfIgltuvbyXd7/S/05g22608jebi3+WhVWl0piaoD06t39LNS0CAnTjAi8hCCBra2wb0isADkvKhG5kirgzXTf3LzaqjpqFEZwQu94yH18
 fFJC09RBBcgSNTOjLNF1WbviDD+Z4Bfr+pHbi2R0qyQONqPauOYYfeMKBKnuERS0xOxq89x+ru+BiQwGWdkenXSw8n2YTqjhNay7f6bBmiZK/maIbGL/bSrj
 kdV5ctjDhby5zTmSaQARrrHCG/aHyA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767118111; bh=gvkgA2p0ToUSY2wAr2tawFuV3yaga5xVNFx8tNtS2AA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=PjMOSmNvu2EeyovREyhEeoxf792FRoA54RW3YVrCenj68Z2xc8mJQyK6yg8SIsYPH
 1NIgyeiHyTOOBYnN8P+8lDVoMQ/HgAxRqyP5cZGZ0i9iP2j54vO/1yrwqai7I6h0Dh
 HKJcjKRz0VfwUeuywQ3dAQp7q98iGw3J8ayDUokvyo4w7ZKLaZg/Z0v6ifvbhmIH2k
 buhZQoQ2b2EchkVtGms35RJwavVyhrOFheNkEAoH4MsrXWDzgSLcXP7QrAlScIrjiD
 dyb4due8wNbAuOsMIePfHUGELIgdKiG/DNfZAg7+JvKj10j8XDNgH7ltStd57QIu5q
 m1anwV4HIEj3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=PjMOSmNv
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure with
 Linux 6.16
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kris, Julien, All,

I've just sent patch to redirect to my repository so all local patches
are committed upstream:
https://patchwork.ozlabs.org/project/buildroot/patch/20251230180544.2537568-1-giulio.benetti@benettiengineering.com/

Best regards
Giulio

On 11/10/2025 01:57, Kris Bahnsen wrote:
> Giulio, Julien,
> 
> 
> On 10/10/25 12:32 PM, Giulio Benetti wrote:
>> Hi Julien, Kris,
>>
>> On 9/13/25 13:47, Julien Olivain wrote:
>>> On 08/09/2025 21:24, Giulio Benetti wrote:
>>>> Add a local patch pending upstream to fix build failure with Linux 6.16
>>>>
>>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>>
>>> Applied to master, thanks.
>>>
>>> This commit adds the fourteenth package patch to wilc-driver.
>>> The package is currently at version linux4microchip-2021.10-1
>>> and I see there is a newer tag:
>>> https://github.com/embeddedTS/wilc3000-external-module/releases/tag/ linux4microchip-2024.04
>>>
>>> Could we reduce a bit the number package patches by bumping
>>> the package version?
>>
>> Sorry for the very late reply.
>>
>> As pointed here:
>> https://lore.kernel.org/buildroot/6b3b8dd5f1a4229c813d29b449a655cfcc74ab29.camel@embeddedTS.com/
>>
>> they have 2 different branches that reflect Microchip ones:
>> 1. 2021.10-with-community-patches => old kernel versions check but some potential bug. I keep opening PR I know that will never be merged AFAICR
>> 2. 2024.04-with-community-patches => no old kernel versions check and it had to be maintained, but last patch is from 31st July 2024 and only
>> supports Linux 6.7
>>
>> On Linux Mainline there is no support for wilc3000(WiFi+BT), only for wilc1000(WiFi only).
> 
> Note that the WILC3000 Wi-Fi is currently supported upstream, its in
> 6.12 LTS. But BLE is not supported as part of 6.12 (and I havn't looked
> in some time to see if there was any update on the state of it).
> 
> Until both are supported, however, we're going to maintain the
> wilc3000-external-module as best as we can. Likely meaning only the
> latest LTS kernel support due to time and testing constraints.
> 
> I would love to get your patches merged in, and its on my list, but
> my time is unfortunately been directed in to other things. Currently
> the 2024.04-with-community-patches supports at least up through 6.12.
> 
>>
>> So at this point I could take over 2021.10-with-community-patches on my
>> company Github Benetti Engineering and keep patching for new Linux
>> versions the same way I do for the other external drivers in Buildroot.
>>
>> @Kris: does it work it for you?
> 
> I have no opinions either direction. If you would like to fork and
> maintain the external driver in that capacity, you are welcome to.
> 
> For the time being, our plan is to certainly keep it working in the
> latest LTS kernels with minimal patching outside of what patches
> that Microchip maintains in their kernel.
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
