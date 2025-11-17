Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF090CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 10:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B148960D6D;
	Mon, 17 Nov 2025 10:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwkzqm7zGNFT; Mon, 17 Nov 2025 10:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE7BD60D76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE7BD60D76;
	Mon, 17 Nov 2025 10:40:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40DA7D5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 10:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32D2260D76
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 10:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VP0O5rhl_7Hs for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 10:40:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.150;
 helo=send55.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72B1E60D6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72B1E60D6D
Received: from send55.i.mail.ru (send55.i.mail.ru [89.221.237.150])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72B1E60D6D
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 10:40:13 +0000 (UTC)
Received: from [10.113.133.206] (port=52800 helo=send34.i.mail.ru)
 by exim-fallback-769dc89968-6gf6q with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1vKwPs-00000000N8O-1SoZ
 for buildroot@buildroot.org; Mon, 17 Nov 2025 13:25:00 +0300
Received: by exim-smtp-77df68b9cf-hc2rn with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1vKwPg-00000000AXX-1Boz; Mon, 17 Nov 2025 13:24:50 +0300
Message-ID: <8004576a-7e29-4963-b844-4de8a803de31@inbox.ru>
Date: Mon, 17 Nov 2025 13:24:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251115102052.3459680-1-bernd@kuhls.net>
 <20251115102052.3459680-2-bernd@kuhls.net>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20251115102052.3459680-2-bernd@kuhls.net>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9110BAFCBE6BD1D1603B6524534BC12556475AD05CF589285182A05F5380850408E0D335CE531D40A3DE06ABAFEAF670561D136A772034DBA79189619EBF5839E4A9DBE0811142006
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE782FBE8B5DCA684DBC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6759CC434672EE6371C2A783ECEC0211ADC4224003CC836476D5A39DEEDB180909611E41BBFE2FEB2BDB0C630E1985EBD077DCF2ABFD8170ED27384A739F28F7DFC4EAABD15FDE12850C819B32DFABC24A725E5C173C3A84C386106675DE625196117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC3733B5EC72352B9FA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352026055571C92BF10F618001F51B5FD3F9D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269176DF2183F8FC7C0D75EB778CE7D8A0C68655334FD4449CB33AC447995A7AD1857739F23D657EF2BD5E8D9A59859A8B6300D3B61E77C8D3B089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5E1FAC868ECE2C9A65002B1117B3ED696D558F5A26CF6662CF5FEB6EB1EB183FD823CB91A9FED034534781492E4B8EEAD21D4E6D365FE45D1BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFF2EDEDBF93BC30694F97510A57DF3D38F4F6D45A6C81DAA7C0C75EDDBAF14CDB08FC8DA71D385488DD12B02666E4935625EED041AEA41BC9922AA77A5831E317C68447351D4733DD111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVfFX+FmbwDW1Rb9o74Xy0e4=
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD2294C58CCFDFF5376C62694A9A14798BDEDB989C3C8FF089F90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B491D8917C1B3228299D5083B6BF327C3A65D8AB6DEDDD56DE049FFFDB7839CE9EA389097CD48B69DBA462E450D32C3360111A53BE365F6ADFC6272E8763363DB0CC06EDA054C664EF
X-7FA49CB5: 0D63561A33F958A529F494D2853CEE605002B1117B3ED696B7A27FF2BA1CA7B3A92FD30A1C74D94802ED4CEA229C1FA827C277FBC8AE2E8B51710B38F27ED36F
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZlTrATppHyY/KnL01ZIRaTg==
X-Mailru-MI: 20000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=jHWr09qmHoea9rSwOOR3imcb1hu6tBCMWOc4RLcn8wg=; t=1763376013; x=1763466013; 
 b=hLvXnJfN3mrG4WYiXuR2IENUlID/Dll3pI8PkWQ5CsDgRopdqiKsLi7AnXK6CCaiWlYLdYB3rGI
 42TXUV/RkxmKx+ZCtEIxCiNCEDI0HwEqj/xaBH99PdOv5KKf2wCqrgAMbILBTkRPp6QAcJThrSGrO
 vtH274EbzE5KRtl8utAJp+u2T+8KLVj4Zg6jMqGD63d16qeBiafVNzaNknpmlan0duvD1LArzvKJ9
 fAHo8rJqaTgktGdlntNRAXcAIzQBLFeo8I2Gx+XcAc1uWxm7un+YqRnZfkc+4/kLd1DE5bZjuOOzG
 OpgEk+JY2gXGfBznlzk8lwiBIAZsHQY/om8A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=jHWr09qmHoea9rSwOOR3imcb1hu6tBCMWOc4RLcn8wg=; t=1763375100; x=1763465100; 
 b=EZyq9GtnhisYgzWAoC1RGr+6srgs8e/B8C2VnQ4qW76Grwt+g2WzkQgBglnWaz9xo510dNCasWh
 wPgCOJaZMGN0tugtSaUOYjj3dr40OF8CcF5v1IgZ99xLQkRbHlxMJPeCZ+rszFY5aU8QU76O2Cy3V
 N7n/TGMEhmgPAEZh0QZOkOnRb+jeIqlPEhua2QmYQngwww72MsfwbAHire7dJ00QbJ17grKLeX6CH
 RRlpgEy/HoGQh28nC25yCJBTnOvoS3+AOtJQF1I/EvsonnRdpsNckWOMZCW4iePC2ORwBPXyLWfsW
 +AycQIayDKDM5MD5YnbimZw2j0jgpxDxowKQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=hLvXnJfN; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=EZyq9Gtn
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Bernd Kuhls for
 postgresql
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

15.11.2025 13:20, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
