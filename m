Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA3EC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 20:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4BE940922;
	Sun, 19 Mar 2023 20:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4BE940922
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYRMbF9qxIsS; Sun, 19 Mar 2023 20:50:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6C42409EB;
	Sun, 19 Mar 2023 20:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6C42409EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 590551BF86D
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 20:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31E9F60A7B
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 20:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31E9F60A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J4X1lSV5zi8u for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 20:50:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0BFA607BC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0BFA607BC
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 20:50:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzFx-1pvFkr12Tx-00HvF1; Sun, 19
 Mar 2023 21:50:36 +0100
Date: Sun, 19 Mar 2023 21:50:35 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230319215035.1886c1d0@gmx.net>
In-Reply-To: <2e06e0e2-2344-b1b2-accb-57fe5d29804d@benettiengineering.com>
References: <20230319192915.264584-1-giulio.benetti@benettiengineering.com>
 <CA+fTLhhVYuSq+ygavwF5wg2SonW55Mg0_ZM2CyOc=jhFUVsOzw@mail.gmail.com>
 <6f57dc7b-ed61-7218-13a1-34f1456478c8@benettiengineering.com>
 <20230319210525.4188a98b@gmx.net>
 <2e06e0e2-2344-b1b2-accb-57fe5d29804d@benettiengineering.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Qj/amCCREPiGSaTdSwFePAVrH3V7oQ7EVJKEg/VP+RUiyiK3x3h
 H4SFMctdHr+dWlFdLC9av6/O6A6PMJugCpU9EdVKtCCub4HRtlDXkQFv6GpXV4AF7d2TozM
 tIyel6zArQKkUPVCJQDWCoIs4/DYt8HP+bZSNx+g8Ah2uUD21+TaLImOJvj3oz6kwFyJE1J
 ovUQfEyth0grnbUoRUlog==
UI-OutboundReport: notjunk:1;M01:P0:z2CSTE0+ByY=;gMSIfkBETNcBnab01uaZ0CPk0se
 o4nZI+qIChX2p1fBNA19Y92jEEKAsGPxl1swso37d8r9i22pjMhd5WNkukTheAyLcHZYm/mn+
 L4dejUW8WJ3P+HpJWAzexQdOpMM5RqgoQyo6Vsekon/B8Q1kxSBu7C/wC5G/x4x47PPniAusB
 wqr4ZSCeB2FwY2uVzJ7qWFBEOBjnwrX0Q8fKs2muaTurHwb7pJKUGucAzQEO2+Ub8E7pz7aqp
 ti3yCOc2jGe1aaexaxOW6YkBkMHlgq0RTvtg5B6F8927tCuIYQfBmZv61V3Dmslbf1HkM/Uo/
 keOQbuPG3kMYAlrNDJuRNF8wnd+HphtogpeumoB0HnJl6fx43PHiKGTgPrZq5ltk5iBxixYdC
 1qNjD7B3ev10UMZND6i4toWG4PoE/KH7V6EwlVhu8OO0k1cWwrfbeJQVF+GAs/vVcJF04koiL
 LNY07M5Y0vzeDS0y8l/Gc7vLlXAqW74z/FS2tOE59SA0ZbbutUSWh7IfPvvb2JeM5rIeBVbyY
 iatCknn4i8/V2lMk6U1hYSIjdFA1isHAL+4PhKePCIdWqK8Ju3Ypgf2i2HkhvR+HXrE/PERrI
 1fMMZMK1u4hZlkAKUxJmk5zonmg0DHiGUM3uAQd9pi2o/wrD6JJAJPuol/CQpGmrzTfLNlkWa
 PCYz6NVKgZtuZmIoiXR15kb9CWwnha6yAiAh7epz4eO2OjWguUF6LHh0h+AO4e9tIQNuZA3tj
 hGOVSICo58+LXPFM06VRMlzPDPL6iuuwFKVLYs/6Ta78TAQTLFdQwwgPNVSXd9C+Qry47FGWg
 VY7zuWpR/xe7EbP3+LUJIQKdF+HTokgC+0sZHDsuaDVFEZPP3s1IkmI/0QqHj+3ivvqXzetk9
 3pYeDm6mV3lFuuHFu6bQxs4yyJXNQICqoZ/0A/4PDsVitIE0TUo/kyJFx3Kksmhb6iikyJGea
 WmrwbJJjCSSQTnzZbKeEoOjO3XgBfrR8z/PhiL76UTBDcxP+79dxxXTRGOhYyZ/zWtWYcg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679259036; i=ps.report@gmx.net;
 bh=VlLJyidWOPN64jHxMCIZ7hs2l6+3TKN/glbEcotcwvc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Q1JpxgM3lBjY/4tTcZENaPpQBH9O1RCLi3CGupPUfuElkG0gA8APjj47iADE2HN5N
 BE7va1PRcIRaqkANyuvvfdBzyzpr+LXQNh1Ahsv3wxt5pVgBULV3s94ofcgaFgcqxe
 dRbmGgTaLFNGK3ezQnxiLPX8ARUnuCmWToGeGUBnWrn2rJnGP6pebZj3aL7hQofSzG
 ROGCLwyEXOEyCXsz1dH07PfOSW0abZ+sQ3ZyYf4Hy20KZ8ynSWeYrUZEElE++tm70A
 7N4LAwl/bVqCSpCTuw/PpytfEfA0k2c1ZQE10vhQD60oVW+SxhSdPVZ3QMy0I0+VmP
 e/jcVtzrxZZsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Q1JpxgM3
Subject: Re: [Buildroot] [PATCH] package/mmc-utils: bump to version
 d4c2910981ff99b983734426dfa99632fb81ac6b
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
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gKiwKT24gU3VuLCAxOSBNYXIgMjAyMyAyMToxMDoyMyArMDEwMCwgR2l1bGlvIEJlbmV0
dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgoKPiBIaSBQ
ZXRlciwKPiAKPiBPbiAxOS8wMy8yMyAyMTowNSwgUGV0ZXIgU2VpZGVyZXIgd3JvdGU6Cj4gPiBI
ZWxsbyAqLAo+ID4gCj4gPiBPbiBTdW4sIDE5IE1hciAyMDIzIDIwOjU2OjE5ICswMTAwLCBHaXVs
aW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6
Cj4gPiAgIAo+ID4+IEhpIEluZHJlaywKPiA+Pgo+ID4+IHBsZWFzZSB1c2UgcGxhaW4tdGV4dCBl
LW1haWwgYW5kIG5vdCBIVE1MIG9uZSwKPiA+Pgo+ID4+IE9uIDE5LzAzLzIzIDIwOjQyLCBJbmRy
ZWsgS3J1dXNhIHdyb3RlOiAgCj4gPj4+IEtvbnRha3QgR2l1bGlvIEJlbmV0dGkgKDxnaXVsaW8u
YmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tCj4gPj4+IDxtYWlsdG86Z2l1bGlvLmJlbmV0
dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4+KSBraXJqdXRhcyBrdXVww6RldmFsIFAsCj4gPj4+
IDE5LiBtw6RydHMgMjAyMyBrZWxsIDIxOjI5Ogo+ID4+Pgo+ID4+PiAgICAgIFNpZ25lZC1vZmYt
Ynk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29t
Cj4gPj4+ICAgICAgPG1haWx0bzpnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29t
Pj4KPiA+Pj4gICAgICAtLS0KPiA+Pj4gICAgICAgwqBwYWNrYWdlL21tYy11dGlscy9tbWMtdXRp
bHMuaGFzaCB8IDQgKystLQo+ID4+PiAgICAgICDCoHBhY2thZ2UvbW1jLXV0aWxzL21tYy11dGls
cy5tayA8aHR0cDovL21tYy11dGlscy5taz7CoCDCoHwgMiArLQo+ID4+PiAgICAgICDCoDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4+Pgo+ID4+PiAg
ICAgIGRpZmYgLS1naXQgYS9wYWNrYWdlL21tYy11dGlscy9tbWMtdXRpbHMuaGFzaAo+ID4+PiAg
ICAgIGIvcGFja2FnZS9tbWMtdXRpbHMvbW1jLXV0aWxzLmhhc2gKPiA+Pj4gICAgICBpbmRleCAx
MjU2ZjYzNDg3Li4yMmQzNGMzZDQwIDEwMDY0NAo+ID4+PiAgICAgIC0tLSBhL3BhY2thZ2UvbW1j
LXV0aWxzL21tYy11dGlscy5oYXNoCj4gPj4+ICAgICAgKysrIGIvcGFja2FnZS9tbWMtdXRpbHMv
bW1jLXV0aWxzLmhhc2gKPiA+Pj4gICAgICBAQCAtMSwzICsxLDMgQEAKPiA+Pj4gICAgICAgwqAj
IExvY2FsbHkgY29tcHV0ZWQKPiA+Pj4gICAgICAtc2hhMjU2Cj4gPj4+ICAgICAgZjZlZDFjYjJm
MDJkNDlkZjQyNDRmODg3MmI0N2IyMjc4MGRkNjM0ZmExOWQ4NTcyOThjZTFiNzkzNzUyNzc2Zgo+
ID4+PiAgICAgIG1tYy11dGlscy1kZmMzYjZlY2RhODRkMjE0MThmYjQ0MDhiMzljNWM3MWRiNGM2
NDU4LWJyMS50YXIuZ3oKPiA+Pj4gICAgICAtc2hhMjU2Cj4gPj4+ICAgICAgZjU3ZTNjNjE2OTEx
NmFhOWZmMDZlZWM5NTczNGNhMDAwZTRkMDE5NjQ2N2JiMjIxZTgwZTUwNTMwYzc2ODA4McKgIG1t
Yy5oCj4gPj4+ICAgICAgK3NoYTI1Ngo+ID4+PiAgICAgIGU1YThkYWNmMjZhMTc4MDEwMjAyYzhm
YTdjYjI4YjAxZjUwZmU5NjdkYTk4Y2RiZGYzMjBiMmYxMTA5MjAxMDYKPiA+Pj4gICAgICBtbWMt
dXRpbHMtZDRjMjkxMDk4MWZmOTliOTgzNzM0NDI2ZGZhOTk2MzJmYjgxYWM2Yi1icjEudGFyLmd6
Cj4gPj4+ICAgICAgK3NoYTI1Ngo+ID4+PiAgICAgIGYwYjUzYjlkNThlZTI0ZThiZDliYjY5YmY0
YjMxZjhkMWQwMzFjZjRmNWQ1MDc4ODQyMTk4YmJjNmE3NzljYTXCoCBtbWMuaAo+ID4+PiAgICAg
IGRpZmYgLS1naXQgYS9wYWNrYWdlL21tYy11dGlscy9tbWMtdXRpbHMubWsgPGh0dHA6Ly9tbWMt
dXRpbHMubWs+Cj4gPj4+ICAgICAgYi9wYWNrYWdlL21tYy11dGlscy9tbWMtdXRpbHMubWsgPGh0
dHA6Ly9tbWMtdXRpbHMubWs+Cj4gPj4+ICAgICAgaW5kZXggNDM1ZTZhZTdmMS4uYmMwZmM3YWFm
MiAxMDA2NDQKPiA+Pj4gICAgICAtLS0gYS9wYWNrYWdlL21tYy11dGlscy9tbWMtdXRpbHMubWsg
PGh0dHA6Ly9tbWMtdXRpbHMubWs+Cj4gPj4+ICAgICAgKysrIGIvcGFja2FnZS9tbWMtdXRpbHMv
bW1jLXV0aWxzLm1rIDxodHRwOi8vbW1jLXV0aWxzLm1rPgo+ID4+PiAgICAgIEBAIC00LDcgKzQs
NyBAQAo+ID4+PiAgICAgICDCoCMKPiA+Pj4gICAgICAgwqAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+ID4+Pgo+ID4+PiAgICAgIC1NTUNfVVRJTFNfVkVSU0lPTiA9IGRmYzNiNmVjZGE4NGQyMTQx
OGZiNDQwOGIzOWM1YzcxZGI0YzY0NTgKPiA+Pj4gICAgICArTU1DX1VUSUxTX1ZFUlNJT04gPSBk
NGMyOTEwOTgxZmY5OWI5ODM3MzQ0MjZkZmE5OTYzMmZiODFhYzZiCj4gPj4+ICAgICAgIMKgTU1D
X1VUSUxTX1NJVEUgPQo+ID4+PiAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2NqYi9tbWMtdXRpbHMuZ2l0Cj4gPj4+ICAgICAgPGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NqYi9tbWMtdXRpbHMuZ2l0Pgo+
ID4+Pgo+ID4+Pgo+ID4+PiBJIGhhcHBlbmVkIHRvIGNsaWNrIG9uIHRoYXQgZ2l0Lmtlcm5lbC5v
cmcKPiA+Pj4gPGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2NqYi9tbWMtdXRpbHMuZ2l0PsKgbGluawo+ID4+PiBhbmQgaXQgZG9lc24ndMKgd29yay4gQnV0
IHRoZW4gd2hlcmUgZG9lcyB0aGlzIHZlcnNpb24gY29tZSBmcm9tPyAgCj4gPj4KPiA+PiB0aGF0
IGlzIHRoZSBnaXQgcmVwb3NpdG9yeSBhZGRyZXNzLCBpdCdzIG5vdCB0aGUgc2FtZSBhZGRyZXNz
IG9mIHRoZQo+ID4+IGdpdC13ZWIgZnJvbnRlbmQuIElmIGRvZXNuJ3Qgc2hvdyB1cCBvbiB0aGUg
YnJvd3NlciBpdCBkb2Vzbid0IG1lYW4gZ2l0Cj4gPj4gZG9lc24ndCB3b3JrLiBUcnkgdG86Cj4g
Pj4gJCBnaXQgY2xvbmUKPiA+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9jamIvbW1jLXV0aWxzLmdpdAo+ID4+Cj4gPj4gYW5kIHlvdSB3aWxsIHNlZSB0
aGF0IGl0IHdpbGwgY2xvbmUgdGhlIHJlcG9zaXRvcnkuICAKPiA+IAo+ID4gQSBiZXR0ZXIgb25l
IChib3RoIHdlYiBhbmQgZ2l0KSB3b3VsZCBiZToKPiA+IAo+ID4gCWh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS91dGlscy9tbWMvbW1jLXV0aWxzLmdpdCAgCj4gCj4gdGhhbmsgeW91LCBJ
IHNlbmQgYSBWMiB1c2luZyB0aGF0IFVSTCB0aGVuLgoKU2VlbXMgdGhlIGdpdCBhY2Nlc3MgaXMg
Zm9yd2FyZGVkIHRvIHRoaXMgb25lLCB0aGUgd2ViIGFjY2VzcyBpcyBub3QuLi4KCkRvIG5vdCBm
b3JnZXQgdG8gdXBkYXRlIHRoZSBwcm9qZWN0IFVSTCBpbiBwYWNrYWdlL21tYy11dGlscy9Db25m
aWcuaW4gdG9vLi4uCgpSZWdhcmRzLApQZXRlcgoKPiAKPiBCZXN0IHJlZ2FyZHMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
