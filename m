Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A507C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 15:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2513040436;
	Sat,  5 Nov 2022 15:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2513040436
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6S1X6GmN-Coj; Sat,  5 Nov 2022 15:07:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FC254033F;
	Sat,  5 Nov 2022 15:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FC254033F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75D791BF285
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 15:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BBD541624
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 15:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BBD541624
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FbPy3k4js0G2 for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 15:07:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06F4C40448
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06F4C40448
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 15:07:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.11.77.72])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 4991E2003B4;
 Sat,  5 Nov 2022 16:07:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 05 Nov 2022 16:07:44 +0100
Date: Sat, 5 Nov 2022 16:07:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nuno =?utf-8?Q?Gon=C3=A7alves?= <nunog@fr24.com>
Message-ID: <20221105150743.GI3918838@scaer>
References: <20221004111528.384625-1-nunog@fr24.com>
 <20221004111528.384625-3-nunog@fr24.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221004111528.384625-3-nunog@fr24.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667660866;
 bh=k4EzRvB/11WX/y+RCK8l3ccBkIOGLN5efX9znNSbAFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gQryX18urUyR8sL67jSZoRKqKG1n+RW8rGD4AkEC4sXfElJH2wrKFQU//mQRLZiu/
 6DKwrCHTaLlaIIde13JTt0hkUlSBOh3o1SIbG5ePU0UYEX0YkuExyYLXzxIZB6yBpw
 cZCOjJeZ3dh4JebrJQ4r770TWstIlIJkgIPgyChqLugfrqZVaM/Gdf7dE4k2+8CNfd
 IwqDwYU7ENDtKm9np7Ckjvjp/+CCQKTlaq+1VDATueV6q/8pAHpokAGSR22ofDfLJS
 cXHbu+wwdPGRm/J0t9L/E6kwNk505m1//eXs0CV+bNQMyAAgEWuqcBX6RtFg0vfUgt
 V23gWcuKSOgBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gQryX18u
Subject: Re: [Buildroot] [PATCH 3/3] package/libopenssl: don't build afalgeng
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
YWtlIHRodXNseToKPiBBZmFsZ2VuZyBpcyBub3QgY3Jvc3MtY29tcGlsZWQgc28gaXMgdXNlbGVz
cyBhbmQgbGVha3MgYnVpbGQgaG9zdCBpbmZvCgpMb29raW5nIGF0IHRoZSBjb25maWd1cmUgc2Ny
aXB0IGZvciBsaWJvcGVuc3NsLCBhZmFsZ2VuZyBzaG91bGQgYWxyZWFkeQpiZSBmb3JjaWJseSBk
aXNhYmxlZCBiZWNhdXNlIG9mIGNyb3NzLWNvbXBpbGF0aW9uOgoKICAxNTU3ICAgICAgICAgaWYg
KCRjb25maWd7Q1JPU1NfQ09NUElMRX0gZXEgIiIpIHsKICAxNTU4ICAgICAgICAgICAgIG15ICR2
ZXJzdHIgPSBgdW5hbWUgLXJgOwogIDE1NTkgICAgICAgICAgICAgbXkgKCRtYSwgJG1pMSwgJG1p
MikgPSBzcGxpdCgiXFwuIiwgJHZlcnN0cik7CiAgMTU2MCAgICAgICAgICAgICAoJG1pMikgPSAk
bWkyID1+IC8oXGQrKS87CiAgMTU2MSAgICAgICAgICAgICBteSAkdmVyID0gJG1hKjEwMDAwICsg
JG1pMSoxMDAgKyAkbWkyOwogIDE1NjIgICAgICAgICAgICAgaWYgKCR2ZXIgPCAkbWludmVyKSB7
CiAgMTU2MyAgICAgICAgICAgICAgICAgZGlzYWJsZSgndG9vLW9sZC1rZXJuZWwnLCAnYWZhbGdl
bmcnKTsKICAxNTY0ICAgICAgICAgICAgIH0gZWxzZSB7CiAgMTU2NSAgICAgICAgICAgICAgICAg
cHVzaCBAeyRjb25maWd7ZW5nZGlyc319LCAiYWZhbGciOwogIDE1NjYgICAgICAgICAgICAgfQog
IDE1NjcgICAgICAgICB9IGVsc2UgewogIDE1NjggICAgICAgICAgICAgZGlzYWJsZSgnY3Jvc3Mt
Y29tcGlsaW5nJywgJ2FmYWxnZW5nJyk7CiAgMTU2OSAgICAgICAgIH0KCkhvd2V2ZXIsIHdlIG5l
dmVyIHNldCBDUk9TU19DT01QSUxFLi4uCgpTbywgSSd2ZSBleHRlbmRlZCB0aGUgY29tbWl0IGxv
ZyB0byBleHBsYWluIHRoZSBzaXR1YXRpb24gYmV0dGVyLgoKPiBTaWduZWQtb2ZmLWJ5OiBOdW5v
IEdvbsOnYWx2ZXMgPG51bm9nQGZyMjQuY29tPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4K
ClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2xpYm9wZW5zc2wvbGli
b3BlbnNzbC5tayB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wubWsgYi9wYWNrYWdlL2xp
Ym9wZW5zc2wvbGlib3BlbnNzbC5tawo+IGluZGV4IGM3YTJkNjVjYzQuLjUwZDQxYTY1MzMgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wubWsKPiArKysgYi9wYWNr
YWdlL2xpYm9wZW5zc2wvbGlib3BlbnNzbC5tawo+IEBAIC04Myw2ICs4Myw3IEBAIGRlZmluZSBM
SUJPUEVOU1NMX0NPTkZJR1VSRV9DTURTCj4gIAkJCW5vLXRlc3RzIFwKPiAgCQkJbm8tZnV6ei1s
aWJmdXp6ZXIgXAo+ICAJCQluby1mdXp6LWFmbCBcCj4gKwkJCW5vLWFmYWxnZW5nIFwKPiAgCQkJ
JChpZiAkKEJSMl9QQUNLQUdFX0xJQk9QRU5TU0xfRU5BQkxFX0NIQUNIQSksLG5vLWNoYWNoYSkg
XAo+ICAJCQkkKGlmICQoQlIyX1BBQ0tBR0VfTElCT1BFTlNTTF9FTkFCTEVfUkM1KSwsbm8tcmM1
KSBcCj4gIAkJCSQoaWYgJChCUjJfUEFDS0FHRV9MSUJPUEVOU1NMX0VOQUJMRV9SQzIpLCxuby1y
YzIpIFwKPiAtLSAKPiAyLjM3LjMKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4g
IHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGly
YWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBB
SUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0t
LS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cnwg
aHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8
ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
