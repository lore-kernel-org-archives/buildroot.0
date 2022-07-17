Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10539C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 20:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90AB340538;
	Sun, 17 Jul 2022 20:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90AB340538
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHvimkwFOPdV; Sun, 17 Jul 2022 20:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E3B040297;
	Sun, 17 Jul 2022 20:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E3B040297
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 504D11BF35C
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 20:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AF9A83E86
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 20:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AF9A83E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_k7HsRiLG5U for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 20:05:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BBC383E7A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BBC383E7A
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 20:05:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6518:6457:938c:3f55])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F0BC213F8AC;
 Sun, 17 Jul 2022 22:05:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 22:05:29 +0200
Date: Sun, 17 Jul 2022 22:05:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@laposte.net>
Message-ID: <20220717200529.GX2249625@scaer>
References: <20220717144441.24477-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220717144441.24477-1-vincent.stehle@laposte.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658088332;
 bh=03fSHi2VEEuahBX44XvIBjC9ZvA9LOPn8MXY/4uilow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lwbkk8XVHMhjXO76e5ioalEljBhg9lDeYXlNB0sMtBHndrkYVVeYEJoB/hSmorAMf
 5nZgOOMIcT+Na+SobCrGjXFUU+DGsyUrPFiioAlE6l0EgysF6Qr70piJ08PbuhvxJK
 qg4Mz7iY7KJzxLHnq+97v+ddqAH/yvgrL7kdaG6GwHaulJzspzYXqeAWdSK2MJHsfG
 4rv0+4iXFrAfrCEZeOn5zb/4WwDzcxii64UgHwjBoSn3g56laaTlaFtYZPdq0vgREy
 F4hrj0arlskVoyjhJjAreC3z2DkTrDpon4kYQlRb9elh0WN+9ocGwlSsR60Oik3pZy
 EzseFWkHWBU7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lwbkk8XV
Subject: Re: [Buildroot] [PATCH] support/testing: add test for lzop
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

Vm5jZW50LCBBbGwsCgpPbiAyMDIyLTA3LTE3IDE2OjQ0ICswMjAwLCBWaW5jZW50IFN0ZWhsw6kg
dmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gQWRkIGEgc2ltcGxlIGNvbXByZXNzLXVuY29t
cHJlc3MgdGVzdCB0byB2ZXJpZnkgdGhhdCBsem9wIGlzIHdvcmtpbmcuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KPiBDYzog
UGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgo+IC0tLQpbLS1TTklQLS1dCj4g
ZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbHpvcC5weSBi
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbHpvcC5weQo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYjU0NzlhMjVkNQo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2x6b3AucHkKPiBAQCAt
MCwwICsxLDM4IEBACj4gK2ltcG9ydCBvcwo+ICsKPiAraW1wb3J0IGluZnJhLmJhc2V0ZXN0Cj4g
Kwo+ICsKPiArY2xhc3MgVGVzdEx6b3AoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKPiArICAgIGNv
bmZpZyA9IGluZnJhLmJhc2V0ZXN0LkJBU0lDX1RPT0xDSEFJTl9DT05GSUcgKyBcCj4gKyAgICAg
ICAgIiIiCj4gKyAgICAgICAgQlIyX1BBQ0tBR0VfTFpPUD15Cj4gKyAgICAgICAgQlIyX1RBUkdF
VF9ST09URlNfQ1BJTz15Cj4gKyAgICAgICAgIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMgbm90
IHNldAo+ICsgICAgICAgICIiIgo+ICsKPiArICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKPiArICAg
ICAgICBjcGlvX2ZpbGUgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJy
b290ZnMuY3BpbyIpCj4gKyAgICAgICAgc2VsZi5lbXVsYXRvci5ib290KGFyY2g9ImFybXY1IiwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAga2VybmVsPSJidWlsdGluIiwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgb3B0aW9ucz1bIi1pbml0cmQiLCBjcGlvX2ZpbGVdKQo+ICsg
ICAgICAgIHNlbGYuZW11bGF0b3IubG9naW4oKQo+ICsKPiArICAgICAgICAjIFByZXBhcmUgaW5w
dXQgZmlsZSB3aXRoIHJhbmRvbSBkYXRhIGFuZCB6ZXJvZXMuCj4gKyAgICAgICAgIyBXZSBrZWVw
IHRoZSBzaXplIHNtYWxsICg0IE1CKSBmb3IgdGhlIHNha2Ugb2YgdGVzdCB0aW1lLgo+ICsgICAg
ICAgIGNtZCA9ICJkZCBpZj0vZGV2L3VyYW5kb20gb2Y9b3JpZyBicz0xTSBjb3VudD0yICYmICIg
XAo+ICsgICAgICAgICAgICAgICJkZCBpZj0vZGV2L3plcm8gb2Y9b3JpZyBicz0xTSBjb3VudD0y
IHNlZWs9MiIKPiArICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCkKPiArCj4gKyAgICAgICAg
IyBDb21wcmVzcy4KPiArICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKCJsem9wIC12IC1vIGNvbXBy
ZXNzZWQubHpvIG9yaWciLCB0aW1lb3V0PTYwKQo+ICsKPiArICAgICAgICAjIFRlc3QuCj4gKyAg
ICAgICAgc2VsZi5hc3NlcnRSdW5PaygibHpvcCAtdHYgY29tcHJlc3NlZC5sem8iKQo+ICsKPiAr
ICAgICAgICAjIFVuY29tcHJlc3MuCj4gKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygibHpvcCAt
ZHYgLW8gdW5jb21wcmVzc2VkIGNvbXByZXNzZWQubHpvIikKPiArCj4gKyAgICAgICAgIyBWZXJp
ZnkuCj4gKyAgICAgICAgIyBUaGUgbHMgaXMgdGhlcmUgZm9yIGRlYnVnZ2luZy4KPiArICAgICAg
ICBzZWxmLmFzc2VydFJ1bk9rKCJscyAtbCAmJiBjbXAgb3JpZyB1bmNvbXByZXNzZWQiKQoKSSB0
aGluayBJIGFtIHN0YXJ0aW5nIHRvIHNlZSBhIHRyZW5kIHRoZXJlLi4uIDstKQoKRG8geW91IHRo
aW5rIHlvdSBjb3VsZCBnZW5lcmFsaXNlIHRoaXMgdGVzdCBhcyBhIGNvbW1vbiwgbm8tdGVzdCBj
bGFzcywKYW5kIGhhdmUgdGhlIHZhcmlvdXMgdGVzdCBpbmhlcml0IGZyb20gaXQ/CgpGb3IgZXhh
bXBsZToKCiAgICBjbGFzcyBUZXN0Q29tcHJlc3MoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKICAg
ICAgICBjb25maWcgPSBpbmZyYS5iYXNldGVzdC5CQVNJQ19UT09MQ0hBSU5fQ09ORklHICsgXAog
ICAgICAgICAgICAiIiIKICAgICAgICAgICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJTz15CiAgICAg
ICAgICAgICMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKICAgICAgICAgICAgIiIi
CgogICAgICAgIGRlZiBfX2luaXRfXyhzZWxmLCAqYXJncywgKiprd2FyZ3MpOgogICAgICAgICAg
ICBzZWxmLmNvbmZpZyArPSAie309eVxuIi5mb3JtYXQoa3dhcmdzWydzeW1ib2wnXSkKICAgICAg
ICAgICAgc2VsZi5jb21wID0ga3dhcmdzWydjb21wJ10KICAgICAgICAgICAgc2VsZi51bmNvbXAg
PSBrd2FyZ3NbJ3VuY29tcCddCiAgICAgICAgICAgIGRlbCBrd2FyZ3NbJ3N5bWJvbCddIGt3YXJn
c1snY29tcCddIGt3YXJnc1sndW5jb21wJ10KICAgICAgICAgICAgc3VwZXIoc2VsZikuX19pbml0
KCphcmdzLCAqKmt3YXJncykKCiAgICAgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgogICAgICAgICAg
ICAjIGJsYWJsYWJsYS4uLgoKICAgICAgICAgICAgIyBDb21wcmVzcwogICAgICAgICAgICBzZWxm
LmFzc2VydFJ1bk9rKCJ7fSA8b3JpZyA+Y29tcHJlc3NlZCIuZm9ybWF0KHNlbGYuY29tcCksIHRp
bWVvdXQ9NjApCgogICAgICAgICAgICAjIGJsYWJsYWJsYQoKICAgICAgICAgICAgIyBVbmNvbXBy
ZXNzCiAgICAgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soInt9IDxjb21wcmVzc2VkID51bmNvbXBy
ZXNzZWQiLmZvcm1hdChzZWxmLnVuY29tcCkpCgoKICAgIGNsYXNzIFRlc3RDb21wcmVzc1BpeHoo
VGVzdENvbXByZXNzKToKICAgICAgICBkZWYgX19pbml0X18oc2VsZik6CiAgICAgICAgICAgIHN1
cGVyKHNlbGYpLl9faW5pdF9fKHN5bXBvbD0nQlIyX1BBQ0tBR0VfTFpPUCcsIGNvbXA9J2x6byAt
dicsIHVuY29tcD0nbHpvcCAtZHYnKQoKCk5vdGljZSBob3cgSSBjaGFuZ2VkIHRvIHVzZSBzdGRp
bi9zdGRvdXQgc28gdGhhdCB3ZSBkbyBub3QgY2FyZSBhYm91dAp0aGUgb3B0aW9uIGZvciBpbnB1
dC9vdXB1dC4uLgoKT2YgY291cnNlLCB0aGlzIGlzIGp1c3QgYSBkcmFmdCwgeW91IHdpbGwgbmVl
ZCBhIGJpdCBtb3JlIG1hZ2ljIHRvIG1ha2UKaXQgd29yay4gOy0pCgpSZWdhcmRzLApZYW5uIEUu
IE1PUklOLgoKPiAtLSAKPiAyLjM1LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9S
SU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25z
cGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENB
TVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0t
LS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8
CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAg
ICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
