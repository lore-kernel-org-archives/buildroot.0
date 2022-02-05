Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBDCC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 15:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D496E404E7;
	Sat,  5 Feb 2022 15:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zn1oyqhlLWgh; Sat,  5 Feb 2022 15:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D447140132;
	Sat,  5 Feb 2022 15:36:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F20931BF39A
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED54082656
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8uTT8o4St4un for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 15:36:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp1.osuosl.org (Postfix) with ESMTP id 556AE81D67
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 15:36:32 +0000 (UTC)
Received: from smtpclient.apple ([151.82.206.129])
 by Aruba Outgoing Smtp  with ESMTPA
 id GN6znaVP8DzPJGN6znEQLR; Sat, 05 Feb 2022 16:36:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644075390; bh=mXlTuaXR8RX09jZ+XM6ZUB9ErwnCJN6oXJboLaFlIPM=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=C/7JFfc0MYwOHZYg47pg7xt76VMPJbp+3kiJCljLBoPgBjeLXhF4VQMCFKNFfgjLP
 Khlc5pV1LTscdO4NOUZUCfgv3LQm/V5hFXRLzAGLppnN32U5VBpYwrATO6CSU9QLwW
 1w3Vf18+ZeLi4NAglQT1rvR2xR7TPOpfTzf3Rx6Iim7Wn1WBB+smOx3t0nveUl9jEE
 NmQOSYSA16ccbBgkDhMwFPGpjtXhvylzbHlPEy0NxfT/FTDV168y9Bs6HnjL4F/WHV
 ME2MdZFebmhVUjijA2q2FpmFTw2K9VtHEfJaT/wxok7GxkltPDw9ezW//AcfSTob3e
 Us+yb4uF/NQUA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 5 Feb 2022 16:36:29 +0100
Message-Id: <34C01EB2-BB12-4DE4-BC53-0141B5DF491D@benettiengineering.com>
References: <98670320-83fa-c6e9-9bc4-aa30d9deb6ff@mind.be>
In-Reply-To: <98670320-83fa-c6e9-9bc4-aa30d9deb6ff@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfOwBqFIl4Kh6DQlcr2GTrWkVaUCttN5dTKRw+ae4zE2Z2+xM3UYoSHJr9kGlC4TzRbrKZDXVQ3J4ur3HolRcOb1Ne7DZP2UzdCTMHzrYgbelhPGDo+rr
 Z688kDOsIwTddWNUPIJH7U64SPWCogoqY8t0Ahhqy/AQY23k1SChun4byypJeBwz9h+1/EO/ydyj1aXKvxKPKcfeJL9QcW0Pz4ld/jX6Apn5T6Jp9iTH4alL
Subject: Re: [Buildroot] [PATCH] board/pc: fix build failure due to new
 genimage 15
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

SGkgQXJub3V0LAoKPiBJbCBnaW9ybm8gNSBmZWIgMjAyMiwgYWxsZSBvcmUgMTU6MTEsIEFybm91
dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gaGEgc2NyaXR0bzoKPiAKPiDvu78gSGkg
R2l1bGlvLAo+IAo+PiBPbiAwNC8wMi8yMDIyIDAxOjU2LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToK
Pj4gQWN0dWFsbHkgZ2VuaW1hZ2UgZmFpbHMgdG8gY3JlYXRlIGZpbmFsIGltYWdlIHdpdGg6Cj4+
IGBgYAo+PiBFUlJPUjogaGRpbWFnZShkaXNrLmltZyk6IHBhcnRpdGlvbiBbTUJSXSAob2Zmc2V0
IDB4MWI4LCBzaXplIDB4NDgpIG92ZXJsYXBzIHByZXZpb3VzIHBhcnRpdGlvbiBib290IChvZmZz
ZXQgMHgwLCBzaXplIDB4MjAwKQo+PiBFUlJPUjogaGRpbWFnZShkaXNrLmltZyk6IGJvb3Rsb2Fk
ZXJzLCBldGMuIHRoYXQgb3ZlcmxhcCB3aXRoIHRoZSBwYXJ0aXRpb24gdGFibGUgbXVzdCBkZWNs
YXJlIHRoZSBvdmVybGFwcGluZyBhcmVhIGFzIGEgaG9sZS4KPj4gYGBgCj4+IFRoaXMgaXMgYmVj
YXVzZSBnZW5pbWFnZSAxNSBpcyBsZXNzIHBlcm1pc3NpdmUgdGhhbiBiZWZvcmUsIHNvIGxldCdz
IGFkZAo+PiBob2xlcyA9IHsiKDQ0MDsgNTEyKSJ9IHRvIGxlYXZlIHJvb20gdG8gTUJSLgo+PiBG
aXhlczoKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9i
cy8xODY1OTM1MjQ5Cj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVu
ZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+PiAtLS0KPj4gIGJvYXJkL3BjL2dlbmltYWdl
LWJpb3MuY2ZnIHwgMSArCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4gZGlm
ZiAtLWdpdCBhL2JvYXJkL3BjL2dlbmltYWdlLWJpb3MuY2ZnIGIvYm9hcmQvcGMvZ2VuaW1hZ2Ut
Ymlvcy5jZmcKPj4gaW5kZXggMjZkMTJkOWFiMy4uNTQwMjZmNjUyNyAxMDA2NDQKPj4gLS0tIGEv
Ym9hcmQvcGMvZ2VuaW1hZ2UtYmlvcy5jZmcKPj4gKysrIGIvYm9hcmQvcGMvZ2VuaW1hZ2UtYmlv
cy5jZmcKPj4gQEAgLTcsNiArNyw3IEBAIGltYWdlIGRpc2suaW1nIHsKPj4gICAgICAgICAgaW1h
Z2UgPSAiYm9vdC5pbWciCj4+ICAgICAgICAgIG9mZnNldCA9IDAKPj4gICAgICAgICAgc2l6ZSA9
IDUxMgo+PiArICAgICAgICBob2xlcyA9IHsiKDQ0MDsgNTEyKSJ9Cj4gCj4gSGF2ZSB5b3UgdGVz
dGVkIHRoaXMgY2hhbmdlIG9uIGFuIGFjdHVhbCBib2FyZCAoaS5lLiBhIFBDIDotKT8KCknigJl2
ZSB0ZXN0ZWQgaXQgd2l0aCBxZW11IGFuZCBpdCBib290cyB0aGUga2VybmVsIGNvcnJlY3RseSh0
aGF0IGlzIGluIHJvb3RmcyksIG9ubHkgdGhpbmcgaXMgdGhhdCBpdCBjYW7igJl0IG1vdW50IHRo
ZSByb290ZnMgYW5kIEkgZG9u4oCZdCB1bmRlcnN0YW5kIHdoeS4KSSB3YW50ZWQgdG8gYXNrIGFi
b3V0IHRoaXMgYnV0IEnigJl2ZSBnb3QgbG9zdCBhbW9uZyBhbGwgdGhlIG90aGVyIHBhdGNoZXMg
Oi0pCgpDb3VsZCBzb21lb25lIGRvdWJsZSBjaGVjayBpZiBpdCBtb3VudHM/CgpCZXN0IHJlZ2Fy
ZHMKR2l1bGlvCgo+IAo+IFJlZ2FyZHMsCj4gQXJub3V0Cj4gCj4+ICAgICAgfQo+PiAgICAgICAg
cGFydGl0aW9uIGdydWIgewo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
