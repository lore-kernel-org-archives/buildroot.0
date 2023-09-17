Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7759ECD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 08:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19B7D61070;
	Sun, 17 Sep 2023 08:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19B7D61070
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PXMEAy6OTNHI; Sun, 17 Sep 2023 08:34:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 417B56102D;
	Sun, 17 Sep 2023 08:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 417B56102D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE76E1BF4DA
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 08:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 985CE80E6D
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 08:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 985CE80E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OjO1VLK961_n for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 08:34:48 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E72780E59
 for <buildroot@busybox.net>; Sun, 17 Sep 2023 08:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E72780E59
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6DC8CB0051B;
 Sun, 17 Sep 2023 10:34:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 10:34:44 +0200
Date: Sun, 17 Sep 2023 10:34:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230917083444.GL415981@scaer>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
 <20230916154351.2747233-2-francois.perrad@gadz.org>
 <20230917082148.GJ415981@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230917082148.GJ415981@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694939686;
 bh=V5s1ohHDVUaWgLrtYGs/xmDysqixGXdejn5ywjax36k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ATdVSigOccg5Bzx2P1ctKTFiYw5M3aad/rqlD8W5IDn8LydngcZcQ38zw+W51HwEe
 Sc3o4dfR2xOaepVhwdpjlM5rou1GTc51uz5tCKNnClcLGChtGs7o/tHGDVIo7u0Qdx
 y9Hm4EVvRBgvRmXZZgpOZ87tadPGA32j1Y16lZZej9m9/11eURzmbGfOo7PatMs8Be
 eR4r4KgZf0ggPAGL7fqvF8sRLvfSYKjiVWmlfO72FdtwpKnoumwHQPNphPAHtGA6Of
 ro96pR+51rlag9iJWuyw/a4vTYJs43L1iOueiDddB7IkqVpFEUrYcZncy4ZQKgzvC0
 a6hUHEQMdo4SQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ATdVSigO
Subject: Re: [Buildroot] [PATCH 02/16] package/perl-convert-asn1: bump to
 version 0.34
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTA5LTE3IDEwOjIxICswMjAwLCBZYW5uIEUuIE1PUklO
IHNwYWtlIHRodXNseToKPiBPbiAyMDIzLTA5LTE2IDE3OjQzICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+ID4gTElDRU5TRTogdXBkYXRlIGNvcHlyaWdodCB5ZWFycyAmIHJl
Zm9ybWF0ZWQgQXJ0aXN0aWMgTGljZW5jZSBwYXJ0Cj4gPiBzZWUgaHR0cHM6Ly9tZXRhY3Bhbi5v
cmcvcmVsZWFzZS9USU1MRUdHRS9Db252ZXJ0LUFTTjEtMC4zMy9kaWZmL1RJTUxFR0dFL0NvbnZl
cnQtQVNOMS0wLjM0I0xJQ0VOU0UKPiBJIGZpeGVkIGl0IGFnYWluLCBhbmQgZGl0dG8gZm9yIGFs
bCB0aGUgZm9sbG93aW5nIHBhdGNoZXMuLi4KPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoK
RlRSOiBJIGRpZCBub3QgYXBwbHkgdGhpcyBwYXRjaCwgZHVlIHRvIG1vcmUgaXNzdWVzIGluIHRo
ZSByZXN0IG9mIHRoZQpzZXJpZXMuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBSZWdhcmRz
LAo+IFlhbm4gRS4gTU9SSU4uCj4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQg
PGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvcGVybC1jb252
ZXJ0LWFzbjEvcGVybC1jb252ZXJ0LWFzbjEuaGFzaCB8IDggKysrKy0tLS0KPiA+ICBwYWNrYWdl
L3BlcmwtY29udmVydC1hc24xL3BlcmwtY29udmVydC1hc24xLm1rICAgfCAyICstCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3BlcmwtY29udmVydC1hc24xL3BlcmwtY29udmVydC1hc24xLmhh
c2ggYi9wYWNrYWdlL3BlcmwtY29udmVydC1hc24xL3BlcmwtY29udmVydC1hc24xLmhhc2gKPiA+
IGluZGV4IDY0NDUxN2FmNS4uMmQxYjFmYWEzIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9wZXJs
LWNvbnZlcnQtYXNuMS9wZXJsLWNvbnZlcnQtYXNuMS5oYXNoCj4gPiArKysgYi9wYWNrYWdlL3Bl
cmwtY29udmVydC1hc24xL3BlcmwtY29udmVydC1hc24xLmhhc2gKPiA+IEBAIC0xLDYgKzEsNiBA
QAo+ID4gLSMgcmV0cmlldmVkIGJ5IHNjYW5jcGFuIGZyb20gaHR0cDovL2NwYW4ubWV0YWNwYW4u
b3JnLwo+ID4gLW1kNSAgODA0MjU4MzUwMjBkYTc3YzQ4YzA1YTQwZTI1YmJmN2UgIENvbnZlcnQt
QVNOMS0wLjMzLnRhci5nego+ID4gLXNoYTI1NiAgMWZkZjAwNDUyMGM3OWUzYTI0NGNmOTY4ODYx
NjI5MzUxNmMxMTc5M2Q3NDZjNzYxZjM2NzQ5NmViM2QwNjA3NiAgQ29udmVydC1BU04xLTAuMzMu
dGFyLmd6Cj4gPiArIyByZXRyaWV2ZWQgYnkgc2NhbmNwYW4gZnJvbSBodHRwczovL2NwYW4ubWV0
YWNwYW4ub3JnLwo+ID4gK21kNSAgY2NhNjMwODhmZGQ1YzM2NjVhMjExOWVlMjkxMzNmNmEgIENv
bnZlcnQtQVNOMS0wLjM0LnRhci5nego+ID4gK3NoYTI1NiAgYTYyOGQ3YzlkMzkwNTY4ZmI3NjM1
OTk3NWZhMDNmNjI2Y2U1N2YxMGRjMTc5ODBlOGUzNTg3ZDc3MTNlNGVlNyAgQ29udmVydC1BU04x
LTAuMzQudGFyLmd6Cj4gPiAgCj4gPiAgIyBjb21wdXRlZCBieSBzY2FuY3Bhbgo+ID4gLXNoYTI1
NiAgNzA4ODRiMTlhMzUzN2JmMTc5NTM4YzNiN2Q3ODk2YTU2YWRlNTA5ZGFmZTZiOGQ1NDVjNTk5
OWE5YzA1ZjhhOSAgTElDRU5TRQo+ID4gK3NoYTI1NiAgYWE4YWUyODg5OGEzZTE2NGVkNTI3M2Mz
ZTRmZDRiZDQ1YjQyZjc5NThmMjgyMzE4ZGYwNjc3MzM0MGUyYzlkNCAgTElDRU5TRQo+ID4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcGVybC1jb252ZXJ0LWFzbjEvcGVybC1jb252ZXJ0LWFzbjEubWsg
Yi9wYWNrYWdlL3BlcmwtY29udmVydC1hc24xL3BlcmwtY29udmVydC1hc24xLm1rCj4gPiBpbmRl
eCBhZmZlNzc1YWMuLmQ4YzRiNjVlMiAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvcGVybC1jb252
ZXJ0LWFzbjEvcGVybC1jb252ZXJ0LWFzbjEubWsKPiA+ICsrKyBiL3BhY2thZ2UvcGVybC1jb252
ZXJ0LWFzbjEvcGVybC1jb252ZXJ0LWFzbjEubWsKPiA+IEBAIC00LDcgKzQsNyBAQAo+ID4gICMK
PiA+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4gIAo+ID4gLVBFUkxfQ09OVkVSVF9BU04x
X1ZFUlNJT04gPSAwLjMzCj4gPiArUEVSTF9DT05WRVJUX0FTTjFfVkVSU0lPTiA9IDAuMzQKPiA+
ICBQRVJMX0NPTlZFUlRfQVNOMV9TT1VSQ0UgPSBDb252ZXJ0LUFTTjEtJChQRVJMX0NPTlZFUlRf
QVNOMV9WRVJTSU9OKS50YXIuZ3oKPiA+ICBQRVJMX0NPTlZFUlRfQVNOMV9TSVRFID0gJChCUjJf
Q1BBTl9NSVJST1IpL2F1dGhvcnMvaWQvVC9USS9USU1MRUdHRQo+ID4gIFBFUkxfQ09OVkVSVF9B
U04xX0xJQ0VOU0UgPSBBcnRpc3RpYyBvciBHUEwtMS4wKwo+ID4gLS0gCj4gPiAyLjM5LjIKPiA+
IAo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAK
PiAtLSAKPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVh
bC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8
Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04g
ICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0t
LS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwg
aHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8
ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdh
cmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cnwg
KzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8
ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
