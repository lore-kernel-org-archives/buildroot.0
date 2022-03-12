Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719FCC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 21:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2821660E84;
	Sat, 12 Mar 2022 21:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vzdm1QICjBGn; Sat, 12 Mar 2022 21:31:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12B6960E80;
	Sat, 12 Mar 2022 21:31:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D0891BF5F5
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 21:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CA234136C
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 21:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WoRl0VUSuHml for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 21:31:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FC0841299
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 21:31:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91a3:d0c0:1a06:f60f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 399C0780316;
 Sat, 12 Mar 2022 22:31:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647120665;
 bh=GNFE+jj9vOyW6H8/kzc5I9UUQoYexht0kQbILo0Wg3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GKnIFabpZuz+ktw1pTP+QSUVt6ll0nEmx3xD/gEf/QYgnOJKxbDR2sCjqFqSqtEHj
 xZck0yI4Tx0UCMn8XrlGjm/AR3DivkmBLYCbn3kaEaYKNO07CWgY6pu1rVKODeDhOD
 dsXF6Upbg3WRNVgIHkhe5+e+yAQ0yBouLaSuay3wClUFzBOy0WsXif8cT1FBngvoRk
 6US3RJuYDSbQ0PIXvhMcSvRHLawvBUd89nH1WgYuF/BVaHteDLu7TSPOlYrm/8hem8
 YunLg7Uf0WfLhI1EeKGI5KzrkpLySSCtc54+uUeaAV5vU9WRuHtBnRUAe8SsuEgsf8
 Y/Be2eBCuHJLA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Mar 2022 22:31:02 +0100
Date: Sat, 12 Mar 2022 22:31:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220312213102.GP283544@scaer>
References: <20220311065511.14015-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311065511.14015-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/openssh: fix
 '-fzero-call-used-regs' option support detection
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

UGV0ZXIsIEFsbCwKCk9uIDIwMjItMDMtMTEgMDc6NTUgKzAxMDAsIFBldGVyIFNlaWRlcmVyIHNw
YWtlIHRodXNseToKPiAtIGFkZCB1cHN0cmVhbSBwYXRjaCAoWzFdKSB0byBmaXggJy1memVyby1j
YWxsLXVzZWQtcmVncycgZ2NjIGNvbXBpbGVyIG9wdGlvbgo+ICAgc3VwcG9ydCBkZXRlY3Rpb24K
PiAKPiAtIGFkZCBhdXRvcmVjb25mIGFzIHRoZSBwYXRjaCB0b3VjaGVzIG00L29wZW5zc2gubTQK
PiAKPiBGaXhlczoKPiAKPiAgIC0gaHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNn
aT9pZD0xNDY1MQo+IAo+ICAgYml0bWFwLmM6IEluIGZ1bmN0aW9uIOKAmHJlc2VydmXigJk6Cj4g
ICBiaXRtYXAuYzo5ODoxOiBzb3JyeSwgdW5pbXBsZW1lbnRlZDog4oCYLWZ6ZXJvLWNhbGwtdXNl
ZC1yZWdz4oCZIG5vdCBzdXBwb3J0ZWQgb24gdGhpcyB0YXJnZXQKPiAgICAgIDk4IHwgfQo+ICAg
ICAgICAgfCBeCj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuc3NoL29wZW5zc2gtcG9y
dGFibGUvY29tbWl0L2YxMDc0NjcxNzk0MjhhMGUzZWE5ZTRhYTk3MzhhYzEyZmYwMjgyMmQucGF0
Y2gKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+
CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4g
LS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAgIC0gcmViYXNlZCBhbmQgcmVudW1iZXJlZCBwYXRj
aCBmcm9tIDAwMDEtSW1wcm92ZS1kZXRlY3Rpb24tb2YtZnplcm8tY2FsbC11c2VkLXJlZ3MtYWxs
LXN1cHBvci5wYXRjaAo+ICAgICB0byAwMDAyLUltcHJvdmUtZGV0ZWN0aW9uLW9mLWZ6ZXJvLWNh
bGwtdXNlZC1yZWdzLWFsbC1zdXBwb3IucGF0Y2gKPiAtLS0KPiAgLi4ubi1vZi1memVyby1jYWxs
LXVzZWQtcmVncy1hbGwtc3VwcG9yLnBhdGNoIHwgMzggKysrKysrKysrKysrKysrKysrKwo+ICBw
YWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tayAgICAgICAgICAgICAgICAgICAgfCAgNCArKwo+ICAy
IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2Uvb3BlbnNzaC8wMDAyLUltcHJvdmUtZGV0ZWN0aW9uLW9mLWZ6ZXJvLWNhbGwtdXNlZC1y
ZWdzLWFsbC1zdXBwb3IucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuc3NoLzAw
MDItSW1wcm92ZS1kZXRlY3Rpb24tb2YtZnplcm8tY2FsbC11c2VkLXJlZ3MtYWxsLXN1cHBvci5w
YXRjaCBiL3BhY2thZ2Uvb3BlbnNzaC8wMDAyLUltcHJvdmUtZGV0ZWN0aW9uLW9mLWZ6ZXJvLWNh
bGwtdXNlZC1yZWdzLWFsbC1zdXBwb3IucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAuLmNlNWM1NTM5ZmYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2Fn
ZS9vcGVuc3NoLzAwMDItSW1wcm92ZS1kZXRlY3Rpb24tb2YtZnplcm8tY2FsbC11c2VkLXJlZ3Mt
YWxsLXN1cHBvci5wYXRjaAo+IEBAIC0wLDAgKzEsMzggQEAKPiArRnJvbSBiNWZlZTVmZTk4Zjcw
OGMxZGM2MWExNTY0ZGIzNWVhY2FkYmZlOGIzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtG
cm9tOiBDb2xpbiBXYXRzb24gPGNqd2F0c29uQGRlYmlhbi5vcmc+Cj4gK0RhdGU6IFRodSwgMjQg
RmViIDIwMjIgMTY6MDQ6MTggKzAwMDAKPiArU3ViamVjdDogW1BBVENIXSBJbXByb3ZlIGRldGVj
dGlvbiBvZiAtZnplcm8tY2FsbC11c2VkLXJlZ3M9YWxsIHN1cHBvcnQKPiArCj4gK0dDQyBkb2Vz
bid0IHRlbGwgdXMgd2hldGhlciB0aGlzIG9wdGlvbiBpcyBzdXBwb3J0ZWQgdW5sZXNzIGl0IHJ1
bnMgaW50bwo+ICt0aGUgc2l0dWF0aW9uIHdoZXJlIGl0IHdvdWxkIG5lZWQgdG8gZW1pdCBjb3Jy
ZXNwb25kaW5nIGNvZGUuCj4gKwo+ICtbVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
c3NoL29wZW5zc2gtcG9ydGFibGUvY29tbWl0L2YxMDc0NjcxNzk0MjhhMGUzZWE5ZTRhYTk3Mzhh
YzEyZmYwMjgyMmQucGF0Y2hdCj4gK1NpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5y
ZXBvcnRAZ214Lm5ldD4KPiArLS0tCj4gKyBtNC9vcGVuc3NoLm00IHwgMyArKysKPiArIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiArCj4gK2RpZmYgLS1naXQgYS9tNC9vcGVuc3No
Lm00IGIvbTQvb3BlbnNzaC5tNAo+ICtpbmRleCA0ZjljMzc5Li44YzMzYzcwIDEwMDY0NAo+ICst
LS0gYS9tNC9vcGVuc3NoLm00Cj4gKysrKyBiL200L29wZW5zc2gubTQKPiArQEAgLTE0LDYgKzE0
LDggQEAgQUNfREVGVU4oW09TU0hfQ0hFQ0tfQ0ZMQUdfQ09NUElMRV0sIFt7Cj4gKyAJQUNfQ09N
UElMRV9JRkVMU0UoW0FDX0xBTkdfU09VUkNFKFtbCj4gKyAjaW5jbHVkZSA8c3RkbGliLmg+Cj4g
KyAjaW5jbHVkZSA8c3RkaW8uaD4KPiArKy8qIFRyaXZpYWwgZnVuY3Rpb24gdG8gaGVscCB0ZXN0
IGZvciAtZnplcm8tY2FsbC11c2VkLXJlZ3MgKi8KPiArK3ZvaWQgZihpbnQgbikge30KPiArIGlu
dCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikgewo+ICsgCSh2b2lkKWFyZ3Y7Cj4gKyAJLyog
U29tZSBtYXRoIHRvIGNhdGNoIC1mdHJhcHYgcHJvYmxlbXMgaW4gdGhlIHRvb2xjaGFpbiAqLwo+
ICtAQCAtMjEsNiArMjMsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpIHsKPiAr
IAlmbG9hdCBsID0gaSAqIDIuMTsKPiArIAlkb3VibGUgbSA9IGwgLyAwLjU7Cj4gKyAJbG9uZyBs
b25nIGludCBuID0gYXJnYyAqIDEyMzQ1TEwsIG8gPSAxMjM0NUxMICogKGxvbmcgbG9uZyBpbnQp
YXJnYzsKPiArKwlmKDApOwo+ICsgCXByaW50ZigiJWQgJWQgJWQgJWYgJWYgJWxsZCAlbGxkXG4i
LCBpLCBqLCBrLCBsLCBtLCBuLCBvKTsKPiArIAkvKgo+ICsgCSAqIFRlc3QgZmFsbHRocm91Z2gg
YmVoYXZpb3VyLiAgY2xhbmcgMTAncyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoIGRvZXMKPiArLS0g
Cj4gKzIuMzUuMQo+ICsKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuc3NoL29wZW5zc2gubWsg
Yi9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tawo+IGluZGV4IDBlMGQ1OWU2YWIuLjg0YWRkOTU2
M2QgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9vcGVuc3NoL29wZW5zc2gubWsKPiArKysgYi9wYWNr
YWdlL29wZW5zc2gvb3BlbnNzaC5tawo+IEBAIC0xMiw2ICsxMiwxMCBAQCBPUEVOU1NIX0NQRV9J
RF9VUERBVEUgPSAkKE9QRU5TU0hfVkVSU0lPTl9NSU5PUikKPiAgT1BFTlNTSF9TSVRFID0gaHR0
cDovL2Z0cC5vcGVuYnNkLm9yZy9wdWIvT3BlbkJTRC9PcGVuU1NIL3BvcnRhYmxlCj4gIE9QRU5T
U0hfTElDRU5TRSA9IEJTRC0zLUNsYXVzZSwgQlNELTItQ2xhdXNlLCBQdWJsaWMgRG9tYWluCj4g
IE9QRU5TU0hfTElDRU5TRV9GSUxFUyA9IExJQ0VOQ0UKPiArCj4gKyMgcGF0Y2ggdG91Y2hpbmcg
bTQvb3BlbnNzaC5tNAo+ICtPUEVOU1NIX0FVVE9SRUNPTkYgPSBZRVMKPiArCj4gIE9QRU5TU0hf
Q09ORl9FTlYgPSBcCj4gIAlMRD0iJChUQVJHRVRfQ0MpIiBcCj4gIAlMREZMQUdTPSIkKFRBUkdF
VF9DRkxBR1MpIiBcCj4gLS0gCj4gMi4zNS4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUu
IE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycg
Y29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwg
LyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1B
SUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
