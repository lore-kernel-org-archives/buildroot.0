Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF67C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 12:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD1D64174C;
	Wed,  3 Jan 2024 12:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD1D64174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2mNBisvAVdAq; Wed,  3 Jan 2024 12:29:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C476C402F3;
	Wed,  3 Jan 2024 12:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C476C402F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85A151BF409
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 12:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D2296100A
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 12:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D2296100A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64pjzJTyuiXp for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 12:29:06 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E03061005
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 12:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E03061005
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EBE4C0007;
 Wed,  3 Jan 2024 12:29:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rL0Mp-002uWG-0j;
 Wed, 03 Jan 2024 13:29:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <20231208174217.29735-1-louis.chauvet@bootlin.com>
 <87h6ju62xg.fsf@48ers.dk> <87le9662dl.fsf@tarshish>
Date: Wed, 03 Jan 2024 13:29:03 +0100
In-Reply-To: <87le9662dl.fsf@tarshish> (Baruch Siach's message of "Wed, 03 Jan
 2024 14:10:30 +0200")
Message-ID: <87cyui61o0.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: fix the RPATH
 of fiptool
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
Cc: =?utf-8?Q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkJhcnVjaCIgPT0gQmFydWNoIFNpYWNoIDxiYXJ1Y2hAdGtvcy5jby5pbD4gd3JpdGVz
OgoKID4gSGkgUGV0ZXIsCiA+IE9uIFdlZCwgSmFuIDAzIDIwMjQsIFBldGVyIEtvcnNnYWFyZCB3
cm90ZToKID4+Pj4+Pj4gIkxvdWlzIiA9PSBMb3VpcyBDaGF1dmV0IHZpYSBidWlsZHJvb3QgPGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CiA+PiAKID4+ID4gVGhlIGFybS10cnVzdGVk
LWZpcm13YXJlIHBhY2thZ2UgYnVpbGRzIGEgaG9zdCB0b29sIGNhbGxlZCAiZmlwdG9vbCIsCiA+
PiA+IHdoaWNoIGlzIHVzZWQgZHVyaW5nIHRoZSBidWlsZCBwcm9jZXNzIG9mIGFybS10cnVzdGVk
LWZpcm13YXJlCiA+PiA+IGl0c2VsZi4gVGhpcyB0b29sIGxpbmtzIGFnYWluc3QgdGhlIE9wZW5T
U0wgaG9zdCBsaWJyYXJ5LCBhbmQKID4+ID4gdGhlcmVmb3JlIG5lZWRzIHRvIGJlIGJ1aWx0IHdp
dGggdGhlIGNvcnJlY3QgUlBBVEggcG9pbnRpbmcgdG8KID4+ID4gJEhPU1RfRElSL2xpYi4KID4+
IAogPj4gPiBUaGlzIGlzIHdoeSBjb21taXQgYTk1N2Q5YTkwYWRlNDE5NGRmZmUzZWIyZmMwMTM2
YmM1ZDA3N2MyOAogPj4gPiAoImJvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmU6IGJ1aWxkIGZpcHRv
b2wgc2VwYXJhdGVseSB3aXRoIGRlcGVuZGVuY3kKID4+ID4gbyBuIGhvc3Qtb3BlbnNzbCIpIGFk
ZGVkIHRoZSBBUk1fVFJVU1RFRF9GSVJNV0FSRV9CVUlMRF9GSVBUT09MCiA+PiA+IHZhcmlhYmxl
LCB3aGljaCBidWlsZHMgdGhlIGZpcHRvb2wgdG9vbCBmaXJzdCwgd2l0aCB0aGUgcmlnaHQKID4+
ID4gdmFyaWFibGVzIHNldCwgYmVmb3JlIGludm9raW5nIHRoZSBmdWxsIGJ1aWxkIG9mIFRGLUEu
IFRoaXMgZW5zdXJlZAogPj4gPiB0aGF0IGZpcHRvb2wgd2FzIGJ1aWx0IHdpdGggdGhlIGNvcnJl
Y3QgUlBBVEguCiA+PiAKID4+ID4gSG93ZXZlciwgbW9yZSByZWNlbnQgdmVyc2lvbnMgb2YgVEYt
QSBoYXZlIG1vZGlmaWVkIHRoZWlyIE1ha2VmaWxlCiA+PiA+IG1hY2hpbmVyeSwgYW5kIGZpcHRv
b2wgaXMgYmVpbmcgcmVidWlsdCBldmVuIGlmIGl0IHdhcyBidWlsdAogPj4gPiBiZWZvcmUuIFVu
Zm9ydHVuYXRlbHksIHRoaXMgcmVidWlsZCBpcyBubyBsb25nZXIgZG9uZSB3aXRoIHRoZSByaWdo
dAogPj4gPiBmbGFncywgc28gd2UgZW5kIHVwIHdpdGggYSBmaXB0b29sIGJpbmFyeSB0aGF0IG5v
IGxvbmdlciBoYXMgdGhlIHJpZ2h0CiA+PiA+IFJQQVRILCBhbmQgZmlwdG9vbCBmYWlscyB0byBm
aW5kIHRoZSBPcGVuU1NMIGxpYnJhcmllcyBmcm9tCiA+PiA+ICRIT1NUX0RJUi9saWIuCiA+PiAK
ID4+ID4gSW4gb3JkZXIgdG8gZml4IHRoaXMsIHdlIHRha2UgYSBkaWZmZXJlbnQgYXBwcm9hY2g6
IHdlIGRvIG5vdCBidWlsZAogPj4gPiBmaXB0b29sIHNlcGFyYXRlbHkgZmlyc3QsIGJ1dCB3ZSBp
bmplY3QgdGhlIG5lY2Vzc2FyeSBmbGFncyB0aHJvdWdoCiA+PiA+IHRoZSBIT1NUQ0MgdmFyaWFi
bGUuIEluZGVlZCwgdGhlcmUncyBubyBIT1NUX0xERkxBR1Mgb3IgSE9TVF9MRExJQlMKID4+ID4g
dmFyaWFibGUgb3Igc2ltaWxhciB0aGF0IHdvdWxkIGFsbG93IHVzIHRvIHBhc3MgdGhlIC1XbCwt
cnBhdGggZmxhZwogPj4gPiB0aGF0IGlzIG5lZWRlZC4gU2hvZS1ob3JuaW5nIHRoaXMgZmxhZyBp
bnRvIEhPU1RDQyBnZXRzIHRoZSBqb2IgZG9uZSwKID4+ID4gYW5kIGFjdHVhbGx5IHNpbXBsaWZp
ZXMgb3VyIGFybS10cnVzdGVkLWZpcm13YXJlLm1rLgogPj4gCiA+PiA+IFRoaXMgcGF0Y2ggYnJl
YWsgdGhlIGNvbXBhdGliaWxpdHkgd2l0aCB2ZXJzaW9uIHByaW9yIHRvIDEuNCAodXBzdHJlYW0K
ID4+ID4gY29tbWl0IDcyNjEwYzQxMDI5OTAgKCJidWlsZDogSW50cm9kdWNlIEhPU1RDQyBmbGFn
IikpLiB2MS40IGlzIHZlcnkgb2xkCiA+PiA+IChKdWx5IDIwMTcpLCBub3QgdXNlZCBhbnltb3Jl
IGluLXRyZWUgYW5kIHByb2JhYmx5IG5vdCB1c2VkIGFueW1vcmUKID4+ID4gb3V0c2lkZSB0aGUg
dHJlZS4KID4+IAogPj4gPiBTaWduZWQtb2ZmLWJ5OiBMb3VpcyBDaGF1dmV0IDxsb3Vpcy5jaGF1
dmV0QGJvb3RsaW4uY29tPgogPj4gPiBDby1hdXRob3JlZC1ieTogVGhvbWFzIFBldGF6em9uaSA8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KID4+ID4gLS0tCiA+PiA+IFByZXZpb3VzIHZl
cnNpb246CiA+PiA+ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDIzMTIw
NjE2NDQzNy4yMjE5MS0xLWxvdWlzLmNoYXV2ZXRAYm9vdGxpbi5jb20vCiA+PiAKID4+ID4gQ2hh
bmdlcyB2MS0+djI6CiA+PiA+ICAgIFVwZGF0ZSBjb21taXQgbG9nIGFib3V0IGNvbXBhdGliaWx0
eQogPj4gCiA+PiBDb21taXR0ZWQgdG8gMjAyMy4wMi54IGFuZCAyMDIzLjExLngsIHRoYW5rcy4K
CiA+IEvDtnJ5IE1haW5jZW50IHJlcG9ydGVkIHRoYXQgdGhpcyBjb21taXQgYnJlYWtzIGZpcHRv
b2wgYnVpbGQgZm9yIHNvbWUKID4gcGxhdGZvcm1zLgoKID4gICBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyMzEyMjQxNjIyNTQuNTg5YjM5NWNAa21haW5jZW50LVhQUy0xMy03MzkwLwoK
SG1tLCB5ZXMuIEkgZGlkbid0IHNlZSBhbnkgY29tbXVuaWNhdGlvbiBhYm91dCB0aGlzIHNpbmNl
IHRoZW4gb3IKZGVmY29uZmlnIGZhaWx1cmVzLCBidXQgSSBtYXkgaGF2ZSBtaXNzZWQgdGhlbS4g
TG91aXM/CgpJJ2xsIGRvIGEgdGVzdCBidWlsZCBvZiBvY3Rhdm9fb3NkMzJtcDFfcmVkX2RlZmNv
bmZpZyBvbiAyMDIzLjAyLnggaGVyZQpvbiBhIG1hY2hpbmUgd2l0aG91dCBsaWJzc2wtZGV2LgoK
LS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
