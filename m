Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00128C433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 14:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4324940A4D;
	Wed, 12 Jan 2022 14:51:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ys9rc4Qml-nJ; Wed, 12 Jan 2022 14:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45CE640A45;
	Wed, 12 Jan 2022 14:51:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0496B1BF2F6
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 14:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E79BC83F48
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 14:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iHaFYMiar6cp for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 14:51:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE0A083FC4
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 14:51:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 79F69FF808;
 Wed, 12 Jan 2022 14:51:04 +0000 (UTC)
Date: Wed, 12 Jan 2022 15:51:03 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20220112155103.7e6c11c0@windsurf>
In-Reply-To: <CAJPV9MpzSPFyj-AMO+_iCNZ-PVp+DcKaH1yrMHvO2TawoUPa1g@mail.gmail.com>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-2-jose.pekkarinen@unikie.com>
 <20220105214129.2f5fffae@windsurf>
 <CAJPV9MpzSPFyj-AMO+_iCNZ-PVp+DcKaH1yrMHvO2TawoUPa1g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/7] package/minijail: new package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBXZWQsIDEyIEphbiAyMDIyIDE2OjE1OjE2ICswMjAwCkpvc8OpIFBla2thcmlu
ZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gPiBXaGF0IGFyZSB5b3Ug
ImZpeGluZyI/IFlvdSdyZSByZXBsYWNpbmcgYSBwcmxpbWl0KCkgY2FsbCBieSBieQo+ID4gc2V0
cmxpbWl0KCksIGJ1dCB3aHk/IFdoYXQgcHJvYmxlbSBkb2VzIGl0IHNvbHZlPyBXaHkgaXMgaXQg
Y29ycmVjdCB0bwo+ID4gZG8gdGhhdD8gIAo+IAo+ICAgICBUaGUgcHJvYmxlbSBpcyBzaG93biBm
cm9tIGFzIHRoaXM6Cj4gCj4gL2hvbWUvcGVra2FyaS9ici10ZXN0LXBrZy9ib290bGluLWFybXY1
LXVjbGliYy9idWlsZC9taW5pamFpbC1saW51eC12MTcvbGlibWluaWphaWwuYzoKPiBJbiBmdW5j
dGlvbiDigJhzZXRfcmxpbWl0c19vcl9kaWXigJk6Cj4gL2hvbWUvcGVra2FyaS9ici10ZXN0LXBr
Zy9ib290bGluLWFybXY1LXVjbGliYy9idWlsZC9taW5pamFpbC1saW51eC12MTcvbGlibWluaWph
aWwuYzoxOTExOjc6Cj4gZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKA
mHBybGltaXTigJk7IGRpZCB5b3UgbWVhbgo+IOKAmHNldHJsaW1pdOKAmT8gWy1XZXJyb3I9aW1w
bGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gMTkxMSB8ICAgaWYgKHBybGltaXQoai0+aW5p
dHBpZCwgai0+cmxpbWl0c1tpXS50eXBlLCAmbGltaXQsIE5VTEwpKQo+ICAgICAgfCAgICAgICBe
fn5+fn5+Cj4gICAgICB8ICAgICAgIHNldHJsaW1pdAo+IAo+ICAgICBTbyBJIGZvbGxvd2VkIHRo
ZSBzdWdnZXN0aW9uLCBubyBtb3JlLCBubyBsZXNzLgoKWW91IHNob3VsZG4ndCBibGluZGx5IGZv
bGxvdyBjb21waWxlciBzdWdnZXN0aW9ucyA6LSkKCnBybGltaXQoKSBleGlzdHMgaW4gbXVzbC4g
V2FzIDxzeXMvcmVzb3VyY2UuaD4gaW5jbHVkZWQsIGFzIHN1Z2dlc3RlZApieSB0aGUgcHJsaW1p
dCgpIG1hbiBwYWdlID8KCgo+ID4gPiArLXN0YXRpY19hc3NlcnQoRkRfU0VUU0laRSA+PSBNQVhf
UFJFU0VSVkVEX0ZEUyAqIDIgLSAxLAo+ID4gPiArLSAgICAgICAgICAiSWYgdHJ1ZSwgZW5zdXJl
X25vX2ZkX2NvbmZsaWN0IHdpbGwgYWx3YXlzIGZpbmQgYW4gdW51c2VkIGZkLiIpOyAgCj4gPgo+
ID4gWW91J3JlIG5vdCBmaXhpbmcgdGhlIHN0YXRpY19hc3NlcnQoKSBoZXJlIGJ1dCBzaW1wbHkg
ZHJvcHBpbmcgaXQuIFdoeT8KPiA+IFdoZW4gZG9lcyBpdCBmYWlsPyBXaGF0IGlzIHRoZSBwcm9i
bGVtIHdpdGggaXQ/IFdoeSBpcyBpdCBzYWZlIHRvIGRyb3AKPiA+IGl0PyAgCj4gCj4gICAgIEl0
IGZhaWxzIGxpa2UgdGhpczoKPiAKPiAvaG9tZS9wZWtrYXJpL2JyLXRlc3QtcGtnL2Jvb3RsaW4t
YXJtdjUtdWNsaWJjL2J1aWxkL21pbmlqYWlsLWxpbnV4LXYxNy9saWJtaW5pamFpbC5jOjI2MjM6
MTU6Cj4gZXJyb3I6IGV4cGVjdGVkIGRlY2xhcmF0aW9uIHNwZWNpZmllcnMgb3Ig4oCYLi4u4oCZ
IGJlZm9yZSBudW1lcmljCj4gY29uc3RhbnQKPiAyNjIzIHwgc3RhdGljX2Fzc2VydChGRF9TRVRT
SVpFID49IE1BWF9QUkVTRVJWRURfRkRTICogMiAtIDEsCj4gICAgICB8ICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fgo+IC9ob21lL3Bla2thcmkvYnItdGVzdC1wa2cvYm9vdGxpbi1hcm12NS11Y2xp
YmMvYnVpbGQvbWluaWphaWwtbGludXgtdjE3L2xpYm1pbmlqYWlsLmM6MjYyNDo4Ogo+IGVycm9y
OiBleHBlY3RlZCBkZWNsYXJhdGlvbiBzcGVjaWZpZXJzIG9yIOKAmC4uLuKAmSBiZWZvcmUgc3Ry
aW5nIGNvbnN0YW50Cj4gMjYyNCB8ICAgICAgICAiSWYgdHJ1ZSwgZW5zdXJlX25vX2ZkX2NvbmZs
aWN0IHdpbGwgYWx3YXlzIGZpbmQgYW4gdW51c2VkIGZkLiIpOwo+ICAgICAgfCAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+Cj4gCj4gICAgIFNvIG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGlzIHBsYXRmb3JtIG1h
eQo+IGRlZmluZSBzdGF0aWNfYXNzZXJ0IGluIGEgZGlmZmVyZW50IG1hbm5lciwgYW5kIEkKPiBm
aW5kIG5vIHRyYWNlcyBvZiB0aGUgcHVycG9zZSBvZiB0aGF0IGlzb2xhdGVkIGFzc2VydCwKPiBz
byB0aGUgZWFzaWVyIHdheSB0byBnZXQgYXJvdW5kIHRoaXMgd2FzIHJlbW92aW5nIGl0LgoKV2Vs
bCwgdGhlIGFzc2VydCBpcyB0aGVyZSBmb3IgYSByZWFzb24sIHNvIHdlIG5lZWQgdG8gdW5kZXJz
dGFuZCB3aGF0Cml0IGlzIHZlcmlmeWluZywgYW5kIHdoZXRoZXIgaXQgaXMgc2FmZSB0byBkcm9w
IGl0LgoKQWZ0ZXIgY2hlY2tpbmcsIEZEX1NFVFNJWkUgc2VlbXMgdG8gYmUgZGVmaW5lZCB0byAx
MDI0IGJ5IGdsaWJjLCBtdXNsCmFuZCB1Y2xpYmMtbmcsIGFuZCBNQVhfUFJFU0VSVkVEX0ZEUyBp
cyBkZWZpbmVkIGFzIDEyOCBieSB0aGUgbWluaWphaWwKY29kZS4KCkNhbiB5b3UgdHJ5IHVzaW5n
IF9TdGF0aWNfYXNzZXJ0KCkgaW5zdGVhZCwgd2hpY2ggaXMgcGFydCBvZiB0aGUgQzExCnN0YW5k
YXJkPwoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25l
ciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcg
YW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
