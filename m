Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540EACDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 06:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CEE981CA7;
	Mon, 16 Oct 2023 06:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CEE981CA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zh6DvrKsADox; Mon, 16 Oct 2023 06:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9584D81C58;
	Mon, 16 Oct 2023 06:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9584D81C58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 345161BF23C
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 06:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06AC0400DD
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 06:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06AC0400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0nhgadJWT5aO for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 06:18:08 +0000 (UTC)
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3663F4119D
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 06:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3663F4119D
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1qsGvT-0008W7-FE; Mon, 16 Oct 2023 09:18:04 +0300
Message-ID: <586a020d-5a67-4025-8263-08c74a6372fc@inbox.ru>
Date: Mon, 16 Oct 2023 09:18:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20231015201204.1277675-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
In-Reply-To: <20231015201204.1277675-1-fontaine.fabrice@gmail.com>
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD978AFEFB3096932CF8220711250C2C7F14874E241AD7DC2F9182A05F5380850408F2EAF463D392ADDD0718B7C29C7D0A53A45321A6B07BA8ABBD1A63114EF44B5
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BC08626EA5717D14EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372CAA106849E7D531EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BE5CCB53A13BC8DBA7BF92A84B0A68226BB50DAF608CAC9F220879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0A3E989B1926288338941B15DA834481FA18204E546F3947CB355ED1E20F5346AF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063770DAEE4257ABEBB3389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC55B19328CBC4F849E2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B851EDB9C5A93305EEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A5136E375C2241B135D0BCD2FEA8FDB85698AA64CE66AD7F04F87CCE6106E1FC07E67D4AC08A07B9B0724336BCC0EE1BA8CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF0F0EB6B6FB552D0B65D681E9C87461CC9687FD4FC86557372EAE7E0ECBB36791A5CD7B9A90500322EBFDF7752E1FC337025A1E5D8B99555376604C66E443486940B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojaEe5+VLEN6kHceeTjLkyMQ==
X-Mailru-Sender: 689FA8AB762F73930F533AC2B33E986B19B40BC7BE256BEC8D1B3CBD22AB4FD398CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=HlAZZyXYApAxrz5zcgTIlwhK2JQbophGyQ08+BXvwmk=; 
 t=1697437088;x=1697527088; 
 b=WToBfqotbKZ7MwhDaNeMLFpiFbwvcGE2b1r76NOyzrWhiwwtmBGgX+VirDsSmsZIMkvrH12Anz9sZ7dZ4bQMctdWUDJYrCa/WCjs5wTDDS61NWU76BGg5xwm5zPI7qtOXEAblOW4wRov82JsmgU196InVwXUHBry3s+domrilgqWG+BtOYUQFd3aoFAb++qaGATATEzCkc1bmmfOBtV92qL2eK4sYMjLX+3uNZeP0McGM6E2lrIZyAYTgvCnAb18gU601mSf3JS8Sf0WZ5AMitQigZxszvFsB7+VUf41Rwfqk3LlbGYUDztLSy0T0KxZx93PPrnYzFwscc+CE+x14g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=WToBfqot
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeos: drop
 DISABLE_GEOS_INLINE
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15.10.2023 23:12, Fabrice Fontaine wrote:
> DISABLE_GEOS_INLINE has ben dropped since version 3.11.0 and
> https://github.com/libgeos/geos/commit/1516e42eeae3b3114585f1e94a0e723d835f7757
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>


Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
