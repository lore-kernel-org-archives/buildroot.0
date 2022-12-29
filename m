Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8299C3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 22:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 318A94020C;
	Thu, 29 Dec 2022 22:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 318A94020C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9d8Ki2TS94Dd; Thu, 29 Dec 2022 22:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C11CB40333;
	Thu, 29 Dec 2022 22:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C11CB40333
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B0741BF287
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 22:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 069D260AF4
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 22:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 069D260AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ruRM7krcWD5X for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 22:07:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8D0C6006A
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8D0C6006A
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 22:06:59 +0000 (UTC)
Received: from smtpclient.apple ([151.18.218.237])
 by Aruba Outgoing Smtp  with ESMTPA
 id B13CpMgIUEkpyB13CpBfEK; Thu, 29 Dec 2022 23:06:58 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 29 Dec 2022 23:06:55 +0100
Message-Id: <BCF6BFBB-EE5A-43FA-B64A-E2513A4A3BCF@benettiengineering.com>
References: <CB65BA13-5218-4C00-86E0-CB128E71F322@benettiengineering.com>
In-Reply-To: <CB65BA13-5218-4C00-86E0-CB128E71F322@benettiengineering.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (20C65)
X-CMAE-Envelope: MS4xfCZqSdKb/RWDpv1YUImeDhdFVCAFvg7nIgWK2KbobC+27NvZXv0Uwdf4M5PzQRNHHDrS4EVugSlW8ylwIPdFlVBCixlel7/0g1XbVpHsnMt/yj/pgcMI
 x6uk5BNP8k73dWuAdcmu/UVUQAygaouJF/K+P/gD9y+3eR3vYyYAFVkIwf5fW0HnIL1ETZsblu8MZzQZCmhCgjn0mdaE4GK32arrLh+D/CYPpdvNJNBbK9PP
 +DJrztrAJR8Vk0Jq8RpbDi+eyRljCQLOgO1uWbG7w37aFIkQoOhNHJZMjX5Lnktl
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672351618; bh=q6wHx8ucv4zx2qPPNZkfISGLmnVYLL77499lc+/4Lc8=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=LABWGqTgLaRg5xgOitI+5554Kj6YWYvoEwF/Vgrkb90BecR6LZspnW3bD80vbh+hO
 LNW4OPpil/exV6IZQ3CqNOmN4KCRQ+qEa34yFm9BuHYqyMhmQ1mFa7xdfdZthFefiL
 sJOOnSnnK2pUgM7Kv9gX4HoPSVbjD6sg4fnSGK4b9Y6WQzeOfUeYtxiJ4aNA0FFC4o
 7LTjDRXZhPKuUXXK7zRmwUQEDFlI6rOu/hZ3Ia3pM7iJrfTSaTrSccHneJNokNiSfS
 PJRZx1pDmyN7ALHUco8A/MC9pwFx4koV8Q1lyS0TZUIqqm2IKw+CShA55aD+s5AtPJ
 MgE7esHdyv0nQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=LABWGqTg
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure up
 to Linux 6.1
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
Cc: Kris Bahnsen <kris@embeddedts.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDI5IGRpYyAyMDIyLCBhbGxlIG9yZSAyMzowNCwgR2l1bGlvIEJlbmV0dGkg
PGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IGhhIHNjcml0dG86Cj4gCj4g
77u/SGkgVGhvbWFzLAo+IAo+PiBJbCBnaW9ybm8gMjkgZGljIDIwMjIsIGFsbGUgb3JlIDA5OjU4
LCBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBoYSBzY3Jp
dHRvOgo+PiAKPj4g77u/T24gV2VkLCAyOCBEZWMgMjAyMiAyMTo1MzoyMyArMDEwMAo+PiBHaXVs
aW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6
Cj4+IAo+Pj4gQWRkIHBhdGNoZXMgcGVuZGluZyB1cHN0cmVhbVswXSB0byBoYW5kbGUgdmFyaW91
cyBkYXRhIHR5cGVzIGFuZCBhcGkKPj4+IGNoYW5nZXMgdXAgdG8gTGludXggNi4xLgo+Pj4gCj4+
PiBbMF06IGh0dHBzOi8vZ2l0aHViLmNvbS9lbWJlZGRlZFRTL3dpbGMzMDAwLWV4dGVybmFsLW1v
ZHVsZS9wdWxsLzIKPj4+IAo+Pj4gRml4ZXM6Cj4+PiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5uZXQvcmVzdWx0cy82YWE3NDc1YTIxYTYwNjBlOWZjZTM1NTJmNzNlNmU3MTAwYThiMmFhCj4+
PiAKPj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5l
dHRpZW5naW5lZXJpbmcuY29tPgo+Pj4gLS0tCj4+PiAuLi5taXNzaW5nLXByYW5kb21fdTMyLXdp
dGgtTGludXgtNi4xLjAucGF0Y2ggfCAgMzQgKysrCj4+PiAuLi5maXgtYnVpbGQtZmFpbHVyZS1v
bi1yZW1vdmUtY2FsbGJhY2sucGF0Y2ggfCAgNDQgKysrKwo+Pj4gLi4udWlsZC1mYWlsdXJlLXdp
dGgtTGludXgtNS4xOS1hbmQtNi4xLnBhdGNoIHwgIDk4ICsrKysrKysrCj4+PiAuLi5vbl9wYXJh
bWV0ZXJzLUxpbnV4LTYuMS1idWlsZC1mYWlsdXIucGF0Y2ggfCAyMTYgKysrKysrKysrKysrKysr
KysrCj4+PiA0IGZpbGVzIGNoYW5nZWQsIDM5MiBpbnNlcnRpb25zKCspCj4+PiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS93aWxjLWRyaXZlci8wMDAxLWNmZzgwMjExLmMtZml4LW1pc3Npbmct
cHJhbmRvbV91MzItd2l0aC1MaW51eC02LjEuMC5wYXRjaAo+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2Uvd2lsYy1kcml2ZXIvMDAwMi1zcGkuYy1maXgtYnVpbGQtZmFpbHVyZS1vbi1yZW1v
dmUtY2FsbGJhY2sucGF0Y2gKPj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3dpbGMtZHJp
dmVyLzAwMDMtY2ZnODAyMTEuYy1maXgtYnVpbGQtZmFpbHVyZS13aXRoLUxpbnV4LTUuMTktYW5k
LTYuMS5wYXRjaAo+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvd2lsYy1kcml2ZXIvMDAw
NC1GaXgtc3RydWN0LXN0YXRpb25fcGFyYW1ldGVycy1MaW51eC02LjEtYnVpbGQtZmFpbHVyLnBh
dGNoCj4+IAo+PiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLiBIb3dldmVyLCBpdCBpcyB3b3J0
aCBtZW50aW9uaW5nIHRoYXQgdGhlCj4+IHJlYWwgInVwc3RyZWFtIiBmb3IgdGhpcyBkcml2ZXIg
aXMgdGhlIGxpbnV4NHNhbSBMaW51eCB0cmVlIGF0Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51
eDRzYW0vbGludXgtYXQ5MS4KPiAKPiBBaCwgeWVzCj4gCj4+IFRoZXkgYXJlIGN1cnJlbnRseSBi
YXNlZCBvbgo+PiA1LjE1LCBidXQgSSBzdXBwb3NlIHRoZXkgd2lsbCByZWJhc2Ugc29vbiBvbiA2
LjEsCj4gCj4gSSB0aGluayBzbyB0b28KPiAKPj4gc28gdGhleSBtaWdodCBiZQo+PiBpbnRlcmVz
dGVkIGluIHlvdXIgZml4ZXMuCj4gCj4gSG93IGNhbiBJIHBvaW50IG15IGZpeGVzPyBEbyB5b3Ug
dGhpbmsgaXTigJlzIGVub3VnaCB0byBvcGVuIGFuIElzc3VlIGluIGxpbnV4LWF0OTEgR2l0SHVi
PwoKVGhleSBkb27igJl0IGhhdmUgdGhlIElzc3VlIGF2YWlsYWJsZSBpbiBHaXRIdWIsIEkgc2Vu
ZCBhbiBlbWFpbCB0byB0aGUgbWFpbnRhaW5lciB0aGVuLgoKQmVzdCByZWdhcmRzCkdpdWxpbwoK
PiAKPj4gSSBkb24ndCBrbm93IGlmL3doZW4gdGhlIG91dC1vZi10cmVlIHZhcmlhbnQKPj4gb2Yg
dGhlIFdJTEMgZHJpdmVyIGF0Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9lbWJlZGRlZFRTL3dpbGMz
MDAwLWV4dGVybmFsLW1vZHVsZSBnZXRzIHN5bmNlZCBmcm9tCj4+IHRoZSBsaW51eDRzYW0gdHJl
ZS4KPiAKPiBJ4oCZdmUgY29tcGFyZWQgdGhlIHR3byBkcml2ZXJzIGFuZCB0aGV5IGFyZSBwcmV0
dHkgdGhlIHNhbWUsIG5vdCBjb21wbGV0ZWx5IGJ1dCB2ZXJ5IGNsb3NlIGV4Y2x1ZGluZyB0aGUg
dmFyaW91cyAjaWZkZWbigJlzLgo+IEkgZG9u4oCZdCBlaXRoZXIga25vdyBob3cgdGhhdCByZXBv
IGlzIGhhbmRsZWQgYnV0IEkgY2FuIG1vbml0b3IgaXQuCj4gCj4gQmVzdCByZWdhcmRzCj4gR2l1
bGlvCj4gCj4+IAo+PiBCZXN0IHJlZ2FyZHMsCj4+IAo+PiBUaG9tYXMKPj4gLS0gCj4+IFRob21h
cyBQZXRhenpvbmksIENUTywgQm9vdGxpbgo+PiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCj4+IGh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
