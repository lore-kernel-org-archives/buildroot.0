Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5453ACCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 19:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00D8081A15;
	Fri, 10 Oct 2025 19:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emCZF1IfUat1; Fri, 10 Oct 2025 19:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 162AB819F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 162AB819F6;
	Fri, 10 Oct 2025 19:32:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE00B31
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 19:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 940A74011A
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 19:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4p_OkjFgDovq for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 19:32:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E89F40116
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E89F40116
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E89F40116
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 19:32:21 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id 7Iqgv9mMbvoVF7Iqhv8y3j; Fri, 10 Oct 2025 21:32:19 +0200
Message-ID: <46cb2cf3-e3be-45d0-ab5f-53fbee9b263b@benettiengineering.com>
Date: Fri, 10 Oct 2025 21:32:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Christian Stewart <christian@aperture.us>,
 Kris Bahnsen <kris@embeddedts.com>, Sergey Matyukevich <geomatsi@gmail.com>
References: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
 <20250908192435.214306-5-giulio.benetti@benettiengineering.com>
 <e6e23b2657445822512e036a7f8876b8@free.fr>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <e6e23b2657445822512e036a7f8876b8@free.fr>
X-CMAE-Envelope: MS4xfO8dTuR2El4UTjTur+nDfzWEQmfVMMVx1buT4QddGzUsTyWSGdlUX3qJ/3jO3d/O1uR10JMWf0/hjGG18qm91L/tsf7BoOHVLH5Vd7N/xwkVlUd/w+cy
 itzdUL+/CO9TnVkTaCYCfNKG80l1BdSKjv1anaehab8ML1TQVqJIpUGYva5M6e6S9Q2Zy6ddaHfUywOc2Jn4nagehoWYZckDD/6QHOAvUvl7bhTBjl/4gbHv
 HeQcyHtK7VFv2BtB4DmiPPMvs2ViIFLwCL60hGXD9YjrU/IDVUjzHaz+6TWpx85UlCESB4/dnukzeTOR54KZN6bVHTdgPeQ1FQQIaFJT3DeuM81amG9njN8f
 G6oJyP+Of5dQVD+j0ZRzArvi7DPtcg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1760124739; bh=kfSyS25VSACGj/aP2iYSzkz49Cy0n0wiczOSPvxbgy8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=NmGdSKEyxsDT0UAM1sDCINXpeZEFNggF+Db6GmDgHF7c1BbfsrZJ6ZfYAg/wpwgz4
 kz2TcVyV0PMD0ZBH1ZG+d4ScbPTQOYchvjZqogasiHeIt9gdEpmxttCtHRRe12DxK5
 KtML3hPCJuekz7b8S8eMudGUjlwlmib/wTq/JGe7EjwLwOrWj24QbxfgB2tX97sWmT
 lpWkTM74vJkm+Z8LpkFzoxIPnhFV5QVj2UpsGVqQ5qkvOymauu1Xakl5AQcBcjKUf2
 Njts0TgpR27rFkFLynZgWUPMgeuKrYDoOk5hxigXIsSR2WWWk+nClun7U2Ig4Ec1/o
 y4bLiEdak66aQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=NmGdSKEy
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

Hi Julien, Kris,

On 9/13/25 13:47, Julien Olivain wrote:
> On 08/09/2025 21:24, Giulio Benetti wrote:
>> Add a local patch pending upstream to fix build failure with Linux 6.16
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Applied to master, thanks.
> 
> This commit adds the fourteenth package patch to wilc-driver.
> The package is currently at version linux4microchip-2021.10-1
> and I see there is a newer tag:
> https://github.com/embeddedTS/wilc3000-external-module/releases/tag/ 
> linux4microchip-2024.04
> 
> Could we reduce a bit the number package patches by bumping
> the package version?

Sorry for the very late reply.

As pointed here:
https://lore.kernel.org/buildroot/6b3b8dd5f1a4229c813d29b449a655cfcc74ab29.camel@embeddedTS.com/

they have 2 different branches that reflect Microchip ones:
1. 2021.10-with-community-patches => old kernel versions check but some 
potential bug. I keep opening PR I know that will never be merged AFAICR
2. 2024.04-with-community-patches => no old kernel versions check and it 
had to be maintained, but last patch is from 31st July 2024 and only
supports Linux 6.7

On Linux Mainline there is no support for wilc3000(WiFi+BT), only for 
wilc1000(WiFi only).

So at this point I could take over 2021.10-with-community-patches on my
company Github Benetti Engineering and keep patching for new Linux
versions the same way I do for the other external drivers in Buildroot.

@Kris: does it work it for you?

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering
https://www.linkedin.com/company/benetti-engineering/
https://www.linkedin.com/in/giulio-benetti-79975951/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
