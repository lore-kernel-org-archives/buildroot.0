Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200CECD8CAC
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 17:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D124161441;
	Tue, 10 Oct 2023 17:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D124161441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9jRrhxBDuL99; Tue, 10 Oct 2023 17:03:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26A6C61476;
	Tue, 10 Oct 2023 17:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A6C61476
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66F091BF94D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4080640C3F
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4080640C3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QIfKZAer4E7P for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 17:03:09 +0000 (UTC)
Received: from fallback3.i.mail.ru (fallback3.i.mail.ru [79.137.243.69])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF01C40185
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 17:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF01C40185
Received: from [10.161.55.49] (port=58016 helo=smtpng1.i.mail.ru)
 by fallback3.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1qqG8O-00F3H7-CO
 for buildroot@buildroot.org; Tue, 10 Oct 2023 20:03:04 +0300
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1qqG7z-0001WT-GQ; Tue, 10 Oct 2023 20:02:40 +0300
Message-ID: <9fb1ef66-66d6-460b-bb12-9ed8f067947a@inbox.ru>
Date: Tue, 10 Oct 2023 20:02:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231010164554.2954023-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231010164554.2954023-1-adam.duskett@amarulasolutions.com>
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9FE0487E5024681463971A198FEAFF48D04BC93A1B985244400894C459B0CD1B932CA6AA44A6419C159BB6BE43E3C43AD795DDC52E34AD8C831DEC98D3E96EC86
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72D1683D4B1F6A6B5EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378A9F193E39E334918638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8CB4BEE122A5BEC5F54C16CE12D07EE8D6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7A6779F98BF527B7A9FA2833FD35BB23D9E625A9149C048EEB1593CA6EC85F86DF04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BAA1C5B227563B4AFA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C22492610E1DCEBCBDF8FE827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B68A0907C648FB30DE089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A5E267D46D91B13A19C8B10005380E8BC9A66BDD7519697AA8F87CCE6106E1FC07E67D4AC08A07B9B0457EE4B4996FC546CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFB1D877038DB05F4D69DD86738780973EDA012984E7B90A489F4E6B2495E557FE1F616861E982FD8FED8146B44B5935896DE228C5E68B7AC0A131DDD66E678032E48CAC7CA610320002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj7Bv9MRqw1O25qTdbfj070g==
X-Mailru-Sender: 689FA8AB762F73930F533AC2B33E986BA276E70A3490E5F35C684970B0854AB798CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B409B553941760C29ED6BF4260E3AC7CD270A38268E04AC444049FFFDB7839CE9E16443AD944D104F7AA0E3CDD234AFAE0137EA2CB597BFEC623AE24EE4E8E789E
X-7FA49CB5: 0D63561A33F958A5532464D0E543A5109692B23B1049299BE860E5FB443034B1CACD7DF95DA8FC8BD5E8D9A59859A8B6421BC5C7567F071C
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFdYKUDEJFrOeCkmpFK+h3UnQ==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=1qq3l+Q76dGdpVAyKX6hJfW0bwCNcWHQg/B75nu7+is=; 
 t=1696957388;x=1697047388; 
 b=ucl8lXVWBnbw+fOww/rxtC+0gM9IhGTXXa413TxBS0VT3BjrwkwgcxVPwCN5F+mf3qon+Fl6TDnlUlDKDHxLHWrzbhwvq9PqCHRMF5SItE7/fpC0BHYyy3REVGAKR/S1FzcTemTa4OWlcw+Tx3sv3IF7r12V9wag8AEKtYQYQeklXZqfLactAFoEN3s6HF37Xhnwt8/8A4zM/f2v1kJV5GFZOV/y7mqIZ3Ln6lH0Ki1EGmowl/eB/lJDlANdcVAuH/MH/slEA99gWpsH41HRnbRxPygA0lr3cVrtS8qCZnAVR+vtAA0HN1EZX9h6mShwX+Xs795MbpzZyqNIeiI5Kw==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=1qq3l+Q76dGdpVAyKX6hJfW0bwCNcWHQg/B75nu7+is=; 
 t=1696957384;x=1697047384; 
 b=t38VzbVmDDNMNj7C0Wt46KFcnBHHwN/msCcHoH5FuSN0C/igOLHm6c2VPWrt+GyeU0CPIIx6frT15pBOOyzsRca1CYbbKh0neS4Evk4IZdoZe2COeo/Dedp/SdN0Du8yeSb42VoAvFSVO1RP2bQo17eVKiv1NPi9aqf9rcpaRbZCKr+1TCAJh+0CYF/n1kEUa3SptuukVNShLoZJyX2VEcNRVZUyDmE8l+htmf2Mbn4bEGyb/PocrQdcy16o3hzKwKwohj2rMijFk0UwGj34vOtzPiLU6WvKAxGZww7F4Y5EpDBO1vwwmYt7QBT3b196rVG1q3ds3GCnOjfAXK6riQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=ucl8lXVW; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=t38VzbVm
Subject: Re: [Buildroot] [PATCH 1/2] package/postgresql/postgresql.service:
 set locale for initdb to C
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10.10.2023 19:45, Adam Duskett wrote:
> From: Peter Seiderer <ps.report@gmx.net>
> 
>  From this patch from Sept. 20, 2020, postgresql.service is still broken on
> startup:
> 
> Postgresql systemd startup fails with:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
