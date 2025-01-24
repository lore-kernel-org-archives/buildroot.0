Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7007CC02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 21:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2887480F92;
	Fri, 24 Jan 2025 21:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwowhtXN4Nws; Fri, 24 Jan 2025 21:03:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22F2380FA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22F2380FA6;
	Fri, 24 Jan 2025 21:03:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65436941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5320280F92
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCIfqpsPVCKu for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 21:03:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B42C480F69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B42C480F69
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B42C480F69
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:03:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.116.19]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryTF-1t60Iy09R7-00mXhn; Fri, 24
 Jan 2025 22:03:09 +0100
Message-ID: <e3929210-5754-4794-93b7-262539f36552@gmx.de>
Date: Fri, 24 Jan 2025 22:03:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250123144032.1429434-1-fiona.klute@gmx.de>
 <e194f1d1813c5be0c9d4a4e95076c0f1@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <e194f1d1813c5be0c9d4a4e95076c0f1@free.fr>
X-Provags-ID: V03:K1:VOBAlo9Kl9cg3tr2NvxHovzeH8VJLkfe5BkeaXEay48xO42toJe
 /5P/gLQhS4C/amUQy61WpWaW1leEtVFIs1OTlrVpzr5dIKJtmeAFEAjDdcrIu0pmX2uud3E
 FA8J0IPN5oH9uv/WMWZwnqVsU3CZFIS6TqFwOUBn8+vyohC6Zd7NQtRKrVdZArBOI+NiBXz
 y/FU+ooQ3bG3ZyxlOJjrQ==
UI-OutboundReport: notjunk:1;M01:P0:QvArUnRawN8=;HJmgCpWNAmx54Uv8VXVxuocLaDW
 Co+nqlEB1CyJXsboSK1izAwqbiBYpHRvGFTdpLibCbxkxFfjG+mX/+Fjo+BCe0mvr5MAFyMn+
 0OEB9e7Ot2gcwH9WWdbGYVgF2/z/gxv9N1GZjtoV/NwaRKKEtQW7n6DxZ/W7v+C4u5Mo3eUCw
 q6QTQjaJo3+XrNOZWYh6jn92Zgd8hBZj+fMsxGuLGN90uLwMHfPYxkc+HdueQklvoP4wcnU0E
 iG8QNIJIpE2MecBE7AzDf6uP3LX+xMNpBV2SuDpbYsZ1wbEHwVidP0tIzOaPWQ69yZiYrBnVc
 CdTQ0RI71sVF4mxPCaq9gYziprr408wQmRv8O7R8BR+NSKlZHL8LAjcZf12pGGH7HjrCDc2jv
 gIiAsEEux0XCIimAS+S2kBEckjZonMhO559DWAczPSNyD+nxzVetjqKJHhOYIHyfCv48UogGD
 oseh1djpXfjUkAI35wdGUIPOB8MiW8LP4cM9yTuW6fHy97xBd8F7RkXD83JC7UlkZvrvtgpu5
 AoZRhVnlxsujwFHayvheariw4OE7UZORRPDUisql88YrYoK2u0EV27fLXKyhq3eCtjV+YYGUh
 IxGTqHq3bgrdUiPnFrQotIwSa9nZXqrb52Nx23+itvtIUPBurPWDR8+bauC9t56RFaBR4Fk0e
 axV0kL9QwZUxEoBFWgOXysiCpvkGBwOMLpEGHAqO4KBP1m1lnz02vXbOpBHQZoAcldhY1vIx7
 d+xjpo8CH5fnSmhyBpNtVHbhSax8HlUgBNNlaGRNXlxtbF26IFUb8E0daWI1i31oshnUTXALE
 dyuXSai9CbRpEmXraaNQI5WYdR2Mpn2vBg7D5IrEJKH6IN4+EcQJ99h/NZPJaKLo9BkMFkGtd
 +joTY/nKcXeQK3gE5za5JC0gQCxP0YAogrzdK4m7MOENtkPHEtxyvUwPpk5NzdP5UWSFzwgpM
 fGfXEdtkClTR0cgcpn0pEJ1cnNlx7Kk6fqBbEJenAjav8wBaH/cfaO1ISkuMDO0JppPRo0Q5P
 yM3Qp3umJ1Mb82i7cm5qDYqYp7QGbgkGsgE1l1YGg2fDngXv1bRW1bba7I3Rdp3Wk/G1If3Mg
 NY10oCJiKfaKG8oEvJA5rWKTdebJvJktFRehfFlHtQKFqnRaoXpuVe18StyKjg2dkuM9dZ74d
 lPrlNuuL305/bxUnfP7GhH5ArFpsxo4BazPirQIeyeS8b3bEzc0slmwGo7f6B3l//OyxOHYCu
 v5ceFd1q2fGU
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737752589; x=1738357389; i=fiona.klute@gmx.de;
 bh=wVphHwa34iP48oQtO3GdjKxRssDFuIohHIwuSxCRc0c=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=HDlwBJdUcTZoSedBX5LQPVxZowP8ARf9leTxxo/vXNzggajRDVYD+cQMrQK/a2+S
 OucKnkIwnzfOZ+gxHQxtgP6Oo1PCdnlgraG9TlVQQhC5yeDcY2wOc81lBPAt34Uty
 G3cHBl4u1garmF608K+H4q2iQnEnxxEd4nIFENWl/OpI8gCVv4nWOiPRF05pHRbMe
 NJVHRpJSOZd2odlSAgTgUAQRQcSQwN6Ox1DPKuPjr8j6W1+Jbq2fjcThwoIlK8NPa
 N1K38tAA5yfAhtaA2+oH+5n/4R3GZUAAvvEl3xF0LdiWz71zgeC8O1D8PUc4q3pr/
 nRUL5EODEje7vkzT9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=HDlwBJdU
Subject: Re: [Buildroot] [PATCH 1/1] package/panel-mipi-dbi-firmware: new
 package
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

Hi Julien!

Am 24.01.25 um 21:05 schrieb Julien Olivain:
> Hi Fiona,
>
> Thanks for the patch!
>
> On 23/01/2025 15:40, Fiona Klute via buildroot wrote:
> [...]
>> diff --git a/package/panel-mipi-dbi-firmware/panel-mipi-dbi-
>> firmware.mk b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk
>> new file mode 100644
>> index 0000000000..c3a9fa7afc
>> --- /dev/null
>> +++ b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk
>> @@ -0,0 +1,35 @@
>> +################################################################################
>> +#
>> +# panel-mipi-dbi-firmware
>> +#
>> +################################################################################
>> +
>> +PANEL_MIPI_DBI_FIRMWARE_VERSION =
>> 1cbd40135a8c7f25d7b444a7fac77fd3c3ad471e
>> +PANEL_MIPI_DBI_FIRMWARE_SITE = https://github.com/notro/panel-mipi-
>> dbi.git
>> +PANEL_MIPI_DBI_FIRMWARE_SITE_METHOD = git
>> +PANEL_MIPI_DBI_FIRMWARE_LICENSE = CC0-1.0
>> +# license info is directly in the only source file
>> +PANEL_MIPI_DBI_FIRMWARE_LICENSE_FILES = mipi-dbi-cmd
>> +
>> +PANEL_MIPI_DBI_FIRMWARE_DEPENDENCIES = host-python3
>
> The script mipi-dbi-cmd does not seem to depend on extra host python
> modules. See:
> https://github.com/notro/panel-mipi-dbi/blob/main/mipi-dbi-cmd#L15
>
> Do you think we could use BR2_PYTHON3_HOST_DEPENDENCY instead? See:
> https://gitlab.com/buildroot.org/buildroot/-/commit/
> b98062f7301bc72d2a59cca733f36525405d3bb9
>
> This could save the time of the host-python compilation, in some situation.
>
> What do you think?
In principle that should work, but as far as I can see I'd have to add
some logic to search the Python interpreter in that case:
$(HOST_DIR)/bin/python, python3, or python?

I suppose the elegant solution would be to store the detected
interpreter in a make variable from
support/dependencies/check-host-python3.mk, and the host-python3 one
otherwise. I can add a patch to do that, but the naming scheme varies
between the other check-host-* files. Would PYTHON3 be acceptable, or
should I use BR2_PYTHON3? Something else?

Or would it be acceptable to just use "python3" and break in the (likely
rare) case someone only has "python"? I don't really like that option.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
