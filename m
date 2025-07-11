Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C02BC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 07:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E56D409D0;
	Fri, 11 Jul 2025 07:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYRxnHeJack2; Fri, 11 Jul 2025 07:05:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5994C40A5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5994C40A5E;
	Fri, 11 Jul 2025 07:05:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2E111E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 07:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B01B0407F7
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 07:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M7HS8RqymR81 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 07:05:25 +0000 (UTC)
X-Greylist: delayed 923 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 11 Jul 2025 07:05:24 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5EEF240608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EEF240608
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.32;
 helo=send193.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send193.i.mail.ru (send193.i.mail.ru [95.163.59.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EEF240608
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 07:05:23 +0000 (UTC)
Received: from [10.113.193.39] (port=39494 helo=send217.i.mail.ru)
 by exim-fallback-579c974f56-xsm4g with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1ua7aE-000000009iO-1TmV
 for buildroot@buildroot.org; Fri, 11 Jul 2025 09:50:10 +0300
Received: by exim-smtp-7bc47bf769-h6292 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1ua7a1-00000000Ava-3dw1; Fri, 11 Jul 2025 09:49:58 +0300
Message-ID: <aaa3f3e6-5a6f-4836-b0ea-26ecc79afcf6@inbox.ru>
Date: Fri, 11 Jul 2025 09:49:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20250711064526.456324-1-fancp2007@gmail.com>
Content-Language: en-US
In-Reply-To: <20250711064526.456324-1-fancp2007@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD95619E8C7B85B6BED519818966C7595B3F26A7201A0A688FB182A05F538085040BEBF63B2F56F0B7E3DE06ABAFEAF670554C1464EC4D10598785A3536AEDFE32A1BB5EE8A55BF1B9C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B9FBA884A7C9B8BAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566C9029756E723F48EB47502F60B3FD9E4FE456EE84A9F91C0AAA2290184BF45838EEF46B7454FC60B9742502CCDD46D0D5E59ED9F89912417117882F4460429724CE54428C33FAD305F5C1EE8F4F765FCF77088377309FF52A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352026055571C92BF10F6FD1C55BDD38FC3FD2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269176DF2183F8FC7C0FE3A47D6FA29121068655334FD4449CB33AC447995A7AD186D8C47C27EEC5E9FD5E8D9A59859A8B6753C3A5E0A5AB5B7089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5E24E425357CECFE35002B1117B3ED6969B7574144E95887AF09842853758E9E5823CB91A9FED034534781492E4B8EEADCAFEFF123806BC82BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFFD2D19C04757B88A9B3908C9C2C5DB3A825F7123BBFF95E2CB98FBC4CBE4A479C150D9F1A63664459BED11808F429D2CE9557E80E122B6E2599FDB2A0DA0C1D0A1296EBD7BECA6A3111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVbGoXdS5lirDiLYIxxlvhMw=
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB6DD8F7035E6C4831F1DF3F85F7A55588C9469ADF0FEE9DA3B90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4E00FA01937F043F5CE4FA680B5D534C8F8D09C97854D643A049FFFDB7839CE9E16264A063CA43BEF3DAFDF5283867A6E774CEB9C67780F48711D83E115A53503B5D3B1B2DC18F129
X-7FA49CB5: 0D63561A33F958A57386E93E9E8F39515002B1117B3ED696B918AC8C3842EC8B4BE7A2D7F647BB5802ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ//F5d3rjzAoH9+vwZwwvsA==
X-Mailru-MI: 20000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=eslk4874sCs0R6xCskHV4skAq1DlQQNV7sk0MFhcfsk=; t=1752217524; x=1752307524; 
 b=Sio1lH1m+nsx83dCJQU71BX+ZNQMuCvyM9A2NeYQNqXIrrAVXQdmtM2lQkFfXIq/nkAFLmHYtEi
 aBCjfmdfNaH0TfXvAJPPL0P7Q2S8uR4sjBsEAled0VvKP5cO8C3a49Q7qULPRMs4mDcytaGPKwzdx
 nSpptfrNBESWDG1Leo+G7WRQb1kz+weNoNNzS7FImTxtv6if2fZkwgIMBcqKSPG8kaIF8VWkBvbdC
 z0d4PhGsv9UH7lzrJvb6DhzIOKAE5AtrRHKDIm+dkb7/95aYOyLPoHn1K6v4pp/9lthNFrQWWA9F7
 O5ewUh5LP9PWV4LjYg29v8wiYBZf9O8hCYoA==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=eslk4874sCs0R6xCskHV4skAq1DlQQNV7sk0MFhcfsk=; t=1752216610; x=1752306610; 
 b=oOYyuTGJZvYB02AlfKoha2U9aAiNtLWBCasfQ7WjUJe2G6wvq96zSmi4kn65B/T73EW5fX+30HS
 6zJCBf/OKugF8XVzZ78aS5LftD+PrAsqcBFC7quZBi/pO433ML+iCa+++9yUJa68ckSR6DkH9K3eA
 jyCCjTgbHR89nuXmQr6t8QLWajdMCuz1Laqn5ChQDxfV2wM3BCMSZCBG8Ixyjo06RH7SQbritUy9K
 UF3IFLAKHBdn/vhkvh/zirUp8quXNEO3KGssxUW6erADRX4M/g8RjDVE2f6RpZwLUjljfWomfWx4H
 62xJt3exloOQv5m/1rV8LyitdcMHLXM5u85A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=Sio1lH1m; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=oOYyuTGJ
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.21.0
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

11.07.2025 09:45, Scott Fan wrote:
> Release notes: https://github.com/timescale/timescaledb/blob/2.21.0/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
