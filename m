Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55445C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 04:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A4260E2E;
	Mon,  3 Jan 2022 04:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dK56i6dlEo2Y; Mon,  3 Jan 2022 04:33:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AA1F60E27;
	Mon,  3 Jan 2022 04:33:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5F261BF325
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 04:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F61D60E27
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 04:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fe02Pk3YSucW for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 04:33:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04D5960B0A
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 04:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=93DWoHSpSKU7WeLJQ/geRiNX9DmhhkBIEPWCPXaBUOc=; 
 t=1641184412;x=1641789812; 
 b=PxlpgxKyA2SThnMZYK13bGknu0wNxEE29MSyLp7fp6v1gt279G1xo8o4x5T8mNjW4xB2rbqSa5ODUIfUTCRxvBMKa4myev4KI7iDAbaqMuVQLHjdGAm++fGhh7Z4FZf1ciLM6YBXgLyYgboSyBXUJlLMKBGGiD/xXXolQMRXIN7qrTxzzWWuYiKXT136eU8honr/bgJ8zuMNjdF7Bv+jx2wjipPTMZx1rJViOotDdpwzozYkDpqHhUxM+8NFuJC6K9EKRx1wUJ0dZP1xhGu0C+TpwbRsEryOMgCk9bO+HAz3n20lmj7LJc5tNdX/1zWX/2KCVKuDpRzqGhXU/hKAEg==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1n4F2F-0004bR-Eb; Mon, 03 Jan 2022 07:33:28 +0300
Message-ID: <de798b64-ce22-e90f-e7ee-6d59ef309903@inbox.ru>
Date: Mon, 3 Jan 2022 07:33:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220102210408.221439-1-giulio.benetti@benettiengineering.com>
 <20220102210408.221439-2-giulio.benetti@benettiengineering.com>
In-Reply-To: <20220102210408.221439-2-giulio.benetti@benettiengineering.com>
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD94D5EF110843E6A67CFD1AE5BAEA5D6B2A1F98ABF68DFDC63182A05F538085040AD814DD2E338D7C68C5D9DE184A5E3741182B1B6594D6B30793BEA5554C35F98
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7495A032B936E882FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063750965CC5CDB672DE8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E8CC138F2318C65DDD02CFC7C4208E146F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE72B26B6EDD975AFD79FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B292D688DDAD4E7BC389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D05AD665AB97B35DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A51ECD5D09279E749B80A9FBAD21B4DBF514701A02BAC7FE7DD59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B869F6C56E712840410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34A1AF43396E40A36F95334A8460E5556F780F052DBE07C541302F7F30A30F6EA6B9C56E7D37EE4D091D7E09C32AA3244C6E9C0388CFFEC5BAEE9C548B918EE5415A1673A01BA68E4083B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVR6zrieWa1M9GqIQJV52uA==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D6D01A7FCA5C8447CCBE3D6C29F2C41A9698CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH 2/2] toolchain: remove binutils bug 21464
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03.01.2022 00:04, Giulio Benetti wrote:
> Binutils bug 21464 is not present anymore in Buildroot so let's remove it
> and its depends on in libgeos and postgis packages.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

> ---
>   package/libgeos/Config.in | 4 +---
>   package/postgis/Config.in | 4 +---
>   toolchain/Config.in       | 6 ------
>   3 files changed, 2 insertions(+), 12 deletions(-)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
