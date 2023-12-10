Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7831DC4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 13:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 142BD60ACA;
	Sun, 10 Dec 2023 13:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 142BD60ACA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYH5O1hbz-U2; Sun, 10 Dec 2023 13:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3106D60A93;
	Sun, 10 Dec 2023 13:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3106D60A93
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7A4A1BF2E4
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 13:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF34C400D6
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 13:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF34C400D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9NdcKXb7s2eF for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 13:51:46 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BFF3400C5
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 13:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BFF3400C5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 649FA13F8A2;
 Sun, 10 Dec 2023 14:51:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 10 Dec 2023 14:51:41 +0100
Date: Sun, 10 Dec 2023 14:51:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZXXCbVmFjaGlzOVT@landeda>
References: <5969347.lOV4Wx5bFT@kilian-aisec>
 <7af21f66-d3c5-e42f-03e5-8a1f6b370520@mind.be>
 <20230902094244.0251e004@windsurf> <ZXXBnuTeg_LcSWgZ@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXXBnuTeg_LcSWgZ@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702216304;
 bh=ysGONeUbsq7B8vVIajFKJRDv9ZSOJOAtURD22gfLhsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jmHKTy7MuujRne74MJfZWuJwcOOVbomMjTpZAx2X0UG0/EiT30OvW7QOOHdsRbvmn
 IeEMb3yseCsAWURXjQYZQS4GATxMYoDOJJFYIa613yuA7Ke/UVoT5bxALvYvG3MR4P
 BI6NakZhTtTSt6H3fUe5jBaU9H7liM6l30Xrmf9gGwBFFhSdHUlDVMOOVcbJN6uOAP
 +dK0Xqa2SqGemBmdmeklV9aBnOYdMFFAIZKVVr5qR8C6EWeFaapuZA8c8zbCrXyOdD
 l8MLYE8RVvqJKyxagbU6RnRy+1nmiWV/INL8U7KcTae6it3Od9V+4wcG/CaUUsrduq
 giJynzBmKIxaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jmHKTy7M
Subject: Re: [Buildroot] Buildroot docker image
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmUuCgpPbiAyMDIzLTEyLTEwIDE0OjQ4ICswMTAwLCBZYW5uIEUuIE1PUklOIHNwYWtlIHRodXNs
eToKPiBUaG9tYXMsIEFsbCwKPiAKPiBPbiAyMDIzLTA5LTAyIDA5OjQyICswMjAwLCBUaG9tYXMg
UGV0YXp6b25pIHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+ID4gT24gRnJpLCAxIFNlcCAy
MDIzIDA5OjE5OjAyICswMjAwCj4gPiBBcm5vdXQgVmFuZGVjYXBwZWxsZSB2aWEgYnVpbGRyb290
IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4gPiA+ICAgRmlyc3Qgb2YgYWxsLCB0
aGUgb25lIG9uIGRvY2tlcmh1YiBpcyBubyBsb25nZXIgdXBkYXRlZC4gVGhlIGltYWdlcyB3ZSAK
PiA+ID4gYWN0dWFsbHkgdXNlIGFyZSBvbiByZWdpc3RyeS5naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290L2Jhc2UKPiA+ID4gCj4gPiA+ICAgQnV0IGV2ZW4gdGhvc2UgaW1hZ2VzIGFy
ZSBub3QgcmVhbGx5ICJmb3IgdXNlciBjb25zdW1wdGlvbiIuIFRoZXkgYXJlIHRoZSAKPiA+ID4g
aW1hZ2VzIHdlIHVzZSBmb3IgQ0ksIGFuZCB0aGV5IHRoZXJlZm9yZSBoYXZlIGEgYml0IG1vcmUg
c3R1ZmYgaW4gdGhlbSB0aGFuIAo+ID4gPiByZWFsbHkgbmVlZGVkLCBlLmcuIHFlbXUuIFRoZXkg
YXJlIGFsc28gbm90IHVwZGF0ZWQgKG9uIHRoZSBPUyBsZXZlbCkgLSBubyAKPiA+ID4gc2VjdXJp
dHkgdXBkYXRlcyBvciBhbnl0aGluZyBhcmUgYXBwbGllZCBvbiBpdC4KPiA+ID4gCj4gPiA+ICAg
SXQgd291bGQgcHJvYmFibHkgYmUgYmV0dGVyIGlmIHdlIHdvdWxkIGFsc28gY3JlYXRlIGEgc21h
bGwgaW1hZ2UgdGhhdCBwZW9wbGUgCj4gPiA+IGNhbiB1c2UgZm9yIGp1c3QgYnVpbGRpbmcgaW4g
dGhlaXIgQ0kuIEEgc21hbGwgaW1hZ2UgYmFzZWQgb24gZS5nLiBBbHBpbmUgb3IgCj4gPiA+IEFy
Y2gsIGFuZCB0aGF0IGlzIHVwZGF0ZWQgZS5nLiBkYWlseSBvbiBkb2NrZXJodWIuIEhvd2V2ZXIs
IG5vYm9keSBldmVyIAo+ID4gPiBjb250cmlidXRlZCBzdWNoIGFuIGltYWdlIHNvIHdlIGRvbid0
IGhhdmUgaXQuCj4gPiAKPiA+IFlhbm4gaGFzIGJlZW4gd29ya2luZyBvbiBhbmQgb2ZmIG9uIGEg
c2V0IG9mIERvY2tlciBpbWFnZXMgZm9yCj4gPiBCdWlsZHJvb3QuIFNlZSBoaXMgYnJhbmNoIGF0
Cj4gPiBodHRwczovL2dpdGxhYi5jb20veW1vcmluL2J1aWxkcm9vdC8tL2NvbW1pdHMveWVtL2Rv
Y2tlcnMvLiBJIGluZGVlZAo+ID4gc2hhcmVkIHdpdGggaGltIHJlY2VudGx5IG9uIElSQyB0aGF0
IGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBhIHJlYWxseQo+ID4gbWluaW1hbCBpbWFnZSwgc2Vw
YXJhdGUgZnJvbSB0aGUgaW1hZ2UgdXNlZCBpbiBDSSAod2hpY2ggaGFzIG1vcmUgc3R1ZmYKPiA+
IGVuYWJsZWQsIG1vc3Qgbm90YWJseSBweXRob24zKS4KPiAKPiBJIHdhcyBsb29raW5nIGF0IHRo
aXMgcmlnaHQgbm93LCBhbmQgaW4gZmFjdCBJIGJlbGlldmUgdGhlIGV4aXN0aW5nCj4gaW1hZ2Ug
aXMgdGhlIHBlcmZlY3QgZmlyIGFzIHRoZSBtaW5pbWFsIGltYWdlIHRvIHVzZS4KCnMvZmlyL2Zp
dC8KCj4gSW5kZWVkLCBsZXQncyB0YWtlIGEgbG9vayBhdCB3aGF0IHdlIGhhdmUgdGhlcmUsIGFu
ZCB3aHkgd2UgZG86Cj4gCj4gICBNVFNDUgo+ICAgw5cgICAgIGJjCj4gICDDlyAgICAgYnVpbGQt
ZXNzZW50aWFsCj4gICAgICAgICBienIKPiAgIMOXICAgICBjYS1jZXJ0aWZpY2F0ZXMKPiAgICDD
lyAgICBjbWFrZQoKY21ha2Ugc2hvdWxkIGhhdmUgYmVlbiBpbiB0aGUgJ1MnIGNvbHVtbi4KClJl
Z2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICAgw5cgICAgIGNwaW8KPiAgIMOXICAgICBjdnMKPiAg
IMOXICAgICBmaWxlCj4gICDDlyAgICAgZysrLW11bHRpbGliCj4gICDDlyAgICAgZ2l0Cj4gICAg
w5cgICAgbGliYzY6aTM4Ngo+ICAgw5cgICAgIGxpYm5jdXJzZXM1LWRldgo+ICAgw5cgICAgIGxv
Y2FsZXMKPiAgICAgICAgIG1lcmN1cmlhbAo+ICAgICAgIMOXIG9wZW5zc2gtc2VydmVyCj4gICAg
ICDDl8OXIHB5dGhvbjMKPiAgICAgIMOXICBweXRob24zLWZsYWtlOAo+ICAgICAgw5cgIHB5dGhv
bjMtbWFnaWMKPiAgICAgICDDlyBweXRob24zLW5vc2UyCj4gICAgICAgw5cgcHl0aG9uMy1wZXhw
ZWN0Cj4gICAgICAgw5cgcHl0aG9uMy1weXRlc3QKPiAgICAgICDDlyBxZW11LXN5c3RlbS1hcm0K
PiAgICAgICDDlyBxZW11LXN5c3RlbS1taXNjCj4gICAgICAgw5cgcWVtdS1zeXN0ZW0teDg2Cj4g
ICDDlyAgICAgcnN5bmMKPiAgICAgIMOXICBzaGVsbGNoZWNrCj4gICAgICAgICBzdWJ2ZXJzaW9u
Cj4gICDDlyAgICAgdW56aXAKPiAgIMOXICAgICB3Z2V0Cj4gCj4gTTogc3RyaWN0bHkgbWFuZGF0
b3J5Cj4gVDogb3B0aW9uYWwsIGJ1dCBoZWxwcyB1c2UgcHJlLWJ1aWx0IHRvb2xjaGFpbnMKPiBT
OiBvcHRpb25hbCwgc3BlZWRzIHVwIHRoZSBidWlsZAo+IEM6IG5lZWRlZCB0byBydW4gY2hlY2st
cGFja2FnZSBldCBhbC4KPiBSOiBuZWVkZWQgdG8gcnVuIHRoZSBydW50aW1lIHRlc3Qtc3VpdGUK
PiAKPiBCYXphYXIsIG1lcmN1cmlhbCBhbmQgc3VidmVyc2lvbiBhcmUgb3B0aW9uYWwsIGFuZCBv
bmx5IHJlcXVpcmVkIHdoZW4gYQo+IHBhY2thZ2UgaXMgYnpyLSwgaGctLCBvciBzdm4taG9zdGVk
LCBidXQgaWYgd2Ugd2FudCB0aGlzIGltYWdlIHRvIGJlCj4gdXNhYmxlIGdlbmVyYWxseSwgaXQg
c2hvdWxkIGhhdmUgYWxsIHRocmVlLgo+IAo+IFNpbmNlIG1lcmN1cmlhbCBpcyBhIHB5dGhvbiBw
YWNrYWdlLCB3ZSBjYW4ndCBkcm9wIHB5dGhvbjMsIGFuZCB0aGUKPiByZW1haW5pbmcgbW9kdWxl
cyBhcmUgcmVsYXRpdmVseSBzbWFsbCBpbiBjb21wYXJpc29uIHRvIHRoZSByZXN0Lgo+IAo+IEdl
dHRpbmcgYSBtb3JlIG1pbmltYWwgaW1hZ2Ugd291bGQgYmUganVzdCBhYm91dCBkcm9wcGluZyBx
ZW11LiBUaGF0Cj4gd291bGQgbWFrZSBmb3IgYW4gaW1hZ2UgdGhhdCB3ZSBjb3VsZCBub3QgdXNl
IGluIHRoZSBDSSwgYW5kIHRoYXQgd291bGQKPiBub3QgYmUgdXNhYmxlIHRvIHRlc3QgdGhlIGNo
YW5nZXMgZG9uZSB0byBCdWlsZHJvb3QuIEkgZG9uJ3QgdGhpbmsgdGhhdAo+IHdvdWxkIG1rYWUg
Zm9yIGEgZ29vZCBpbWFnZS4KPiAKPiBUaGUgc2l6ZSBvZiB0aGlzIGltYWdlIGlzIGN1cnJlbnRs
eSB+MzMwTWlCIHRvIGRvd25sb2FkLCBhbmQgfjk3NU1pQiBvZgo+IHN0b3JhZ2U7IGJ1aWxkaW5n
IGFuIGltYWdlIHdpdGhvdXQgcWVtdSB3b3VsZCBub3QgbWFrZSBtdWNoIG9mIGEKPiBkaWZmZXJl
bmNlLgo+IAo+IFNvLCBJIHRoaW5rIHRoaXMgaXMgdGhlIGJlc3QgbWluaW1hbCB3ZSBjYW4gZ2V0
IHRvLCBhcyBpdCBjb250YWlucwo+IGV2ZXJ5dGhpbmcgdGhhdCBwZW9wbGUgc2hvdWxkIG5lZWQg
dG8gYnVpbGQgYW5kIHRvIHJ1biB0aGUgdG9vbGluZy4KPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4g
TU9SSU4uCj4gCj4gLS0gCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29u
c3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAv
IENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0Mjcg
YC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMg
bm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1M
IE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0n
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
