Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFA5ECAAD5
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 14:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B1D141674;
	Tue,  6 Sep 2022 14:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B1D141674
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mYGhUErkIMaa; Tue,  6 Sep 2022 14:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCB07416D7;
	Tue,  6 Sep 2022 14:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCB07416D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D79A21BF25F
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 14:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF46182D45
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 14:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF46182D45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RlN931hAg4lD for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 14:59:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A829782B81
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A829782B81
 for <buildroot@busybox.net>; Tue,  6 Sep 2022 14:59:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CE9B1B0054C;
 Tue,  6 Sep 2022 16:59:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 16:59:11 +0200
Date: Tue, 6 Sep 2022 16:59:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220906145911.GC1585594@scaer>
References: <20220901105831.1825819-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901105831.1825819-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662476353;
 bh=95DdVMxRu+8YrHwPVfPJlcIzVc74Zl0xKIklnPJdUho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kocBEC6CTtGg9vL7I6pEXLAEVIYRnqi+berLIgYuT7gZLe2ZNxFh9dKoYinzGH2Qt
 0/uG4M69F6BNTt//ZvJ8NbYdykjxkSesU5+uXyoJCf5w+Woge7vtuWdEuKB3brXrCa
 b9Od/kCHBVYRoL2jPI78l8GyRTNZZoGWBNQSToGfAeD969hoeJvtGJvGB9DXFUqF5k
 BcVmvesdv9MlCNrcxZ/4+egJtrsG3V2cDmBoKegsk9Cn7uHlvL5Og/WcXpSyCWD/QJ
 J26hrMPFi6BWVmq3CWld8UIo76LTn1QaIhEOwW1jDyNQ075dUolNdG6MixmBEze95u
 eCujDaycykYEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kocBEC6C
Subject: Re: [Buildroot] [PATCH] package/luasocket: bump to version 3.1.0
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA5LTAxIDEyOjU4ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9sdWFzb2NrZXQvbHVhc29ja2V0Lmhhc2gg
fCAyICstCj4gIHBhY2thZ2UvbHVhc29ja2V0L2x1YXNvY2tldC5tayAgIHwgMiArLQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9sdWFzb2NrZXQvbHVhc29ja2V0Lmhhc2ggYi9wYWNrYWdlL2x1YXNvY2tl
dC9sdWFzb2NrZXQuaGFzaAo+IGluZGV4IGI2NmFlNTdiOS4uYmZiYzA2ZjNlIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvbHVhc29ja2V0L2x1YXNvY2tldC5oYXNoCj4gKysrIGIvcGFja2FnZS9sdWFz
b2NrZXQvbHVhc29ja2V0Lmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgIyBjb21wdXRlZCBieSBs
dWFyb2Nrcy9idWlsZHJvb3QKPiAtc2hhMjU2ICA2M2ZkMmRkMThkZmUyNDJjYTViY2MxMjAzODM5
ZTg2YTljODkzNjI2MWE5Y2E5ZjMyMDBmMmRlYWI0MzFkYTg4ICBsdWFzb2NrZXQtMy4wLjAtMS5z
cmMucm9jawo+ICtzaGEyNTYgIGY0YTIwN2Y1MGEzZjk5YWQ2NWRlZjhlMjljNTRhYzlhYWM2Njhi
MjE2NDc2ZjdmYWUzZmFlOTI0MTMzOThlZDIgIGx1YXNvY2tldC0zLjEuMC0xLnNyYy5yb2NrCj4g
IHNoYTI1NiAgMjI0YWZlNDJkMDczOGVhYWViNTdhYjI4OTQ2NmExYzRlNzcwOTE1OTFlNjlkYmNl
ZjJkYmIzODU1ODlmMmY0MSAgbHVhc29ja2V0L0xJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9sdWFzb2NrZXQvbHVhc29ja2V0Lm1rIGIvcGFja2FnZS9sdWFzb2NrZXQvbHVhc29ja2V0Lm1r
Cj4gaW5kZXggZWVlY2UyNmZkLi5iZTM2MGEzMzcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sdWFz
b2NrZXQvbHVhc29ja2V0Lm1rCj4gKysrIGIvcGFja2FnZS9sdWFzb2NrZXQvbHVhc29ja2V0Lm1r
Cj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4g
LUxVQVNPQ0tFVF9WRVJTSU9OID0gMy4wLjAtMQo+ICtMVUFTT0NLRVRfVkVSU0lPTiA9IDMuMS4w
LTEKPiAgTFVBU09DS0VUX1NVQkRJUiA9IGx1YXNvY2tldAo+ICBMVUFTT0NLRVRfTElDRU5TRSA9
IE1JVAo+ICBMVUFTT0NLRVRfTElDRU5TRV9GSUxFUyA9ICQoTFVBU09DS0VUX1NVQkRJUikvTElD
RU5TRQo+IC0tIAo+IDIuMzQuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAg
fCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJh
Y3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJ
R04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0t
LS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBo
dHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwg
ICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
