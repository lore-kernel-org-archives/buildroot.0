Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B41BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 14:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFED960A94;
	Sat,  5 Nov 2022 14:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFED960A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iUjbR6ZdlPUQ; Sat,  5 Nov 2022 14:44:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D565960A72;
	Sat,  5 Nov 2022 14:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D565960A72
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DEE91BF28A
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 14:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25D8F41625
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 14:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25D8F41625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-6qkObq58AU for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 14:44:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5E5E415BB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5E5E415BB
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 14:44:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.11.77.72])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3C97B2003C8;
 Sat,  5 Nov 2022 15:44:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 05 Nov 2022 15:44:12 +0100
Date: Sat, 5 Nov 2022 15:44:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nuno =?utf-8?Q?Gon=C3=A7alves?= <nunog@fr24.com>
Message-ID: <20221105144412.GH3918838@scaer>
References: <20221004111528.384625-1-nunog@fr24.com>
 <20221004111528.384625-2-nunog@fr24.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221004111528.384625-2-nunog@fr24.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667659455;
 bh=3flBag+nD31nP10zkDijSBfjO9wJlxdGTW5wYpnK56M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jWsFF9bwEfAITWkvvcHt4Osn1ctqnl39uBe4JuRNpqVSPk772RNq132Nb832gxQ2K
 tQaGksE/HVSVeuyFfA2pAMRbXkGJZ1RM7rQ1uL0At6kXknWOypZfNaWTvdumEHUg0U
 uje+qeVu79g+l5GeavwHQyHRoUoB0R4cWRbg0mgyNrDkmnl9sAMK7bMUZ+0LAxtNkH
 YUlfwJ4wOuHniFlyLuZwwCDIaDDMw9D2VFIuV4/z3JK6nE8Uxl2TWP0/hYx5CZkZBO
 wHxQP7nUxkfT+huOLsCU1lcLeKJTypDo8V6cHG8SnCUDD9/J8zNRzyuKRhzsd6e7a3
 t3Mh3KMH6p+xg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jWsFF9bw
Subject: Re: [Buildroot] [PATCH 2/3] package/sudo: explicitly disable tzdir
 and tmpfiles as otherwise they are based on build host directories
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TnVubywgQWxsLAoKT24gMjAyMi0xMC0wNCAxMjoxNSArMDEwMCwgTnVubyBHb27Dp2FsdmVzIHNw
YWtlIHRodXNseToKPiBTaWduZWQtb2ZmLWJ5OiBOdW5vIEdvbsOnYWx2ZXMgPG51bm9nQGZyMjQu
Y29tPgoKQ29tbWl0IHRpdGxlIGlzIHdheSB0b28gbG9uZy4KCkFsc28sIEkgYW0gbm90IHN1cmUg
SSB1bmRlcnN0YW5kIHdoYXQncyBnb2luZyBvbiwgc28gaXQgd291bGQgYmUgbmljZSBpZgp5b3Ug
Y291bGQgcmVzcGluIHdpdGggYSBiZXR0ZXIgY29tbWl0IGxvZy4KCkJ1dCBzZWUgYmVsb3cuLi4K
Cj4gLS0tCj4gIHBhY2thZ2Uvc3Vkby9zdWRvLm1rIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3Vkby9zdWRvLm1rIGIv
cGFja2FnZS9zdWRvL3N1ZG8ubWsKPiBpbmRleCA0ZjlmZGI0YjJjLi45N2Y4M2Q5ZjZmIDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2Uvc3Vkby9zdWRvLm1rCj4gKysrIGIvcGFja2FnZS9zdWRvL3N1ZG8u
bWsKPiBAQCAtMTYsNiArMTYsOCBAQCBTVURPX1NFTElOVVhfTU9EVUxFUyA9IHN1ZG8KPiAgIyBU
aGlzIGlzIHRvIGF2b2lkIHN1ZG8ncyBtYWtlIGluc3RhbGwgZnJvbSBjaG93bigpaW5nIGZpbGVz
IHdoaWNoIGZhaWxzCj4gIFNVRE9fSU5TVEFMTF9UQVJHRVRfT1BUUyA9IElOU1RBTExfT1dORVI9
IiIgREVTVERJUj0iJChUQVJHRVRfRElSKSIgaW5zdGFsbAo+ICBTVURPX0NPTkZfT1BUUyA9IFwK
PiArCS0td2l0aC10emRpcj1ubyBcCgpBcyBJIHVuZGVyc3RhbmQgdGhlIGNvZGUsIHRoaXMgcGF0
aCBpcyBvbmx5IHVzZWQgYXQgcnVudGltZSwgdG8gc2FuaXRpemUKdGhlIFRaIGVudmlyb25tZW50
IHZhcmlhYmxlLiBTbywgd2Ugc2hvdWxkIGJlIGFibGUgdG8gcGFzcyB0aGUgcHJvcGVyCnBhdGgs
IGJ1dCBvbmx5IGlmIHR6ZGF0YSBpcyBlbmFibGVkOgoKICAgIC0td2l0aC10emRpcj0kKGlmICQo
QlIyX1BBQ0tBR0VfVFpEQVRBKSwvdXNyL3NoYXJlL3pvbmVpbmZvLG5vKQoKKG5vdGUgdGhhdCAv
dXNyL3NoYXJlL3pvbmVpbmZvIGlzIHdoZXJlIHdlIGluc3RhbGwgVFogZGF0YSBpbiB0aGUgdHpk
YXRhCnBhY2thZ2UpLgoKPiArCS0tZW5hYmxlLXRtcGZpbGVzLmQ9bm8gXAoKRGl0dG8sIEkgYW0g
bm90IHN1cmUgaXQgbWFrZXMgc2Vuc2UgdG8gdWJuY29uZGl0aW9uYWxseSBkaXNhYmxlIHN1cHBv
cnQKZm9yIHRtcGZpbGVzLCBlc3BlY2lhbGx5IHdoZW4gc3lzdGVtZCBpcyBhY3R1YWxseSB1c2Vk
IGFzIHRoZSBpbml0CnN5c3RlbS4KCkluZGVlZCwgdGhlIGNvZGUgZGVmYXVsdHMgdG8gbG9va2lu
ZyBvbiB0aGUgaG9zdCB0byBmaW5kIHdoZXJlIHRoZXkKc2hvdWxkIGJlLCBhbmQgb2YgY291cnNl
IHRodCBkb2VzIG5vdCB3b3JrIGluIGNyb3NzLWNvbXBpbGF0aW9uLiBCdXQKdGhhdCBwYXRoIGlz
IHVzZWQgdG8gaW5zdGFsbCBmaWxlcywgc28gdGhlcmUgaXMgcHJvYmFibHkgbm8gcmVhc29uIG5v
dAp0ZWxsIHN1ZG8gd2hlcmUgdG8gaW5zdGFsbCBpdHMgZmlsZXM6CgogICAgLS1lbmFibGUtdG1w
ZmlsZXMuZD0kKGlmICQoQlIyX1BBQ0FLR0VfU1lTVEVNRCksL3Vzci9saWIvdG1wZmlsZXMuZCxu
bykKCkNvdWxkIHlvdSBsb29rIGludG8gdGhpcyBhbmQgcmVzcGluIGEgcGF0Y2gsIHBsZWFzZT8K
ClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICAJLS13aXRob3V0LWxlY3R1cmUgXAo+ICAJLS13
aXRob3V0LXNlbmRtYWlsIFwKPiAgCS0td2l0aG91dC11bWFzayBcCj4gLS0gCj4gMi4zNy4zCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1
NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAg
ICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJ
TlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAon
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
