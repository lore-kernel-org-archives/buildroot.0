Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D8CC3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 07:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D343381EA3;
	Wed,  3 Jan 2024 07:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D343381EA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0cKcu5-rs6C5; Wed,  3 Jan 2024 07:07:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C6B881EC4;
	Wed,  3 Jan 2024 07:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C6B881EC4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C92741BF27E
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 07:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF11E60BE2
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 07:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF11E60BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tr1rB7MssD_e for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 07:07:53 +0000 (UTC)
Received: from smtp33.i.mail.ru (smtp33.i.mail.ru [95.163.41.74])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3229605BE
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 07:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3229605BE
Received: by smtp33.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rKvLy-00D8vM-0l; Wed, 03 Jan 2024 10:07:50 +0300
Message-ID: <7d5cc7f4-4fed-414c-be4e-9d3d5f15961d@inbox.ru>
Date: Wed, 3 Jan 2024 10:07:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240102224416.2529022-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240102224416.2529022-1-fontaine.fabrice@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9F008C97756F746CAE2B75521B1C23978BC5B3227EFB96EBE182A05F53808504021B8CCEBB2F7102718E57DA09222CF410C7873FE0A700556218A9EE735F31965
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78CB87876C5D626D4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637205505A8D8EF484BEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B73AB1701401CD8710856E4912DC7AA318E60EACDE04291EA20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C000E2D00546020E658941B15DA834481FA18204E546F3947C457EE4B4996FC546F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637E5FAC37A846F0F679FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F7900637F9425D8FA97DB4396D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637A7EFCB0EB5ACB161EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A5888182A56C8E50B0A09D24D3866110CC8351C2138419A1DFF87CCE6106E1FC07E67D4AC08A07B9B09E541A154B51D14BCB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF27311B3BAD708942A717C1744C3FA3D23E7A0CACF09C04AF4327093C944897C9FDDCA1AF55FC97B2B477C3CC75CCF192E31A0B162B4CDFBF718E05D3DF3BFB3740B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVwURT5GdYzXawieqm2Rulw==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE33DFE2BD3E92642FB53D9D39B27365611F98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=R+CNbxiJy2i1oyGyVP/y/Ai/D3UrxI6uQb1Y95O/F9Q=; t=1704265672; x=1704355672; 
 b=uO1S4nkV+GKjXMoTOxhf2ydwW8glqEJkt1N6KTCHjvKDY80NydFfEaI2N4ADTNt+Jx6P6UYFtTR
 Oggy0ovbHh4RsiPq4wIgr6tSqH9INnFAKoVMgKKqwrGt/yLiP+gknCT6MvQ/FCOpjNQrWJPdwkNL6
 M2OQM/v//CCKLey4KrkIHMzOMamT4jXh6G/kAKizPCSs9TVT4t1ZGWTAIc2JZ/0+61RkdnTz09enl
 M1RtNokXqZQty0vaRCeiuQ/jLLHdVFSxPXh6E0ja/DvxA1vGiqD6sizxK8vCdPeKCgAKmxyOCpk5s
 wEc5m+0TgmScj2hfT4RE+6dUZjncFSt75Lnw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=uO1S4nkV
X-Mailman-Original-Authentication-Results: smtp33.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump to version 3.4.1
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



On 03.01.2024 01:44, Fabrice Fontaine wrote:
> https://github.com/postgis/postgis/blob/3.4.1/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
