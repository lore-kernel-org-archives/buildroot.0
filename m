Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E01C54EBC
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 17:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E41140B72;
	Tue, 10 Jan 2023 17:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E41140B72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1ybBcG4jzZR; Tue, 10 Jan 2023 17:02:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8954E40B67;
	Tue, 10 Jan 2023 17:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8954E40B67
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D1481BF5DE
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 17:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58C0761038
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 17:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58C0761038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P5RQRCdUaw5s for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 17:02:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A11361035
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A11361035
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 17:02:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A45665FF9A;
 Tue, 10 Jan 2023 18:02:03 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 10 Jan 2023 18:02:03 +0100
Date: Tue, 10 Jan 2023 18:02:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20230110170203.GO151997@scaer>
References: <20230109163017.1260911-1-yann.morin.1998@free.fr>
 <b70a1950-f42a-2a2a-6bc1-c2afb200375b@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b70a1950-f42a-2a2a-6bc1-c2afb200375b@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673370129;
 bh=cfTENeU600LrTB6bOCxcFPBCMEKN65Td3YU2b+vPNdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZV35AXk763UlVEODHSTaSIrypQ0iVfAD32PeFv4hNR/kGiqug4/zihSHZz6XOe5tR
 brLPPSEjsEyhO+Dt8nPFf4uco8flI7Z889aMUW5V2QcffbXqEb5LywdIxbfoAArmv9
 0EJ7Lm5n+eI1vYRt8oFEKmeAz32m5VluHU4hNC+9AzZI/U8brzx42zIRpswQ6BETvm
 KZEaubkt27Xrk63qTUmLSLEJHf5HwVU0D7aksEgglGRgRbM2dQ0n9qM/9vXNmrh6Sb
 GY0TrUkti5ShgkYN9PDFCUqzx6E73s7FgQfQKlcFNe/DW93RUg7q59AroujHI7p5Kp
 MZaa4BjrpTW1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZV35AXk7
Subject: Re: [Buildroot] [PATCH] support/download: fix cargo vendoring
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Simon Richter <simon.richter@ptwdosimetry.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDIzLTAxLTEwIDEzOjQ5ICswMTAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDA5LzAxLzIwMjMgw6AgMTc6MzAsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKWy0tU05JUC0tXQo+ID4gU3RpbGwsIHdlIGtlZXAgdGhlIGNvbW1lbnQgYWJvdmUgdGhl
IHZlcnNpb25zIHN0cmluZ3MsIGluIHRoZSBob3BlIHRoYXQKPiA+IGEgZnV0dXJlIGJ1bXBlciB3
aWxsIG5vdGljZSBhbmQgYmUgbW9yZSBjYXJlZnVsIGF0IHZhbGlkYXRpbmcgdGhlCj4gPiB2ZW5k
b3JpbmcuCj4gV2UgaGF2ZSBzb21lIHJ1bnRpbWUgdGVzdCBmb3IgZ2l0bGFiL2dpdGh1YiBkb3du
bG9hZCB3cmFwcGVyLCBkbyB3ZSB3YW50IGEgdGVzdAo+IGZvciBjYXJnbyB2ZW5kb3IgdG9vPwoK
WWVzLCB0aGF0IHdvdWxkIGJlIG5pY2UsIGluZGVlZC4KCj4gUmV2aWV3ZWQtYnk6IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+IFRlc3RlZC1ieTogUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAc21pbGUuZnI+CgpUeXBvZXMgZml4ZWQgd2hlbiBhcHBseWluZywgdGhhbmtz
ISA7LSkKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4K
PiAKPiA+IAo+ID4gRml4ZXM6Cj4gPiAgICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3Jn
L3Jlc3VsdHMvYmVhL2JlYWM3Njc0YmJjOWZkMmY4Nzc3YjU4NjFmNjVhZmVlOWM0ODU3NTMvICAo
YmF0KQo+ID4gICAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2QxZS9k
MWVjMWViYmRlMTE1NjI4YTRiOGI5MDk5NTQ0MzQ3MjQyYTk3YzFjLyAgKGR1c3QpCj4gPiAgICAg
aHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZjk2L2Y5NjhiZTg5NWJlOWNh
OThiMzE0ZmRkNjg4ZWY4ZDNiZGY0ZTVkZmIvICAoaHllcmZpbmUpCj4gPiAgICAgaHR0cDovL2F1
dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYTBjL2EwY2RiNmNjOTQ5M2Y1MjQ4ZDk4Zjk4
YjEzZGE4NTRlMTJhZGMyYmUvICAocmlwZ3JlcCkKPiA+ICAgICAuLi4gYW5kIHNvIG1hbnkgb3Ro
ZXJzLi4uCj4gPiAKPiA+IFJlcG9ydGVkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBn
bWFpbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5
OThAZnJlZS5mcj4KPiA+IENjOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4KPiA+IENjOiBTaW1vbiBSaWNodGVyIDxzaW1vbi5yaWNodGVyQHB0d2Rvc2ltZXRyeS5j
b20+Cj4gPiAtLS0KPiA+ICBzdXBwb3J0L2Rvd25sb2FkL2NhcmdvLXBvc3QtcHJvY2VzcyB8IDE2
ICstLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE1
IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9kb3dubG9hZC9jYXJn
by1wb3N0LXByb2Nlc3MgYi9zdXBwb3J0L2Rvd25sb2FkL2NhcmdvLXBvc3QtcHJvY2Vzcwo+ID4g
aW5kZXggMTg2ZTllYjY5Yi4uMjFhNmJlOGRiZSAxMDA3NTUKPiA+IC0tLSBhL3N1cHBvcnQvZG93
bmxvYWQvY2FyZ28tcG9zdC1wcm9jZXNzCj4gPiArKysgYi9zdXBwb3J0L2Rvd25sb2FkL2Nhcmdv
LXBvc3QtcHJvY2Vzcwo+ID4gQEAgLTI1LDI1ICsyNSwxMSBAQCBwb3N0X3Byb2Nlc3NfdW5wYWNr
ICIke2Jhc2VfbmFtZX0iICIke291dHB1dH0iCj4gPiAgcHVzaGQgIiR7YmFzZV9uYW1lfSIgPiAv
ZGV2L251bGwKPiA+ICAKPiA+ICAjIENyZWF0ZSB0aGUgbG9jYWwgLmNhcmdvL2NvbmZpZyB3aXRo
IHZlbmRvciBpbmZvCj4gPiAtIwo+ID4gLSMgVGhlIGZpcnN0IGxpbmUgb2YgdGhlIG91dHB1dCB0
byBzdGRvdXQgaXMgZW1wdHkuCj4gPiAtIyBTbyBza2lwIGl0IHRvIGhhdmUgdGhlIGZpbGUgc3Rh
cnQgd2l0aCB0aGUgdmVuZG9yaW5nCj4gPiAtIyBjb25maWd1cmF0aW9uIChgdGFpbCAtLWxpbmVz
PSsyYCkuCj4gPiAtIwo+ID4gLSMgTk9URToKPiA+IC0jICAgVGhlcmUgaXMgIGEgcGF0Y2ggZm9y
IGNhcmdvIHRvIHJlbW92ZSB0aGUgZmlyc3QgZW1wdHkgbGluZToKPiA+IC0jICAgU2VlOiBodHRw
czovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2NhcmdvL3B1bGwvMTEyNzMKPiA+IC0jCj4gPiAtIyAg
IFRoZSBwYXRjaCBhbHJlYWR5IGxhbmRlZCBpbiArbmlnaHRseSBhbmQgd2lsbCBlbmQgdXAKPiA+
IC0jICAgaW4gK3N0YWJsZSBzb29uLgo+ID4gLSMKPiA+IC0jIC0+ICBXaGVuIHVwZGF0aW5nIHJ1
c3QvY2FyZ28sIHRoZSBjYWxsIHRvIGB0YWlsYCBtdXN0IGJlIHJlbW92ZWQuCj4gPiAtIwo+ID4g
IG1rZGlyIC1wIC5jYXJnby8KPiA+ICBjYXJnbyB2ZW5kb3IgXAo+ID4gICAgICAtLW1hbmlmZXN0
LXBhdGggJHtCUl9DQVJHT19NQU5JRkVTVF9QQVRILUNhcmdvLnRvbWx9IFwKPiA+ICAgICAgLS1s
b2NrZWQgVkVORE9SIFwKPiA+IC0gICAgfCB0YWlsIC0tbGluZXM9KzIgfCB0ZWUgLmNhcmdvL2Nv
bmZpZwo+ID4gKyAgICB8IHRlZSAuY2FyZ28vY29uZmlnCj4gPiAgCj4gPiAgcG9wZCA+IC9kZXYv
bnVsbAo+ID4gIAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRp
bWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCAr
MzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwg
IF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0t
LS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1v
cmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29u
c3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
