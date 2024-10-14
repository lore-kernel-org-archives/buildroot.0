Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7713CF2590
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 04:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86E8E606FA;
	Mon, 14 Oct 2024 04:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lS9H1ELpUU6u; Mon, 14 Oct 2024 04:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22D4860687
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22D4860687;
	Mon, 14 Oct 2024 04:21:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09CAA1BF387
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 04:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECD08810C9
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 04:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXDw_gZ2gucw for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 04:21:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.80;
 helo=smtp39.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9865810C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9865810C6
Received: from smtp39.i.mail.ru (smtp39.i.mail.ru [95.163.41.80])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9865810C6
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 04:21:46 +0000 (UTC)
Received: by exim-smtp-57f79c7799-lkzks with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1t0CaV-000000003jt-0qoZ; Mon, 14 Oct 2024 07:21:43 +0300
Message-ID: <b49fd0f6-b62b-4a79-acb5-2d168e4c535a@inbox.ru>
Date: Mon, 14 Oct 2024 07:21:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20241014011729.48018-1-fancp2007@gmail.com>
Content-Language: en-US
In-Reply-To: <20241014011729.48018-1-fancp2007@gmail.com>
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9B01871A0ED523BBF32CE30BE1D7BB39A1060E4D055FFF490182A05F5380850404298105CEF5DA1743DE06ABAFEAF670502D77F632BE6EBA40A691F511CECB8E99799EF890AE2FAA9
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7FBB2043146276655EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637560334CFC131571A8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82C9A8D8C86EF02BC512BC4FD487A9211B7F0E83A6D081DED20879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F790063741F7343E26298569389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC85E3BF8C76DC23F74F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE33AC447995A7AD181150BA43C84913FC3A03B725D353964B1D471462564A2E1935872C767BF85DA227C277FBC8AE2E8B08F9A42B2210255C75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A52465FA2510981DB95002B1117B3ED6968E615E157311626B5D145BB8EF0DE66B823CB91A9FED034534781492E4B8EEAD09F854029C6BD0DABDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF9CFE75C899BCFC066D263D0845010B7BBE08048D47121CA121455AABB858B257A4B23375CB3901BD7C85317C21026A495BDE79E4930BF77E7A7BBFFB0D5BE3A31203D2BC92F16BF1111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojTJ02HBIKT7LYSIOqvRmsJQ==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA21910BC4E122C78E2792DFD80D69E462C061E5DCB5055B4AD9090DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=myX+q72GO0wO9x/HZkkImS8GKrmR0kLIF61LrmnnS/I=; t=1728879707; x=1728969707; 
 b=sYcXMpVlL5+oh2nsHJZIgj55d7lavEcJYNpFljweAk3TBb39DywYLQ54aoBJIFDHt/QcwUPa9Vf
 tzzzsdXXe7ZaoCQKFGC1xQYKb48XXDCHABKYH9ci31fel3tAbZMDrqh5tMksfy4ZDD8TnJ1vvw6If
 yVUXAFgedSn8dWK16g3DnuvLbvVNwnYYsQh/PGo9USx+N5r+/TcSOuYNSofU3dz6Jx/JoPWMq/bNj
 XwwpMrtcGZpsBpyduy0GSLoSg/JQ7TofIMRMcZ0n3v7yfEu7rvRE1raMsLBquNK+AJeWFDpQLMraj
 1GbXO6L/zrr6I0BV5TzTiKQgoku621s1ZKng==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=sYcXMpVl
X-Mailman-Original-Authentication-Results: exim-smtp-57f79c7799-lkzks;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.17.0
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

14.10.2024 04:17, Scott Fan wrote:
> Release notes: https://github.com/timescale/timescaledb/blob/2.17.0/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
