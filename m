Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1C3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 22:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C1DC84791;
	Sat, 16 Jul 2022 22:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C1DC84791
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f6D5EfiVgYFQ; Sat, 16 Jul 2022 22:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80D838478A;
	Sat, 16 Jul 2022 22:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80D838478A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B5851BF487
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 557168478A
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 557168478A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sjLWx-D8z-dO for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 22:01:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5816A84787
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5816A84787
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 22:01:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 68D907804FE;
 Sun, 17 Jul 2022 00:01:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 00:01:36 +0200
Date: Sun, 17 Jul 2022 00:01:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@laposte.net>
Message-ID: <20220716220136.GM2543@scaer>
References: <20220713172006.26411-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713172006.26411-1-vincent.stehle@laposte.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658008898;
 bh=xPBwgu3utggAkZBN7U1IB4ihiamA/6K5J265JIsZFmc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bhSJJtXgtKIxPOPQS9Ce1lqxvpRPW+LuTPVg60iPPWZLOwr3+iz+HP7h+wRs9jM62
 RnhOxRB0S3YyhrBrW0nG3eHHzcy3sdanEDBVWCW/LRnfCNVYYQENkequl+ISyeDAHi
 m7c8D/kG9TZzyIWN0BkIWD4x9F0L8fgKsZfsOfB5+Xr8CSy+bvoxtpQL1NLvOacct4
 jOK943TIdJx+oTpuvatcOVHx82eGGl8/sHwy/9l81VkLkhWafCPt3UnwEpA80zvI56
 KqG7Oh7bkCKeIfyY9AokJHqE1H1NO2cBRjMdOiLECDWFzjlWpIjakA5tmpx1NqDOIL
 UPboe8GW0GzPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bhSJJtXg
Subject: Re: [Buildroot] [PATCH] support/testing: add test for pixz
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

VmluY2VudCwgQWxsLAoKT24gMjAyMi0wNy0xMyAxOToyMCArMDIwMCwgVmluY2VudCBTdGVobMOp
IHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IEFkZCBhIHNpbXBsZSBjb21wcmVzcy11bmNv
bXByZXNzIHRlc3QgdG8gdmVyaWZ5IHRoYXQgcGl4eiBpcyB3b3JraW5nLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAbGFwb3N0ZS5uZXQ+CgpBcHBs
aWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4g
Cj4gCj4gSGksCj4gCj4gSSBoYXZlIHZlcmlmaWVkIHRoYXQgdGhpcyB0ZXN0IHdvcmtzIGZpbmUg
bG9jYWxseSBhbmQgb24gZ2l0bGFiLgo+IEJlc3QgcmVnYXJkcywKPiAKPiBWaW5jZW50Lgo+IAo+
IAo+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4g
IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcGl4ei5weSB8IDQwICsrKysrKysr
KysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3BpeHou
cHkKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCAwYWZk
Njk3YjZjLi45YTc0MGQ2NTBkIDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZF
TE9QRVJTCj4gQEAgLTI5MTcsNiArMjkxNyw3IEBAIEY6CWNvbmZpZ3MvdWV2bTU0MzJfZGVmY29u
ZmlnCj4gIEY6CXBhY2thZ2UvaTd6Lwo+ICBGOglwYWNrYWdlL21zci10b29scy8KPiAgRjoJcGFj
a2FnZS9waXh6Lwo+ICtGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3BpeHou
cHkKPiAgCj4gIE46CVZpbmljaXVzIFRpbnRpIDx2aW5pY2l1c3RpbnRpQGdtYWlsLmNvbT4KPiAg
RjoJcGFja2FnZS9weXRob24tdGhyaWZ0Lwo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X3BpeHoucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X3BpeHoucHkKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAu
LmVlZmYxMGVhYTEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF9waXh6LnB5Cj4gQEAgLTAsMCArMSw0MCBAQAo+ICtpbXBvcnQgb3MKPiAr
Cj4gK2ltcG9ydCBpbmZyYS5iYXNldGVzdAo+ICsKPiArCj4gK2NsYXNzIFRlc3RQaXh6KGluZnJh
LmJhc2V0ZXN0LkJSVGVzdCk6Cj4gKyAgICBjb25maWcgPSBpbmZyYS5iYXNldGVzdC5CQVNJQ19U
T09MQ0hBSU5fQ09ORklHICsgXAo+ICsgICAgICAgICIiIgo+ICsgICAgICAgIEJSMl9QQUNLQUdF
X1BJWFo9eQo+ICsgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQo+ICsgICAgICAgICMg
QlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKPiArICAgICAgICAiIiIKPiArCj4gKyAg
ICBkZWYgdGVzdF9ydW4oc2VsZik6Cj4gKyAgICAgICAgY3Bpb19maWxlID0gb3MucGF0aC5qb2lu
KHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmNwaW8iKQo+ICsgICAgICAgIHNlbGYu
ZW11bGF0b3IuYm9vdChhcmNoPSJhcm12NSIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
IGtlcm5lbD0iYnVpbHRpbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIG9wdGlvbnM9
WyItaW5pdHJkIiwgY3Bpb19maWxlXSkKPiArICAgICAgICBzZWxmLmVtdWxhdG9yLmxvZ2luKCkK
PiArCj4gKyAgICAgICAgIyBQcmVwYXJlIGlucHV0IGZpbGUgd2l0aCByYW5kb20gZGF0YSBhbmQg
emVyb2VzLgo+ICsgICAgICAgICMgV2Uga2VlcCB0aGUgc2l6ZSBzbWFsbCAoNCBNQikgZm9yIHRo
ZSBzYWtlIG9mIHRlc3QgdGltZS4KPiArICAgICAgICBjbWQgPSAiZGQgaWY9L2Rldi91cmFuZG9t
IG9mPW9yaWcgYnM9MU0gY291bnQ9MiAmJiAiIFwKPiArICAgICAgICAgICAgICAiZGQgaWY9L2Rl
di96ZXJvIG9mPW9yaWcgYnM9MU0gY291bnQ9MiBzZWVrPTIiCj4gKyAgICAgICAgc2VsZi5hc3Nl
cnRSdW5PayhjbWQpCj4gKwo+ICsgICAgICAgICMgQ29tcHJlc3MuCj4gKyAgICAgICAgIyBXZSBh
c2sgZm9yIDMgdGhyZWFkcyBmb3IgZ29vZCBtZWFzdXJlIGJ1dCB3aXRoIGEgdmVyeSBzbWFsbCBm
aWxlIG9uIGEKPiArICAgICAgICAjIHVuaXByb2Nlc3NvciBxZW11IHRoaXMgaXMgb25seSBhIGxp
Z2h0IHZhbGlkYXRpb24uCj4gKyAgICAgICAgY21kID0gImNwIC12IG9yaWcgY29tcHJlc3NlZCAm
JiBwaXh6IC1wIDMgY29tcHJlc3NlZCIKPiArICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCwg
dGltZW91dD02MCkKPiArCj4gKyAgICAgICAgIyBVbmNvbXByZXNzLgo+ICsgICAgICAgIGNtZCA9
ICJjcCAtdiBjb21wcmVzc2VkLnh6IHVuY29tcHJlc3NlZC54eiAmJiBwaXh6IC1kIHVuY29tcHJl
c3NlZC54eiIKPiArICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCkKPiArCj4gKyAgICAgICAg
IyBWZXJpZnkuCj4gKyAgICAgICAgIyBUaGUgbHMgaXMgdGhlcmUgZm9yIGRlYnVnZ2luZy4KPiAr
ICAgICAgICBjbWQgPSAibHMgLWwgJiYgY21wIG9yaWcgdW5jb21wcmVzc2VkIgo+ICsgICAgICAg
IHNlbGYuYXNzZXJ0UnVuT2soY21kKQo+IC0tIAo+IDIuMzUuMQo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
