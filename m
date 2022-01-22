Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539CFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 10:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3918415DD;
	Sat, 22 Jan 2022 10:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SclQQtQkkQFk; Sat, 22 Jan 2022 10:50:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB8E741513;
	Sat, 22 Jan 2022 10:50:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 874B51BF5E9
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 10:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74D75401DD
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 10:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fnqa-6IPfPcR for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 10:50:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50EC4400F8
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 10:50:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90bb:6e44:a706:407c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 008CE780350;
 Sat, 22 Jan 2022 11:50:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642848624;
 bh=iAz/u1lRkxw1Hj0XfIdZEhBOmf1RylL6kIoupzK3yd8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yfou2u2Hnvjk3bvCVUp1jsg4p4uJsnfATLZjYPIp//4dXiCAmjhzFpXMF/xjyWj9C
 6atmU4TN5ukTE/SdUKbu4N8RDoOfvkrQz15oLvjG08lhXvN4yrjw21V0zTI/LxnrIK
 3GSjP32tz5A7xTJKuIBouWtDKLF0JLuxnB/amjx/NeAGSKIUgCbzIu/H+gDJR3o6KD
 tE62ChaejFhNtZdU03wQtROX195bHjimoVlXKFm+BP0Mdx1UDDMvEWVlPJGN8dXUBJ
 SmeSoXjcacRfedbjutpG4Q3iiqxxie6b04SX5CFnLaD25+OUTK6ctX5jWLr61UvFvC
 3GctUKZRvyZAw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 22 Jan 2022 11:50:17 +0100
Date: Sat, 22 Jan 2022 11:50:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220122105017.GM3252931@scaer>
References: <cover.1641663315.git.yann.morin.1998@free.fr>
 <91348c3073b0dcf57a8ea3227bae74c23a122713.1641663315.git.yann.morin.1998@free.fr>
 <e0fb6796-834f-f23f-a388-37c35b59ec99@mind.be>
 <20220113215805.GM1477939@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220113215805.GM1477939@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/3] core/pkg-generic: fixup all PPD paths
 in a generic fashion
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
Cc: Louis-Paul CORDIER <lpdev@cordier.org>, Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Naumann <anaumann@ultratronik.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXJub3V0LCBBbGwsCgpPbiAyMDIyLTAxLTEzIDIyOjU4ICswMTAwLCBZYW5uIEUuIE1PUklOIHNw
YWtlIHRodXNseToKPiBPbiAyMDIyLTAxLTEyIDIxOjQyICswMTAwLCBBcm5vdXQgVmFuZGVjYXBw
ZWxsZSBzcGFrZSB0aHVzbHk6Cj4gPiBPbiAwOC8wMS8yMDIyIDE4OjM1LCBZYW5uIEUuIE1PUklO
IHdyb3RlOgo+ID4gPlNvbWUgZmlsZXMgY29udGFpbiBoYXJkLWNvZGVkIGFic29sdXRlIHBhdGhz
IHRoYXQgcG9pbnQgdG8gdGhlIGhvc3QKPiA+ID5hbmQvb3Igc3RhZ2luZyBkaXJlY3Rvcmllcy4K
PiA+ID4KPiA+ID5XaXRoIHBlci1wYWNrYWdlIGRpcmVjdG9yaWVzIChha2EuIFBQRCksIHRoZXNl
IHBhdGhzIHBvaW50IHRvIHRoZSBQUEQKPiA+ID5vZiB0aGUgcGFja2FnZSB0aGF0IGNyZWF0ZWQg
dGhlIGZpbGVzLCB3aGVuIHdlIHdhbnQgdGhlbSB0byBwb2ludCB0byB0aGUKPiA+ID5QUEQgb2Yg
dGhlIHBhY2thZ2UgdGhhdCB1c2VzIHRoZW0uCj4gWy0tU05JUC0tXQo+ID4gPitkZWZpbmUgUFBE
X0ZJWFVQX1BBVEhTCj4gPiA+KwkkKFEpZ3JlcCAtbHJaICckKFBFUl9QQUNLQUdFX0RJUikvW14v
XVwrLycgJChIT1NUX0RJUikgXAo+ID4gIFRoaXMgd2lsbCB0cmF3bCB0byBsYXJnZSBiaW5hcnkg
ZmlsZXMgYW5kIHBvdGVudGlhbGx5IHRha2UgYSBsb25nIHRpbWUuLi4KPiAKPiBJIHRvbyB0aG91
Z2h0IG9mIHRoYXQsIGFuZCBJIGV2ZW4gZGlzY3Vzc2VkIGl0IHNsaWdodGx5IHdpdGggUGV0ZXIg
Sy4KPiBoZXJlIGFib3V0IHdoYXQgd291bGQgYmUgbW9zdCBlZmZpY2llbnQ6IGdyZXAtdGhlbi1m
aWxlLCBvciBmaWxlLXRoZW4tZ3JlcD8KPiAKPiBCdXQgaWYgd2UgYWRkIC0tYmluYXJ5LWZpbGVz
PXdpdGhvdXQtbWF0Y2ggdG8gZ3JlcCwgdGhlbiBpdCB3aWxsCj4gYmFpbC1vdXQgZWFybHkgb24g
YmluYXJ5IGZpbGVzLCB3aGljaCB3b3VsZCBiZSBtb3JlIGVmZmljaWVudC4gQW5kIHRoZW4KPiB3
ZSBzdGlsbCBwYXNzIHRoYXQgdGhyb3VnaCBmaWxlIHRvIHJlYWxseSBnZXQgb25seSB0ZXh0IGZp
bGVzLgo+IAo+IEJ1dCBhIHRleHQtZmlsZSB3aXRoIHV0ZjggaXMgcmVhbGx5IGEgYmluYXJ5IGZp
bGUsIHNvIHdvdWxkIGdyZXAgaWdub3JlCj4gaXQ/CgpTbyBJIHRyaWVkIGFuZCBjcmVhdGVkIGEg
c2ltcGxlIGZpbGUgd2l0aCBhcmJpdHJhcnkgbm9uLUFTQ0lJIFVURi04CnN5bWJvbHMgKEkganVz
dCBjb3B5LXBhc3RlZCB0aGUgY2hpbmVzZSBXaWtpcGVkaWEgaG9tZSBwYWdlLCBhcmJpdGFyaWx5
CndyYXBwZWQgZm9yICJyZWFkYWJpbGl0eSIpOgoKICAgICQgY2F0IGZvbwogICAg6Iux5qC85YWw
6Laz55CD6LaF57qn6IGU6LWb6YeR5omL5aWX5aWW5piv6Iux5qC85YWw6Laz55CD6LaF57qn6IGU
6LWb55qE5LiA5Liq5aWW6aG577yMCiAgICDmr4/lubTpooHlj5HkuIDmrKHvvIzpooHnu5nlnKjl
vZPotZvlraPoi7HotoXogZTotZvkuK3lrozmiJDmnIDlpJrmrKHpm7blsIHnmoTlrojpl6jlkZjj
gIIKICAgIOWcqOi2s+eQg+S4re+8jOmbtuWwgeaMh+eahOaYr+WuiOmXqOWRmOWcqOS4gOaVtOWc
uuavlOi1m+S4reS/neaMgeS4jeWkseeQg+OAgjIwMDXlubTvvIwKICAgIOiLsei2heiBlOi1m+es
rOS4gOasoemigeWPkemHkeaJi+Wll+Wllu+8jOWIh+WwlOilv+eahOW9vOW+l8K35YiH6LWr6I63
5aWW77yM5YiH6LWr5ZyoCiAgICAyMDA0LTA16LWb5a2j5a6M5oiQ5LqGMjTlnLrpm7blsIHvvIzo
h7Pku4rku43mmK/oi7HotoXogZTotZvnmoTorrDlvZXjgILliIfotavlkozkuZTCtwogICAg5ZOI
54m55ZCE6LWi5b6X6L+H5Zub5qyh6YeR5omL5aWX5aWW77yM5bm25YiX6I636K+l5aWW5qyh5pWw
5pyA5aSa55qE55CD5ZGY77yM5YiH6LWr6L+Y5pivCiAgICDoh7Pku4rllK/kuIDkuIDkvY3kuLrk
uKTlrrbkv7HkuZDpg6jvvIjliIflsJTopb/jgIHpmL/mo67nurPvvInmlYjlipvml7bpg73ojrfl
vpfph5HmiYvlpZcKICAgIOWllueahOeQg+WRmOOAguS9qeS9qcK36Zu357qz5YiZ5piv56ys5LiA
5Liq6IO95aSf6L+e57ut6I635b6X6K+l5aWW55qE55CD5ZGY77yM5LuW5ZyoMjAwNgogICAg6Iez
MjAwOOW5tOi/nue7reS4ieasoeiOt+W+l+iLsei2hemHkeaJi+Wll+OAguS5lMK35ZOI54m55YiZ
5ZyoMjAxMS0yMDEz5bm06L+95bmz5LqGCiAgICDov5nkuIDmiJDlsLHjgIIKCiAgICAkIGZpbGUg
LWIgLS1taW1lLXR5cGUgZm9vCiAgICB0ZXh0L3BsYWluCgogICAgJCBncmVwIC0tYmluYXJ5LWZp
bGVzPXdpdGhvdXQtbWF0Y2gg5piv6Iux6LaFIGZvbwogICAgMjAwNC0wNei1m+Wto+WujOaIkOS6
hjI05Zy66Zu25bCB77yM6Iez5LuK5LuN5piv6Iux6LaF6IGU6LWb55qE6K6w5b2V44CC5YiH6LWr
5ZKM5LmUwrcKClNvLCBhIHRleHQgZmlsZSB3aXRoIHV0Zi04IGNoYXJzIGlzIHN0aWxsIHJlY29n
bmllZCBhcyBhIHRleHQgZmlsZSwKYW5kIGdyZXAgd2lsbCBhbHNvIG5vdCByZWNvZ25pc2UgaXQg
YXMgYSBiaW5hcnkgZmlsZS4KClNvIHdlIGNhbiB0ZWxsIGdyZXAgdG8gYmFpbCBvdXQgZWFybHkg
b24gYmluYXJ5IGZpbGVzLCB0byBzcGVlZCB1cCB0aGUKc3R1ZmYuIEknZCBzdGlsbCBrZWVwIHRo
ZSAnZmlsZScgdGVzdCBhcyBhIGZ1cnRoZXIgc2FmZXR5IG5ldCwgdGhvdWdoLgoKU28sIGdyZXAg
ZG9lcyBub3QgZm9sbG93IHN5bWxpbmtzLCBhbmQgd2UgY2FuIGNhbiBzcGVlZCBncmVwIGJ5Cmlu
c3RydWN0aW5nIGl0IHRvIHNraXAgYmluYXJ5IGZpbGVzLiBBcyBzdWNoLCBJIHRoaW5rIGFsbCB5
b3VyIGlzc3VlcwpoYXZlIGJlZW4gYWRkcmVzc2VkIG5vdy4KClJlZ2FyZHMsCllhbm4gRS4gTU9S
SU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFs
LVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwK
fCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAg
IHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4t
LS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8v
eW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAg
Y29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
