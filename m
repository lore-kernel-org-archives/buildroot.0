Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929F1CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 10:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA7760D89;
	Mon, 17 Nov 2025 10:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7RWdTC5wHBC; Mon, 17 Nov 2025 10:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 666C660D76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 666C660D76;
	Mon, 17 Nov 2025 10:39:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DFCA71A9
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 10:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5E4440BB1
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 10:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXFLcJLwHXuf for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 10:39:54 +0000 (UTC)
X-Greylist: delayed 921 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 17 Nov 2025 10:39:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F11804092D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F11804092D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.219;
 helo=send124.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send124.i.mail.ru (send124.i.mail.ru [89.221.237.219])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F11804092D
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 10:39:53 +0000 (UTC)
Received: from [10.113.169.125] (port=48948 helo=send82.i.mail.ru)
 by exim-fallback-769dc89968-d7rgr with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1vKwPY-00000000AlV-3Vws
 for buildroot@buildroot.org; Mon, 17 Nov 2025 13:24:40 +0300
Received: by exim-smtp-77df68b9cf-f5597 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1vKwPN-00000000A13-0fyv; Mon, 17 Nov 2025 13:24:29 +0300
Message-ID: <24357adc-822d-4f4d-9fcb-fe1a1f7cdebe@inbox.ru>
Date: Mon, 17 Nov 2025 13:24:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251115102052.3459680-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20251115102052.3459680-1-bernd@kuhls.net>
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9110BAFCBE6BD1D160E233FAEE0BF1AC7D533576BAB6B91D4182A05F53808504009A5DA9FB229B38C3DE06ABAFEAF6705DCE4AB8DC4FEF3FB79189619EBF5839EEE80B9AFA0738B6B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E1CE26B48C3821F5EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566D0BE23D09F2BEA50226564505EC46CE337A9D337D05502E954C34406915435CA8EEF46B7454FC60B9742502CCDD46D0D1D471462564A2E19F6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249D07623A0E6354027CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0AF05157F0BAFB9978941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C309A7649CC036878F35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A56998D410ABEEF1B55002B1117B3ED696AC508650A57E54BACA7E60A991436CA2823CB91A9FED034534781492E4B8EEAD3C056C6FCE5AFF8EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF250BD08D3139D7652DAADD33C2D6DD7C3FFE04269B21C61BBF590B86943573317D7FE2FA29F57787DD12B02666E493560B12BE502578A44445A43F2E42A9A9B7ECEAD38CEA4E56E2111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVfFX+FmbwDW1y4Si6fXYNac=
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD2B52FD4B7006DD70C8552A68B08AA15763A828464FD4E10B890DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B491D8917C1B3228299D5083B6BF327C3A65D8AB6DEDDD56DE049FFFDB7839CE9EA389097CD48B69DBF900754CE75D9F2E6C56F8E7B37BB9D3F0831FFF9601FE780FB4B09026D33285
X-7FA49CB5: 0D63561A33F958A58A0FC6C5958165F65002B1117B3ED69626E2F64D717B29156A798FA66DF72EC902ED4CEA229C1FA827C277FBC8AE2E8B51710B38F27ED36F
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZR0BQRH0BtIf15Eu8fpKsgQ==
X-Mailru-MI: 20000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=njQdwuIW6QjvUakPtEr8NME5WWssEpjjnB0N2vmxMPE=; t=1763375994; x=1763465994; 
 b=TAhXQ5gIOwNHrMwtl6rR6XvCt/KzlZDht2h1CMKqantj25/VgLFUUHqQ0JBzjtH1aG/xVw4Spjt
 xpDhiblA2DP2TiOVOdlsBlhVC0G/aXIVBO0XVYaAoAqJYZfPC0ghWO4IZzW8tDYcZBnGZCHtUYHVX
 MWXr0rVX/Cm3qR1IxPhMUGmlk0WVXYvewXgS+5k3SfvHp25jOQ+EHy1SprycgUn18SoMN/mqc61ib
 NQDq+MkvNlucA/Ms6qi/SJN5uAdkIzFi3on+b+a/BUoRmbsa9Rb4vFQuOLVXAuHnRu1Jwned6enKk
 3cuaawSIt21TxDZqLwpO4kYoM+8uCSi4JBSQ==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=njQdwuIW6QjvUakPtEr8NME5WWssEpjjnB0N2vmxMPE=; t=1763375080; x=1763465080; 
 b=OuZCJK9cKB7v8cObLDrHDRnzZODD63jqwTvKTRn6pxGP4ClCCzUHFs2MRrP73pOvzL7Hc7BYCi7
 1XydP3QOIKj8W5QWBZSPJjbbeokGVXBbd6pp0sSbYqAZO1kkQvtOq6uYnaOXyLHiQ4sLe6my6Igxo
 dSGhx2dZpN6YlQ44SoaWCu2IW37Rk7LUc4A09dnCIo34M4QKN/KiyieKv0V48lDgu8xHk/ZYFAO6L
 1V/7cfjGaGxw2LudbeM7ENewKR611x0Db+xvikCFuCvoMPtVyoK4xFPZ3Q6Li+C1BJmdaGteVFczT
 +AVYHZhMoWFicY4prJAXS2whN7E23PC8WCog==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=TAhXQ5gI; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=OuZCJK9c
Subject: Re: [Buildroot] [PATCH 1/2] package/postgresql: security bump to
 version 17.7
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

15.11.2025 13:20, Bernd Kuhls wrote:
> Release notes:
> https://www.postgresql.org/about/news/postgresql-181-177-1611-1515-1420-and-1323-released-3171/
> 
> Fixes CVE-2025-12817 & CVE-2025-12818.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
