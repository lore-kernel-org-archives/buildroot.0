Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12007D65553
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 06:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88DDF608D6;
	Thu, 28 Nov 2024 06:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qr5IRQhULV2; Thu, 28 Nov 2024 06:08:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC131608DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC131608DA;
	Thu, 28 Nov 2024 06:08:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 184121167
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 06:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05B15428E1
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 06:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KgfQ9vAqReF for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 06:08:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.245;
 helo=send150.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B06BF408D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B06BF408D4
Received: from send150.i.mail.ru (send150.i.mail.ru [89.221.237.245])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B06BF408D4
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 06:08:07 +0000 (UTC)
Received: by exim-smtp-78d78789c6-624cc with esmtpa (envelope-from
 <fido_max@inbox.ru>) id 1tGXh5-000000005im-2usv
 for buildroot@buildroot.org; Thu, 28 Nov 2024 09:08:04 +0300
Message-ID: <003b9d80-27dd-477a-a5d6-b4dcb83dee12@inbox.ru>
Date: Thu, 28 Nov 2024 09:08:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241128050116.879176-1-fido_max@inbox.ru>
 <87iks87xbz.fsf@tarshish>
Content-Language: en-US
In-Reply-To: <87iks87xbz.fsf@tarshish>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD97DF634AB044F3A9041927C67D3DC0654BD8916EDA40F9E6B00894C459B0CD1B963113FEDAC0EC32BD27678DDAA80631406A16DF88AA90160FF6C3322E4D472EAB57612C3CDEB6A40
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE745229D52CF30560CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AB1265E79AFCDEF58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D856291B2E2B47587BAB3CC57EF4A417ECFF07CEB605A7E5E120879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C036A2807E4187C3608941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC82FFDA4F57982C5F4F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6B1CFA6D474D4A6A4089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A5A8CC193E934244FB5002B1117B3ED6969B7E677C0AD34EBFCA7E60A991436CA2823CB91A9FED034534781492E4B8EEAD27E9584FBD6BDD31BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC420D114F2088D564BA390AF344412570C7DBE980C247E3F427999E0A5AFD2D3D9E67331CBA3B6E4BDCC763D930D6EFA14CE5B74F6ABE84BF3A3CC47880E1205ED9B43398A0238B7383C93C5AD2DA449913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojA97iaBGbkJ0gyGbrz4tEkg==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA21910D4B2219B4E878156D986D6A963BBECEF712F36BF04AE8C90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=sXAZ3UlqKLLjp9uvDYguqtQ7DYORVxugdwy2MStVzRs=; t=1732774088; x=1732864088; 
 b=TZCwrRFBULiGgs2Wp0mIAqU4Yg1zI/DuVnGHbgCIDS4UHYcSb0TZcrZRgJZizKlM5C8dGwUwhah
 SWjEG+eXEWQWjtnMvKvSFL0cMXVd++T5Limz+TcLBThkQqKEHX1SntEeaBuEg/ZLaZf3ylmpMCni1
 c3XmzFtvhuJnNlTN+lwb4NoOFiY6CPNR/Q37hMKz665f+WXuPqZq8YMrijqdZfhTIPAcptTWVSf1Z
 Q5qxekOr/b8Cv2xzWFXdcGobF45SG8DXPL6zSzYYukiwuftnpntMzWB9CBxTrDFWMegOscFAV6WgF
 WDZvaZrKP1XXEFw7UU4puztyC3KajwgHd/rA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=TZCwrRFB
X-Mailman-Original-Authentication-Results: exim-smtp-78d78789c6-624cc;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] dmaengine: dw-axi-dmac: fix snps,
 axi-max-burst-len settings
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

28.11.2024 08:15, Baruch Siach via buildroot wrote:
> Hi Maxim,
> 
> On Thu, Nov 28 2024, Maxim Kochetkov via buildroot wrote:
>> axi_rw_burst_len allowed values range is 1..256. Then this value
>> goes to ARLEN/AWLEN 8-bit fields of lli->ctl_hi. So writing 256
>> leads to overflow and overwrites another fields in LLI. More over
>> ARLEN/AWLEN are zero based (0 - 1, 256 - 255).
>>
>> Fixes: c454d16a7d5a ("dmaengine: dw-axi-dmac: Burst length settings")
>> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> 
> This is the wrong list for this patch, I believe.

Yep. Sorry about that. That was miss click.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
