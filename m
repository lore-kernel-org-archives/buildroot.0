Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50B1C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 14:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17C5460ADE;
	Sun, 24 Dec 2023 14:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17C5460ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJJJoGEOP7vB; Sun, 24 Dec 2023 14:54:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7785860AAE;
	Sun, 24 Dec 2023 14:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7785860AAE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D07C91BF5DB
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 14:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5AAF4162C
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 14:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5AAF4162C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3avsoPRj1mPH for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 14:54:53 +0000 (UTC)
Received: from smtp29.i.mail.ru (smtp29.i.mail.ru [95.163.41.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0779F41620
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 14:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0779F41620
Received: by smtp29.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rHPsP-00Dbiu-1O
 for buildroot@buildroot.org; Sun, 24 Dec 2023 17:54:49 +0300
Message-ID: <8269971d-20de-4a7c-a4d4-1bf4fd6149cf@inbox.ru>
Date: Sun, 24 Dec 2023 17:54:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20231219075352.1048958-1-fido_max@inbox.ru>
 <20231223183947.1586f122@windsurf>
Content-Language: en-US
In-Reply-To: <20231223183947.1586f122@windsurf>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9F008C97756F746CAC396EDCBB59CB7E27DCACB827A2434F7182A05F538085040C40F51CC172775053A6EC9A16C8D46A2DBCD3A44F578CBE3C24A59B60A46F1C2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE721B3E54BB37EA0B4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063779089FB2CE4EA2908638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8825BF8C20765E52AA5ABEF3E2EE0D9D96F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7A6779F98BF527B7A9FA2833FD35BB23D9E625A9149C048EE4B6963042765DA4B2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BC0EC8C44E4C1BEE2A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C22494854413538E1713FE827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B613439FA09F3DCB32089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A5BB16D4CFA58F27F4976AC6B483F3D2D66E5394035A5404F6F87CCE6106E1FC07E67D4AC08A07B9B0E753FA5741D1AD02CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF3310498BA9487399C78BDFE36DB6E390CA42D89E34B25B36D827804D497FF631D2D1C8B3CBCE0EE8CA65547994326EF88D12BFDC787E0FB3AE256F9A63CCD50ACAACD699CDC6F98202C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojY17BwQnFUO8i0/5+N8GDQQ==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE33888347A820EABE9843E7F924C20EF11598CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=VpifMvIktoON+ZFM2kDtx8WF3Ryt93+yDKi1qV0tXUM=; t=1703429693; x=1703519693; 
 b=jaNdEZVUgMKOvODDMMxbLtRuvEXPXAyIGiokJCGMq50mLQs/eOzPG94O1jKV41dBo0m41rJtKzv
 O3AYRxnONiOuOvEEBCm6uGZpaUVnJ4jB/vs9cS8W2nf1g6vT0pSbCZsdE0MNc906EuDUMSiD6NPpg
 660Sv/c5JgCRpNNtGeJuaKCwLpPbDsw8/7g8iiw/dNfmrRgvFmgBs7mYX7KxhchtBw2EGkQyD6EDR
 l2nyJB91W0P+sjAeSZuOHKwx3NEG5fHetAwPka/7Zv0phgQOeHPMhNUs6bMo6OXRUclbrt0mjc8QU
 Yu4Zpx/JOKsbcAdxht6hTpwrB8DfA9rehBMw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=jaNdEZVU
X-Mailman-Original-Authentication-Results: smtp29.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 16.1
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



On 23.12.2023 20:39, Thomas Petazzoni via buildroot wrote:
> On Tue, 19 Dec 2023 10:53:52 +0300
> Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:
> 
>> +ifeq ($(BR2_PACKAGE_ICU),y)
>> +POSTGRESQL_DEPENDENCIES += icu
>> +POSTGRESQL_CONF_OPTS += --with-icu
>> +else
>> +POSTGRESQL_CONF_OPTS += --without-icu
>> +endif
> 
> Unless I'm wrong, this change is unrelated to the bump to 16.1. The

https://www.postgresql.org/docs/release/16.0/

.....
Build ICU support by default (Jeff Davis)

This removes build flag --with-icu and adds flag --without-icu.
.....


There will be configure error if ICU is not available:
....
checking for icu-uc icu-i18n... no
configure: error: ICU library not found
If you have ICU already installed, see config.log for details on the
failure.  It is possible the compiler isn't looking in the proper directory.
Use --without-icu to disable ICU support.
....

So we have to provide --without-icu or add ICU dependency

> --with-icu/--without-icu options already exist in the currently
> packaged version of Postgresql in Buildroot. Therefore, could you split

I see no such options in the current package/postgresql.

> this into two patches?

Correct bump is not possible without ifeq ($(BR2_PACKAGE_ICU),y)

> 
> Thanks a lot,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
