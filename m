Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357CEC25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 16:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8A6C83C53;
	Sun, 12 May 2024 16:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8kKKIPP-iCn; Sun, 12 May 2024 16:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9472783C54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9472783C54;
	Sun, 12 May 2024 16:46:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E1E51BF3C6
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 16:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AB6483C54
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 16:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pB7K_Tfi8LW3 for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 16:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B14CA83C53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B14CA83C53
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B14CA83C53
 for <buildroot@buildroot.org>; Sun, 12 May 2024 16:46:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 30D3513F8B9;
 Sun, 12 May 2024 18:46:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 May 2024 18:46:04 +0200
Date: Sun, 12 May 2024 18:46:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYp?=
 <leo@yuriev.ru>
Message-ID: <ZkDyTOH1eGNaA8Nc@landeda>
References: <20240314161116.714877-1-leo@yuriev.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240314161116.714877-1-leo@yuriev.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715532367;
 bh=FAbyk1t+3FqAYGJAUdYTpkc5q95EtvRpiJmTHHG8f+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rnoy5GQaJotWudEnCuZH5tFff5nYHFRnYSBScdyNg4Xdl18wZeD4bMk+tghd1A0Dg
 dWW+KYmCKLCKchrXrA0TDiNwSThP2Iz1ol1kFPl/OUvac2UUsO0+WT0P8HyIVGNUiv
 iCJ9tZahSYP0lvlY+hc88qF7cRFSVl+Vy2kIT5ZQQcoOT0Ij+06PbRuTydEjlrX5Om
 9HQFc1UuK0AEoppPuEVXSfmSF7a6681Zi8H5RUQyuFaSTE9cKBths1oPDhYiqjgmeB
 7skcZBL0hb4DKQZi0CWn1jhbFs5UIhe/7EccZJ9xXGGx+jTOw+1rA9k+S/hVUS5SAs
 WMV0ciCWnhUlg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Rnoy5GQa
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.12.10
 "SEM"
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

0JvQtdC+0L3QuNC0INCu0YDRjNC10LIsIEFsbCwKClRoYW5rcyBmb3IgdGhpcyB2ZXJzaW9uIGJ1
bXAsIEkndmUgYXBwbGllZCB0byBtYXN0ZXIsIGJ1dCBzZWUgYmVsb3cgZm9yCmEgZmV3IGNvbW1l
bnRzLi4uCgpPbiAyMDI0LTAzLTE0IDE5OjExICswMzAwLCDQm9C10L7QvdC40LQg0K7RgNGM0LXQ
siAoTGVvbmlkIFl1cmlldikgc3Bha2UgdGh1c2x5Ogo+IFRoaXMgaXMgYnVnZml4IHJlbGVhc2Ug
b2Ygc3RhYmxlIGxpYm1kYnggYnJhbmNoLCBpbiBtZW1vcnkgb2YgdGhlIEhlcm8KPiBvZiBSdXNz
aWEgR3VhcmQgTWFqb3IgRG1pdHJ5IFNlbWVub3Ygd2l0aCB0aGUgY2FsbCBzaWduICJTRU0iLgoK
QmVpbmcgYSBoZXJvIGRlcGVuZHMgb24gd2hvbSBvbmUgYXNrczsgc29tZW9uZSdzIGhlcm8gbWF5
IHZlcnkgd2VsbCBiZQpzb21lb25lbHNlJ3MgdmlsbGFpbi4gSW4gQnVpbGRyb290LCB3ZSdkIGxp
a2UgdG8gc3RheSBhd2F5IGZyb20gYW55CnBvbGl0aWNzIG9yIHByb3BhZ2FuZGEsIHdoYXRldmVy
IGl0cyBwdXJwb3NlIGFuZCBvcmlnaW4sIGFuZCBzdGljayB0bwp0ZWNobmljYWwgZmFjdHMgYW5k
IG1lcml0LiBTbyBJIGRyb3BwZWQgdGhhdCByZWZlcmVuY2UgZnJvbSB0aGUgY29tbWl0CmxvZyAo
YW5kIGFsc28gZnJvbSB0aGUgY29tbWl0IHRpdGxlKS4KCj4gSXQgaXMgcmVhc29uYWJsZSB0byBi
YWNrcG9ydCB0aGlzIHBhdGNoIHRvIGFsbCBhcHBsaWNhYmxlIHJlbGVhc2VzL2JyYW5jaGVzIG9m
IEJ1aWxkcm9vdC4KClRoYW5rcyBmb3IgdGhlIG5vdGljZTsgaXQgZG9lcyBub3QgYmVsb25nIHRv
IGEgY29tbWl0IGxvZywgYnV0IHRvIGEKcG9zdC1jb21taXQgbm90ZSwgYWZ0ZXIgdGhlIC0tLSBs
aW5lLgoKPiBUaGUgbW9zdCBzaWduaWZpY2FudCBmaXhlcyBzaW5jZSB2MC4xMi44IChwcmV2aW91
cyB2ZXJzaW9uIHBpbm5lZCB0byBidWlsZHJvb3QpOgo+IAo+ICAtIEZpeGVkIGFuIG1ham9yIGJ1
ZyBpbmhlcml0ZWQgZnJvbSBMTURCIChMaWdodG5pbmcgTWVtb3J5LU1hcHBlIERhdGFiYXNlKQo+
ICAgIHRoYXQgY2F1c2VzIGRhdGFiYXNlIGNvcnJ1cHRpb24gZHVyaW5nIHVzZSB0aGUgTURCWF9E
VVBGSVhFRCBtb2RlLgo+ICAgIEluIExNREIsIHRoZSBwcm9ibGVtIGhhcyBleGlzdGVkIGZvciBt
b3JlIHRoYW4gMTAgeWVhcnMgYW5kIGlzIHN0aWxsCj4gICAgcHJlc2VudCAoYXMgd2VsbCBhcyBt
b3JlIHRoYW4gYSBkb3plbiBvdGhlciBidWcgYW5kIHNob3J0Y29taW5ncwo+ICAgIGZpeGVkIGlu
IGxpYm1kYngpLgo+IAo+ICAtIEZpeGVkIG9mIGEgZmFsc2UgZXJyb3IgTURCWF9DT1JSVVBURUQg
KC0zMDc5NikgaW4gdGhlIHNjZW5hcmlvIG9mCj4gICAgd29ya2luZyBpbiB0aGUgbW9kZSBNREJY
X0RVUEZJWEVEIHdpdGggb2RkIGxlbmd0aCBvZiBtdWx0aS12YWx1ZXMuCj4gCj4gIC0gRml4ZWQg
YSBidWcgaW4gYWRqdXN0aW5nIHRoZSBjdXJzb3JzIGluIHRoZSBjYXNlIHNwbGl0dGluZyBhIHBh
Z2UgYnkKPiAgICBhZGRpbmcgYSBuZXcgcGFnZSBvbiB0aGUgbGVmdC4KPiAKPiAgLSBUcm91Ymxl
c2hvb3RpbmcgYW4gZXJyb3Igd2hlbiBvcGVuaW5nIGEgZGF0YWJhc2Ugb24gYSByZWFkLW9ubHkg
ZmlsZSBzeXN0ZW0uCj4gCj4gIC0gQSBzZXQgb2YgQysrIEFQSSBpbXByb3ZlbWVudHM6Cj4gCj4g
ICAgIC0gYWRkZWQgdGhlIG1kYng6OmN1cnNvcjo6ZXN0aW1hdGlvbl9yZXN1bHQgdHlwZSwgYW5k
IHRoZSBiZWhhdmlvcgo+ICAgICAgIG9mIG1ldGhvZHMgY3Vyc29yOjplc3RpbWF0ZSgpIGlzIHVu
aWZpZWQgd2l0aCBjdXJzb3I6Om1vdmUoKTsKPiAKPiAgICAgLSB0byBwcmV2ZW50IHVubm90aWNl
YWJsZSBpbmNvcnJlY3QgdXNlIG9mIHRoZSBBUEksIGZvciBpbml0aWFsaXppbmcKPiAgICAgICBz
bGljZXMgcmV0dXJuZWQgYnkgcmVmZXJlbmNlIHRoZSBzbGljZTo6aW52YWxpZCgpIGlzIHVzZWQs
IGluc3RlYWQgb2YKPiAgICAgICBlbXB0eSBzbGljZXM7Cj4gCj4gICAgIC0gYWRkZWQgYWRkaXRp
b25hbCBDKysgY29udmVyc2lvbiBvcGVyYXRvcnMgdG8gQyBBUEkgdHlwZXM7Cj4gCj4gICAgIC0g
dHlwZXMgYnVmZmVyOjptb3ZlX2Fzc2lnbl9hbGxvYyBhbmQgYnVmZmVyOjpjb3B5X2Fzc2lnbl9h
bGxvYyBhcmUgcHVibGljCj4gICAgICAgbm93IGZvciBjb21wYXRpYmlsaXR5IHdpdGggb2xkZXIg
QysrIHN0YW5kYXJkcyBhbmQgb2xkZXIgU1RMIHZlcnNpb25zOwo+IAo+ICAgICAtIGFkZGVkIGEg
bmV3IG1kYng6OmRlZmF1bHRfYnVmZmVyIHR5cGU7Cj4gCj4gICAgIC0gYWRkZWQgbWV0aG9kcyBm
b3Igc2xpY2VzIGFuZCBidWZmZXJzIGhleF9kZWNvZGUoKSwgYmFzZTY0X2RlY29kZSgpLAo+ICAg
ICAgIGJhc2U1OF9kZWNvZGUoKTsKPiAKPiAgICAgLSBhZGRlZCB0eXBlIG1kYng6OmNvbXBhcmF0
b3IoKSBhbmQgbWRieDo6ZGVmYXVsdF9jb21wYXJhdG9yKCkgZnVuY3Rpb25zOwo+IAo+ICAgICAt
IGFkZGVkIHN0YXRpYyBtZXRob2RzIGJ1ZmZlcjo6aGV4KCksIGJ1ZmZlcjo6YmFzZTY0KCksIGJ1
ZmZlcjo6YmFzZTU4KCk7Cj4gCj4gICAgIC0gYWRkZWQgbWV0aG9kcyBmb3IgdHJhbnNhY3Rpb25z
IGFuZCBjdXJzb3JzIGdldC9zZXRfY29udGV4dCgpOwo+IAo+ICAgICAtIGFkZGVkIHRoZSBjdXJz
b3I6OmNsb25lKCkgbWV0aG9kOwo+IAo+ICAgICAtIGltcGxlbWVudGF0aW9uIG9mIGJhc2U1OCBu
b3cgaXMgaW4gYWNjb3JkYW5jZSB3aXRoIHRoZSBSRkMgZHJhZnQuCgpUaGFua3MgZm9yIHRoZSBk
ZXRhaWxzLCBidXQgaXQgd2FzIElNSE8gYSBsaXR0bGUgYml0IHRvbyBtdWNoLCBzbyBJCnNjcnVi
YmVkIHRoZSBDKysgZGV0YWlscy4gSW50ZXJlc3RlZCBwYXJ0aWVzIHdpbGwgbm93IHRvIGxvb2sg
YXQgdGhlCmNoYW5nZWxvZywgd2hpY2ggeW91IHNwZWNpZnkgYmVsb3cuCgpBcHBsaWVkIHRvIG1h
c3RlciB3aXRodCB0aGUgYWJvdmUgZml4dXBzLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1P
UklOLgoKPiBUaGUgY29tcGxldGUgQ2hhbmdlTG9nOiBodHRwczovL2dpdGZsaWMucnUvcHJvamVj
dC9lcnRoaW5rL2xpYm1kYngvYmxvYj9maWxlPUNoYW5nZUxvZy5tZAo+IAo+IFNpZ25lZC1vZmYt
Ynk6INCb0LXQvtC90LjQtCDQrtGA0YzQtdCyIChMZW9uaWQgWXVyaWV2KSA8bGVvQHl1cmlldi5y
dT4KPiAtLS0KPiAgcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaCB8IDIgKy0KPiAgcGFja2Fn
ZS9saWJtZGJ4L2xpYm1kYngubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRi
eC9saWJtZGJ4Lmhhc2ggYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoCj4gaW5kZXggODJj
ZjI4ZDZhOS4uMWRiZGVmN2M2OSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYm1kYngvbGlibWRi
eC5oYXNoCj4gKysrIGIvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaAo+IEBAIC0xLDUgKzEs
NSBAQAo+ICAjIEhhc2hlcyBmcm9tOiBodHRwczovL2xpYm1kYnguZHFka2ZhLnJ1L3JlbGVhc2Uv
U0hBMjU2U1VNUwo+IC1zaGEyNTYgIGM3OGM1NmM1MzcwOGJiZmM1MTliZjUzZWJmNTIwZDFmMDlk
MzBlZTY0MjdhNGJlZGY3MTMzMTY2OTZlNjcxZDAgIGxpYm1kYngtYW1hbGdhbWF0ZWQtMC4xMi44
LnRhci54ego+ICtzaGEyNTYgIDQ2MzdlMDY3NjhhOWE4ZmM3NTc3ZTZlNDU4ZTA0NWFkMWY5YThi
YWVlNzQ5OTZhM2M4OGJjMGFkNjRjYmNmNjcgIGxpYm1kYngtYW1hbGdhbWF0ZWQtMC4xMi4xMC50
YXIueHoKPiAgCj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gIHNoYTI1NiAgMzEwZmUyNWM4NThh
OTUxNWZjOGM4ZDdkMWYyNGE2N2M5NDk2Zjg0YTkxZTBhMGU0MWVhOTk3NWIxMzcxZTU2OSAgTElD
RU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tayBiL3BhY2thZ2Uv
bGlibWRieC9saWJtZGJ4Lm1rCj4gaW5kZXggNGNjNmNiZDA4ZS4uNmUwNTcxZmYyNCAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tawo+ICsrKyBiL3BhY2thZ2UvbGlibWRi
eC9saWJtZGJ4Lm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiAgCj4gLUxJQk1EQlhfVkVSU0lPTiA9IDAuMTIuOAo+ICtMSUJNREJYX1ZFUlNJT04g
PSAwLjEyLjEwCj4gIExJQk1EQlhfU09VUkNFID0gbGlibWRieC1hbWFsZ2FtYXRlZC0kKExJQk1E
QlhfVkVSU0lPTikudGFyLnh6Cj4gIExJQk1EQlhfU0lURSA9IGh0dHBzOi8vbGlibWRieC5kcWRr
ZmEucnUvcmVsZWFzZQo+ICBMSUJNREJYX1NVUFBPUlRTX0lOX1NPVVJDRV9CVUlMRCA9IE5PCj4g
LS0gCj4gMi40My4yCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwt
VGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8
ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAg
fCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0t
LS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95
bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBj
b25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
