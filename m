Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA01C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 08:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A40654195A;
	Tue, 26 Jul 2022 08:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A40654195A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id edRhRqJ2s8Q3; Tue, 26 Jul 2022 08:14:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43684402BB;
	Tue, 26 Jul 2022 08:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43684402BB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7721BF239
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 049184055D
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 049184055D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZdzQSDONMdjU for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 08:13:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49FB1401D5
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49FB1401D5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:13:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BED1E240009;
 Tue, 26 Jul 2022 08:13:53 +0000 (UTC)
Date: Tue, 26 Jul 2022 10:13:52 +0200
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20220726101352.6c43eb92@windsurf>
In-Reply-To: <20211210141209.1812043-6-jose.pekkarinen@unikie.com>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-6-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658823234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WP9ACEcIoImRFIJexJfW8ECdVPwPYjybRmV5JrmrdQo=;
 b=jzMuBOw06xdoLQMx96dJ5/ZAOVNuMPDFk6ag4NISRkxr0lYl76nbhLwCQChGqn/LK+OJDx
 JfA9nGfT0IeJbA0yLTK9GUrzL1aU2eSCbG5iPt1TG0VJldAY9/iaFbdScdyMe3bFDOtPUe
 M7aTUqpXGd1h0LIEbjh4lQv8jQnDznkaLpZd5n2QQEKTl8ZDKN7wdZpnCjGY+wP8Qa9T5r
 ZdXING/l8cWqdbwSB3071CsTY4OBMxb1rfRBRQJKDvIiy5tj43dMv5wEJx9fRC2ZlGrequ
 ZkN281kjm+qSh49XGzV0D5Ecv36p6BWI0+5tVTmOTU5SMZXsjCy9E3NQuv3pLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jzMuBOw0
Subject: Re: [Buildroot] [PATCH 6/7] package/avocado: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zw6ksCgpPbiBGcmksIDEwIERlYyAyMDIxIDE2OjEyOjA4ICswMjAwCkpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gVGhpcyBwYXRj
aCBhZGRzIGEgYmFzaWMgcGFja2FnZSBmb3IKPiBhdm9jYWRvIGZyYW1ld29yay4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4K
CkkgaGF2ZSBmaW5hbGx5IGFwcGxpZWQgdGhpcyBwYWNrYWdlLCBidXQgd2l0aCBhIG51bWJlciBv
ZiBjaGFuZ2VzLiBTZWUgYmVsb3cuCgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2F2b2NhZG8vQ29u
ZmlnLmluIGIvcGFja2FnZS9hdm9jYWRvL0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMDAwMC4uNDAyYTYzOTk2OQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9w
YWNrYWdlL2F2b2NhZG8vQ29uZmlnLmluCj4gQEAgLTAsMCArMSwxMyBAQAo+ICtjb25maWcgQlIy
X1BBQ0tBR0VfQVZPQ0FETwo+ICsJYm9vbCAiYXZvY2FkbyIKPiArCWRlcGVuZHMgb24gIUJSMl9T
VEFUSUNfTElCUyAjIGRsb3BlbigpCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRkZJCj4gKwlz
ZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OMwoKU2luY2UgeW91IHNlbGVjdCBQeXRob24sIHlvdSBu
ZWVkIHRvIGluaGVyaXQgYWxsIGl0cyBkZXBlbmRlbmNpZXM6CgorICAgICAgIGRlcGVuZHMgb24g
QlIyX1VTRV9XQ0hBUiAjIHB5dGhvbjMKKyAgICAgICBkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMg
cHl0aG9uMworICAgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIHB5
dGhvbjMKKyAgICAgICBkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBweXRob24zCgpBbHNv
LCB5b3Ugd2VyZSBtaXNzaW5nIGEgbnVtYmVyIG9mIG1vZHVsZXMgcGFydCBvZiB0aGUgUHl0aG9u
IHN0YW5kYXJkCmxpYnJhcnksIGFuZCBvbmUgZXh0ZXJuYWwgbW9kdWxlLCBzbyBJIGhhZCB0byBh
ZGQ6CgorICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT04zX0JaSVAyCisgICAgICAgc2Vs
ZWN0IEJSMl9QQUNLQUdFX1BZVEhPTjNfUFlFWFBBVAorICAgICAgIHNlbGVjdCBCUjJfUEFDS0FH
RV9QWVRIT04zX1NRTElURQorICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT04zX1haCisg
ICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9TRVRVUFRPT0xTICMgcnVudGltZSwgcGtn
X3Jlc291cmNlcwoKZm9yIEF2b2NhZG8gdG8gd29yayBwcm9wZXJseS4KCj4gKwloZWxwCj4gKwkg
IEF2b2NhZG8gaXMgYW4gYXV0b21hdGVkIHRlc3Rpbmcgc3VpdGUgY29udGFpbmluZwo+ICsJICB0
ZXN0cyBmb3IgdmFyaW91cyBzdWJzeXN0ZW1zLgo+ICsKPiArCSAgaHR0cHM6Ly9hdm9jYWRvLWZy
YW1ld29yay5yZWFkdGhlZG9jcy5pby8KPiArCj4gK2NvbW1lbnQgImF2b2NhZG8gbmVlZHMgYSB0
b29sY2hhaW4gd2l0aCBkeW5hbWljIGxpYnJhcnkgc3VwcG9ydCIKPiArCWRlcGVuZHMgb24gQlIy
X1NUQVRJQ19MSUJTCgpZb3UgaGFkIGZvcmdvdHRlbiBCUjJfVVNFX01NVSBoZXJlLCBhbmQgdGhp
cyBoYWQgdG8gYmUgdXBkYXRlZAphY2NvcmRpbmcgdG8gdGhlIGRlcGVuZGVuY2llczoKCitjb21t
ZW50ICJhdm9jYWRvIG5lZWRzIGEgdG9vbGNoYWluIHcvIHdjaGFyLCB0aHJlYWRzLCBkeW5hbWlj
IGxpYnJhcnkiCisgICAgICAgZGVwZW5kcyBvbiBCUjJfVVNFX01NVQorICAgICAgIGRlcGVuZHMg
b24gIUJSMl9VU0VfV0NIQVIgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgfHwgQlIyX1NU
QVRJQ19MSUJTCgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2F2b2NhZG8vYXZvY2Fkby5oYXNoIGIv
cGFja2FnZS9hdm9jYWRvL2F2b2NhZG8uaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMC4uMjU3ZWU1ZDVhZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdl
L2F2b2NhZG8vYXZvY2Fkby5oYXNoCj4gQEAgLTAsMCArMSw0IEBACj4gKyMgRnJvbSBodHRwczov
L2dpdGh1Yi5jb20vYXZvY2Fkby1mcmFtZXdvcmsvYXZvY2Fkby9hcmNoaXZlL3JlZnMvdGFncwoK
VGhpcyBwYWdlIGRvZXMgbm90IGV4aXN0LgoKPiArc2hhMjU2ICBiN2EzNTU1MmNkMGYwZDhlNGIz
YWE0YmI3MDA5Y2U5ZTQ3NGE0MGMxY2QxMTE2OThlZDAzZGE5MGQ3MWEyZjRiICA5My4wLnRhci5n
ego+ICsjIExvY2FsbHkgY29tcHV0ZWQKPiArc2hhMjU2ICA2ODBjZTU2ZTljNDA0MzgyNmYwZjE0
MjA5MzVkMjQ1M2VhM2RkYWNkMTU4MmNiNmYxY2VmMjZjMTA3N2ZjYzkzICBMSUNFTlNFCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvYXZvY2Fkby9hdm9jYWRvLm1rIGIvcGFja2FnZS9hdm9jYWRvL2F2
b2NhZG8ubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjg0NzRm
YTQ4YzgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9hdm9jYWRvL2F2b2NhZG8ubWsK
PiBAQCAtMCwwICsxLDE0IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBh
dm9jYWRvLWZyYW1ld29yawo+ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtB
Vk9DQURPX1ZFUlNJT04gPSA5My4wCgpJIGhhdmUgdXBkYXRlZCB0byB2ZXJzaW9uIDk4LjAKCj4g
K0FWT0NBRE9fU09VUkNFID0gJChBVk9DQURPX1ZFUlNJT04pLnRhci5nego+ICtBVk9DQURPX1NJ
VEUgPSBodHRwczovL2dpdGh1Yi5jb20vYXZvY2Fkby1mcmFtZXdvcmsvYXZvY2Fkby9hcmNoaXZl
L3JlZnMvdGFncwoKQW5kIGhlcmUgcmVwbGFjZWQgYm90aCBvZiB0aG9zZSBsaW5lcyBieToKCitB
Vk9DQURPX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGF2b2NhZG8tZnJhbWV3b3JrLGF2b2NhZG8sJChB
Vk9DQURPX1ZFUlNJT04pKQoKPiArQVZPQ0FET19TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+ICtB
Vk9DQURPX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCgpBbmQgbm93IEkgcmVhbGl6ZSB0aGlzIGlzIHdy
b25nLi4uIHRoZSBsaWNlbnNlIGlzIG5vdCBBcGFjaGUtMi4wLCBidXQKR1BMLTIuMC4gSSBmb3Jn
b3QgdG8gY2hlY2sgdGhpcywgSSB3aWxsIGNvbW1pdCBhIGZvbGxvdy11cCBwYXRjaC4KCkFub3Ro
ZXIgdGhpbmcgSSBkaWQgaXMgYWRkIGEgcnVudGltZSB0ZXN0IGZvciBBdm9jYWRvLCBpbgpzdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2F2b2NhZG8ucHkKClRoYW5rcyBmb3IgeW91
ciBjb250cmlidXRpb24hCgpUaG9tYXMgUGV0YXp6b25pCi0tIApUaG9tYXMgUGV0YXp6b25pLCBj
by1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
