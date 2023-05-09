Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECFDC77B75
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 12:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63CC660AAE;
	Tue,  9 May 2023 12:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63CC660AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tUIJw75obOlH; Tue,  9 May 2023 12:29:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77FCE60BE7;
	Tue,  9 May 2023 12:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77FCE60BE7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95E1D1BF300
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 12:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C18F40487
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 12:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C18F40487
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S3JGZ9WCt6KC for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 12:29:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1F5E403E9
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1F5E403E9
 for <buildroot@buildroot.org>; Tue,  9 May 2023 12:29:18 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pwMSx-004o99-8j; Tue, 09 May 2023 14:29:15 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 7992d4fe;
 Tue, 9 May 2023 12:29:12 +0000 (UTC)
Date: Tue, 9 May 2023 15:29:08 +0300
Message-ID: <20230509152908.GB2291742@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <3722492d-cee3-71be-62d0-f532a7985782@benettiengineering.com>
References: <20230503145825.GB1907630@igalia.com>
 <E63916C7-FFFA-4C6E-B684-02CE35739EB8@benettiengineering.com>
 <20230503232913.GC3101739@igalia.com>
 <3722492d-cee3-71be-62d0-f532a7985782@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lS9VgjqQ9STAy01DT+c3PNKlCFQEAaq6Vnoa2BtQHOg=; b=O7X9NRF6ngW3Ba+bLfcl6KGKkk
 WZSTAiLmBOGKypo/h0r7CjhFh0+VezFsrvysNmULMxwdZXpTosBhiPplLoBOImrIfDAAs2dN1H/kk
 xHL8pOiyB93XGlpX0nGQeZv/pau9qRBI3mpv6hLcG7o+OmI7jbaPgKY/9A0un4hdIcLlxnVOFuYca
 YwoDqEYrIW9cz7wE72nohwhJz194LI+lo35h6eO6+qv3teoa3alI+ctOaScuCf/e/51bmMMwpeRSu
 d0gka6N5xKeXZ2z0XpQOcxe4I2wKSAWexUBj0Dd4UGIqDYHNcx1lchD/Dv2CAe6PKR7QT2nc6SvhI
 Cpum1dSA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=O7X9NRF6
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard: support the
 wayland driver
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
Content-Type: multipart/mixed; boundary="===============0093430552476280392=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0093430552476280392==
Content-Type: multipart/signed; boundary="gleqXW5NsN5aS70J"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--gleqXW5NsN5aS70J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgR2l1bGlvLAoKSSBoYWQgYSBtb21lbnQgdG8gY2hlY2sgeW91ciBidWlsZCBmYWlsdXJlLCBz
ZWUgdGhlIGNvbW1lbnQgYmVsb3cuCgpPbiBTdW4sIDA3IE1heSAyMDIzIDE1OjAwOjAxICswMjAw
IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3
cm90ZToKPiBIaSBBZHJpYW4sCj4gCj4gT24gMDMvMDUvMjMgMjI6MjksIEFkcmlhbiBQZXJleiBk
ZSBDYXN0cm8gd3JvdGU6Cj4gPiBIZWxsbyBHaXVsaW8uCj4gPiAKPiA+IE9uIFdlZCwgMDMgTWF5
IDIwMjMgMjE6NDc6MDYgKzAyMDAgR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0
dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+ID4gCj4gPj4+IElsIGdpb3JubyAzIG1hZyAyMDIz
LCBhbGxlIG9yZSAxMzo1OCwgQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5j
b20+IGhhIHNjcml0dG86Cj4gPj4+Cj4gPj4+IO+7v0hlbGxvIEdpdWxpbywKPiA+Pj4KPiA+Pj4+
IE9uIFN1biwgMzAgQXByIDIwMjMgMjM6MzU6MDMgKzAyMDAgR2l1bGlvIEJlbmV0dGkgPGdpdWxp
by5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+ID4+Pj4gSGkgQWRyaWFu
LAo+ID4+Pj4KPiA+Pj4+PiBPbiAyMy8wNC8yMyAyMzo0NiwgQWRyaWFuIFBlcmV6IGRlIENhc3Ry
byB3cm90ZToKPiA+Pj4+PiBIaSwKPiA+Pj4+Pgo+ID4+Pj4+IE9uIE1vbiwgMjQgQXByIDIwMjMg
MDA6NDA6MTQgKzAzMDAgQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+
IHdyb3RlOgo+ID4+Pj4+PiBBZGQgYSBjaG9pY2UgdG8gYWxsb3cgdXNpbmcgdGhlIFdheWxhbmQg
dmFyaWFudCBvZiB0aGUgTWFsaSBkcml2ZXIuIFdoZW4KPiA+Pj4+Pj4gc2VsZWN0ZWQsIHRoZSBw
YWNrYWdlIGlzIG1hcmtlZCBhcyBwcm92aWRlciBmb3IgbGliZ2JtIGFzIGxpYk1hbGkuc28KPiA+
Pj4+Pj4gaW5jbHVkZXMgdGhlIHN5bWJvbHMgYW5kIGEgbGliZ2JtLnNvIHN5bWxpbmsgaXMgaW5z
dGFsbGVkOyBhbmQgYm90aAo+ID4+Pj4+PiBCUjJfUEFDS0FHRV9IQVNfe0xJQkdCTSxMSUJFR0xf
V0FZTEFORH0gYXJlIHNlbGVjdGVkIGFjY29yZGluZ2x5Lgo+ID4+Pj4+Pgo+ID4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KPiA+
Pj4+Pgo+ID4+Pj4+IFdpdGggdGhpcyBJIGhhdmUgYmVlbiBhYmxlIHRvIGJ1aWxkIFdlYktpdEdU
SywgV1BFV2ViS2l0LCBhbmQgdGhlIENhZ2UKPiA+Pj4+PiBjb21wb3NpdG9yIHdpdGhvdXQgdHJv
dWJsZSwgYnV0IHVuZm9ydHVuYXRlbHkgSSBkbyBub3QgaGF2ZSB0aGUgaGFyZHdhcmUKPiA+Pj4+
PiB0byB0ZXN0IGl0Li4uIHNvIEkgY2Fubm90IHJlYWxseSB0ZWxsIHdoZXRoZXIgdGhpbmdzIHdv
cmsgYXMgZXhwZWN0ZWQuCj4gPj4+Pgo+ID4+Pj4gQ2FuIHlvdSBwbGVhc2UgcGFzdGViaW4gb3Ig
cGFzdGUgaGVyZSB0aGUgZGVmY29uZmlnIHlvdSd2ZSB1c2VkIHRvCj4gPj4+PiBidWlsZD8gSSdt
IGVuY291bnRlcmluZyBzb21lIGlzc3VlcyB3aGlsZSBidWlsZGluZyBidXQgSSB3b3VsZCBsaWtl
IHRvCj4gPj4+PiB0ZXN0IG9uIGEgYm9hcmQgdGhpcyBwYXRjaC4KPiA+Pj4KPiA+Pj4gSSBhbSBh
dHRhY2hpbmcgdGhlIGNvbmZpZ3VyYXRpb24gZmlsZSB0byB0aGlzIG1haWwsIGl0J3MgYmFzZWQg
b24KPiA+Pj4gb2xpbWV4X2EyMF9vbGludXhpbm9fbGltZTJfZGVmY29uZmlnIGFuZCBJIGhhdmUg
dGVzdGVkIGJ1aWxkaW5nIHdwZXdlYmtpdAo+ID4+PiB3aXRoIHRoZSBwYXRjaCBhcHBsaWVkIGFu
ZCBpdCB3b3JrZWQgaGVyZS4gSSBob3BlIHRoaXMgaGVscHMsIGFuZCBsZXQgbWUKPiA+Pj4ga25v
dyBpZiBJIGNhbiBoZWxwIG91dCBpbiBhbnkgb3RoZXIgd2F5IDotKQo+ID4+Cj4gPj4gVGhhbmtz
IGEgbG90LiBDYW4geW91IGFsc28gcG9pbnQgbWUgdGhlIFNIQTEgY29tbWl0IHlvdSB3ZXJlIHVz
aW5nIHRvIGJ1aWxkPwo+ID4+IFRoaXMgaXMgYmVjYXVzZSBidWlsZCBmYWlscyBhdCBtZSBub3Qg
ZHVlIHRvIGhvc3QgcHJvYmxlbXMuCj4gPiAKPiA+IFllcywgSSBqdXN0IHRyaWVkIGEgYnVpbGQg
dG9kYXkgb24gOWEwODU3ZDczNGM1ZmNhNzQ5MTViMWNkODViOTI1NTVmZTE1ZmI5Mwo+ID4gYmVm
b3JlIHNlbmRpbmcgdGhlIC5jb25maWcgZmlsZSBlYXJsaWVyLgo+IAo+IFNvcnJ5IGJ1dCBpdCBz
dGlsbCBmYWlscyB3aXRoIHRoaXMgZXJyb3I6Cj4gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vNlk0SFRO
ZkYKPiAKPiBJJ3ZlIHVzZWQgdGhlIFNIQTEgeW91J3ZlIHBvaW50ZWQgbWUgdGhhdCBJJ3ZlIHNl
ZW4gdGhhdCByZWZlcnMgdG86Cj4gMjAyMi4wMi4xMgo+IAo+IEkndmUgdXNlZCBidWlsZHJvb3Qv
dXRpbHMvZG9ja2VyLXJ1biB0b28gYW5kIHRoZSBlcnJvciBpcyB0aGUgc2FtZS4KPiAKPiBDYW4g
eW91IHBsZWFzZSB0YWtlIGEgbG9vayBhdCBpdD8KCllvdSBuZWVkIHRvIGFwcGx5IHRoaXMgcGF0
Y2ggdG8gbWFrZSAyLjM4LnggYnVpbGQgY29ycmVjdGx5IHdpdGggZHJpdmVycwp3aGljaCBzdHJp
Y3RseSBkZWNsYXJlIEdMRVN2MiBmdW5jdGlvbnMgYW5kIHN5bWJvbHMgaW4gdGhlaXIgaGVhZGVy
cyB3aXRob3V0CmFueSBHTEVTdjMgb3IgRGVza3RvcCBHTCBhZGRpdGlvbnM6CgogIGh0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzA0MjMyMTMy
MzMuMjk2MTc3MC0xLWFwZXJlekBpZ2FsaWEuY29tLwoKSSBhY3R1YWxseSB3cm90ZSB0aGF0IHBh
dGNoIHNvIEkgY291bGQgZ2V0IFdlYktpdCBidWlsdCB3aXRoIHRoaXMgcGF0Y2ggSQpzZW50IGZv
ciBzdW54aS1tYWxpLXV0Z2FyZCBidXQgZm9yZ290IHRvIG1lbnRpb24gaXQgYmVmb3JlLiBNeSBh
cG9sb2dpZXMsCkkndmUgYmVlbiBhIGJpdCBzbGVlcCBkZXByaXZlZCBsYXRlbHkgXl9eCgo+IE1h
eWJlIGl0IHdvdWxkIGJlIGJldHRlciB1c2luZyBhdCBsZWFzdCB2ZXJzaW9uIDIwMjMuMDQgb3Ro
ZXJ3aXNlIGV2ZW4KPiBpZiBpdCBidWlsZHMgYW5kIHdvcmtzIG9uIHRoZSBib2FyZCB3ZSdyZSBu
b3Qgc3VyZSBpdCB3b3JrcyBvbiBtYXN0ZXIKPiBicmFuY2guCj4gQnkgdGhlIHdheSBvbiBtYXN0
ZXIgYnJhbmNoIHRoZSBlcnJvciBpcyB0aGUgc2FtZSBhbmQgaXQncyBkdWUgdG8gbGliZXBveHku
CgpUaGVyZSBhcmUgc29tZSB3YXJuaW5ncyByZWxhdGVkIHRvIHByZXByb2Nlc3NvciBtYWNyb3Mg
cmVkZWZpbmVkIGJ5IHRoZQpoZWFkZXJzIGluY2x1ZGVkIGFzIHBhcnQgb2YgbGliZXBveHksIGJ1
dCB0aG9zZSBzaG91bGQgYmUgaGFybWxlc3MgYmVjYXVzZQp0aGV5IGFyZSBHTEVTIG1hY3JvcyB3
aXRoIHdlbGwta25vd24gdmFsdWVzIHRoYXQgYWxsIGltcGxlbWVudGF0aW9ucyBtdXN0CmRlZmlu
ZSB3aXRoIHRoZSBzYW1lIGNvbnN0YW50cy4KCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--gleqXW5NsN5aS70J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZFo8lAAKCRCRxVnb5MkS
OyXZAJ0X3qqFi5PfiKRi0W+Er7xsT+p15ACfebz93y44sfDnOHKc/nLOiGK8TUo=
=saFg
-----END PGP SIGNATURE-----

--gleqXW5NsN5aS70J--

--===============0093430552476280392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0093430552476280392==--
