Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CAAC00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E09B415FF;
	Wed, 24 Aug 2022 11:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E09B415FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id spBtEuO5TwsV; Wed, 24 Aug 2022 11:27:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 215274092D;
	Wed, 24 Aug 2022 11:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 215274092D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6D6E1BF407
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F47881400
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F47881400
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QjZV1W82Ue2p for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:27:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB880813FA
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB880813FA
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:27:50 +0000 (UTC)
Received: from [192.168.31.190] (unknown [123.185.180.94])
 by smtp9 (Coremail) with SMTP id DcCowAC3+O0xCwZj1hJ1aw--.10012S2;
 Wed, 24 Aug 2022 19:27:47 +0800 (CST)
Message-ID: <a4ab0b64-bf49-836b-14a3-ea8714c2a128@163.com>
Date: Wed, 24 Aug 2022 04:27:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220823054811.360322-1-christian@paral.in>
 <4931af16-cd09-8bbe-842e-9836bbd1e7c9@163.com>
 <20220823172647.GJ2167049@scaer>
From: TIAN Yuanhao <tianyuanhao3@163.com>
In-Reply-To: <20220823172647.GJ2167049@scaer>
X-CM-TRANSID: DcCowAC3+O0xCwZj1hJ1aw--.10012S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKry7Zr4rGF13Xr4kArW5KFg_yoW3Gwb_Cr
 WFkr1DJws8uFWkG3ZxJ3yrCFZrKa1fCry8J3WjgF12krn2yrnFyws5tFnIyw4Yqwn5JFs0
 9FZ8ZFnY9F17ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRA-B_5UUUUU==
X-Originating-IP: [123.185.180.94]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbCqR5njV0Dgu8yTAAAsQ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From; bh=2qDKq
 TmIbGfMpi8uT0kRE71wNBBS3+QDDTUzhK78Qs0=; b=UeOszouUetpNzAghDVF+K
 jRdRvbrGK5o6n8uISe5eR5xL0H3lUWs3C2YGpYJZFeNAq7qbzUX8HLtObL0Fb2zZ
 paeApzwm6urs8eCFeTbgOfLcG9vr43BL11E8J+zSMGxk7wokSyI9+yrdFF9aaGao
 jm+udCYQ/o2tcivBA5D9KY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=UeOszouU
Subject: Re: [Buildroot] [PATCH v2 1/1] package/crun: new package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgQWxsLAoK5ZyoIDgvMjMvMjIgMTA6MjYsIFlhbm4gRS4gTU9SSU4g5YaZ6YGTOgoKID4g
WXVhbmhhbywgQWxsLAogPgogPiBPbiAyMDIyLTA4LTIzIDA1OjMxIC0wNzAwLCBUSUFOIFl1YW5o
YW8gc3Bha2UgdGh1c2x5OgogPgogPj4gTWF5YmUgd2Ugc2hvdWxkIGV4cGxpY2l0bHkgZW5hYmxl
IHRoZXNlIGtlcm5lbCBjb25maWd1cmF0aW9uczoKID4+CiA+PiBDT05GSUdfVVNFUl9OUyAjIHNl
dGdyb3VwcwogPj4gQ09ORklHX0JMS19ERVZfVEhST1RUTElORyAjIGlvLm1heAogPgogPiBBcmUg
dGhleSBzdHJpY3RseSByZXF1aXJlZCBmb3IgcnVuYyB0byBiZSBmdW5jdGlvbmFsIGF0IGFsbCwg
b3IgYXJlIAp0aGV5IGp1c3Qgb3B0aW9uYWw/CiA+CiA+IFdlIHRyeSB0byBiZSB2ZXJ5IGNvbnNl
cnZhdGl2ZSBhYm91dCB0aGUgb3B0aW9ucyB3ZSBlbiBhYmxlIGluIHRoZSAKa2VybmVsLCB0byBq
dXN0IHRoZSBvbmVzIHRoYXQgYXJlIHN0cmljdGx5IG5lZWRlZC4KCkFjY29yZGluZyB0byB0aGUg
c291cmNlIGNvZGUsIHRoZXNlIGFyZSBtYW5kYXRvcnkgY29uZmlndXJhdGlvbnMuIFRlc3RlZCAK
YnkgcnVubmluZyB0aGUgaGVsbG8td29ybGQgY29udGFpbmVyLgoKSW4gZmFjdCwgbW9zdCBvZiB0
aGUga2VybmVsIGNvbmZpZ3VyYXRpb25zIGluIGRvY2tlci1lbmdpbmUubWsgYWN0dWFsbHkgCmJl
bG9uZ3MgdG8gcnVuYywgb2YgY291cnNlLCBpdCBzaG91bGQgYWxzbyBiZSB0cnVlIGZvciBjcnVu
LgoKUmVnYXJkcywKVElBTiBZdWFuaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
