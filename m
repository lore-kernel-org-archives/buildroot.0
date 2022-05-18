Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CFFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 01:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 042EC83E46;
	Wed, 18 May 2022 01:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNF0KIqRzZ1M; Wed, 18 May 2022 01:47:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DFF683E41;
	Wed, 18 May 2022 01:47:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9B41BF429
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 01:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C9AC83E41
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 01:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2B7LyBVpfPwd for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 01:47:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D662583E2F
 for <buildroot@buildroot.org>; Wed, 18 May 2022 01:47:14 +0000 (UTC)
Received: from localhost (91-154-92-55.elisa-laajakaista.fi [91.154.92.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: sakkinen)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id C73671B00016;
 Wed, 18 May 2022 04:47:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1652838430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJM5hFHy2aKedAj5oPrFk+FVupa562Pvm+PQxKaZ1JM=;
 b=aiXGxJZcyLLoMh+qnvMcz4T+gIoAEcd35xbLrlvpq8Lv1jVOw8pWU8NsMU6OT45LDkI7lb
 zJlHgmbFSEzSy0E8kzGwlr6cidfAp2YguEEun29K2EdIpK0yUjNwRUCAmmbqkOYOAy4D+e
 CSqIUboKSioeGXTy4kNNSFKkiHLDTVWQKB1yzWulGf2/EPqOgGrWRAmaW8SexSaPv2oF8A
 8OL5mWqKS5XVvj6If5hMcI6ZLKmVzk1YCCWHbgeU21TkvxzGWBzJSexXC4Te9CYFi2XOJW
 z8YFP395/T9zKErNP7qp8UlgIIrvlBUdt2oS/J18tdqb1TY3dEHfVlD50QxNHQ==
Message-ID: <cdd96900cc9536464bf8009b62cdfa7cf7e82e82.camel@iki.fi>
From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 18 May 2022 04:45:38 +0300
In-Reply-To: <20220517224809.21f77949@gmx.net>
References: <379b85295cffd8c19ca02051849d946a24a915de.camel@iki.fi>
 <20220508233809.61d5d2a2@gmx.net>
 <1332b2a553298d899b231f0cc47de7600a5a4aa5.camel@iki.fi>
 <20220517224809.21f77949@gmx.net>
User-Agent: Evolution 3.44.1 
MIME-Version: 1.0
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1652838430; a=rsa-sha256; cv=none;
 b=JbFehzmvEOi7hIRCwilSDF+ZZPSM7qLFi9YeAx9uySzkOxBjwapq6vOIYrfq66KfTxSJk2
 Nsf7wXkKrrrUDm1BNENE7TtCWITMkkYfxon5NpcYh5jCJw8cugwU0vAwKTxrv3XTzQ6NJW
 8s0ICXLutZ3Kq3ggoiFOxWQ6cCUEDrHh9h1MX1YFz5b4V0LhTRSgVOMSPRtuPwsawhQVtJ
 4MZDjMWeULhoVLD94AnP2kI16HnehtptKjvSwik68RXXPqt+0DFzfKey/2YPHPnmdwtVjc
 BNAqEWZ4ZZE+IaNq3rRhvLPbhrFLCHNzUmVgMO2o7HcjVvueYD5YO91YwskOSg==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1652838430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJM5hFHy2aKedAj5oPrFk+FVupa562Pvm+PQxKaZ1JM=;
 b=huOz32dhQtJrYiK7wFonOBNA19wiOefl3SkJCJEnY4F3JDoaOXzeex3ceePga/SMwYSjTm
 z6iQ/a1fJdTrLEdwfMsaPYuLt8yNIoRM4SUJwnGRlg3Hx2k7ENnVcjwmENsZeoTv4qQdAY
 Q8+7Y+0K2QqmL4VtnldIXRhKtI/ItXKh1Ui01CIEhN006DB3XeEvBM/cfru2I9vwAfPfra
 BMPFarlKKrzAlIg2dcjh5JDqFXmR2Yb3dOobucq+0LLynSTdyB26oxHG0PorIQaeVQVNda
 xUKvuhZl8dZKuPF1xs33GNFav8e0dx3So/+gXZe6x+KXHuoY7DayLYaiMzbj+g==
Subject: Re: [Buildroot] selftests/sgx
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

T24gVHVlLCAyMDIyLTA1LTE3IGF0IDIyOjQ4ICswMjAwLCBQZXRlciBTZWlkZXJlciB3cm90ZToK
PiBIZWxsbyBKYXJra28sCj4gCj4gT24gVHVlLCAxNyBNYXkgMjAyMiAyMDowNjo1MSArMDMwMCwg
SmFya2tvIFNha2tpbmVuIDxqYXJra28uc2Fra2luZW5AaWtpLmZpPiB3cm90ZToKPiAKPiA+IE9u
IFN1biwgMjAyMi0wNS0wOCBhdCAyMzozOCArMDIwMCwgUGV0ZXIgU2VpZGVyZXIgd3JvdGU6Cj4g
PiA+IEhlbGxvIEphcmtrbywKPiA+ID4gCj4gPiA+IE9uIFNhdCwgMDcgTWF5IDIwMjIgMjM6MDM6
NTcgKzAzMDAsIEphcmtrbyBTYWtraW5lbiA8amFya2tvLnNha2tpbmVuQGlraS5maT4gd3JvdGU6
Cj4gPiA+IMKgIAo+ID4gPiA+IEhpLAo+ID4gPiA+IAo+ID4gPiA+IFdoZW4gc3BlY2lmeWluZyAi
QlIyX1BBQ0tBR0VfTElOVVhfVE9PTFNfU0VMRlRFU1RTPXkiLCBmb3Igc29tZSByZWFzb24KPiA+
ID4gPiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zZ3gvIGJ1aWxkIHJlc3VsdHMsIGkuZS4gInNn
eDp0ZXN0X3NneCIsIGRvZXMKPiA+ID4gPiBub3QgZ2V0IGluY2x1ZGVkIHRvIHRoZSByb290ZnMg
aW1hZ2UsIG5vciBpcyBpdCBsaXN0ZWQgaW7CoAo+ID4gPiA+IGtzZWxmdGVzdC1saXN0LnR4dC4K
PiA+ID4gPiAKPiA+ID4gPiBJZiBJIG1hbnVhbGx5IGNvbXBpbGUgYW5kIGluc3RhbGwgc2VsZnRl
c3RzLCBpdCBkb2VzIGdldCBpbmNsdWRlZC4gQW55Cj4gPiA+ID4gaWRlYXMgd2hhdCBjb3VsZCBi
ZSB3cm9uZz/CoCAKPiA+ID4gCj4gPiA+IEZvciB3aGljaCBhcmNoaXRlY3R1cmUgZG8geW91IChj
cm9zcykgY29tcGlsZSAod2hhdCBpcyB5b3VyIHRhcmdldCBhcmNoaXRlY3R1cmUpPwo+ID4gPiAK
PiA+ID4gQWNjb3JkaW5nIHRvIGUuZy4gWzFdOgo+ID4gPiAKPiA+ID4gWy4uLl0KPiA+ID4gwqAg
NyBDQU5fQlVJTERfWDg2XzY0IDo9ICQoc2hlbGwgLi4veDg2L2NoZWNrX2NjLnNoICQoQ0MpIFwK
PiA+ID4gwqAgOMKgwqAgCj4gPiA+IFsuLi5dCj4gPiA+IMKgMTkgVEVTVF9DVVNUT01fUFJPR1Mg
Oj0gJChPVVRQVVQpL3Rlc3Rfc2d4Cj4gPiA+IMKgMjAgCj4gPiA+IMKgMjEgaWZlcSAoJChDQU5f
QlVJTERfWDg2XzY0KSwgMSkKPiA+ID4gwqAyMiBhbGw6ICQoVEVTVF9DVVNUT01fUFJPR1MpICQo
T1VUUFVUKS90ZXN0X2VuY2wuZWxmCj4gPiA+IMKgMjMgZW5kaWYKPiA+ID4gWy4uLl3CoCAKPiA+
IAo+ID4gSGksCj4gPiAKPiA+IE15IGNvbmZpZyBpcyBjb250YWluZWQgZnVsbHkgaGVyZToKPiA+
IAo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2phcmtrb2pzL2J1aWxkcm9vdC1zZ3gvYmxvYi9tYXN0
ZXIvY29uZmlncy9zZ3hfeDg2XzY0X2RlZmNvbmZpZwo+ID4gCj4gPiBBbmQgbXkga2VybmVsIGNv
bmZpZyBpcyBoZXJlOgo+ID4gCj4gPiBodHRwczovL2dpdGh1Yi5jb20vamFya2tvanMvYnVpbGRy
b290LXNneC9ibG9iL21hc3Rlci9ib2FyZC9zZ3gveDg2XzY0L2xpbnV4LmNvbmZpZwo+ID4gCj4g
PiBJLmUuIGNhbiBiZSBidWlsdCB3aXRoICJtYWtlIHNneF94ODZfNjRfZGVmY29uZmlnICYmIG1h
a2UiLgo+ID4gCj4gCj4gVGhlIG9yaWdpbmFsIGVycm9yIG1lc3NhZ2UgZnJvbSBsaW51eC01LjE3
LjcvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvc2d4IGlzCj4gKE5vdGU6IG5vIGdsb2JhbCBmYWls
dXJlIGluIGxpbnV4LXRvb2xzL3NlbGZ0ZXN0cyBpbiBjYXNlIG9uZSBvciBtb3JlIG9mIHRoZQo+
IHRlc3QgY2FzZSBjb21waWxlcyBmYWlsKToKPiAKPiDCoCAuLi4vaG9zdC9iaW4veDg2XzY0LWJ1
aWxkcm9vdC1saW51eC1nbnUtZ2NjIC1XYWxsIC1XZXJyb3IgLWcgLUkuLi8uLi8uLi8uLi90b29s
cy9pbmNsdWRlIC1mUElDIC16IG5vZXhlY3N0YWNrIC1jIHNpZ3N0cnVjdC5jIC1vIC4uLi9idWls
ZC9saW51eC0KPiA1LjE3LjcvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3NlbGZ0ZXN0L3NneC9z
aWdzdHJ1Y3Qubwo+IMKgIHNpZ3N0cnVjdC5jOjE1OjEwOiBmYXRhbCBlcnJvcjogb3BlbnNzbC9l
cnIuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+IMKgwqDCoMKgIDE1IHwgI2luY2x1ZGUg
PG9wZW5zc2wvZXJyLmg+Cj4gwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+
fn5+fn5+fn5+fn4KPiDCoCBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgo+IAo+IFlvdSBuZWVkIHRv
IGVuYWJsZSAnQlIyX1BBQ0tBR0VfT1BFTlNTTCcgaW4geW91ciBkZWZjb25maWcgYW5kIGFwcGx5
Cj4gdGhlIGZvbGxvd2luZyBidWlsZHJvb3QgcGF0Y2g6Cj4gCj4gLS0tIGEvcGFja2FnZS9saW51
eC10b29scy9saW51eC10b29sLXNlbGZ0ZXN0cy5tay5pbgo+ICsrKyBiL3BhY2thZ2UvbGludXgt
dG9vbHMvbGludXgtdG9vbC1zZWxmdGVzdHMubWsuaW4KPiBAQCAtMTgsNiArMTgsMTAgQEAgZW5k
aWYKPiDCoAo+IMKgU0VMRlRFU1RTX0RFUEVOREVOQ0lFUyA9IGxpYmNhcC1uZyBwb3B0Cj4gwqAK
PiAraWZlcSAoJChCUjJfUEFDS0FHRV9PUEVOU1NMKSx5KQo+ICtTRUxGVEVTVFNfREVQRU5ERU5D
SUVTICs9IG9wZW5zc2wKPiArZW5kaWYKPiArCj4gwqBTRUxGVEVTVFNfTUFLRV9GTEFHUyA9IFwK
PiDCoMKgwqDCoMKgwqDCoCAkKExJTlVYX01BS0VfRkxBR1MpIFwKPiDCoMKgwqDCoMKgwqDCoCBB
UkNIPSQoU0VMRlRFU1RTX0FSQ0gpCj4gCj4gCj4gUmVnYXJkcywKPiBQZXRlcgoKVGhhbmsgeW91
IHRoYXQgZXhwbGFpbnMgaXQuCgpJIHRoaW5rIHRoYXQgbW9yZSBhcHByb3ByaWF0ZSB3b3VsZCBi
ZToKCmlmZXEgKCQoTk9STUFMSVpFRF9BUkNIKSx4ODZfNjQpClNFTEZURVNUU19ERVBFTkRFTkNJ
RVMgKz0gb3BlbnNzbAplbmRpZgoKQlIsIEphcmtrbwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
