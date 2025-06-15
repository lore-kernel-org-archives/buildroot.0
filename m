Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC970C61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 06:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5455440625;
	Sun, 15 Jun 2025 06:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usvPug_ep59a; Sun, 15 Jun 2025 06:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8040F40633
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8040F40633;
	Sun, 15 Jun 2025 06:26:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19F88151
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 06:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BA0580E35
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 06:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6xp0lVNiZJO for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 06:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.219;
 helo=send124.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5694C80E22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5694C80E22
Received: from send124.i.mail.ru (send124.i.mail.ru [89.221.237.219])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5694C80E22
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 06:26:01 +0000 (UTC)
Received: from [10.113.30.181] (port=33542 helo=send219.i.mail.ru)
 by exim-fallback-dcf6d76dd-hj5xj with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1uQgoZ-00000000Az1-1rAe
 for buildroot@buildroot.org; Sun, 15 Jun 2025 09:25:59 +0300
Received: by exim-smtp-85b97957d7-s7xxh with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1uQgoN-000000008oT-368k; Sun, 15 Jun 2025 09:25:48 +0300
Message-ID: <63cb89f5-f8e3-43e3-a283-3e15ea39aa89@inbox.ru>
Date: Sun, 15 Jun 2025 09:25:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20250613020220.462260-1-fancp2007@gmail.com>
Content-Language: en-US
In-Reply-To: <20250613020220.462260-1-fancp2007@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD909B82214CC9889175395EA0A18D39C97654ADDB14BA8099C00894C459B0CD1B95743B4EA7A40553EC7A4B249DE6549FDE62735AA4DD3AAA809148571C3378437CE06B70447BA4CE8
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70A10A23A3B64B805EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375661E4D98A1D60E60F20B9932A933D9115671E188EEDA39B5B1C5DBE9F4736745B58EEF46B7454FC60B9742502CCDD46D0D5B63D382EEF4D896F6B57BC7E64490618DEB871D839B73339E8FC8737B5C22499EAAB76869E07C3ECC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C068077CCD40B79AC98941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5278DA827A17800CE76631511D42670FFE2EB15956EA79C166176DF2183F8FC7C0E4A630A5B664A4FF725E5C173C3A84C3483320834B361D1F089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A53DB51724C9404D525002B1117B3ED69645104D9D3C4F355292B673A2F5DDD7E7823CB91A9FED034534781492E4B8EEAD09F854029C6BD0DABDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFAFA02320329B0D57A19455C0A460E440C7D84F221732BB90DB5ACEDC73A080225B8C288B04B80C1CC14A341A2D75A6C52199E1207E3F18E899DEAF225C00E26D73C82165A21CECA5111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVSykAyseJQ6/n+PrfOp/1DI=
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB636210B8C128D293D9F3B5CCF4CC97C8C1DB70C1961A6DBE290DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4E215B17B1B44A5D5A5124BDBFB32ADAC1BAF6DE60C9EB4E1049FFFDB7839CE9E008FB5866B8777F8FE26583C7F82875CF4194B9493DD29035F2A4F464C6B9FE1B246E04ECC9E9CE0
X-7FA49CB5: 0D63561A33F958A53B8C785A803A5D815002B1117B3ED696CC7916322EAE8095E409568A2FDEBC0902ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ5bT1o0G6MkszAdJHa8MmYQ==
X-Mailru-MI: 20000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=q+TgNFkyoqEESIfomE8+0nftxMd67k7AoRPzqJzF8Rw=; t=1749968762; x=1750058762; 
 b=kx3Gr/HlFE2CU9GH/rXMZTO7LIio59YBScIX/VzA+v60YxHQzPxLE3KpFKjBfeCA6kVOu7Ynvf/
 JqAzb/Thj/DKAyE2MXXKlg7nz4Fh02OO1EZ96T3sRL9EAjCI5V7ILO1OSWh9G5Qezflcbi2P991Xt
 pXJBJGbLoJF35kASGNqZlGMJOTrTd91NXm7hJ0bebCxYFA9mO0KD4Mk8XnXO8iEHZ5HCa9v8GTSWz
 uUk+IZTOcsOS2spC3VPxlZd0bEjoWFdN6RDhlCfmZu62+SOWN2jJeOrdl4isXzEI/KPUm07O9Zxo4
 z9PY0KZD0kbGryV+qm7AZBIwef2lZiNqT1Tw==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=q+TgNFkyoqEESIfomE8+0nftxMd67k7AoRPzqJzF8Rw=; t=1749968759; x=1750058759; 
 b=XIxT6GNw8pVg5ODdoga5j6YPBfcHgCytbFJxDkECp3y4DqvGoPJWdbN+qubKJT4PpY8oywBISDm
 qa5sgBDF9GYpg35G4vfPj1y1VH+oX1c6cfPjZqdiNPf/qxPGsEQM813ZRdAZD1ZtNEuU3lJ7KuYQV
 p+ifE5GnzdYdWa3bbOzs8OShONI1/P9Uo9QlOMc5G5gXVxyNUm5QccH/nHka28ktPKB5CDGL76Dv4
 0lJVWsshKpWLnr1Dwi+R8/qz++MbZFfPKNYcu+2sum7Gu9Z+xqC5VsCRw7ewVnrAX5EnYkfM22ut2
 KmR5C58HObQu+5srKM81PfH2ytJFSDlPH6NA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=kx3Gr/Hl; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=XIxT6GNw
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.20.3
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

13.06.2025 05:02, Scott Fan wrote:
> Release notes: https://github.com/timescale/timescaledb/blob/2.20.3/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
