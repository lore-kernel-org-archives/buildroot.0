Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B94FC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 08:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33F58400CB;
	Tue,  8 Aug 2023 08:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33F58400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yYHOKBE9z08o; Tue,  8 Aug 2023 08:20:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51955402CE;
	Tue,  8 Aug 2023 08:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51955402CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8D81BF25F
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 08:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34CD261069
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 08:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34CD261069
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaSqog-X_Thm for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 08:20:50 +0000 (UTC)
X-Greylist: delayed 386 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 08 Aug 2023 08:20:50 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5492960BCD
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5492960BCD
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 08:20:50 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 30095BDE6CE0;
 Tue,  8 Aug 2023 10:14:18 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 08 Aug 2023 08:14:18 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230806214533.512bac85@windsurf>
References: <20220409160921.GA3547512@scaer>
 <20221005091032.3014-3-br015@umbiko.net> <20230806214533.512bac85@windsurf>
Message-ID: <80da653b4925d4b2d3b99fd242bb9bf7@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.8 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1691482458; bh=aFFPl4rWZkTSPPwU6/ZE8fEshvOH9fovZVG1g8Q/HVw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ji9J27UUeUBTYRj5twLreVOjWs8Buz0idW7lRBr/TdFdAqj214luSSYdNmeu1tIxS
 JNDrexDlQJKNTbFAjCr+9f22wYgzTyPYnCOqPlqfy928NOgpOIUOa9Atcvvu/NpTLY
 0aj+NrIzHC8nNKJ0e77SaLyKPpjMO//KjBDgt99o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=ji9J27UU
Subject: Re: [Buildroot] [PATCH v2 2/4] package/mpd: add/enhance (kconfig +
 code) comments
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
Cc: YANN E MORIN <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLCAqLAoKVGhhbmsgeW91IGZvciBwaWNraW5nIHRoaXMgdXAuCgpPbiAyMDIzLTA4
LTA2IDE5OjQ1LCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+IEhlbGxvIEFuZHJlYXMsCj4gCj4g
T24gV2VkLCAgNSBPY3QgMjAyMiAxMToxMDozMCArMDIwMAo+IEFuZHJlYXMgWmllZ2xlciA8YnIw
MTVAdW1iaWtvLm5ldD4gd3JvdGU6Cj4gCj4+IEFsaWduIGtjb25maWcgY29tbWVudHMgd2l0aCBk
ZXNjcmlwdGlvbnMgaW4gdGhlIG1wZCBtYW51YWwuCj4+IEFkZCBhIGtjb25maWcgY29tbWVudCB0
byBoaWdobGlnaHQgdGhlIGltcGFjdCBvZiBvZ2cvdm9yYmlzIHNlbGVjdGlvbi4KPj4gQWRkIGNv
bW1lbnRzIHRvIG1ha2VmaWxlIHRvIGV4cGxhaW4gcmVtYWluaW5nIG11bHRpcGxlIGRlcGVuZGVu
Y3kgCj4+IGNyZWF0aW9uLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBaaWVnbGVyIDxi
cjAxNUB1bWJpa28ubmV0Pgo+PiAtLS0KPj4gQ2hhbmdlcyB2MSAtPiB2MjoKPj4gIC0gbWFrZSB0
aGlzIGEgc2VwYXJhdGUgcGF0Y2gKPj4gCj4+ICBwYWNrYWdlL21wZC9Db25maWcuaW4gfCA5ICsr
KysrKy0tLQo+PiAgcGFja2FnZS9tcGQvbXBkLm1rICAgIHwgMiArKwo+PiAgMiBmaWxlcyBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9tcGQvQ29uZmlnLmluIGIvcGFja2FnZS9tcGQvQ29uZmlnLmluCj4+IGluZGV4IDhm
MGFmN2IyZDMuLjI2MDYwMDhlOTAgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvbXBkL0NvbmZpZy5p
bgo+PiArKysgYi9wYWNrYWdlL21wZC9Db25maWcuaW4KPj4gQEAgLTMzLDcgKzMzLDcgQEAgY29u
ZmlnIEJSMl9QQUNLQUdFX01QRF9TUUxJVEUKPj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfU1FMSVRF
Cj4+ICAJaGVscAo+PiAgCSAgRW5hYmxlIHNxbGl0ZSBkYXRhYmFzZSBzdXBwb3J0Lgo+PiAtCSAg
SWYgeW91IGRvbid0IHVzZSBzcWxpdGUgaXQgd2lsbCB1c2UgYW4gQVNDSUkgZGF0YWJhc2UuCj4g
Cj4gV2h5IGlzIHRoaXMgcmVtb3ZlZD8KCkl0IHJhaXNlcyBmYWxzZSBob3Blcy4gTXBkIHVzZXMg
YW4gaW4tbWVtb3J5IGRhdGFiYXNlIHRoYXQgaXMgcGVyc2lzdGVkIAppbiBhIHByb3ByaWV0YXJ5
IGZpbGUgZm9ybWF0LiBUaGUgZm9ybWF0IG1heSBjaGFuZ2UgYmV0d2VlbiByZWxlYXNlcyBhbmQg
CnRoZXJlIGlzIG5vIHdheSB0byB1c2UgYSBTUUwgZGF0YWJhc2UgZm9yIHN0b3JhZ2UuIEFsbCB0
aGF0IHRoZSAKc3FsaXRlPWVuYWJsZWQgZmVhdHVyZSBkb2VzIGlzIGVuYWJsZSB0aGUgc3RpY2tl
ciBkYXRhYmFzZS4KCj4gCj4+ICsJICBUaGlzIGlzIG1hbmRhdG9yeSBmb3IgdGhlIHN0aWNrZXIg
ZGF0YWJhc2UuCj4gCj4gTm90IHN1cmUgd2hhdCB0aGUgc3RpY2tlciBkYXRhYmFzZSBpcyA6LSkK
Ckkgd2lsbCBhZGQgbW9yZSBpbmZvcm1hdGlvbiBmcm9tIHRoZSBtcGQgbWFudWFsOgorCSAgU3Vw
cG9ydCBmb3IgdGhlIHN0aWNrZXIgZGF0YWJhc2UuICDigJxTdGlja2Vyc+KAnSBhcmUgcGllY2Vz
IG9mCisJICBpbmZvcm1hdGlvbiBhdHRhY2hlZCB0byBzb25ncy4gU29tZSBjbGllbnRzIHVzZSB0
aGVtIHRvIHN0b3JlCisJICByYXRpbmdzIGFuZCBvdGhlciB2b2xhdGlsZSBkYXRhLgoKPiAKPj4g
Cj4+ICBjb25maWcgQlIyX1BBQ0tBR0VfTVBEX1paSVAKPj4gIAlib29sICJ6emlwIgo+PiBAQCAt
ODEsOCArODEsOCBAQCBjb21tZW50ICJEZWNvZGVyIHBsdWdpbnMiCj4+ICBjb25maWcgQlIyX1BB
Q0tBR0VfTVBEX0RTRAo+PiAgCWJvb2wgImRzZCIKPj4gIAloZWxwCj4+IC0JICBFbmFibGUgRGln
aXRhbCBTcGVlY2ggRGVjb2RlciAoRFNEKSBzdXBwb3J0IHRvIHBsYXkgYXVkaW8KPj4gLQkgIGZp
bGVzIGVuY29kZWQgaW4gYSBkaWdpdGFsIHNwZWVjaCBmb3JtYXQuCj4+ICsJICBEaXJlY3QgU3Ry
ZWFtIERpZ2l0YWwgKERTRCkgc3VwcG9ydCB0byBwbGF5IGF1ZGlvCj4+ICsJICBmaWxlcyBlbmNv
ZGVkIGluIHNpbmdsZSBiaXQgZm9ybWF0Lgo+IAo+IElzIHRoaXMgY2hhbmdlIHJlYWxseSByZWxl
dmFudCA/Cj4gCgpUaGUgRGlnaXRhbCBTcGVlY2ggWzFdIGZvcm1hdCBleGlzdHMsIGJ1dCB0aGlz
IGlzIG5vdCB0aGUgZm9ybWF0IApyZWZlcnJlZCB0byBoZXJlLiBNUEQgcGxheXMgU0EtQ0Qgcmlw
cyBbMl0KCk1heWJlOgorCSAgRGlyZWN0IFN0cmVhbSBEaWdpdGFsIChEU0QpIHN1cHBvcnQgdG8g
cGxheSBkZWx0YS1zaWdtYQorCSAgZW5jb2RlZCBmaWxlcyBpbiBmb3JtYXRzIERTRElGRiBhbmQg
RFNGLgorCisJICBUaGlzIGlzIHRoZSBzYW1wbGUgZm9ybWF0IHVzZWQgb24gU3VwZXIgQXVkaW8g
Q0RzLgoKPj4gCj4+ICBjb25maWcgQlIyX1BBQ0tBR0VfTVBEX0ZBQUQyCj4+ICAJYm9vbCAiZmFh
ZDIiCj4+IEBAIC0yMTAsNiArMjEwLDkgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01QRF9UV09MQU1F
Cj4+ICAJaGVscAo+PiAgCSAgRW5hYmxlIFR3b0xBTUUgbXAyIGVuY29kaW5nLgo+PiAKPj4gK2Nv
bW1lbnQgImZvciBvZ2cvdm9yYmlzIGVuY29kaW5nIGVuYWJsZSB2b3JiaXMgZGVjb2RlciIKPj4g
KwlkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9NUERfVk9SQklTCj4gCj4gSSBkb24ndCB1bmRlcnN0
YW5kIHdoeSB0aGlzIGNvbW1lbnQgaXMgbmVlZGVkLiBXZSB1c3VhbGx5IGRvbid0IHB1dAo+IGNv
bW1lbnRzIGFib3V0IGFsbCBkZXBlbmRlbmNpZXMgb24gb3RoZXIgcGFja2FnZXMuIFdoeSBmb3Ig
dGhpcyBvbmU/CgpPcHRpb25zIGFyZSBzdHJ1Y3R1cmVkIGJ5IGZ1bmN0aW9uLiBTaW5jZSBvZ2cv
dm9yYmlzIGNvZGVjcyBtdXN0IGJlIApzZWxlY3RlZCBzaW11bHRhbmVvdXNseSAoYWNjb3JkaW5n
IHRvIHRoZSBCdWlsZHJvb3Qgc3RhbmRhcmQpLCBhIGZlYXR1cmUgCnRoYXQgaXMgbG9jYXRlZCB1
bmRlciAqZGVjb2RpbmcqIG11c3QgYmUgZW5hYmxlZCBmb3IgKmVuY29kaW5nKi4gQnJlYWtzIAp1
cCB0aGUgVUkgYSBsaXR0bGUgYml0LCB0aGVyZWZvcmUgYSBjb21tZW50LgoKPiBJZiB5b3Ugd2Fu
dCB0byBwbGF5IE9nZy9Wb3JiaXMgZmlsZXMsIGl0J3MgcXVpdGUgb2J2aW91cyB0aGF0IHRoZQo+
ICJ2b3JiaXMiIG9wdGlvbiBuZWVkcyB0byBiZSBlbmFibGVkLgoKVGhpcyBpcyBhIGRpZmZlcmVu
dCB1c2UgY2FzZS4gVGhlIGVuY29kZXIgaXMgdXNlZCBmb3Igc3RyZWFtaW5nIApwcm90b2NvbHMs
IHNpbWlsYXIgdG8gaW50ZXJuZXQgcmFkaW8gc3RhdGlvbnMuCgo+PiArIyBvcHVzIG5lZWRzIHRv
IGJlIGVuY2Fwc3VsYXRlZCBpbiBhIGNvbnRhaW5lciBmb3JtYXQsIGhlcmUgb2dnCj4gCj4gWWVz
LCBhbmQ/CgpNb3N0IG1wZCBvcHRpb25zIGhhdmUgZXhhY3RseSBvbmUgZGVwZW5kZW5jeS4gRmVh
dHVyZSBuYW1lIGFuZCBsaWJyYXJ5IApuYW1lIG1hdGNoOyBlYXN5IHRvIHNlZSB0aGF0IGV2ZXJ5
dGhpbmcgaXMgYXMgaXQgc2hvdWxkIGJlLiBTbyBJIGFkZGVkIApjb21tZW50cyB3aGVuZXZlciB0
aGVyZSB3YXMgYSBkZXZpYXRpb24sIGp1c3QgdG8gc2hvdyB0aGF0IHRoaXMgaXMgbm90IAphbiBl
cnJvciwgYnV0IGludGVuZGVkLgoKPj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTVBEX09QVVMpLHkp
Cj4+ICBNUERfREVQRU5ERU5DSUVTICs9IG9wdXMgbGlib2dnCj4+ICBNUERfQ09ORl9PUFRTICs9
IC1Eb3B1cz1lbmFibGVkCj4+IEBAIC0zMTcsNiArMzE4LDcgQEAgZWxzZSBpZmVxICgkKEJSMl9Q
QUNLQUdFX01QRF9VUE5QX0RJU0FCTEVEKSx5KQo+PiAgTVBEX0NPTkZfT1BUUyArPSAtRHVwbnA9
ZGlzYWJsZWQKPj4gIGVuZGlmCj4+IAo+PiArIyBoYW5kbGUgZGVjb2RlciBhbmQgZW5jb2RlciBz
aW11bHRhbmVvdXNseQo+IAo+IFllcywgYW5kPwo+IAoKQWdhaW4sIGEgZGV2aWF0aW9uIGZyb20g
dGhlIG9uZSBmZWF0dXJlIC9vbmUgc2VsZWN0aW9uIHBhdHRlcm4uCgo+IFNvcnJ5LCBidXQgSSBk
b24ndCByZWFsbHkgdW5kZXJzdGFuZCB0aGUgdmFsdWUgb2YgdGhlIGNoYW5nZXMgcHJvcG9zZWQK
PiBpbiB0aGlzIGNvbW1pdC4gSSdsbCBtYXJrIGl0IGFzIENoYW5nZXMgUmVxdWVzdGVkIGZvciB0
aGUgdGltZSBiZWluZy4KPiBGZWVsIGZyZWUgdG8gcmVzdWJtaXQgd2l0aCBtb3JlIGRldGFpbHMg
aWYgbmVlZGVkLiBBbHNvLCBsb29rIGF0IG90aGVyCj4gQnVpbGRyb290IHBhY2thZ2VzLCB3ZSB0
cnkgdG8gZG8gdGhpbmdzIGNvbnNpc3RlbnRseSwgc28gZG9pbmcKPiBzb21ldGhpbmcgInNwZWNp
YWwiIGluIE1QRCBpcyB1bmxpa2VseSB0byBiZSBhY2NlcHRlZC4KClNvbWUgcGFja2FnZXMgLSBm
b3IgZXhhbXBsZSBtcGQgLSBhcmUgcmF0aGVyIGRpZmZpY3VsdCB0byBjb25maWd1cmUgCmNvcnJl
Y3RseS4gU28gd2h5IG5vdCBhZGQgYSBiaXQgbW9yZSBpbmZvcm1hdGlvbiwgZXNwZWNpYWxseSBp
biB0aGUgdXNlciAKaW50ZXJmYWNlIDstKQoKSSBleHBlY3QgeW91ciBjb21tZW50cyBhbmQgd2ls
bCBmb2xsb3cgdXAgd2l0aCBhIG5ldyB2ZXJzaW9uLgoKS2luZCByZWdhcmRzLApBbmRyZWFzCgo+
IFRoYW5rcyEKPiAKPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFu
ZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFu
ZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KClsxXSBodHRwczovL2VuLndpa2lwZWRp
YS5vcmcvd2lraS9EaWdpdGFsX1NwZWVjaF9TdGFuZGFyZApbMl0gaHR0cHM6Ly9lbi53aWtpcGVk
aWEub3JnL3dpa2kvRGlyZWN0X1N0cmVhbV9EaWdpdGFsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
