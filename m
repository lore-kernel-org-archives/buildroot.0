Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8EFC77B7D
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 09:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36E2260F01;
	Sun, 14 May 2023 09:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36E2260F01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eeWDHnQj8fD4; Sun, 14 May 2023 09:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EE5160E0A;
	Sun, 14 May 2023 09:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EE5160E0A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D19BD1BF41D
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 09:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5D5B41ECB
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 09:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5D5B41ECB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vkOfovbJcBUD for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 09:46:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FCB441E65
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FCB441E65
 for <buildroot@buildroot.org>; Sun, 14 May 2023 09:46:16 +0000 (UTC)
Received: from smtpclient.apple ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPA
 id y8IupE6KuJCZXy8IvpfMaD; Sun, 14 May 2023 11:46:13 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 14 May 2023 11:46:12 +0200
Message-Id: <EF888116-F5C4-47F5-99F1-9125F9B1D199@benettiengineering.com>
References: <20230514081642.GR2582048@scaer>
In-Reply-To: <20230514081642.GR2582048@scaer>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: iPhone Mail (20E252)
X-CMAE-Envelope: MS4xfGbKBQU02uI0qR1acJEdhkhvyC6lfTmCVWgXi9gDD8ITFOZulfiZZpO2t8U5q3E3r0DosTtfDItnORVu+gxio7BtM1CqFecIFRBthBNka/yyVpySyMKf
 JDAlZ757wwZCkEYUx5ye4oxSnmW/vb2mZEVXcYtk0bDBI58xbfMeZ2dbs4eX+Sw+abDg/JPwpPdAKrUZgDxCI4S0hF+CkX/pfDDINPoeRFEMSR9dgRkOOc7h
 DeaC1nXa6QWuww67deTqJGPauvXVptgLuokljzJlKJI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1684057573; bh=0q0t5YGwF/aO7CD/2taZvIAGdyYfA3O9U5ffyYyc3Zc=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=BEZWVb3j2eZXXU9Qj5fmkbZmPqjuG6+1FXnCBYdX8tP8blxnr6pMO4cvdKWnjcpTF
 WpAT3mqRoQxM4iDZudAV178cJNnap266q7/fIn0R9r1UD+8AsDnxFcuvgYGfeTD3Yr
 2HSQpzN+o960rPYE4/5aENtSwR2SRCD01il6ySmNRSi4HurAWmZae9H5/Vpk7cXrp1
 21z245p8ANBZKPtcHqvt1m9wgDZZLkZesMpcy6rLJN7F4ZJzDrcAOX7zMdvYR9+FWU
 ReZ9sbz0FA7NqDZOrj4MaVHoqExbMmJRjQonuZv3S/vAZBwV1hSe1AOeBPdcP642uB
 4UW7r6UtFdHfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=BEZWVb3j
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump to version 2.6.3
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

SGkgWWFubiwKCj4gSWwgZ2lvcm5vIDE0IG1hZyAyMDIzLCBhbGxlIG9yZSAxMDoxNywgWWFubiBF
LiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGhhIHNjcml0dG86Cj4gCj4g77u/R2l1
bGlvLCBBbGwsCj4gCj4gT24gMjAyMy0wNS0xMSAyMjowMiArMDIwMCwgR2l1bGlvIEJlbmV0dGkg
c3Bha2UgdGh1c2x5Ogo+PiBEcm9wIGxvY2FsIHBhdGNoZXMgc2luY2UgdGhleSBoYXZlIGJlZW4g
dXBzdHJlYW1lZCBidXQgYWRkIGEgbmV3IGxvY2FsCj4+IHBhdGNoIGFscmVhZHkgdXBzdHJlYW1l
ZCB0aGF0IGNoZWNrcyBmb3IgbGliZXZlbnQgYW5kIHNxbGl0ZSBzaW5jZSB3aXRoIHRoZQo+PiBh
ZGRpbmcgb2YgcmVleHBvcnQgdGhleSBiZWNhbWUgbWFuZGF0b3J5LiBUaGlzIGlzIGJlY2F1c2Ug
aXQncyBub3QgcG9zc2libGUKPj4gdG8gZGlzYWJsZSByZWV4cG9ydC4KPj4gCj4+IFNpZ25lZC1v
ZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcu
Y29tPgo+PiAtLS0KPiBbLS1TTklQLS1dCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25mcy11dGls
cy9uZnMtdXRpbHMubWsgYi9wYWNrYWdlL25mcy11dGlscy9uZnMtdXRpbHMubWsKPj4gaW5kZXgg
MWE0YTk5ZjU2Ni4uMmYyZTIwMGJiNSAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9uZnMtdXRpbHMv
bmZzLXV0aWxzLm1rCj4+ICsrKyBiL3BhY2thZ2UvbmZzLXV0aWxzL25mcy11dGlscy5tawo+PiBA
QCAtNCwxMiArNCwxMiBAQAo+PiAjCj4+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+IAo+PiAt
TkZTX1VUSUxTX1ZFUlNJT04gPSAyLjYuMgo+PiArTkZTX1VUSUxTX1ZFUlNJT04gPSAyLjYuMwo+
IAo+IFRoaXMgYnVtcCBjYXVzZXMgYnVpbGQgZmFpbHVyZXMgZm9yIHRoZSBob3N0IHZhcmlhbnQ6
Cj4gICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNWUxYWM5N2U0MDIz
ZjkwMmRmZmEwNjZjODk1YWE2ZjYwMDVkNTQxYy8KPiAKPiBiZWNhdXNlLi4uCj4gCj4+IE5GU19V
VElMU19TT1VSQ0UgPSBuZnMtdXRpbHMtJChORlNfVVRJTFNfVkVSU0lPTikudGFyLnh6Cj4+IE5G
U19VVElMU19TSVRFID0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgvdXRpbHMvbmZz
LXV0aWxzLyQoTkZTX1VUSUxTX1ZFUlNJT04pCj4+IE5GU19VVElMU19MSUNFTlNFID0gR1BMLTIu
MCsKPj4gTkZTX1VUSUxTX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4+IC1ORlNfVVRJTFNfREVQ
RU5ERU5DSUVTID0gaG9zdC1uZnMtdXRpbHMgaG9zdC1wa2djb25mIGxpYnRpcnBjIHV0aWwtbGlu
dXgKPj4gK05GU19VVElMU19ERVBFTkRFTkNJRVMgPSBob3N0LW5mcy11dGlscyBob3N0LXBrZ2Nv
bmYgbGliZXZlbnQgbGlidGlycGMgc3FsaXRlIHV0aWwtbGludXgKPiAKPiAuLi4gbGliZXZlbnQg
c2hvdWxkIGFsc28gYmUgYWRkZWQgdG8gdGhlIGhvc3QgdmFyaWFudCBkZXBlbmRlbmNpZXMgKGFz
Cj4gaG9zdC1saWJldmVudCwgb2YgY291cnNlKS4KPiAKPiBDYXJlIHRvIGxvb2sgaW50byB0aGF0
LCBwbGVhc2U/CgpTdXJlLCB0aGFua3MgZm9yIGFscmVhZHkgcG9pbnRpbmcgdGhlIHNvbHV0aW9u
Cgo+IAo+IChOb3RlOiBvdXIgcmVmZXJlbmNlIGRvY2tlciBpYW1nZSBkb2VzIG5vdCBoYXZlIGxp
YmV2ZW50LCBzbyBtYXliZSB0aGlzCj4gaXMgYSBnb29kIGlkZWEgdG8gdGVzdCBpbiB0aGVyZT8p
CgpZZXMuIEZyb20gbm93IG9uIEnigJlsbCB0ZXN0IHBhY2thZ2VzIHVzaW5nIGRvY2tlciBiZWZv
cmUgc2VuZGluZyBwYXRjaGVzLgoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPiBSZWdhcmRzLAo+
IFlhbm4gRS4gTU9SSU4uCj4gCj4+IE5GU19VVElMU19DUEVfSURfVkVORE9SID0gbGludXgtbmZz
Cj4+IE5GU19VVElMU19BVVRPUkVDT05GID0gWUVTCj4+IAo+PiBAQCAtNDcsNyArNDcsNyBAQCBO
RlNfVVRJTFNfVEFSR0VUU18kKEJSMl9QQUNLQUdFX05GU19VVElMU19SUENfTkZTRCkgKz0gdXNy
L3NiaW4vZXhwb3J0ZnMgXAo+PiAKPj4gaWZlcSAoJChCUjJfUEFDS0FHRV9ORlNfVVRJTFNfTkZT
VjQpLHkpCj4+IE5GU19VVElMU19DT05GX09QVFMgKz0gLS1lbmFibGUtbmZzdjQgLS1lbmFibGUt
bmZzdjQxCj4+IC1ORlNfVVRJTFNfREVQRU5ERU5DSUVTICs9IGtleXV0aWxzIGxpYmV2ZW50IGx2
bTIgc3FsaXRlCj4+ICtORlNfVVRJTFNfREVQRU5ERU5DSUVTICs9IGtleXV0aWxzIGx2bTIKPj4g
ZWxzZQo+PiBORlNfVVRJTFNfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1uZnN2NCAtLWRpc2FibGUt
bmZzdjQxCj4+IGVuZGlmCj4+IC0tIAo+PiAyLjM0LjEKPj4gCj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
Pj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCj4gLS0gCj4gLi0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJ
SSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29m
dHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8
Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAg
ICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9y
Zy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICct
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tLS0nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
