Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98511C77B73
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 04:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1E7A41FB3;
	Wed, 24 May 2023 04:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1E7A41FB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7l4saLGioes; Wed, 24 May 2023 04:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9644D4211C;
	Wed, 24 May 2023 04:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9644D4211C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2FF61BF355
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 04:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B538A6157E
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 04:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B538A6157E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JRVQo5ny7WIV for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 04:26:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9D4F61544
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9D4F61544
 for <buildroot@buildroot.org>; Wed, 24 May 2023 04:26:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:1b02:4e3:83be:ab2e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B4F8A19F5C3;
 Wed, 24 May 2023 06:26:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 24 May 2023 06:26:43 +0200
Date: Wed, 24 May 2023 06:26:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: unixmania@gmail.com
Message-ID: <20230524042643.GM621937@scaer>
References: <20230523231645.33886-1-unixmania@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523231645.33886-1-unixmania@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684902406;
 bh=eWea26f90T27Enm3kHPhIvPmCq4BMQSeVxwohmHNnHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HUcahzq/+YuieHO0CkoAWq16b2yqw/jQBOQS4w1o5Fdkv7nDRH5Sg8eITu9lQ5U2y
 LxHdqH7TIV0Y9P2EdacDjImegjkGM+zDYv06ZiP48gzofFHpRmYsEgbqcXmKT1NrNe
 oRBp7xnlvv3kpz5oyGLJUpkaxLQMm3dvK5CB3CB9gcvRyvZorFX2JKviETRAZNbQkd
 wgpHTSpUL/PMwx0e0Igee7LlI2jqNW3Hp5DTyFAfeQkbuH+PqeQ25Bs2aNGvixkk4y
 QzxD8BfOHgy4sxH2SyqRTKL0djDaA4hCgnelNTeKyvHQ7M9O0YvgY4VIIsKydd7hgc
 0b6lzpTZa+GAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HUcahzq/
Subject: Re: [Buildroot] [PATCH v2] package/qemu: install keyboard maps only
 if necessary
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2FybG9zLCBBbGwsCgpPbiAyMDIzLTA1LTIzIDIwOjE2IC0wMzAwLCB1bml4bWFuaWFAZ21haWwu
Y29tIHNwYWtlIHRodXNseToKPiBGcm9tOiBDYXJsb3MgU2FudG9zIDx1bml4bWFuaWFAZ21haWwu
Y29tPgo+IAo+IFRoZXkgYXJlIHJlcXVpcmVkIG9ubHkgZm9yIHN5c3RlbSBlbXVsYXRpb24sIHNv
IHB1bGwgYSBwYXRjaCBhbHJlYWR5Cj4gcmV2aWV3ZCB1cHN0cmVhbSB0aGF0IG1ha2VzIHRoZSBp
bnN0YWxsYXRpb24gY29uZGl0aW9uYWw6Cj4gCj4gICAgIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9xZW11LWRldmVsL3BhdGNoLzIwMjMwMzI3MTcyMTQ3LjE5NjYwNy0xLWNh
c2FudG9zQHJlZGhhdC5jb20vCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2FybG9zIFNhbnRvcyA8dW5p
eG1hbmlhQGdtYWlsLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHYxLT52Mgo+ICAgLSBGaXhlZCByZWZl
cmVuY2UgdG8gdXB0cmVhbSBwYXRjaCwgdXNpbmcgdGhlIFFFTVUgcGF0Y2h3b3JrCj4gCj4gTm90
ZSBhYm91dCB0aGUgIlNpZ25lZC1vZmYtYnk6IENhcmxvcyBTYW50b3MgPGNhc2FudG9zQHJlZGhh
dC5jb20+IiBpbgo+IHRoZSBwYXRjaDoKPiAKPiBUaG91c2FuZHMgb2YgUmVkIEhhdCBlbXBsb3ll
ZXMgY29udHJpYnV0ZSB0byBmcmVlIHNvZnR3YXJlIHByb2plY3RzCj4gdXNpbmcgdGhlaXIgd29y
ayBlbWFpbCBhZGRyZXNzZXMuIFRoZXJlIGlzIG5vIGNvbnRyYWRpY3Rpb24gYmV0d2Vlbgo+IHBl
cnNvbmFsIGFuZCBlbXBsb3llZSBhY3Rpdml0eSByZWdhcmRpbmcgdGhpcy4gQ2hlY2sgdGhpcyBk
b2N1bWVudCBmb3IKPiBhZGRpdGlvbmFsIGluZm9ybWF0aW9uOgo+IAo+ICAgIFJlZCBIYXTigJlz
IG9wZW4gc291cmNlIHBhcnRpY2lwYXRpb24gZ3VpZGVsaW5lcwo+ICAgIGh0dHBzOi8vd3d3LnJl
ZGhhdC5jb20vZW4vcmVzb3VyY2VzL29wZW4tc291cmNlLXBhcnRpY2lwYXRpb24tZ3VpZGVsaW5l
cy1vdmVydmlldwoKU3RpbGwsIGl0IGlzIG91ciBwb2xpY3kgaW4gQnVpbGRyb290IHRoYXQgdGhl
IHN1Ym1pdHRlciBhZGRzIGl0cyBvd24gU29CCndoZW4gdGhleSBjYXJyeSBhIHBhdGNoLiBJbiB0
aGlzIGNhc2UsIHRoZSBhdXRob3IgY2FzYW50b3NAcmVkaGF0LmNvbSBpcwpub3QgdGhlIHNhbWUg
KGxlZ2FsbHkpIGFzIHRoZSBzdWJtaXR0ZXIgdW5peG1hbmlhQGdtYWlsLmNvbTogdGhlIGZvcm1l
cgppcyBhIFJlZCBIYXQgZW1wbG95ZWUsIHRoZSBsYXR0ZXIgaXMgYW4gaW5kaXZpZHVhbCBhY3Rp
bmcgaW4gdGhlaXIgb3duCm5hbWUuCgpQbGVhc2UsIGFkZCB5b3VyIHVuaXhtYW5pYUBnbWFpbC5j
b20gU29CIHRvIHRoZSBwYXRjaCB5b3UgYWRkLCBhcyBBcm5vdXQKcmVxdWVzdGVkLgoKUmVnYXJk
cywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIC4uLnRhbGwta2V5Ym9hcmQtbWFwcy1vbmx5LWlm
LW5lY2Vzc2FyeS5wYXRjaCB8IDM2ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDM2IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcWVtdS8w
MDAzLW1lc29uLWluc3RhbGwta2V5Ym9hcmQtbWFwcy1vbmx5LWlmLW5lY2Vzc2FyeS5wYXRjaAo+
IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvMDAwMy1tZXNvbi1pbnN0YWxsLWtleWJvYXJk
LW1hcHMtb25seS1pZi1uZWNlc3NhcnkucGF0Y2ggYi9wYWNrYWdlL3FlbXUvMDAwMy1tZXNvbi1p
bnN0YWxsLWtleWJvYXJkLW1hcHMtb25seS1pZi1uZWNlc3NhcnkucGF0Y2gKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjkxZWExZTg2YzkKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS9xZW11LzAwMDMtbWVzb24taW5zdGFsbC1rZXlib2FyZC1tYXBzLW9u
bHktaWYtbmVjZXNzYXJ5LnBhdGNoCj4gQEAgLTAsMCArMSwzNiBAQAo+ICtGcm9tIDlkOWI3NGY4
MDZmNWRiY2E1M2RmNjYzMGMxYTA1OTFlYWVkZDQ1MDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
Cj4gK0Zyb206IENhcmxvcyBTYW50b3MgPGNhc2FudG9zQHJlZGhhdC5jb20+Cj4gK0RhdGU6IFN1
biwgMSBKYW4gMjAyMyAyMTowMDo1NyAtMDMwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIG1lc29uOiBp
bnN0YWxsIGtleWJvYXJkIG1hcHMgb25seSBpZiBuZWNlc3NhcnkKPiArCj4gK1RoZXkgYXJlIHJl
cXVpcmVkIG9ubHkgZm9yIHN5c3RlbSBlbXVsYXRpb24gKGkuZS4gaGF2ZV9zeXN0ZW0gaXMgdHJ1
ZSkuCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBDYXJsb3MgU2FudG9zIDxjYXNhbnRvc0ByZWRoYXQu
Y29tPgo+ICstLS0KPiArIHBjLWJpb3Mva2V5bWFwcy9tZXNvbi5idWlsZCB8IDYgKysrKy0tCj4g
KyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICsKPiAr
ZGlmZiAtLWdpdCBhL3BjLWJpb3Mva2V5bWFwcy9tZXNvbi5idWlsZCBiL3BjLWJpb3Mva2V5bWFw
cy9tZXNvbi5idWlsZAo+ICtpbmRleCAxNThhM2I0MTBjLi5iZmYzMDgzMzEzIDEwMDY0NAo+ICst
LS0gYS9wYy1iaW9zL2tleW1hcHMvbWVzb24uYnVpbGQKPiArKysrIGIvcGMtYmlvcy9rZXltYXBz
L21lc29uLmJ1aWxkCj4gK0BAIC00Nyw3ICs0Nyw3IEBAIGlmIG5hdGl2ZV9xZW11X2tleW1hcC5m
b3VuZCgpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIGJ1aWxkX2J5X2RlZmF1bHQ6IHRydWUs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgIG91dHB1dDoga20sCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbW1hbmQ6IFtuYXRpdmVfcWVtdV9rZXltYXAsICctZicsICdAT1VUUFVUQCcs
IGFyZ3Muc3BsaXQoKV0sCj4gKy0gICAgICAgICAgICAgICAgICAgICAgIGluc3RhbGw6IHRydWUs
Cj4gKysgICAgICAgICAgICAgICAgICAgICAgIGluc3RhbGw6IGhhdmVfc3lzdGVtLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICBpbnN0YWxsX2RpcjogcWVtdV9kYXRhZGlyIC8gJ2tleW1hcHMn
KQo+ICsgICBlbmRmb3JlYWNoCj4gKyAKPiArQEAgLTU2LDQgKzU2LDYgQEAgZWxzZQo+ICsgICBp
bnN0YWxsX2RhdGEoa2V5bWFwcy5rZXlzKCksIGluc3RhbGxfZGlyOiBxZW11X2RhdGFkaXIgLyAn
a2V5bWFwcycpCj4gKyBlbmRpZgo+ICsgCj4gKy1pbnN0YWxsX2RhdGEoWydzbCcsICdzdiddLCBp
bnN0YWxsX2RpcjogcWVtdV9kYXRhZGlyIC8gJ2tleW1hcHMnKQo+ICsraWYgaGF2ZV9zeXN0ZW0K
PiArKyAgaW5zdGFsbF9kYXRhKFsnc2wnLCAnc3YnXSwgaW5zdGFsbF9kaXI6IHFlbXVfZGF0YWRp
ciAvICdrZXltYXBzJykKPiArK2VuZGlmCj4gKy0tIAo+ICsyLjMxLjEKPiArCj4gLS0gCj4gMi4z
MS4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAou
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJl
ZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIg
Mzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAg
ICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBY
ICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMt
YS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5
LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
