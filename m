Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE7ACD6E6E
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 13:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E742282B49;
	Wed, 11 Oct 2023 13:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E742282B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G_bK--1jzoOE; Wed, 11 Oct 2023 13:57:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFEC782B75;
	Wed, 11 Oct 2023 13:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFEC782B75
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0126D1BF42C
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB41F82B51
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 13:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB41F82B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHFWe63XWHBV for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 13:56:56 +0000 (UTC)
X-Greylist: delayed 762 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 11 Oct 2023 13:56:56 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52D5082B49
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52D5082B49
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 13:56:56 +0000 (UTC)
Received: from [192.168.0.247] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mlvmv-1rGWO92cs7-00j0hU; Wed, 11 Oct 2023 15:44:10 +0200
Message-ID: <5d1cff30-4bfe-4480-8eb9-b07114d110cb@green-communications.fr>
Date: Wed, 11 Oct 2023 15:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20231011110932.4425-1-sebastien.szymanski@armadeus.com>
 <20231011110932.4425-5-sebastien.szymanski@armadeus.com>
Content-Language: fr
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <20231011110932.4425-5-sebastien.szymanski@armadeus.com>
X-Provags-ID: V03:K1:TG5Is1DOO0PyFmbafrOkJLOvpsXMxDYJd2/vWR6SrkxRjG3LpJF
 UV1rrkUiXXIjz92GkF+kpkKf7AS1rWDaz/VW5fRlv91hM4hUOp6ZbGYbL5PgC4zcTo3xsuF
 oGrsdMPKtSbL19lYcCxZ0frgV8ACOpWKWtLFj2NqZjhxpNwGH4CN6PzU8+B4+9ICXRiLW+N
 m6RssVnfpdryhUdnn92aQ==
UI-OutboundReport: notjunk:1;M01:P0:WJ7DCsVxK2s=;9lxFOGgsZtU01Ix5reCAKq9cWxi
 7N9JQlWfUiEr7AJ1xYMSR24YLDLdfVhMxdLY1UJMheDTeYMmiZ513CTY9hdiWVXS3b0jwi4fY
 TFMV5hqNveHstckvvwyLxscUVDQsG9iaKmtXsx+PjHzKm1wREHPdR+7oYl7TWCO0k8mW5FQU+
 EF13QnIoqrfz5MmupssnA6YY+kX+pto+0a205tSdMmYXLxJ2RnS4/qhVIuBDqRzEdGFl6um/A
 dR69MU4dz5orYb6F3KPnfRqAwLW50j5nOLTwwK+/VoM+WC6Tr4xbOXt9swij12uwnCfIY2G+S
 /jFBCnUD/yLaRQZnlgXQ1auXr5rivFtdLUEseiYn8UX9YhjzJcptqSmMUNWqkQ3krmwxqbEko
 9oqDEQlTHNiA3cDPfjdMphKGHjd3iicmbs4BgOfG+xmEecsNvStsrnDaAjE9dvP0ioNGsc7Z9
 TBRa3tDQiIcFFTfLNvtm2hZ32qCX8Jk5zUqrnzzifKbN8ssv1PTQHkRxo/jOPjf39xGzYtkPo
 9w/08NPrzW+XatgX0cVoYwhFLvTJA+2HlZ7TzlNlckhx76ROw78gtmVbgAldkJCu3qp4sNSBl
 swYhLrAqjvNvbQ6MCGMG1SZ90bTJ1nkVVujzZI1DOljX9KUW9DeFAgYXaCeTGbEE/ltxiXRtR
 FfOgPgPtHHhOrRti8He81+vFOUG0uLz3V2ueqgMPjakMoZBW8Z840HUHpUg68/RMfc3RzL72M
 HZRCimMK7W7G2ngQgDfMu9dPAmSHQnHl1mGcqfeP4iI+ednap/yQUB8Ts3qd5mSGUTUZJE0XH
 4Z4maLgUpfVZoeX/fO7o4C8YygA/0vSC+pOjw4Me+k/MremZXKLitIXxafF9PMoNAGMWmSred
 82X5wg/Wyrv8qMg==
Subject: Re: [Buildroot] [PATCH 4/4] configs/freescale_imx93evk: new
 defconfig
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U21hbGwgbml0OgoKT24gMTEvMTAvMjAyMyAxMzowOSwgU8OpYmFzdGllbiBTenltYW5za2kgd3Jv
dGU6Cj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvZnJlZXNjYWxlX2lteDkzZXZrX2RlZmNvbmZpZyAK
PiBiL2NvbmZpZ3MvZnJlZXNjYWxlX2lteDkzZXZrX2RlZmNvbmZpZyBuZXcgZmlsZSBtb2RlIDEw
MDY0NCBpbmRleCAKPiAwMDAwMDAwMDAwMDAuLmYwZTRhOTU5MzBjNiAtLS0gL2Rldi9udWxsICsr
KyAKPiBiL2NvbmZpZ3MvZnJlZXNjYWxlX2lteDkzZXZrX2RlZmNvbmZpZyBAQCAtMCwwICsxLDM4
IEBAICtCUjJfYWFyY2g2ND15IAo+IFsuLi5dCj4gK0JSMl9ETF9ESVI9Ii9ob21lL3NzenkvZGV2
ZWxvcG1lbnQvYnVpbGRyb290LWRvd25sb2FkIgoKWW91IHByb2JhYmx5IHdhbnQgdG8gcmVtb3Zl
IHRoYXQgbGluZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
