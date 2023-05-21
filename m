Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728B2C77B73
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 15:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC985821B8;
	Sun, 21 May 2023 15:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC985821B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XV8IXED0br3V; Sun, 21 May 2023 15:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E85F982133;
	Sun, 21 May 2023 15:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E85F982133
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55EF91BF3CD
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B32560AF6
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B32560AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xo9Z-oTXnOnk for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 15:40:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33FFB6058B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33FFB6058B
 for <buildroot@buildroot.org>; Sun, 21 May 2023 15:40:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:cc91:114a:eab6:96e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 322F5B00535;
 Sun, 21 May 2023 17:40:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 17:40:08 +0200
Date: Sun, 21 May 2023 17:40:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20230521154008.GF171618@scaer>
References: <20230503023926.587412-1-alistair.francis@wdc.com>
 <20230513160934.GU2582048@scaer>
 <CAKmqyKMJyT2HKELoQ_EShPYLv=DJDJYAwhYJg+srEP7sFO1zoA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKmqyKMJyT2HKELoQ_EShPYLv=DJDJYAwhYJg+srEP7sFO1zoA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684683612;
 bh=aU1AjUooVmoywb4yX2xFRaLFOr6HegdeWtbmfhx2VRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bkGIrzO7CgBnyXv+xgU9nNKYfHAxx+QBb1E7JTFUzA4VuN8fKZ6/5JnSkVVRaAJV0
 VrsIH3JqFbSZMoG+0mJL9B0YglXKx+QGCQwVoSMqiQTRVku8LJ1NNdK5PJv2B2rhEJ
 KHWWARrnhC6apMuZKrI93AC6w+NTn8uTPD32rIB06fZ5FnN2H9vnZEiSYW9e+ihG0X
 qe620TenxbBs+LIfa7GKtUVxLtEYxdYNjHWafZAe8Te47tARaPOHKYHZit3ydUfd4e
 0tEGETfeiKFnls3HvxYHzmBYUDerbA9f98uZtfcTE2z14jZrqveDqfkadscnGhba+7
 VC2OR9BvDl5jQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bkGIrzO7
Subject: Re: [Buildroot] [PATCH] package/cmocka: Ensure we always build
 static libs
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
Cc: Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxpc3RhaXIsIEFsbCwKCk9uIDIwMjMtMDUtMTcgMTQ6NTggKzEwMDAsIEFsaXN0YWlyIEZyYW5j
aXMgc3Bha2UgdGh1c2x5Ogo+IE9uIFN1biwgTWF5IDE0LCAyMDIzIGF0IDI6MDnigK9BTSBZYW5u
IEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4gPiBPbiAyMDIzLTA1
LTAzIDEyOjM5ICsxMDAwLCBBbGlzdGFpciBGcmFuY2lzIHNwYWtlIHRodXNseToKPiA+ID4gU29t
ZSBwYWNrYWdlcyB0aGF0IHVzZSBjbW9ja2EgYXMgYSBkZXBlbmRlbmN5IHdpbGwgbGluayBhZ2Fp
bnN0IHRoZQo+ID4gPiBzdGF0aWMgbGlicywgc28gbGV0J3MgYnVpbGQgdGhlbSBieSBkZWZhdWx0
Lgo+ID4gV2hhdCBwYWNrYWdlcz8gQXJlIHRoZXkgaW4gQnVpbGRyb290PyBXaHkgY2FuJ3QgdGhl
eSBsaW5rIHRvIHRoZSBzaGFyZWQKPiA+IGxpYnJhcnk/Cj4gSSBzaG91bGQgaGF2ZSBrZXB0IHRo
aXMgcGF0Y2ggYXMgcGFydCBvZiBhIHNlcmllcywgYnV0IGl0J3MgZm9yCj4gbGlic3BkbTogaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMy1NYXkvNjY3
MDY0Lmh0bWwKCkJ1dCB0aGVuLCB3aHkgZG9lcyBsaWJzcGRtIHJlcXVpcmUgdGhlIHN0YXRpYyBj
bWxvY2thIGxpYnJhcnk/CgpBbmQgZ2l2ZW4gdGhlIGh1Z2UgYW1vdW50IG9mIHBhdGNoaW5nIHlv
dSBhbHJlYWR5IGFkZGVkLCB0aGlzIGNvdWxkIGFsc28KaW5jbHVkZSBjaGFuZ2VzIHRvIGFjY2Vw
dCB0aGUgc2hhcmVkIHZhcmlhbnQuCgpXaGljaCBicmluZ3MgbWUgdG8gdGhlIGZhY3QgdGhhdCwg
d2l0aCBodWdlIHBhdGNoZXMgYWdhaW5zdCBsaWJzcGRtLCBpdAppcyBnb2luZyB0byBiZSBxdWl0
ZSBzb21lIHdvcmsgdG8gbWFpbnRhaW4gdGhvc2UgcGF0Y2hlcyB3aGVuIHdlIHdhbnQgdG8KdXBk
YXRlIGxpYnNwZG0uLi4uIEknbGwgcmVwbHkgZnVydGhlciB0aGVyZS4uLgoKUmVnYXJkcywKWWFu
biBFLiBNT1JJTi4KCj4gQWxpc3RhaXIKPiAKPiA+Cj4gPiBSZWdhcmRzLAo+ID4gWWFubiBFLiBN
T1JJTi4KPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWly
LmZyYW5jaXNAd2RjLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBwYWNrYWdlL2Ntb2NrYS9jbW9ja2Eu
bWsgfCA0IC0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jbW9ja2EvY21vY2thLm1rIGIvcGFja2FnZS9jbW9j
a2EvY21vY2thLm1rCj4gPiA+IGluZGV4IGVhZmI0ODk4ZTEuLmUyMTI5NjkyMWQgMTAwNjQ0Cj4g
PiA+IC0tLSBhL3BhY2thZ2UvY21vY2thL2Ntb2NrYS5tawo+ID4gPiArKysgYi9wYWNrYWdlL2Nt
b2NrYS9jbW9ja2EubWsKPiA+ID4gQEAgLTE1LDEwICsxNSw2IEBAIENNT0NLQV9DT05GX09QVFMg
PSAtRFdJVEhfRVhBTVBMRVM9T0ZGCj4gPiA+ICAjIGNtb2NrYSBvbmx5IHN1cHBvcnRzIG91dCBv
ZiBzb3VyY2UgYnVpbGRzCj4gPiA+ICBDTU9DS0FfU1VQUE9SVFNfSU5fU09VUkNFX0JVSUxEID0g
Tk8KPiA+ID4KPiA+ID4gLSMgY21vY2thIGFsd2F5cyBidWlsZHMgYSBzaGFyZWQgbGlicmFyeSwg
YnV0IHlvdSBjYW4gb3B0aW9uYWxseSBidWlsZCBhIHN0YXRpYwo+ID4gPiAtIyBsaWJyYXJ5IGFz
IHdlbGwKPiA+ID4gLWlmZXEgKCQoQlIyX1NIQVJFRF9TVEFUSUNfTElCUykseSkKPiA+ID4gIENN
T0NLQV9DT05GX09QVFMgKz0gLURXSVRIX1NUQVRJQ19MSUI9T04KPiA+ID4gLWVuZGlmCj4gPiA+
Cj4gPiA+ICAkKGV2YWwgJChjbWFrZS1wYWNrYWdlKSkKPiA+ID4gLS0KPiA+ID4gMi4zOS4yCj4g
PiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cj4gPgo+ID4gLS0KPiA+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gPiB8ICBZYW5u
IEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmlj
cycgY29uc3BpcmFjeTogfAo+ID4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiA+IHwgKzMzIDU2
MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8g
IFRoZXJlIGlzIG5vICB8Cj4gPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypc
XyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ID4gJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS0tLScKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cnwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
