Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7EFC48260
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 05:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16C34605C2;
	Mon, 19 Feb 2024 05:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vlKJ-9mbieq1; Mon, 19 Feb 2024 05:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39BEA60A98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39BEA60A98;
	Mon, 19 Feb 2024 05:48:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF01B1BF82D
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 05:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D745940446
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 05:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id irAoDVFfqcnN for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 05:47:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.94;
 helo=smtp56.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F0504042B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F0504042B
Received: from smtp56.i.mail.ru (smtp56.i.mail.ru [95.163.41.94])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F0504042B
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 05:47:56 +0000 (UTC)
Received: by smtp56.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rbwVL-0000000BuoJ-0KDq; Mon, 19 Feb 2024 08:47:52 +0300
Message-ID: <edaa9cd9-0a29-4432-b193-b95a3186e84c@inbox.ru>
Date: Mon, 19 Feb 2024 08:47:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
 <20240218184536.1922309-3-giulio.benetti@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <20240218184536.1922309-3-giulio.benetti@benettiengineering.com>
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9001F8F2F6BAD20211AF9977AC3F5306D85631166D2AADE8700894C459B0CD1B9550205ADFB9F22D8FFB36B11FB8673C234AA9432E241BD7E3E88C8D4F1998E201D371A049BD054D4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D51E5C74E5FE13C7EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B05885A782BE20C5EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B73AB1701401CD871F6B0D85CDB68E97764A11EB4D88E1CC3BD5255B405D186781DF9E95F17B0083B26EA987F6312C9EC9647ADFADE5905B16FD1C55BDD38FC3FD2E47CDBA5A96583C09775C1D3CA48CF01200A96CB7104FF117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7A4F00A9E8C511CEB9FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F7900637F9425D8FA97DB4396D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637B8F435DEDE9E76EBEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A563F1108456AC61F65002B1117B3ED69699911B78D107F5CE47A99E6294EE8661823CB91A9FED034534781492E4B8EEAD9DB614F8F96CFA30BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF4CFEDB996B5F7AB4CCB1A70ECD1DCC6D21B4E8EB23A4CC03FD136C6706656AA5519D809D4148B49634E84B500378195F3E4B2357424184265AB57D5A8E669EEB02E73B87EC281E8A034D55ECCE8C67C6913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojpg4ZDo8heSxG7Wrpd5uLYw==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE33A0BA9FE83C53A1691285264D58F0EB3A1238428F2C6DAE6D90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=6wEmMa/twSUhQLOTr3xLSsAoebm6dE76oa9yfzSLOFo=; t=1708321678; x=1708411678; 
 b=INgChw2Iij04IuUAxYvugIkMLr5oaKHTV/ynt4Qgm9jUT5MrexPUYmjgrExW51IsnIFBIha+Kb7
 +PqcvliqWqTQCKzq4F+j+CdVpWAd4V/nIhC4Udi9YDPOmnRTfooEYU6wDF+dN4wdFAwo2c47a63ty
 3nVAk6WIXd/C4iIoWXFhk3ydI+tQYQAzHS79DZV5vTVj3myYSZBlKgc8oiESu0caioCAMnV6T0IUd
 qi/wjRtnNw8ujNSCoe3KdSX/OJKQBLKWg5k9AB+ReXsVKgihdvlgZUiHAzLg1hVaclN+wCZjS8KDu
 eG1WKEp4e6hqADnjAmBghyh9v8mD/jsP6xsA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=INgChw2I
X-Mailman-Original-Authentication-Results: smtp56.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 2/8] package/gdal: drop nios2 binutils bug
 27597 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18.02.2024 21:45, Giulio Benetti wrote:
> Now that binutils patch has been backported to every Buildroot binutils
> version we can drop nios2 binutils bug 27597 dependency.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
