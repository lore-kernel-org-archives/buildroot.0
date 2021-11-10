Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CEBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 08:06:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17B796112F
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 08:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17B796112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC31F80F32;
	Wed, 10 Nov 2021 08:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlZ9Qvy7Hrsv; Wed, 10 Nov 2021 08:06:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4DC080F34;
	Wed, 10 Nov 2021 08:06:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A8231BF279
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 08:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59BD680F34
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 08:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQpbhvtl6jFm for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 08:06:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0800280F32
 for <buildroot@busybox.net>; Wed, 10 Nov 2021 08:06:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90c4:eaed:10a6:22de])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A0B885FF3F;
 Wed, 10 Nov 2021 09:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636531574;
 bh=R1BXlh9+od+z55EEkW6YceaFIfC50hWWtXzmwTxb3Jo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SNB3OeVLnKXZ1uX8Vkp+A5Mu29H2zB/nciXK9ks0S5tQm9TV2Vzh2L7m9u/SST0tU
 8XI3F5gbu2XIloFk4Z/n7N4WqtjrxqOCnbFV7MhsnLtBXDNOYFEGd1RgtSNdPbK86b
 gdbQ8dm3MpThdbEHnmh6GKEP18gJcx1+4tcXJ2pN0hVRAUZbesLeyup8qmnzDQVCzv
 jUqqjeM+pfOGhvVY9r6+D3cRF3hhI2TGr3U395ZdVEg50qNjwgP/rrSOZpcXay71Rs
 4ddLPNlc/GEKYlSzFKCPih0ZhSIlotGZXqZ3Y7beHm780qwEzMeuWwe1T9eNd60Lm+
 S72cfboJIUyIA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 09:06:07 +0100
Date: Wed, 10 Nov 2021 09:06:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211110080607.GC2084998@scaer>
References: <20211108201054.225256-1-francois.perrad@gadz.org>
 <67ba0cba-8d57-5349-4f53-7c621350b835@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67ba0cba-8d57-5349-4f53-7c621350b835@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/luajit: fix luvi
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
Cc: buildroot@busybox.net, Francois Perrad <fperrad@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBSb21haW4sIEFsbCwKClRoYW5rcyBmb3IgdGhlIGNyb3NzLWludmVzdGlnYXRp
b25zISDwn5GNCgpPbiAyMDIxLTExLTA5IDIzOjUxICswMTAwLCBSb21haW4gTmFvdXIgc3Bha2Ug
dGh1c2x5Ogo+IExlIDA4LzExLzIwMjEgw6AgMjE6MTAsIEZyYW5jb2lzIFBlcnJhZCBhIMOpY3Jp
dMKgOgo+ID4gbHV2aSB1c2VzIHRoZSBjcm9zcyBieXRlY29kZSBnZW5lcmF0aW9uIG9mIGhvc3Qt
bHVhaml0Cj4gPiB0aGUgYnl0ZWNvZGUgZm9ybWF0IGhhcyAyIGZsYXZvcnMsIGRlcGVuZGluZyBv
ZiBHQzY0IG9wdGlvbi4KPiA+IAo+ID4gc2luY2UgdGhlIGNvbW1pdCBodHRwczovL2dpdGh1Yi5j
b20vTHVhSklUL0x1YUpJVC9jb21taXQvYmQwMDA5NGMzYjUwZTE5M2ZiMzJhYWQ3OWI3ZWE4ZWE2
Yjc4ZWQyNQo+ID4gR0M2NCBtb2RlIGlzIGVuYWJsZSBieSBkZWZhdWx0IG9uIGFsbCA2NGJpdHMg
cGxhdGZvcm0uCj4gPiAKPiA+IHdpdGggdGhpcyBwYXRjaCwgbHVhaml0IGFuZCBob3N0LWx1YWpp
dCBhcmUgYnVpbHQgd2l0aCB0aGUgc2FtZSBvcHRpb24sCj4gPiBzbyB0aGUgYnl0ZWNvZGUgZ2Vu
ZXJhdGVkIGJ5IGhvc3QtbHVhaml0IGlzIHZhbGlkIG9uIGx1YWppdC4KPiBJIGJlbGlldmUgaXQg
d291bGQgYmUgZ3JlYXQgdG8gYWRkIGEgbmV3IHRlc3QgdG8gdGVzdCBieXRlY29kZSBnZW5lcmF0
ZWQgYnkKPiBob3N0LWx1YWppdC4gSXQncyBvbmx5IGJ5ICJjaGFuY2UiIHRoYXQgd2Ugbm90aWNl
ZCB0aGlzIGlzc3VlLgoKV2UgYWxyZWFkeSBoYXZlIGEgbHVhaml0IHRlc3QgaW46CiAgICBzdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2x1YS5weQoKPiA+IFNpZ25lZC1vZmYtYnk6
IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgo+ID4gLS0tCj4gPiAg
cGFja2FnZS9sdWFqaXQvbHVhaml0Lm1rIHwgNSArKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbHVhaml0L2x1YWppdC5tayBiL3BhY2thZ2UvbHVhaml0L2x1YWppdC5tawo+ID4gaW5kZXgg
ZmJiZDhlYmM3Li5iYTVkODU0MzQgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL2x1YWppdC9sdWFq
aXQubWsKPiA+ICsrKyBiL3BhY2thZ2UvbHVhaml0L2x1YWppdC5tawo+ID4gQEAgLTE1LDYgKzE1
LDcgQEAgTFVBSklUX1BST1ZJREVTID0gbHVhaW50ZXJwcmV0ZXIKPiA+ICAKPiA+ICBpZmVxICgk
KEJSMl9QQUNLQUdFX0xVQUpJVF9DT01QQVQ1MikseSkKPiA+ICBMVUFKSVRfWENGTEFHUyArPSAt
RExVQUpJVF9FTkFCTEVfTFVBNTJDT01QQVQKPiA+ICtIT1NUX0xVQUpJVF9YQ0ZMQUdTICs9IC1E
TFVBSklUX0VOQUJMRV9MVUE1MkNPTVBBVAo+ID4gIGVuZGlmCj4gPiAgCj4gPiAgIyBUaGUgbHVh
aml0IGJ1aWxkIHByb2NlZHVyZSByZXF1aXJlcyB0aGUgaG9zdCBjb21waWxlciB0byBoYXZlIHRo
ZQo+ID4gQEAgLTI2LDggKzI3LDEwIEBAIGVuZGlmCj4gPiAgIyBsaWJyYXJpZXMgYXJlIGluc3Rh
bGxlZC4KPiA+ICBpZmVxICgkKEJSMl9BUkNIX0lTXzY0KSx5KQo+ID4gIExVQUpJVF9IT1NUX0ND
ID0gJChIT1NUQ0MpCj4gPiArSE9TVF9MVUFKSVRfWENGTEFHUyArPSAtRExVQUpJVF9FTkFCTEVf
R0M2NAo+IAo+IFdoYXQgaWYgdGhlIGhvc3QgaXMgYW4gMzJiaXRzIG1hY2hpbmUgPwoKRnJvbSBo
dHRwczovL2x1YWppdC5vcmcvZXh0ZW5zaW9ucy5odG1sI3N0cmluZ19kdW1wIChhbmQgdGhlIHNh
bWUgZmlsZQppbiBnaXQgc3RpbGwgaGFzIHRoZSBzYW1lIHdvcmRpbmcpOgoKICAgIFRoZSBnZW5l
cmF0ZWQgYnl0ZWNvZGUgaXMgcG9ydGFibGUgYW5kIGNhbiBiZSBsb2FkZWQgb24gYW55CiAgICBh
cmNoaXRlY3R1cmUgdGhhdCBMdWFKSVQgc3VwcG9ydHMsIGluZGVwZW5kZW50IG9mIHdvcmQgc2l6
ZQogICAgb3IgZW5kaWFuZXNzLgoKSG93ZXZlciwgZnJvbSBodHRwczovL2x1YWppdC5vcmcvaW5z
dGFsbC5odG1sI2Nyb3NzCgogICAgVGhlIEdOVSBNYWtlZmlsZS1iYXNlZCBidWlsZCBzeXN0ZW0g
YWxsb3dzIGNyb3NzLWNvbXBpbGluZyBvbiBhbnkKICAgIGhvc3QgZm9yIGFueSBzdXBwb3J0ZWQg
dGFyZ2V0LCBhcyBsb25nIGFzIGJvdGggYXJjaGl0ZWN0dXJlcyBoYXZlCiAgICB0aGUgc2FtZSBw
b2ludGVyIHNpemUuCgpJbiBnaXQsIHRoZSBmaWxlIHJlYWRzIGRpZmZlcmVudGx5LCBidXQgdGhl
IHJlcXVpcmVtZW50IHJlbWFpbnM6CgogICAgVGhlIEdOVSBNYWtlZmlsZS1iYXNlZCBidWlsZCBz
eXN0ZW0gYWxsb3dzIGNyb3NzLWNvbXBpbGluZyBvbiBhbnkKICAgIGhvc3QgZm9yIGFueSBzdXBw
b3J0ZWQgdGFyZ2V0OgoKICAgICogWWVzLCB5b3UgbmVlZCBhIHRvb2xjaGFpbiBmb3IgYm90aCB5
b3VyIGhvc3QgYW5kIHlvdXIgdGFyZ2V0IQoKICAgICogQm90aCBob3N0IGFuZCB0YXJnZXQgYXJj
aGl0ZWN0dXJlcyBtdXN0IGhhdmUgdGhlIHNhbWUgcG9pbnRlcgogICAgICBzaXplLgoKICAgICog
RS5nLiBpZiB5b3Ugd2FudCB0byBjcm9zcy1jb21waWxlIHRvIGEgMzIgYml0IHRhcmdldCBvbiBh
IDY0CiAgICAgIGJpdCBob3N0LCB5b3UgbmVlZCB0byBpbnN0YWxsIHRoZSBtdWx0aWxpYiBkZXZl
bG9wbWVudCBwYWNrYWdlCiAgICAgIChlLmcuIGxpYmM2LWRldi1pMzg2IG9uIERlYmlhbi9VYnVu
dHUpIGFuZCBidWlsZCBhIDMyIGJpdCBob3N0CiAgICAgIHBhcnQgKEhPU1RfQ0M9ImdjYyAtbTMy
IikuCgogICAgKiA2NCBiaXQgdGFyZ2V0cyBhbHdheXMgcmVxdWlyZSBjb21waWxhdGlvbiBvbiBh
IDY0IGJpdCBob3N0LgoKR2FoLi4uIFNvLCBvbiBhIDMyLWJpdCBob3N0LCB3ZSBjYW4ndCBidWls
ZCBmb3IgYSA2NC1iaXQgdGFyZ2V0LCB3aGlsZQp0aGUgb3Bwb3NpdGUgd2lsbCByZXF1aXJlIEJS
Ml9IT1NUQVJDSF9ORUVEU19JQTMyX0xJQlMuCgpNZWgsIG1laCwgbWVoLi4uCgo+IFRoZSBsdXZp
IHRlc3QgbmVlZHMgYW5vdGhlciBjaGFuZ2Ugc2luY2UgbHV2aSAtdiBkb2Vzbid0IGFsd2F5cyBy
ZXR1cm4gYSBsaXN0IGluCj4gdGhlIHNhbWUgb3JkZXI6Cj4gU2VlIEx1YUpJVCBGQVE6Cj4gaHR0
cHM6Ly9sdWFqaXQub3JnL2ZhcS5odG1sCj4gUTogVGFibGUgaXRlcmF0aW9uIHdpdGggcGFpcnMo
KSBkb2VzIG5vdCByZXN1bHQgaW4gdGhlIHNhbWUgb3JkZXI/Cj4gaHR0cDovL2xpc3RzLmJ1c3li
b3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMS1Ob3ZlbWJlci82Mjc5MzguaHRtbAoKWWVz
LCBidXQgdGhpcyBpcyBhIHNlcGFyYXRlIHRvcGljLCB3aGljaCBjYW4gYmUgYWRkcmVzc2VkIGlu
IHBhcmFsbGVsLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJ
SSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3
YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8
ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAg
fCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBf
LypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
