Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7381C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 07:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4120F81E90;
	Wed,  3 Jan 2024 07:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4120F81E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVHgYwUIdY8J; Wed,  3 Jan 2024 07:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A43A081973;
	Wed,  3 Jan 2024 07:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A43A081973
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3591D1BF27E
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 07:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DA9360BE2
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 07:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DA9360BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xaLbi1lR6fKI for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 07:07:37 +0000 (UTC)
Received: from smtp33.i.mail.ru (smtp33.i.mail.ru [95.163.41.74])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF129605BE
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 07:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF129605BE
Received: by smtp33.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rKvLg-00D8vM-13; Wed, 03 Jan 2024 10:07:32 +0300
Message-ID: <3ae959ef-3041-4900-97cd-0ce32f68ba26@inbox.ru>
Date: Wed, 3 Jan 2024 10:07:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240102224108.2515943-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
In-Reply-To: <20240102224108.2515943-1-fontaine.fabrice@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9F008C97756F746CADF20BED058D54BDFCC27A1D840D02C46182A05F53808504001DE227C8DBF531471D4E58DF735C77831C9C30DE826839FD57DB6712AAE6524
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE79145AB6E9E75F07EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637531CC3E3F637A59A8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89A80CBCAC7BF020A0C69C083EE27EBAD6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7850F8B975A76562C9FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FF04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B292D688DDAD4E7BC389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FCF1175FABE1C0F9B6E2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BAEB924C2B054B06E75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A5197FFEB60DCCBFC8A09D24D3866110CCC76A1C6C3344E159F87CCE6106E1FC07E67D4AC08A07B9B0A7DFDF579AB090EFCB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFDCD21DC64A7D9C02BA0F41C681442C853C271BF32E976BADBF77F8D455F206FBE125D5F9813FCCC5B477C3CC75CCF19283673A98D9AF9023526CEF4DD378E4D640B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVwURT5GdYzVJ97SJ9lRwzA==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE3395D30FC6223FFB2CD3E2EFE3BA01F4C398CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=nQ9qfY/H9xSC9AaQcFkm0//FWTW1XCJcdC4mv59/zTk=; t=1704265657; x=1704355657; 
 b=AbP9cpCqj/i+J3kS8KIXxz4e34ZAz8LE5LhkTQmsDPZpOPunm8TUc/8dpP9MdqMUeq3Kh5Rp1Hi
 8OtsN1nmRKmXgHx5L/KKH8Y46wJDiUyJLZ0njQqL0J4UvKSOuT8UxhL+cffOUNjuE5OyLUZXljyaz
 VTFWVpd01fG+FQcQIDmgcnk5/U0g6xlvGwuWjDagToSLGaMcr93p47LbIA/IqDJ1yrTlFMOcgTmzf
 37/AemvQaCIQmdG1eUATYC7doDBx41hRqhW0wJXr7b19e6WP99MxQQZr0wihR1Pn0CGq9lCCSEaBh
 kerE24b0awBRLOae93Qn1W7VZFnSlLwAOwIQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=AbP9cpCq
X-Mailman-Original-Authentication-Results: smtp33.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: drop autoreconf
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



On 03.01.2024 01:41, Fabrice Fontaine wrote:
> Commit 1718c2ba6a4db1461b2490aa42ca4f0a2112adae removed all patches but
> forgot to drop autoreconf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
