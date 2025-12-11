Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38273D41D64
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 17:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1BD584F9C;
	Thu, 11 Dec 2025 17:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kW-nMrymQ9Hd; Thu, 11 Dec 2025 17:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D6C484906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765472567;
	bh=LILh5pzmF80ZxPEPby/7hcYJYl1XQ52GJEAnX/6Wo4Q=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=r0HdPMlY6azC3JmKTL1t8BQpDXmPvFLHDaLgkqIa/rM77iRhjZDIIj5SjoXL8VkWJ
	 CshfjGNTdIYx5VsgVcsco0aoA1EB/hjMFRoMqqkCHyqAHi+J6gunVUwRFDiXx3oLVm
	 xCKh88RrBN2z+ROxF44HHMRCKTf7bDc6qIRjSA2i0K9TkLmKpv+SP8ZUcmVhOh2YCs
	 1aMH7lPbrtQsRyGsjKVAoMqE6XqaSF0GmkMKY+GRk4at7T9ZEhM/KXW+bjh36tRL15
	 eSj9iDzyCqof84rxiuUDZnDbRnY4xrQm2TsdJBAWlrBlPbH24gISZjAOwsrOsOVy8v
	 bk9fbyAgeZ0Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D6C484906;
	Thu, 11 Dec 2025 17:02:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A08E92C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 17:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9288640F57
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 17:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKFR2N7o0lOC for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 17:02:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.32;
 helo=send193.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A49F240F5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A49F240F5C
Received: from send193.i.mail.ru (send193.i.mail.ru [95.163.59.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A49F240F5C
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 17:02:44 +0000 (UTC)
Received: from [10.113.175.227] (port=43922 helo=send172.i.mail.ru)
 by exim-fallback-657d7677d-hpszb with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1vTk3q-00000000KHJ-3EB3
 for buildroot@buildroot.org; Thu, 11 Dec 2025 20:02:38 +0300
Received: by exim-smtp-9954f69f5-4jrcg with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1vTk39-000000001I8-3oU2; Thu, 11 Dec 2025 20:01:56 +0300
Message-ID: <97b6e0e9-2b59-43f5-ab82-072968320837@inbox.ru>
Date: Thu, 11 Dec 2025 20:01:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20251211161615.503688-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251211161615.503688-1-thomas.petazzoni@bootlin.com>
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9564C67F5AB2842FF6FF470C5B82BE130028A0EFBE685DD86182A05F538085040C534EACB4826263D3DE06ABAFEAF67055A451C7198449A1D6473FAB94EB76EC9E6CFE96EA49CC3A4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE704FFE27C31EF363AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B261E18FAF084198872E070BE324C7D3C452D99439F0235FFDBB0A4F435E46E6718B35066C979671628AA50765F7900637F1F33655BFBB40449FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751F2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B55D5BE2F85BDEC5FA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB1724D34C644744043847C11F186F3C59DAA53EE0834AAEE
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A57F8DD15064119B8C5002B1117B3ED696C5CADC5D29856000E99897350C7C491E823CB91A9FED034534781492E4B8EEAD543F342AA183667FBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F9677DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659D47A7E06AAD8661B3095A07BD85B2B9DDE52FE692FEEF6237A88069F4D4852EB5AE92F2B7F0E35F4B8341EE9D5BE9A0A3155B3DA3A3E9183DC2C1240C481DC9772AF73866935C3C252EE4E5D9E54FDA4F32EBBB8949988C87F602240D6CCBEE5D3DA9480BB1E7B08C654B4D7A83FC0F143082AE146A756F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVZ7tsNvok/Tz40NHSqV7iSU=
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD2A557161CD1C7D1B41A573C63106E3EFC5BFA650AD63C24D690DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B476D451B6D5EC61448A18F39633D6C8AFB418B103D04DC5A468F3CF0E9FE49B693887ED40B8DD80A7892AB0CCFFB71659D7BDACEDDF2F4143DA50AB554695D94F21B671EF756D80A9
X-7FA49CB5: 0D63561A33F958A5B6B81CF8CE1FDE515002B1117B3ED696E3017F0285DEE3C71682F49BADD9DBB802ED4CEA229C1FA827C277FBC8AE2E8B0F068EB0F7B02D21
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZv3fiD5hwRHUbDILL1DecLg==
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=OxACcxEYLN0v+UgjDUtF5iaV5BX9BoqRPKzbKV9ILSQ=; t=1765472564; x=1765562564; 
 b=ruDEy07XsnFOETrrrq8LxYx/ypweL3YP1JKK4iL3Wo2U+iA1/I3KMtTaJLXcw+u2Aa/i09Vskfc
 VCqhNiBYvKL+qjoI5yQAWCHrdq+9ud90auu4beCFer3lOo8H1z8z5UvI156L7Kqm35orM5HuTNXFp
 1OGv7ajvnSdyiWnnB74Y/QGn0e3qt5/xqWdq22hD5TuRX//RiEpHC1OfhqzWBN+DSKn/UxrThRtuS
 S7j3L2RywFUkPFdy9lGER1E5Yb2NIBhgoeLQu4nMJH86cC6Qqymhla0i5fYa+KctVknld5zRVKHh4
 o1ZRRdtCboT/J5VZKQ5cMXQGvO5h+tm4b5hQ==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=OxACcxEYLN0v+UgjDUtF5iaV5BX9BoqRPKzbKV9ILSQ=; t=1765472558; x=1765562558; 
 b=O0pCJuWjo0c6OV82Cee1fU9mi6FguWloA8g8q2SScv+vs0k82VBdjS+O5o0qzwbwJSzwGtszLeB
 bO7n+pSHINh/KJqFxV1gk6PiU4xMOAo6Aqv22UIphxmueiA7d/gfVH4GvPhooGx7AphXAvFG1ng6c
 MGNK4TBd/h9ITP1E3lwvgALMOXsOvpG1Y7KI6aCoLPjtxDvyZy1B2UknLnbabmDkpP6jfhhGBjM5+
 3mWjGBC1sYLA4GV1eGg1WqVZXQ5J9eu9VNQPiRBgZqgAtI9B0jq3wNjNKmzA63XcxiB/fq9w7FKJZ
 L0UWOxHn2CnzPTwP3Dq9H5CzTeIK2Sf69d4A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=ruDEy07X; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=O0pCJuWj
Subject: Re: [Buildroot] [PATCH] arch: drop support for ARC big-endian
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
Cc: John Stile <johns@msli.com>, Alistair Francis <alistair@alistair23.me>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

11.12.2025 19:16, Thomas Petazzoni wrote:
> Alexey Brodkin from Synopsys says:
> 
>    I think indeed, we may remove all the big-endian support for ARC.
>    Reasons are since introduction of ARC HS4x processors we no longer
>    support big-endian in any new processor IP, and even for older IP
>    which used to support big-endian it was rarely used... so basically
>    there's no good justification to spend any cycles on big-endian
>    support looking forward in this project.  I.e. BE support in uClibc
>    could also be removed if it makes any difference.
> 
> Therefore, let's removed support for ARC big-endian.
> 
> Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> Cc: ARC Maintainers <arc-buildroot@synopsys.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
