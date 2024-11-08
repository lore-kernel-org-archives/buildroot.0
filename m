Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB32D64097
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 22:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F9626144C;
	Fri,  8 Nov 2024 22:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T60H2mfxOtfA; Fri,  8 Nov 2024 22:22:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49D2461451
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D2461451;
	Fri,  8 Nov 2024 22:22:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 29195C2
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 22:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17AC461451
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 22:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Buc_mMmC1PSi for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 22:22:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 214706144C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 214706144C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 214706144C
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 22:22:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B88EF2003DA;
 Fri,  8 Nov 2024 23:22:13 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:38990])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Nov 2024 23:22:13 +0100
MIME-Version: 1.0
Date: Fri, 08 Nov 2024 23:22:13 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Buildroot List
 <buildroot@buildroot.org>
In-Reply-To: <b961c43d-adfa-41d1-b590-4e8989eddaf9@gmx.de>
References: <20241026162109.1055271-1-thomas.petazzoni@bootlin.com>
 <b961c43d-adfa-41d1-b590-4e8989eddaf9@gmx.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <3b87813bf1a9be617d48376f43cccd85@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731104536;
 bh=jSNfiQ3OLI+Boi+agDRJqD3oNyQDBTKmW6WJJSyw7Vo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VcJtiY5wqpjWZFUwlqCAiFyuMUas887RJIczVAI8uC4n43N/OYqNI5YODiRpqjh92
 TzB+0QNeIrZaaX0T5X9BD8qsLBMdIE+LiGFqlx545CvpAEA8CIdhdH2T99UtA8VUnx
 JqR9SOaFDJYwYt+38Uf8bVWGH2rOP36AXgMGw/OdSg6ZoaJutuDvEiifgUbF9MJEJ3
 /nt2Mc3hbW35eMocc+Jaz6MV13fyIdJeTDxqPl8L1Mpl4X8V2ng2YyjzSpi0fo1Ovi
 rcCbqJ1OxN6FlWH2rDzxcDk6FF4+Ycg2XXlWYhCkoaJ2XoFYRoRK9lsZ+92yH/rgXs
 l8ctXwPMPtUqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VcJtiY5w
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Fiona as a developer for
 all init scripts
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

Hi Fiona, Thomas,

On 08/11/2024 11:17, Fiona Klute via buildroot wrote:
> Am 26.10.24 um 18:21 schrieb Thomas Petazzoni:
>> Recently, Fiona has been involved in a very nice effort to clean up
>> our init scripts, and make them more consistent with each other. In
>> order to continue this effort, let's make sure Fiona gets Cc'ed on all
>> patches that touch init scripts by adding her to the DEVELOPERS file
>> for package/*/S*.
>> 
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> ---
>> Fiona, this is obviously a proposal, and I will not merge it if it
>> doesn't get your Acked-by.
> 
> I can't promise how much time I'll have, but I'm happy to take a look
> when I can.
> 
> Acked-by: Fiona Klute <fiona.klute@gmx.de>

I applied to master, thanks!

> Best regards,
> Fiona
> 
>> ---
>>   DEVELOPERS | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 409642f96f..8a14ed36ce 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -1098,6 +1098,7 @@ N:	Falco Hyfing <hyfinglists@gmail.com>
>>   F:	package/python-pymodbus/
>> 
>>   N:	Fiona Klute <fiona.klute@gmx.de>
>> +F:	package/*/S*
>>   F:	package/python-pyasynchat/
>>   F:	package/python-pyasyncore/
>> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
