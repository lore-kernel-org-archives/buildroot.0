Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BD3C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:35:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8F226103B
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8F226103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A58A406B1;
	Mon, 27 Sep 2021 16:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LM1nOJDTz2n2; Mon, 27 Sep 2021 16:35:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F107406B2;
	Mon, 27 Sep 2021 16:35:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E44671BF955
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D357D406B2
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vhm6WO2NY0Dz for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 16:35:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52D8C406B1
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 16:35:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:fc12:1c1d:1db6:86f9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CBD2DB00548;
 Mon, 27 Sep 2021 18:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632760535;
 bh=ql0ypDNMoalhfyPgwZyWTTn/hzv5Rq5hdSths2Xz82Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V1iG7+REq/SRX1EbSeMd9FMTJP+hpYFNifq3DziFbTHn3fw6tpJUSgYKjflnPavWi
 QOSAgDZl+feLf4pN4mO/cLyfxeo4PXtng+OOcs8dzTvI4kL1F4f8tSPUEGlxMkKLUn
 +74P28q8kXRe6abliy0Fc2h1lwcqsOCIRdF6WOG1ykapxQcgtlmYxpzAX65Rq7Dg1w
 6XS4DOpQvtRumeynYi8JNffsOn/MqGnz0iLyLUNz9styJ9iFV4Pf5YVzIMg1e65iqt
 mynmeeoPFhMmWk1ioBesS6YrXIQ7kFlsZ8v4mJBa2usWyVUtQJ7//m5NfPLPvEJ7t+
 wbQ60aVwtpH1A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Sep 2021 18:35:28 +0200
Date: Mon, 27 Sep 2021 18:35:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Tenart <atenart@kernel.org>
Message-ID: <20210927163528.GA1357968@scaer>
References: <20210923092136.141553-1-atenart@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210923092136.141553-1-atenart@kernel.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/refpolicy: make sure xmllint is used
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
Cc: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW50b2luZSwgQWxsLAoKT24gMjAyMS0wOS0yMyAxMToyMSArMDIwMCwgQW50b2luZSBUZW5hcnQg
c3Bha2UgdGh1c2x5Ogo+IFdoZW4gcGFyc2luZyBhbmQgYWRkaW5nIG1vZHVsZXMgdGhlIHJlZnBv
bGljeSBidWlsZCBzeXN0ZW0gY2hlY2tzIHRoZWlyCj4gdmFsaWRpdHkgdXNpbmcgeG1sbGludC4g
QnkgZGVmYXVsdCB0aGUgaG9zdCBzeXN0ZW0gdmVyc2lvbiBpcyB1c2VkIGFuZAo+IGlmIG5vdCBm
b3VuZCBhbiBlcnJvciBpcyBkaXNwbGF5ZWQgYnV0IHRoZSBidWlsZCBpcyBub3Qgc3RvcHBlZC4g
VGhpcwo+IGxlYWRzIHRvIGludGVyZXN0aW5nIGlzc3VlcyB3aGVyZSBtb2R1bGVzIGFyZSBub3Qg
YWRkZWQgY29ycmVjdGx5IHRvCj4gbW9kdWxlcy5jb25mWzFdIChvdGhlciBwb3NzaWJsZSBpc3N1
ZXMgYXJlIGxpa2VseSkuCj4gCj4gRml4IHRoaXMgYnkgYWRkaW5nIGEgZGVwZW5kZW5jeSBvbiBo
b3N0LWxpYnhtbDIgYW5kIGV4cGxpY2l0bHkgdXNlIHRoZQo+IHhtbGxpbnQgYmluYXJ5IGJ1aWx0
IGJ5IEJ1aWxkcm9vdC4KPiAKPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290
LzIwMjEwODMwMTE0NTMxLjIyODUxNzgtMS1qb3NlLnBla2thcmluZW5AdW5pa2llLmNvbS8KPiAK
PiBUZXN0ZWQtYnk6IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IEFudG9pbmUgVGVuYXJ0IDxhdGVuYXJ0QGtlcm5lbC5vcmc+CgpB
cHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0t
Cj4gIHBhY2thZ2UvcmVmcG9saWN5L3JlZnBvbGljeS5tayB8IDQgKysrLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcmVmcG9saWN5L3JlZnBvbGljeS5tayBiL3BhY2thZ2UvcmVmcG9saWN5L3JlZnBvbGlj
eS5tawo+IGluZGV4IGViMzQ1ZDBmOThjOS4uOTc1YzNiNTg0YzQyIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvcmVmcG9saWN5L3JlZnBvbGljeS5tawo+ICsrKyBiL3BhY2thZ2UvcmVmcG9saWN5L3Jl
ZnBvbGljeS5tawo+IEBAIC0xNCw3ICsxNCw4IEBAIFJFRlBPTElDWV9ERVBFTkRFTkNJRVMgPSBc
Cj4gIAlob3N0LXBvbGljeWNvcmV1dGlscyBcCj4gIAlob3N0LXB5dGhvbjMgXAo+ICAJaG9zdC1z
ZXRvb2xzIFwKPiAtCWhvc3QtZ2F3awo+ICsJaG9zdC1nYXdrIFwKPiArCWhvc3QtbGlieG1sMgo+
ICAKPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9SRUZQT0xJQ1lfQ1VTVE9NX0dJVCkseSkKPiAgUkVG
UE9MSUNZX1ZFUlNJT04gPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1BBQ0tBR0VfUkVGUE9MSUNZX0NV
U1RPTV9SRVBPX1ZFUlNJT04pKQo+IEBAIC0zMCw2ICszMSw3IEBAIGVuZGlmCj4gICMgQ2Fubm90
IHVzZSBtdWx0aXBsZSB0aHJlYWRzIHRvIGJ1aWxkIHRoZSByZWZlcmVuY2UgcG9saWN5Cj4gIFJF
RlBPTElDWV9NQUtFID0gXAo+ICAJUFlUSE9OPSQoSE9TVF9ESVIpL3Vzci9iaW4vcHl0aG9uMyBc
Cj4gKwlYTUxMSU5UPSQoTElCWE1MMl9IT1NUX0JJTkFSWSkgXAo+ICAJVEVTVF9UT09MQ0hBSU49
JChIT1NUX0RJUikgXAo+ICAJJChUQVJHRVRfTUFLRV9FTlYpIFwKPiAgCSQoTUFLRTEpCj4gLS0g
Cj4gMi4zMS4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAg
ICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0t
Li0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6
Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYg
ICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
