Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D031C46CA0
	for <buildroot@archiver.kernel.org>; Tue,  5 Dec 2023 09:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C732C8227C;
	Tue,  5 Dec 2023 09:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C732C8227C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2xNGNM4L3tSa; Tue,  5 Dec 2023 09:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3043981ECF;
	Tue,  5 Dec 2023 09:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3043981ECF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5891BF2AA
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 09:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1315E40253
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 09:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1315E40253
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TMIp0NCTgSg for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 09:43:02 +0000 (UTC)
X-Greylist: delayed 13870 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 05 Dec 2023 09:43:01 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98C174021D
Received: from smtp37.i.mail.ru (smtp37.i.mail.ru [95.163.41.78])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98C174021D
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 09:43:00 +0000 (UTC)
Received: by smtp37.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rARxA-00Bef6-1n; Tue, 05 Dec 2023 12:42:57 +0300
Message-ID: <5937bf18-1a72-4013-8137-77cd28943261@inbox.ru>
Date: Tue, 5 Dec 2023 12:42:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Maxim Kochetkov via buildroot <buildroot@buildroot.org>
References: <20231205055144.74622-1-fido_max@inbox.ru>
 <87bkb5t29j.fsf@48ers.dk>
Content-Language: en-US
In-Reply-To: <87bkb5t29j.fsf@48ers.dk>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9DBEED9ECEB82BED7C4E2D97DD155C14BF8D7A948E8576FB51313CFAB8367EF908E2BE116634AD74D83281B87012D1F95FD3EA497EA1E3A22C9302D77BB996C63954A11D17F55FE80
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B9D6DADD6B53929DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063716A4A39B750036BB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D88C6193443E1CA88A45C3EF926D49F63D6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE70F3DDF2BBF19B93A9FA2833FD35BB23D9E625A9149C048EE437C869540D2AB0F28451B159A507268D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B88D1FE13D87E6629A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C224952D31B9D28593E51E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6BF3059D42242344A089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A51D9BB7EC0606503B1584D597648F10C97EF99FC0F73872F6F87CCE6106E1FC07E67D4AC08A07B9B0A7DFDF579AB090EFCB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF4C7E4F20F9C3BFA52C0EB0DBAD228A81D2A6AE0FE4A165B4098AB5A3202E8D25C69CBF34C6AF1FF59157FEB932BFB23D49A9B1A46FF8BACDFCB8BC696D156D6D40B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojJEmydpeiNq9fz9nO8zXEtw==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE33E64EA24DE3B3C0E374F3D266EB11732298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=VUyLFF4s2L6wDrbvEwGu154qlU1GYlNPYQwc2Xfz8oY=; t=1701769381; x=1701859381; 
 b=HUaYlUAVxXhnGhwqrg/fHw3OSOx9PSGfxPnafkh1IF37qiJx9YCIOkgUHP+9uRjAhAWTryaeCEk
 QbHDpcdViqycpX0S9Te0Oyv3u55+H4B0Z0F6t0UPxaYp8hn5kobo/HSD1RRCRLZwmjyWqAfzRfmgF
 ZcUmRz+4eXO9HfDOMGjXH3141klRcuI4xQIeHU86SdNfNCqbEGLiOPIldlhzVaOKUpBp5WTmQF1uh
 F/q8TOHfk7rtCe47ZzgoCoXa2fhu757WXSGxxkBzBo1wv62txvh8ymOHE2wxOcFCD4/qnG+2mS8V+
 Z0Es8mYMGV76MThhHooFsm71bqERkZimv2xQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=HUaYlUAV
X-Mailman-Original-Authentication-Results: smtp37.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 15.5
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



On 05.12.2023 12:41, Peter Korsgaard wrote:
>>>>>> "Maxim" == Maxim Kochetkov via buildroot <buildroot@buildroot.org> writes:
> 
>   > Release notes:
>   > https://www.postgresql.org/about/news/postgresql-161-155-1410-1313-1217-and-1122-released-2749/
> 
>   > Fixes CVE-2023-5868, CVE-2023-5869, CVE-2023-5870.
> 
>   > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> 
> Huh, you already sent (and Yann applied) this change back on Nov 23rd?

Sorry about that. Just drop it. I sent it by mistake.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
