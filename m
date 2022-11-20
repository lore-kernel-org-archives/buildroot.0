Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5E0C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 09:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8A9860ABB;
	Sun, 20 Nov 2022 09:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8A9860ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYvRnwey06Ew; Sun, 20 Nov 2022 09:24:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 206AF60769;
	Sun, 20 Nov 2022 09:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 206AF60769
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F01671BF40E
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB46A81779
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:24:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB46A81779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0GBrDDhRkxMa for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 09:24:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C113081772
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C113081772
 for <buildroot@busybox.net>; Sun, 20 Nov 2022 09:24:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0a9:eda8:8a8b:60c8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EAFC9B00533;
 Sun, 20 Nov 2022 10:24:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Nov 2022 10:24:00 +0100
Date: Sun, 20 Nov 2022 10:24:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221120092400.GT2123054@scaer>
References: <20221118190014.1401088-1-francois.perrad@gadz.org>
 <20221120092240.GS2123054@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221120092240.GS2123054@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668936243;
 bh=CsiJoelJX2IJEXXu9bAs44m499O4OktUx4Jo7jcBK38=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T69fN6KLGnml+/jn0hzijoP99K8vm+SFvgHTobmZLNQ9Gq1UM+xVOiQvUxy6EdlLR
 FAei/8n9MOoGVdxxAT8cyRLefnDmGnMkfcXctXYPcFzptrpI7qwk5p+7uUjo+tuI8h
 ct1AMWA0xguYdIglArhKuYQvh74znFYsh+eqme4zHFTPYHHLqQO8wNMky8rtOwQ1mE
 oiiWcFH2aNKmSHwRCqW8uL+HWFczd3uKMSIzRseWzum3YxKcU4IG5y14g1ClDmVkJ3
 TXI2FTEAvGZME6oi8Mi9QPgzYEsz+monOvYJMhOdiybM0zfE3UlJTwqxacu8W1ojBn
 AO3OrUa3RSFmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T69fN6KL
Subject: Re: [Buildroot] [PATCH] package/fakeroot: bump to version 1.30.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTExLTIwIDEwOjIyICswMTAwLCBZYW5uIEUuIE1PUklO
IHNwYWtlIHRodXNseToKPiBPbiAyMDIyLTExLTE4IDIwOjAwICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+ID4gcmVtb3ZlIHVwc3RyZWFtIHBhdGNoCj4gPiAKPiA+IHJlbW92
ZSBta2RpciBidWlsZC1hdXggKG5vIGxvbmdlciBuZWVkZWQsIGxpa2UgQVVUT1JFQ09ORikKPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fk
ei5vcmc+Cj4gPiAtLS0KPiBbLS1TTklQLS1dCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mYWtl
cm9vdC9mYWtlcm9vdC5tayBiL3BhY2thZ2UvZmFrZXJvb3QvZmFrZXJvb3QubWsKPiA+IGluZGV4
IDNmYWRmMWMwZi4uNWI0ZmIyNmEzIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9mYWtlcm9vdC9m
YWtlcm9vdC5tawo+ID4gKysrIGIvcGFja2FnZS9mYWtlcm9vdC9mYWtlcm9vdC5tawo+ID4gQEAg
LTQsOSArNCw5IEBACj4gPiAgIwo+ID4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPiAgCj4g
PiAtRkFLRVJPT1RfVkVSU0lPTiA9IDEuMjYKPiA+ICtGQUtFUk9PVF9WRVJTSU9OID0gMS4zMC4x
Cj4gPiAgRkFLRVJPT1RfU09VUkNFID0gZmFrZXJvb3RfJChGQUtFUk9PVF9WRVJTSU9OKS5vcmln
LnRhci5nego+ID4gLUZBS0VST09UX1NJVEUgPSBodHRwczovL3NuYXBzaG90LmRlYmlhbi5vcmcv
YXJjaGl2ZS9kZWJpYW4vMjAyMTA5MDdUMDkyNTEyWi9wb29sL21haW4vZi9mYWtlcm9vdAo+ID4g
K0ZBS0VST09UX1NJVEUgPSBodHRwczovL2RlYi5kZWJpYW4ub3JnL2RlYmlhbi9wb29sL21haW4v
Zi9mYWtlcm9vdAo+IAo+IFdlIHN0aWxsIHdhbnQgdG8gdXNlIHNuYXBzaG90LmRlYmlhbi5vcmcs
IHNvIHRoYXQgd2UgY2FuIHN0aWxsIHJldHJpZXZlCj4gdGhhdCB0YXJiYWxsIGluIHRoZSBmdXR1
cmUgKHdoZW4gbm8gdGhlbi1jdXJyZW50IGRlYmlhbiB2ZXJzaW9uIHVzZSBpdAo+IGFueW1vcmUp
LiBTbywgSSByZXZlcnRlZCB0byBzLmQubywgdG8gdGhlIGN1cnJlbnQgZGF0ZToKPiAgICAgaHR0
cHM6Ly9zbmFwc2hvdC5kZWJpYW4ub3JnL2FyY2hpdmUvZGViaWFuLzIwMjIxMTIwVDAzMDI1OFov
cG9vbC9tYWluL2YvZmFrZXJvb3QKPiAKPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKSSBt
ZWFudCBzL21hc3Rlci9uZXh0Lzsgc29ycnkgZm9yIHRoZSBjb25mdXNpb24uLi4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPiAKPiA+ICBIT1NU
X0ZBS0VST09UX0RFUEVOREVOQ0lFUyA9IGhvc3QtYWNsCj4gPiAgIyBGb3JjZSBjYXBhYmlsaXRp
ZXMgZGV0ZWN0aW9uIG9mZgo+ID4gQEAgLTE4LDkgKzE4LDQgQEAgSE9TVF9GQUtFUk9PVF9DT05G
X0VOViA9IFwKPiA+ICBGQUtFUk9PVF9MSUNFTlNFID0gR1BMLTMuMCsKPiA+ICBGQUtFUk9PVF9M
SUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ID4gIAo+ID4gLWRlZmluZSBIT1NUX0ZBS0VST09UX0JV
SUxEX0FVWAo+ID4gLQlta2RpciAtcCAkKEBEKS9idWlsZC1hdXgKPiA+IC1lbmRlZgo+ID4gLUhP
U1RfRkFLRVJPT1RfUE9TVF9QQVRDSF9IT09LUyArPSBIT1NUX0ZBS0VST09UX0JVSUxEX0FVWAo+
ID4gLQo+ID4gICQoZXZhbCAkKGhvc3QtYXV0b3Rvb2xzLXBhY2thZ2UpKQo+ID4gLS0gCj4gPiAy
LjM3LjIKPiA+IAo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKPiAKPiAtLSAKPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9S
SU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25z
cGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8g
Q0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwg
LyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2
IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAg
ICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlO
U1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsu
b3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cict
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
