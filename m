Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B43C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 15:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 924CC60AEB;
	Sun,  6 Nov 2022 15:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 924CC60AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70vfm3oMAyj5; Sun,  6 Nov 2022 15:03:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5E8A6072A;
	Sun,  6 Nov 2022 15:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5E8A6072A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74F1B1BF59F
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DA3F400B8
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DA3F400B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tTREwC7rVMqF for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 15:03:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F03C400FF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F03C400FF
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 15:03:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9BD3B5FFA2;
 Sun,  6 Nov 2022 16:03:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Nov 2022 16:03:30 +0100
Date: Sun, 6 Nov 2022 16:03:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221106150330.GY3918838@scaer>
References: <20221103224539.692322-1-thomas.petazzoni@bootlin.com>
 <20221103224539.692322-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221103224539.692322-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667747015;
 bh=wd1UjgLuE40el8fIkl59EAMseQdOdXIW9gd2n7GG2xs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tTv5fTpdPpGSdcdr2cch9JmJRClVNwLhod5HUnK+q9wb9HhGevd3ghPYGQsh19dxK
 aTGY3QyhyOA4ge/r2mF2zn9X55gNA2vC/9eheQC6vBoKbZR0dZzGjO0dnVhjprHLNq
 LayMbfCuGkTnNo+n3a3csE9JnA38+LHDCdne2bpjSPwVkhnEIv5ceY6hvVpkuzfK9b
 45TNuFFs2AoPgs+NCsRW9MRiTQPnNOLey3nhQVBXevrSmEq4AX2yOQu0NjB4l02oB4
 /K5e+wcEydvtVvpCsCw/4GUBNlj+b7HiUSNIydDB8sGQa6kA0jyDcuo7yTrhuFZnfs
 mAoKmlhUqrELg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tTv5fTpd
Subject: Re: [Buildroot] [PATCH next 2/2] package/pkg-cargo: move CARGO_HOME
 into DL_DIR
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
Cc: Moritz Bitsch <moritz@h6t.eu>, James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpPbiAyMDIyLTExLTAzIDIzOjQ1ICswMTAwLCBUaG9tYXMgUGV0YXp6b25p
IHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IENBUkdPX0hPTUUgaXMgd2hlcmUgQ2FyZ28g
c3RvcmVzIGl0cyBkb3dubG9hZGVkIGFydGVmYWN0cy4gU2VlCj4gaHR0cHM6Ly9kb2MucnVzdC1s
YW5nLm9yZy9jYXJnby9yZWZlcmVuY2UvZW52aXJvbm1lbnQtdmFyaWFibGVzLmh0bWw6Cj4gCj4g
ICBDQVJHT19IT01FIOKAlCBDYXJnbyBtYWludGFpbnMgYSBsb2NhbCBjYWNoZSBvZiB0aGUgcmVn
aXN0cnkgaW5kZXggYW5kCj4gICBvZiBnaXQgY2hlY2tvdXRzIG9mIGNyYXRlcy4gQnkgZGVmYXVs
dCB0aGVzZSBhcmUgc3RvcmVkIHVuZGVyCj4gICAkSE9NRS8uY2FyZ28gKCVVU0VSUFJPRklMRSVc
LmNhcmdvIG9uIFdpbmRvd3MpLCBidXQgdGhpcyB2YXJpYWJsZQo+ICAgb3ZlcnJpZGVzIHRoZSBs
b2NhdGlvbiBvZiB0aGlzIGRpcmVjdG9yeS4gT25jZSBhIGNyYXRlIGlzIGNhY2hlZCBpdAo+ICAg
aXMgbm90IHJlbW92ZWQgYnkgdGhlIGNsZWFuIGNvbW1hbmQuIEZvciBtb3JlIGRldGFpbHMgcmVm
ZXIgdG8gdGhlCj4gICBndWlkZS4KPiAKPiBXZSBjdXJyZW50bHkgbWFrZSBpdCBwb2ludCB0byAk
KEhPU1RfRElSKS9zaGFyZS9jYXJnbywgYnV0IHRoaXMgaGFzIGEKPiBudW1iZXIgb2YgZHJhd2Jh
Y2tzOgo+IAo+ICAoMSkgSXQgaXMgbm90IHNoYXJlZCBiZXR3ZWVuIEJ1aWxkcm9vdCBidWlsZHMu
IEVhY2ggQnVpbGRyb290IGJ1aWxkCj4gICAgICB3aWxsIHJlLWRvd25sb2FkIHRoZSBjcmF0ZXMg
aW5kZXgsIGFuZCB0aGUgY3JhdGVzIHRoZW1zZWx2ZXMsCj4gICAgICB1bmxlc3Mgb2YgY291cnNl
IHRoZSBmaW5hbCB2ZW5kb3JlZCB0YXJiYWxsIGlzIGFscmVhZHkgdGhlcmUuCj4gCj4gICgyKSBX
aXRoIEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklFUz15LCBpdCBpcyBldmVuIHdvcnNlOiBDQVJH
T19IT01FCj4gICAgICBpcyBub3QgZXZlbiBzaGFyZWQgYmV0d2VlbiBwYWNrYWdlcywgYXMgJChI
T1NUX0RJUikvc2hhcmUvY2FyZ28KPiAgICAgIGlzIHBlciBwYWNrYWdlLiBTbyBlYWNoIHBhY2th
Z2UgaW4gdGhlIGJ1aWxkIHRoYXQgbmVlZHMgdmVuZG9yaW5nCj4gICAgICBvZiBDYXJnbyBjcmF0
ZXMgd2lsbCBkb3dubG9hZCB0aGUgY3JhdGVzIGluZGV4IGFuZCB0aGUgY3JhdGVzIGluCj4gICAg
ICBpdHMgb3duIENBUkdPX0hPTUUgbG9jYXRpb24uCj4gCj4gVG8gc29sdmUgdGhpcywgdGhpcyBj
b21taXQgbW92ZXMgQ0FSR09fSE9NRSBpbnRvICQoRExfRElSKSwgc28gdGhhdCBpdAo+IGlzIHNo
YXJlZCBiZXR3ZWVuIGJ1aWxkcyBhbmQgcGFja2FnZXMuCj4gCj4gRXZlbiB0aG91Z2ggbm90IHRo
ZSBiZXN0L21vc3QgYXV0aG9yaXRhdGl2ZSBzb3VyY2UsCj4gaHR0cHM6Ly9naXRodWIuY29tL3J1
c3QtbGFuZy9jYXJnby9pc3N1ZXMvNjkzMCBpbmRpY2F0ZXMgdGhhdCB0aGVyZSBpcwo+IGEgbG9j
ayB3aGVuIGFjY2Vzc2luZyBDQVJHT19IT01FLCBiZWNhdXNlIGEgdXNlciBldmVuIGNvbXBsYWlu
cyB0aGF0Cj4gdGhpcyBsb2NrIGhhcyBldmVuIGJlY29tZSBtb3JlIGNvYXJzZS1ncmFpbmVkIHRo
YW4gaXQgdXNlZCB0byBiZQo+ICh3aGljaCBmb3IgdXMgaXMgZmluZSwgaXQganVzdCBtZWFucyB0
aGF0IHR3byBDYXJnbyBmZXRjaCBvcGVyYXRpb25zCj4gZnJvbSB0d28gZGlmZmVyZW50IHBhY2th
Z2VzIHdpbGwgYmUgc2VyaWFsaXplZCwgbm90IGEgYmlnIGRlYWwpLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gLS0t
Cj4gIHBhY2thZ2UvcGtnLWNhcmdvLm1rIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctY2Fy
Z28ubWsgYi9wYWNrYWdlL3BrZy1jYXJnby5tawo+IGluZGV4IDU5MjM3MjVmNWUuLmMzZDFlMzQz
MDkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wa2ctY2FyZ28ubWsKPiArKysgYi9wYWNrYWdlL3Br
Zy1jYXJnby5tawo+IEBAIC0yMCw3ICsyMCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiAgCj4gLUJSX0NBUkdPX0hPTUUgPSAkKEhPU1RfRElSKS9zaGFyZS9jYXJnbwo+ICtC
Ul9DQVJHT19IT01FID0gJChETF9ESVIpLy5jYXJnbwoKSSBhbSBub3QgYSBmYW4gb2YgZG90LWRp
cmVjdG9yaWVzLCBiZWNhdXNlIHRoZXkgZ2V0IGhpZGRlbiwgZXNwZWNpYWxseQpzaW5jZSBCUjJf
RExfRElSIGNhbiBiZSBzZXQgaW4gdGhlIGVudmlyb25tZW50IGFuZCBwb2ludCB0byBhIGxvbmct
bGl2ZWQKZGlyZWN0b3J5LgoKSW5zdGVhZCwgSSB3b3VsZCBqdXN0IGNhbGwgaXQgJ2NhcmdvLWhv
bWUnLiBJZiB0aGF0J3MgT0ssIHdlIGNhbiBjaGFuZ2UKd2hlbiBhcHBseWluZy4uLgoKUmVnYXJk
cywKWWFubiBFLiBNT1JJTi4KCj4gIFBLR19DT01NT05fQ0FSR09fRU5WID0gXAo+ICAJQ0FSR09f
SE9NRT0kKEJSX0NBUkdPX0hPTUUpCj4gLS0gCj4gMi4zOC4xCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8
ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04g
fCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNp
Z25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
