Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709DBC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 20:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0F9A83E89;
	Wed,  6 Apr 2022 20:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4ZIz_HkhWsW; Wed,  6 Apr 2022 20:04:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6B4D83E27;
	Wed,  6 Apr 2022 20:04:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 599131BF5A1
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 20:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4925983E27
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 20:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z5xQvmk7Mi9M for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 20:03:59 +0000 (UTC)
X-Greylist: delayed 00:06:27 by SQLgrey-1.8.0
Received: from forward501p.mail.yandex.net (forward501p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:120])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4295781551
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 20:03:59 +0000 (UTC)
Received: from myt6-67c6d92bc178.qloud-c.yandex.net
 (myt6-67c6d92bc178.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:5f83:0:640:67c6:d92b])
 by forward501p.mail.yandex.net (Yandex) with ESMTP id AAFD76213286;
 Wed,  6 Apr 2022 22:57:27 +0300 (MSK)
Received: from myt6-efff10c3476a.qloud-c.yandex.net
 (myt6-efff10c3476a.qloud-c.yandex.net [2a02:6b8:c12:13a3:0:640:efff:10c3])
 by myt6-67c6d92bc178.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 PFtaLd4Tzq-vRfaN8Tu; Wed, 06 Apr 2022 22:57:27 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=corrigendum.ru; s=mail;
 t=1649275047; bh=Be1QlW+wyoXpAkm+60EORcY4YE/77yYtinzQtBKhOyI=;
 h=In-Reply-To:From:Subject:Cc:References:Date:Message-ID:To;
 b=oPf3NHp+QbIBeX2oDRnF+uUeEUn8OVpPpKDBCKSQ2S1sp1x+5/V1HDZo6lcvcIMBB
 Ifnkm3n5fadBxpZ3D7JidWhb7bVpRU4VyKOxiXY+Ilz8LqBomHFpBD8p2Meh/w+L2D
 5Rtc47LkZkzYavol516dhEnccr6eQvok0HfBjfzg=
Authentication-Results: myt6-67c6d92bc178.qloud-c.yandex.net;
 dkim=pass header.i=@corrigendum.ru
Received: by myt6-efff10c3476a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id bjzggwIeui-vQKGGsvE; Wed, 06 Apr 2022 22:57:26 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <6f2c2047-1c19-dc6f-1d77-26f6a7f2615a@corrigendum.ru>
Date: Wed, 6 Apr 2022 22:57:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org,
 James Hilliard <james.hilliard1@gmail.com>
References: <20220405233412.4701-1-dpb@corrigendum.ru>
 <08affbae-a2c5-7e17-a9ee-a1f7842c2259@mind.be>
From: =?UTF-8?B?0KDQvtC80LDQvSDQlNC+0L3Rh9C10L3QutC+?= <dpb@corrigendum.ru>
In-Reply-To: <08affbae-a2c5-7e17-a9ee-a1f7842c2259@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python.mk: remove hardcoded
 paths for host Python
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MDYuMDQuMjAyMiAxNzoyNCwgQXJub3V0IFZhbmRlY2FwcGVsbGUg0L/QuNGI0LXRgjoKPiBPbiAw
Ni8wNC8yMDIyIDAxOjM0LCDQoNC+0LzQsNC9INCU0L7QvdGH0LXQvdC60L4gd3JvdGU6Cj4+IFdo
ZW4gaW5zdGFsbGVyIGlzIHVzZWQgdG8gaW5zdGFsbCBwYWNrYWdlcyBmb3IgaG9zdCBQeXRob24s
IGl0IGNhbiBmaWd1cmUKPj4gb3V0IGJ5IGl0c2VsZiB3aGljaCBwYXRocyB0byB1c2UuIFdlIGp1
c3QgbmVlZCB0byB1c2UgdGhlIGluc3RhbGxlciBDTEkKPj4gaW5zdGVhZCBvZiBvdXIgd3JhcHBl
ciBzY3JpcHQuCj4gCj4gIMKgSmFtZXMsIGNvdWxkIHlvdSBoYXZlIGEgbG9vayBhdCB0aGlzIGFu
ZCBhZGQgaXQgdG8geW91ciBzZXJpZXMgdGhhdCAKPiByZXdvcmtzIHRoZSBwZXA1MTcgaW5mcmE/
IEJlY2F1c2UgSSB0aGluayBpdCdsbCBjcmVhdGUgY29uZmxpY3RzLgo+IAo+ICDCoEFsc28sIGNh
biB0aGUgaW5zdGFsbGVyIGJlIHVzZWQgZm9yIHRhcmdldCBpbnN0YWxsIGFzIHdlbGw/CgpObywg
aW5zdGFsbGVyIGRvZXNuJ3Qga25vdyB0aGUgc2V0dGluZ3MgZm9yIHRoZSB0YXJnZXQgUHl0aG9u
LCBhbmQgdGhlIAppbnN0YWxsZXIgQ0xJIGlzbid0IGZsZXhpYmxlIGVub3VnaCB0byBjb25maWd1
cmUgdGhlc2Ugc2V0dGluZ3MuIFNvIGEgCmN1c3RvbSBzY3JpcHQgaXMgcmVxdWlyZWQuCgo+IAo+
ICDCoFJlZ2FyZHMsCj4gIMKgQXJub3V0Cj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6INCg0L7QvNCw
0L0g0JTQvtC90YfQtdC90LrQviA8ZHBiQGNvcnJpZ2VuZHVtLnJ1Pgo+PiAtLS0KPj4gwqAgcGFj
a2FnZS9wa2ctcHl0aG9uLm1rIHwgMTAgKy0tLS0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDkgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3BrZy1weXRob24ubWsgYi9wYWNrYWdlL3BrZy1weXRob24ubWsKPj4gaW5kZXggODY3MzQxZmM3
Yi4uYWNkNTYyOGYzYiAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9wa2ctcHl0aG9uLm1rCj4+ICsr
KyBiL3BhY2thZ2UvcGtnLXB5dGhvbi5tawo+PiBAQCAtMTQ2LDE0ICsxNDYsNiBAQCBIT1NUX1BL
R19QWVRIT05fUEVQNTE3X0VOViA9IFwKPj4gwqDCoMKgwqDCoCBQWVRIT05OT1VTRVJTSVRFPTEg
XAo+PiDCoMKgwqDCoMKgICQoSE9TVF9DT05GSUdVUkVfT1BUUykKPj4gLUhPU1RfUEtHX1BZVEhP
Tl9QRVA1MTdfSU5TVEFMTF9PUFRTID0gXAo+PiAtwqDCoMKgIC0taW50ZXJwcmV0ZXI9L2Jpbi9w
eXRob24gXAo+PiAtwqDCoMKgIC0tc2NyaXB0LWtpbmQ9cG9zaXggXAo+PiAtICAgIAo+PiAtLXB1
cmVsaWI9JChIT1NUX0RJUikvbGliL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKS9zaXRl
LXBhY2thZ2VzIFwKPj4gLcKgwqDCoCAtLWhlYWRlcnM9JChIT1NUX0RJUikvaW5jbHVkZS9weXRo
b24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikgXAo+PiAtwqDCoMKgIC0tc2NyaXB0cz0kKEhPU1Rf
RElSKS9iaW4gXAo+PiAtwqDCoMKgIC0tZGF0YT0kKEhPU1RfRElSKQo+PiAtCj4+ICAgCj4+ICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIAo+Pgo+PiDCoCAjIGlubmVyLXB5dGhvbi1wYWNrYWdlIC0t
IGRlZmluZXMgaG93IHRoZSBjb25maWd1cmF0aW9uLCBjb21waWxhdGlvbgo+PiDCoCAjIGFuZCBp
bnN0YWxsYXRpb24gb2YgYSBQeXRob24gcGFja2FnZSBzaG91bGQgYmUgZG9uZSwgaW1wbGVtZW50
cyBhCj4+IEBAIC0yMTIsNyArMjA0LDcgQEAgJCgyKV9CQVNFX0lOU1RBTExfU1RBR0lOR19DTUQg
PSAKPj4gJChUT1BESVIpL3N1cHBvcnQvc2NyaXB0cy9weWluc3RhbGxlci5weSBkaXN0LyoKPj4g
wqAgZWxzZQo+PiDCoCAkKDIpX0JBU0VfRU5WID0gJCQoSE9TVF9QS0dfUFlUSE9OX1BFUDUxN19F
TlYpCj4+IMKgICQoMilfQkFTRV9CVUlMRF9DTUQgPSAtbSBidWlsZCAtbiAtdwo+PiAtJCgyKV9C
QVNFX0lOU1RBTExfQ01EID0gJChUT1BESVIpL3N1cHBvcnQvc2NyaXB0cy9weWluc3RhbGxlci5w
eSAKPj4gZGlzdC8qICQkKEhPU1RfUEtHX1BZVEhPTl9QRVA1MTdfSU5TVEFMTF9PUFRTKQo+PiAr
JCgyKV9CQVNFX0lOU1RBTExfQ01EID0gLW0gaW5zdGFsbGVyIGRpc3QvKgo+PiDCoCBlbmRpZgo+
PiDCoCBlbHNlCj4+IMKgICQkKGVycm9yICJJbnZhbGlkICQoMilfU0VUVVBfVFlQRS4gVmFsaWQg
b3B0aW9ucyBhcmUgJ2Rpc3R1dGlscycsIAo+PiAnc2V0dXB0b29scycsICdwZXA1MTcnIG9yICdm
bGl0Jy4iKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
