Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91639C38145
	for <buildroot@archiver.kernel.org>; Fri,  2 Sep 2022 15:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0C9340A88;
	Fri,  2 Sep 2022 15:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0C9340A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVODL6cVqRNc; Fri,  2 Sep 2022 15:48:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF783405E3;
	Fri,  2 Sep 2022 15:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF783405E3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10E6D1BF408
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 15:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5F40819FC
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 15:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5F40819FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jOUw-42H8mn9 for <buildroot@lists.busybox.net>;
 Fri,  2 Sep 2022 15:48:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83F6F81326
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83F6F81326
 for <buildroot@buildroot.org>; Fri,  2 Sep 2022 15:48:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e679:ffcd:1bfc:6eba])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5AC5313F92C;
 Fri,  2 Sep 2022 17:48:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 02 Sep 2022 17:48:22 +0200
Date: Fri, 2 Sep 2022 17:48:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Guillaume Smaha <guillaume.smaha@gmail.com>
Message-ID: <20220902154822.GN68979@scaer>
References: <20220902103434.3768420-1-guillaume.smaha@gmail.com>
 <20220902113034.GD59502@scaer>
 <CANf9tWYT3MZGq1UKDQN95X=L077Tuu8vRjOn1E5ek7ZLvjX1kA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANf9tWYT3MZGq1UKDQN95X=L077Tuu8vRjOn1E5ek7ZLvjX1kA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662133704;
 bh=0B1qQVpR2vHFLsU1RuBMsxMcbUCzboeNrDnIF31WUZc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CQf/wSbCFtDTGsn40pun5VH32y3ZSzaVS3hXq5S6yKGlRVWKFniTlvttoTAdLPSDG
 uCWRKltXfi6BO4iPkCxZLS/c7Mn9xXBXxBqSy3phB2pb7m7L/nZRmUvvib7Qht8wMV
 2oTjbnT4Q8tsOiHVbN68IBtbhTLY16W1qoCdOOMNqCtXC6EH21+FeTHSivyKPXxugB
 J2w895BiZwS/s4vS28ErfL95t9iTLFuuSgYtrtyE706HrDit3umWiIYsbisROllB9O
 VCbQaNzxrFEvQN6deBhNPXOBqGxunxyhGeklzWIQjNfaUdHN83ESSCb5ElsXyddKLK
 HX5b1Djf5e1xA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CQf/wSbC
Subject: Re: [Buildroot] [PATCH] package/glibc: fix usage of
 BR2_PACKAGE_GLIBC_KERNEL_COMPAT
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

R3VpbGxhdW1lLCBBbGwsCgpbR3VpbGxhdW1lOiBwbGVhc2Uga2VlcCB0aGUgbGlzdCBpbiBDYyB3
aGVuIHlvdSByZXBseV0KCk9uIDIwMjItMDktMDIgMTQ6MjAgKzAyMDAsIEd1aWxsYXVtZSBTbWFo
YSBzcGFrZSB0aHVzbHk6Cj4gVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24gIQo+IFlvdSBhcmUg
cmlnaHQsIEkgZ290IGNvbmZ1c2VkIHRoYXQgZ2xpYmMgIHdpbGwgZW5hYmxlIGFsbCB0aGUgYmFj
a3dhcmQKPiBjb21wYXRpYmlsaXR5d2l0aG90dSB0aGUgZmxhZy4KCk5vIHByb2JsZW0sIHRoYW5z
IGZvciB0aGUgZmVlZGJhY2suCgpJJ3ZlIGNvbnNlcXVlbnRseSBtYXJrZWQgdGhlIHBhdGNoIGFz
IHJlamVjdGVkIGluIG91ciBwYXRjaHdvcmsuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBP
biBGcmksIFNlcCAyLCAyMDIyIGF0IDE6MzAgUE0gWWFubiBFLiBNT1JJTiA8IFsxXXlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiAKPiAgIEd1aWxsYXVtZSwgQWxsLAo+IAo+ICAgT24g
MjAyMi0wOS0wMiAxMjozNCArMDIwMCwgR3VpbGxhdW1lIFNtYWhhIHNwYWtlIHRodXNseToKPiAg
ID4gQXMgZXhwbGFpbiBpbiB0aGUgY29tbWl0IDUyNWZmYzJiYjE3ZmExMWZjMTI4MTI0ZDJkM2E5
MmQ4Njk4ZWFhYjg6Cj4gICA+ICJTYXkgJ3knIGhlcmUgaWYgeW91IHBsYW4gb24gcnVubmluZyB5
b3VyIHN5c3RlbSBvbiBhIGtlcm5lbCBvbGRlciB0aGFuCj4gICA+IHRoZSB2ZXJzaW9uIHVzZWQg
Zm9yIHRoZSB0b29sY2hhaW4gaGVhZGVycy4iCj4gICA+Cj4gICA+IFNpZ25lZC1vZmYtYnk6IEd1
aWxsYXVtZSBTbWFoYSA8IFsyXWd1aWxsYXVtZS5zbWFoYUBnbWFpbC5jb20+Cj4gICA+IC0tLQo+
ICAgPsKgIHBhY2thZ2UvZ2xpYmMvIFszXWdsaWJjLm1rIHwgMiArLQo+ICAgPsKgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ICAgPgo+ICAgPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9nbGliYy8gWzRdZ2xpYmMubWsgYi9wYWNrYWdlL2dsaWJjLyBbNV1nbGli
Yy5tawo+ICAgPiBpbmRleCA1YWY1MzljYTYyLi40ZTQ0MTdiNDVhIDEwMDY0NAo+ICAgPiAtLS0g
YS9wYWNrYWdlL2dsaWJjLyBbNl1nbGliYy5tawo+ICAgPiArKysgYi9wYWNrYWdlL2dsaWJjLyBb
N11nbGliYy5tawo+ICAgPiBAQCAtOTgsNyArOTgsNyBAQCBlbmRpZgo+ICAgPsKgIEdMSUJDX01B
S0UgPSAkKEJSMl9NQUtFKQo+ICAgPsKgIEdMSUJDX0NPTkZfRU5WICs9IGFjX2N2X3Byb2dfTUFL
RT0iJChCUjJfTUFLRSkiCj4gICA+wqAKPiAgID4gLWlmZXEgKCQoQlIyX1BBQ0tBR0VfR0xJQkNf
S0VSTkVMX0NPTVBBVCksKQo+ICAgPiAraWZlcSAoJChCUjJfUEFDS0FHRV9HTElCQ19LRVJORUxf
Q09NUEFUKSx5KQo+IAo+ICAgWW91IG1heSBoYXZlIGdvdHRlbiBhIGJpdCBjb25mdXNlZCwgYnV0
IHRoZSBjdXJlbnQgc2l0dWF0aW9uIGlzIGV4YWN0bHkKPiAgIGNvcnJlY3QuCj4gCj4gICBJbmRl
ZWQsIHdoZW4gY29uZmlndXJlZCBfd2l0aG91dF8gcGFzc2luZyBhbnkgLS1lbmFibGUta2VybmVs
PVguWS5aCj4gICB2YWx1ZSwgdGhlbiBnbGliYyB3aWxsIGVuYWJsZSAqYWxsKiB0aGUgYmFja3dh
cmQgY29tcGF0aWJpbGl0eSB3cmFwcGVycy4KPiAKPiAgIEhvd2V2ZXIsIHdoZW4gY29uZmlndXJl
ZCB3aXRoIC0tZW5hYmxlLWtlcm5lbD1YLlkuWiwgdGhlbiBvbmx5IHRob3NlCj4gICB3cmFwcGVy
cyBuZWVkZWQgZm9yIGJlaW5nIGNvbXBhdGlibGUgd2l0aCB0aGF0IHZlcnNpb24gb2YgdGhlIGtl
cm5lbAo+ICAgd2lsbCBiZSB1c2VkLgo+IAo+ICAgU28sIGluZGVlZCwgd2UgZG8gbm90IHdhbnQg
dG8gcGFzcyAtLWVuYWJsZS1rZXJuZWw9WC5ZLlogd2hlbgo+ICAgQlIyX1BBQ0tBR0VfR0xJQkNf
S0VSTkVMX0NPTVBBVCBpcyBzZXQuCj4gCj4gICBGb3IgbW9yZSBpbmZvcm1hdGlvbiwgc2VlOgo+
ICAgwqAgwqAgWzhdaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9saWJjL21hbnVhbC9odG1s
X21vbm8vbGliYy5odG1sI0NvbmZpZ3VyaW5nLWFuZC1jb21waWxpbmcKPiAgIMKgIMKgIFs5XWh0
dHBzOi8vZ2l0aHViLmNvbS9ibWlub3IvZ2xpYmMvYmxvYi9tYXN0ZXIvY29uZmlndXJlLmFjI0wy
NzMKPiAgIMKgIMKgIFsxMF1odHRwczovL2dpdGh1Yi5jb20vYm1pbm9yL2dsaWJjL2Jsb2IvbWFz
dGVyL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L2NvbmZpZ3VyZS5hYyNMMzAKPiAKPiAgIFJlZ2Fy
ZHMsCj4gICBZYW5uIEUuIE1PUklOLgo+IAo+ICAgPsKgIEdMSUJDX0NPTkZfT1BUUyArPSAtLWVu
YWJsZS1rZXJuZWw9JChjYWxsIHFzdHJpcCwkKEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFT
VCkpCj4gICA+wqAgZW5kaWYKPiAgID7CoAo+ICAgPiAtLQo+ICAgPiAyLjM0LjEKPiAgID4KPiAg
ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiAgID4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+ICAgPiBbMTFdYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiAgID4gWzEyXWh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo+IAo+ICAgLS0KPiAgIC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gICB8wqAgWWFu
biBFLiBNT1JJTsKgIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVy
aWNzJyBjb25zcGlyYWN5OiB8Cj4gICB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlwqAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR07CoCDCoCDCoHzCoCBfX1/CoCDCoCDCoCDCoCDCoCDCoAo+ICAg
wqAgwqB8Cj4gICB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06wqAgWMKg
IEFHQUlOU1TCoCDCoCDCoCB8wqAgXGUvwqAgVGhlcmUgaXMgbm/CoCB8Cj4gICB8IFsxM11odHRw
Oi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMwqAgwqAgfMKg
IMKgdsKgIMKgY29uc3BpcmFjeS7CoCB8Cj4gICAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwo+IAo+
IC0tCj4gR3VpbGxhdW1lIFNtYWhhCj4gCj4gTGlua3M6Cj4gMS4gbWFpbHRvOnlhbm4ubW9yaW4u
MTk5OEBmcmVlLmZyCj4gMi4gbWFpbHRvOmd1aWxsYXVtZS5zbWFoYUBnbWFpbC5jb20KPiAzLiBo
dHRwOi8vZ2xpYmMubWsKPiA0LiBodHRwOi8vZ2xpYmMubWsKPiA1LiBodHRwOi8vZ2xpYmMubWsK
PiA2LiBodHRwOi8vZ2xpYmMubWsKPiA3LiBodHRwOi8vZ2xpYmMubWsKPiA4LiBodHRwczovL3d3
dy5nbnUub3JnL3NvZnR3YXJlL2xpYmMvbWFudWFsL2h0bWxfbW9uby9saWJjLmh0bWwjQ29uZmln
dXJpbmctYW5kLWNvbXBpbGluZwo+IDkuIGh0dHBzOi8vZ2l0aHViLmNvbS9ibWlub3IvZ2xpYmMv
YmxvYi9tYXN0ZXIvY29uZmlndXJlLmFjI0wyNzMKPiAxMC4gaHR0cHM6Ly9naXRodWIuY29tL2Jt
aW5vci9nbGliYy9ibG9iL21hc3Rlci9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9jb25maWd1cmUu
YWMjTDMwCj4gMTEuIG1haWx0bzpidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IDEyLiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAxMy4gaHR0
cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLwoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwg
IFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8
IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2ln
bmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAw
OTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRo
ZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBc
IEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
LS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
