Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93282C369BD
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 12:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A4B26FA21;
	Wed, 16 Apr 2025 12:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOtVzkE_Yqa4; Wed, 16 Apr 2025 12:32:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B05A6FC06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B05A6FC06;
	Wed, 16 Apr 2025 12:32:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67960E83
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 12:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64D43416B5
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 12:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTvTqzmiE9Og for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 12:32:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.131;
 helo=send36.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3ED7F41434
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ED7F41434
Received: from send36.i.mail.ru (send36.i.mail.ru [89.221.237.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3ED7F41434
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 12:32:49 +0000 (UTC)
Received: by exim-smtp-5c5f4778f6-dtrjq with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1u51wc-00000000Ed3-3E6Y; Wed, 16 Apr 2025 15:32:47 +0300
Message-ID: <2ba91570-321f-48c6-8f9a-90750d8742d9@inbox.ru>
Date: Wed, 16 Apr 2025 15:32:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20250416114620.140463-1-fancp2007@gmail.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20250416114620.140463-1-fancp2007@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9979B9587D9DF8E23C68751CB9F52C74C9F5B0E08A57F8D4CCD62213F67905E7AD6AAA3595414B19486E0A5E766B157E51253A749ACEBA1276462D4F4853E44F851CE0648C9E8651D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C42AF033AFE07300EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566018564DF7FD8E215A4154EE1B28AEEB1899ECBEDE9986E84F23FE3F78AC5FDDC8EEF46B7454FC60B9742502CCDD46D0DEDCF5861DED71B2F389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0998E19D2343267C68941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6668FBEE05F116134CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6957A4DEDD2346B4275ECD9A6C639B01B78DA827A17800CE75A9E79F66F1C28F3731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5A452077ADDDC6BF15002B1117B3ED6966AA43F1FD573446FCCE9A60C8CB01D7C823CB91A9FED034534781492E4B8EEAD17AEC49845D0B908
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFB2BAFE1DB55BB0BC8D7C5F53884CC56A95B9096A99F8E93E71B21597316839F190F5B3B6BD0F620EAE3C13A4B731FE03686CF6928E1D2483A438659904AF687AD8C27E43474E07E4111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS2bpaGes9W5EdiHYUPvZ5I=
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB6D404F9D397A47551B117F010B27ABF18C7EC5CDF42C0241F90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=F8UI7j4rDyd4eRpuQvVCKgf2wPbW6n9qZU5dIpzgS0g=; t=1744806771; x=1744896771; 
 b=dxXlk68sssiR767dIcp1HB73C0f4FUICu7BnwVnhmUiE42irhoKrRYclpyxgm61k5s0vK7WOVef
 eQ76OYJIqve5UaMZf9b5GpREeQvduDJXlZaYlPHLuo26dN52dGsHuxdX87LlNPECmQmzwBFZsFVC6
 B0kWAaoADLOXPfLp5kKjzAB5TV06Fk6xuFXuxOOkjGlAdyK4au+qqL8FF6PI6eqQ3S/Bb54fiuGll
 ffh2g9jctl51ZUUK1R8ZIB/AvDDvr0ucSTtdvRPs9kOKAMZdr+W9ZrTMXgqcNtAmMoHRwBQOTEpga
 HG2CL3nYOhSHqUIpceblXjMolhuph7hRcUnQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=dxXlk68s
X-Mailman-Original-Authentication-Results: exim-smtp-5c5f4778f6-dtrjq;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.19.3
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

16.04.2025 14:46, Scott Fan wrote:
> Release notes: https://github.com/timescale/timescaledb/blob/2.19.3/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
