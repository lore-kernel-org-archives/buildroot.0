Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B78EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 22:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47A8461129;
	Tue, 25 Jul 2023 22:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47A8461129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HtgcxUflN2BK; Tue, 25 Jul 2023 22:01:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D52461110;
	Tue, 25 Jul 2023 22:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D52461110
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47AEE1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 22:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EC6582135
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 22:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EC6582135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVHQjkqUZ5_T for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 22:01:43 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBF028212E
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 22:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBF028212E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id DDF25780313;
 Wed, 26 Jul 2023 00:01:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 26 Jul 2023 00:01:32 +0200
Date: Wed, 26 Jul 2023 00:01:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: stefan.nickl@gmail.com
Message-ID: <20230725220132.GA3544423@scaer>
References: <20230724191638.637054-1-Stefan.Nickl@gmail.com>
 <20230724191638.637054-2-Stefan.Nickl@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230724191638.637054-2-Stefan.Nickl@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690322500;
 bh=WUwHiY4TNBTC5gZv81IKpIXEvwnvHjQft5st6ca6oTE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TtsVlKD9a3yAt6adoHR5wfauVoOq3pj7tXHZq/8uea0UYbzGmtxiR8AXCCaVL1F1a
 oS9LFR0Je4HGVSGYwuIsfEF8T3R/YTAxwYNGqk6b0a/SRuTegVEwNDSESEoEyjgkbd
 Ty2evXXqaIY7d9W6zylx0qlRq72ir7gPI5IBWwmadinpIx0p1sxqEt1sgQtNNfAqnB
 0Hcv/49X27WX2ENO4uWZ4BPhdoQ9MpUhu4YhWjgoJW/k65VwrOdM78OHDWbhjPgCKF
 dUi0UVURmsgyAMUdeU4UZc3qBExacquzM5QKwztSR9IBAEQJC1Dn3E48f33Ro6oiGd
 EZZplEcgFmHzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TtsVlKD9
Subject: Re: [Buildroot] [PATCH v2 1/5] package/freescale-imx/firmware-imx:
 bump version to 8.20
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Charles Hardin <ckhardin@gmail.com>, buildroot@buildroot.org,
 Maeva Manuel <maeva.manuel@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U3RlZmFuLCBBbGwsCgpPbiAyMDIzLTA3LTI0IDIxOjE2ICswMjAwLCBzdGVmYW4ubmlja2xAZ21h
aWwuY29tIHNwYWtlIHRodXNseToKPiBGcm9tOiBTdGVmYW4gTmlja2wgPFN0ZWZhbi5OaWNrbEBn
bWFpbC5jb20+Cj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIE5pY2tsIDxTdGVmYW4uTmlja2xA
Z21haWwuY29tPgo+IC0tLQo+ICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtaW14L2Zp
cm13YXJlLWlteC5oYXNoIHwgNiArKystLS0KPiAgcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13
YXJlLWlteC9maXJtd2FyZS1pbXgubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJl
ZXNjYWxlLWlteC9maXJtd2FyZS1pbXgvZmlybXdhcmUtaW14Lmhhc2ggYi9wYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvZmlybXdhcmUtaW14L2Zpcm13YXJlLWlteC5oYXNoCj4gaW5kZXggZWIwYzM4N2Eu
LjBiMzU2MWE5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1p
bXgvZmlybXdhcmUtaW14Lmhhc2gKPiArKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdh
cmUtaW14L2Zpcm13YXJlLWlteC5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gICMgTG9jYWxseSBj
YWxjdWxhdGVkCj4gLXNoYTI1NiAgOTM3ZTE5NjQ3NmI4ZTk1YjRiN2YyNTAxYTE0YzgzMjZkOGEw
NjQ5ZjhhM2Y5MjI4YjcyMzczNzcwYTA4ZGViMyAgZmlybXdhcmUtaW14LTguMTUuYmluCj4gLXNo
YTI1NiAgMzUxODhlNjVkYmI5YzdkYTRiYmNiNzdjNzcyNmU4MzU2MDdmOWY0MWI4YjQ0MTQ5ODA2
ZWE1MTQyOWNhOWEzMSAgQ09QWUlORwo+IC1zaGEyNTYgIDMwZjYxODI1NTgzYjRjMjZkMjlhNzk4
YWQ3ZTRjOGVmMmYyZjM5MGIxZTk2NGFmMzAyZDJkYzQwZTkzY2IwYTQgIEVVTEEKPiArc2hhMjU2
ICBmNmRjNmE1YzhmZDliOTEzYTE1MzYwZDNjY2Q1M2QxODhkYjA1YTA4YTg1OTRjNTE4ZTU3NjIy
NDc4YzcyMzgzICBmaXJtd2FyZS1pbXgtOC4yMC5iaW4KPiArc2hhMjU2ICA5MTNiYTM4ZDRiZTk3
MzYxYzNkMGZhOWJmMmY2ZGJlN2IxYzBjNDEyMTNkZDI2OGZiNjczOGRiOTcwNGRiZTMyICBDT1BZ
SU5HCj4gK3NoYTI1NiAgNGZkOGJiNDVhMmVjMjIxMTdkMjBjZmVhODQzNzBlMmEzYTJjZDk5ZThl
MTc3MTM4YmVkMDkzODEzN2IxYWViMyAgRVVMQQoKSSBzZWUgVGhvbWFzIGFscmVhZHkgaW5xdWly
ZWQgYWJvdXQgdGhlIGxpY2Vuc2UgY2hhbmdlcywgYW5kIHRoYXQgeW91Cm1lbnRpb25lZCBvbiB5
b3VyIGNvdmVyIGxldHRlciB0aGF0IGl0ICJhcHBlYXJzIGluY29uc2VxdWVudGlhbCIuCgpIb3dl
dmVyLCB3ZSBuZWVkIHRoZSBleHBsYW5hdGlvbnMgdG8gYmUgaW4gdGhlIGNvbW1pdCBsb2csIG5v
dCB0aGUgY292ZXIKbGV0dGVyLCBzbyB0aGF0IHRoZXkgYXBwZWFyIGluIHRoZSBoaXN0b3J5ICh0
aGUgY292ZXIgbGV0dGVyIGRvZXMgbm90CmVuZCB1cCBpbiB0aGUgcmVwb3NpdG9yeSkuCgpBbmQg
d2UgbmVlZCB0aGUgZXhwbGFuYXRpb25zIHRvIGJlIGV4cGxpY2l0LCBldmVuIGlmIHRlcnNlLiBJ
biB0aGlzCmNhc2UsIHRoZSBidWxrIG9mIHRoZSBjaGFuZ2VzIGFyZToKICAtIHVwZGF0ZSB0byBj
b3B5cmlnaHQgeWVhcnMgKDIwMjIgLT4gMjAyMykKICAtIHN3aXRjaCBmcm9tIEFTQ0NJIGRvdWJs
ZSBxdW90ZXMgdG8gZmFuY3kgVW5pY29kZSBvbmVzICgiIiAtPiDigJzigJ0pCiAgLSByZWZsb3cg
dGhlIGxpY2Vuc2UgdGV4dAogIC0gaWRlbnRpZnkgbmV3IHRoaXJkLXBhcnRpZXMgYW5kIHRoZWly
IGNvbmRpdGlvbnMKCkl0IGRvZXMgbm90IGxvb2sgbGlrZSBpdCBpcyBjaGFuZ2luZyBtdWNoLgoK
Q2FyZSB0byBjaGVjayB0aGUgb3RoZXIgcGFja2FnZXMsIHBsZWFzZT8KClJlZ2FyZHMsCllhbm4g
RS4gTU9SSU4uCgo+ICBzaGEyNTYgIDQwZDAyZjZkNmI0ZTk0ZDkzMDc1Mjk0MDhmMzcyZjVhOTkw
OGNmM2QxNTZlYzUzM2E0ZTU0Mjc0YjQwZjI3MWUgIFNDUi50eHQKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9maXJtd2FyZS1pbXgubWsgYi9wYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtaW14L2Zpcm13YXJlLWlteC5tawo+IGluZGV4IDRjY2Vi
NjcwLi42NmVmOGMzOSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdh
cmUtaW14L2Zpcm13YXJlLWlteC5tawo+ICsrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJt
d2FyZS1pbXgvZmlybXdhcmUtaW14Lm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLUZJUk1XQVJFX0lNWF9WRVJTSU9OID0gOC4xNQo+ICtG
SVJNV0FSRV9JTVhfVkVSU0lPTiA9IDguMjAKPiAgRklSTVdBUkVfSU1YX1NJVEUgPSAkKEZSRUVT
Q0FMRV9JTVhfU0lURSkKPiAgRklSTVdBUkVfSU1YX1NPVVJDRSA9IGZpcm13YXJlLWlteC0kKEZJ
Uk1XQVJFX0lNWF9WRVJTSU9OKS5iaW4KPiAgCj4gLS0gCj4gMi40MS4wCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBS
SUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJl
ICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICsz
MyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAg
XGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypc
XyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
