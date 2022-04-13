Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D59C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 08:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FEF940986;
	Wed, 13 Apr 2022 08:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CxPpjg_dvu0x; Wed, 13 Apr 2022 08:29:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32971408DC;
	Wed, 13 Apr 2022 08:29:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B81061BF403
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3C4960B34
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEbiY-48B4or for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 08:29:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C14A60AB3
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 08:29:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 78346FF815;
 Wed, 13 Apr 2022 08:29:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1neYNC-009clX-E1; Wed, 13 Apr 2022 10:29:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <Eugen.Hristev@microchip.com>
References: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
 <8735ims60b.fsf@dell.be.48ers.dk>
 <d1a1ead3-98a8-35fe-4c4c-e7fd3f02e058@microchip.com>
 <CAPi7W81VbAArhoyDEJrNMeseVXgmJzu2+K39njx1j5y3_5mb5g@mail.gmail.com>
 <8735iifser.fsf@dell.be.48ers.dk>
 <34fddc8f-8710-65f9-330d-81fefe64354a@microchip.com>
 <87y20aeb04.fsf@dell.be.48ers.dk>
 <CAPi7W83dikm9d7KWjKfqYwr7mP3U4WzAzdw6iLF6gmOkTgwB-Q@mail.gmail.com>
 <8d53da79-2a90-8649-6f46-22b33b7bdbe5@microchip.com>
Date: Wed, 13 Apr 2022 10:29:10 +0200
In-Reply-To: <8d53da79-2a90-8649-6f46-22b33b7bdbe5@microchip.com> (Eugen
 Hristev's message of "Wed, 13 Apr 2022 07:54:54 +0000")
Message-ID: <87bkx5crop.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Cc: fontaine.fabrice@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gICA8RXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tPiB3cml0ZXM6CgogPiBPbiA0LzEy
LzIyIDk6MTcgUE0sIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6CiA+PiBMZSBtYXIuIDEyIGF2ci4g
MjAyMiDDoCAxNDozNCwgUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiBhIMOp
Y3JpdCA6CiA+Pj4gCiA+Pj4+Pj4+PiA8RXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tPiB3cml0
ZXM6CiA+Pj4gCiA+Pj4gSGksCiA+Pj4gCiA+Pj4gPj4gWWVhaC4gRXVnZW4sIGlzIHRoZXJlIGFu
eSBzcGVjaWZpYyByZWFzb24gd2h5IHlvdSB1c2UgdGhlIGRoY3AgcGFja2FnZQogPj4+ID4+IG92
ZXIgdGhlIG90aGVyIERIQ1AgY2xpZW50cyB3ZSBwcm92aWRlPwogPj4+IAogPj4+ID4gSGlzdG9y
aWNhbCByZWFzb25zLCBhbmQgdGhlIGZhY3QgdGhhdCBwZW9wbGUgaGF2ZSB3b3JraW5nIGNvbmZp
Z3VyYXRpb25zCiA+Pj4gPiB1c2luZyB0aGlzIHBhY2thZ2UuLi4gSSB3YXMgdW5hd2FyZSB0aGF0
IGl0IHdhcyBkdWUgdG8gYmUgcmVtb3ZlZC4KID4+PiA+IFdlIHdpbGwgdHJ5IHRvIHN3aXRjaCB0
byBhIGRpZmZlcmVudCBwYWNrYWdlIGluIHRoZSBmdXR1cmUuIFRoYW5rcyBmb3IKID4+PiA+IGxl
dHRpbmcgbWUga25vdy4KID4+PiA+IEhvd2V2ZXIsIGlmIHRoZSBwYWNrYWdlIGlzIHN0aWxsIGlu
IHRoaXMgYnVpbGRyb290IHJlbGVhc2UsIGl0IGhhcyB0bwogPj4+ID4gd29yayByaWdodCA/CiA+
Pj4gCiA+Pj4gWWVzLCB0aGF0IGlzIHRoZSBpZGVhLiBJZiBpdCBpcyBkZWFkIHVwc3RyZWFtIGFu
ZCBoYXJkIHRvIGZpeCB0aGVuIHRoYXQKID4+PiBuYXR1cmFsbHkgbWFrZXMgaXQgaGFyZGVyIHRv
IGRvLCBidXQgdGhlIGludGVudGlvbiBpcyB0byBmaXggaXQuCiA+PiAKID4+IFRoZSBmb2xsb3dp
bmcgcGF0Y2ggc2hvdWxkIGZpeCB0aGUgaXNzdWU6CiA+PiBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNDEyMTgxNjA3LjE0NTE1ODAtMS1m
b250YWluZS5mYWJyaWNlQGdtYWlsLmNvbS8KCiA+IEhpLAoKID4geW91ciBwYXRjaCB0b2dldGhl
ciB3aXRoIHRoZSBvdGhlciBvbmUgKCAKID4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L2J1aWxkcm9vdC9wYXRjaC9EVTBQMjUxTUIwNzc5N0NBQUU4MEM5ODVEQzg5NzYzMzVF
M0U3OUBEVTBQMjUxTUIwNzc5LkVVUlAyNTEuUFJPRC5PVVRMT09LLkNPTS8KID4gKSwKCiA+IHNv
bHZlIHRoZSBidWlsZCBwcm9ibGVtIGZvciB0aGlzIHBhY2thZ2UuCgpUaGV5IGFyZSBub3cgYm90
aCBhZGRlZCB0byB0aGUgMjAyMi4wMi54IGJyYW5jaCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIg
S29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
