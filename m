Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A554BC77B7F
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 05:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F04942D34;
	Fri, 12 May 2023 05:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F04942D34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fa7k5mSkF1_t; Fri, 12 May 2023 05:28:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 689F042D39;
	Fri, 12 May 2023 05:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 689F042D39
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AA3E1BF593
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 05:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5462042D34
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 05:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5462042D34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CErKPdAdkMoZ for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 05:28:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C37F42D2A
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C37F42D2A
 for <buildroot@buildroot.org>; Fri, 12 May 2023 05:28:18 +0000 (UTC)
Received: from [2a02:2698:5c2b:1696:8c16:b05f:33be:f94a] (port=39510)
 by smtpng1.m.smailru.net with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1pxLKB-0002hk-In; Fri, 12 May 2023 08:28:15 +0300
Message-ID: <66ab6f66-1abb-579e-8555-234428a0fc3f@inbox.ru>
Date: Fri, 12 May 2023 08:28:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20230512052620.372820-1-bernd.kuhls@t-online.de>
Content-Language: en-US
In-Reply-To: <20230512052620.372820-1-bernd.kuhls@t-online.de>
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD937A220035D8EB644C22572A5ECB921CD9764E2CB84E6B2C31867C24CE74E72BB5FE18E9CBFBE7C070E2FDD16D793D7F0DB2E9EE8C3F80A45C27D29C7A3054D68092611B121F4B2B0
X-C8649E89: 1C3962B70DF3F0AD5177F0B940C8B66ECE892A7B2722663E91682638B966EB3F662256BEEFA9527FEB9D06AB479A84F01447F64550417A1066D0C0DC5A7E1B0A3866A6DA0C1745BA50DC8F738AAB664B37FD76D11AF80A0DB7FEDD4E44E6DD06E8D91F9CBB55BB85EA455F16B58544A20F8CC89F905D8FE8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj/wax08AvnvOTUZS1mMbIAA==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF54611F7BC635EBC6899C153ABA0CE5AAD98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=yNUmv2U1ebd0HNapcGupxF/tJ6e4DtU4wheyHq1u8ts=; 
 t=1683869298;x=1683959298; 
 b=ESKVpfpUmdRkqfEovzMw8hUlBO/DiXRDwkrvnSQarrXLTzYDf/vLDZM3YiOiJYHsDW1OpoRvh+a8WOAGb6278wB6r+q7P2/1KMf9o0xTHLENrqsc34BEqwFJc1+da+SoUMx0g+N5JIOURJ5LcXC2NKGAniUyu5fgNfR0JjMWYx3UOQIMB86BwOhaYIglu5X1YZ5hBO+7j3HX7q/30gp1DuTkBWni5AdOvNQaBu+uAzCQFVR1Ib1N22t0/AVm0F8TnZ+oms/6eSCKXl4V/sGbWSbDd7vAb2pohUK7+Ky5e0sku4qBaZ8LxRa401NXglFuwZpJ2tAKHXgxyxSg1AbfCw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=ESKVpfpU
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 15.3
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



On 12.05.2023 08:26, Bernd Kuhls wrote:
> Release notes:
> https://www.postgresql.org/about/news/postgresql-153-148-1311-1215-and-1120-released-2637/
> 
> Fixes CVE-2023-2454 & CVE-2023-2455.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
