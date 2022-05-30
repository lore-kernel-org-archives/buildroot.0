Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C28C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 22:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C75D340C14;
	Mon, 30 May 2022 22:06:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nEcjBjzr-RR5; Mon, 30 May 2022 22:06:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D94CA40522;
	Mon, 30 May 2022 22:06:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4264A1BF3CD
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 22:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 236418411D
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 22:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOrYe6GsH6tO for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 22:06:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39958840A8
 for <buildroot@buildroot.org>; Mon, 30 May 2022 22:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7M2/Z8db0CZnAU+FFCnhbFw+5EHIP6Emk+ruWogYFzM=; b=qI78twBR8YRm14JHnjsil6qseD
 37S7PYLHJJDthNNiYJqVt0tZfHhLnue/7yuAuxqFzBOQ0hpUoTjoVmltDWWfjLY+qLOS1Xe/9bEPX
 3I4GnatUJKLp7PD6tJ+ifx15wwYlsK28vF+fcj6khVQojSaiDEKxNPveLQPTwLzkFt2a2Xi+XGbAD
 ADSYospaDo/RPerjW9Yh+C8nX1HfgP78etZJ1+kdSNZbKgKac2zY267quroDaEvCpoESwdvIcvvXC
 sayKd9/6GFEZFfjF1jWCqOaxDqwkJRD9Xx9qemkMRWJntkkEseOgvEKwUjuPCl8P1W0dDKGsWd8Nn
 DpnJ5gDw==;
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nvnWo-005zCi-IU; Tue, 31 May 2022 00:06:22 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id bdb3d51f;
 Mon, 30 May 2022 22:06:12 +0000 (UTC)
Date: Tue, 31 May 2022 01:06:07 +0300
Message-ID: <20220531010607.GD740429@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: =?UTF-8?B?RnJhbsOnb2lz?= Perrad <francois.perrad@gadz.org>
In-Reply-To: <20220519201219.GB3682468@momiji>
References: <20220518141927.554571-1-aperez@igalia.com>
 <CAB0FRssx+9pJoLhn8DB6LvKRLcZMnaHEyU+gA6q_K22kbBsNBg@mail.gmail.com>
 <20220519201219.GB3682468@momiji>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version
 2.36.2
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
Content-Type: multipart/mixed; boundary="===============4059608469097231058=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4059608469097231058==
Content-Type: multipart/signed; boundary="dS7q61NAThrId1hZ"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--dS7q61NAThrId1hZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8sIGFsbCwKCk9uIFRodSwgMTkgTWF5IDIwMjIgMjA6MTI6MTkgKzAzMDAgQWRyaWFuIFBl
cmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IHdyb3RlOgogCj4gT24gVGh1LCAxOSBN
YXkgMjAyMiAxODozMTozMCArMDIwMCBGcmFuw6dvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRA
Z2Fkei5vcmc+IHdyb3RlOgo+ID4gTGUgbWVyLiAxOCBtYWkgMjAyMiDDoCAxNjoxOSwgQWRyaWFu
IFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IGEKPiA+IMOpY3JpdCA6Cj4gPiAK
PiA+ID4gQnVnZml4IHJlbGVhc2UsIG1vc3RseSB3aXRoIGJ1aWxkIGZpeGVzLCBhbmQgYW4gaW1w
b3J0YW50IGZpeCBmb3IKPiA+ID4gd2hlbiB1c2luZyB0aHJlYWRlZCByZW5kZXJpbmcuIFJlbGVh
c2Ugbm90ZXM6Cj4gPiA+Cj4gPiA+ICAgaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2Uvd3Bl
d2Via2l0LTIuMzYuMi5odG1sCj4gPiA+Cj4gPiA+IFRoaXMgcmVsZWFzZSBmYWlscyB0byBidWls
ZCB3aGVuIFgxMSBoZWFkZXJzIGFyZSBub3QgcHJlc2VudCwgYnV0IHRoZXJlCj4gPiA+IGlzIGFs
cmVhZHkgYSBmaXggYWNjZXB0ZWQgdXBzdHJlYW0gYW5kIHNsYXRlZCBmb3IgaW5jbHVzaW9uIGlu
IHRoZSBuZXh0Cj4gPiA+IHJlbGVhc2UgaW4gdGhlIHNlcmllcywgc28gaW4gdGhlIG1lYW50aW1l
IGltcG9ydGVkIGl0IGxvY2FsbHkuCj4gPiA+Cj4gPiA+Cj4gPiB3ZWJraXRndGsgMi4zNi4xIChm
cm9tIEJSIDIwMjIuMDUtcmMxKSBoYXMgYWxzbyB0aGlzIGlzc3VlLgo+ID4gcGF0Y2ggZnJvbSBo
dHRwczovL2J1Z3Mud2Via2l0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjM5MDM5IHNvbHZlcyBpdC4K
PiAKPiBJIHdhcyBpbiB0aGUgbWlkZGxlIG9mIHByZXBhcmluZyB0aGUgMi4zNi4yIHVwZGF0ZSBm
b3Igd2Via2l0Z3RrLCB3aGljaAo+IHdvdWxkIGluY2x1ZGUgdGhpcyBwYXRjaCBhcyB3ZWxsOyBi
dXQgdGhlbiBJIGZvdW5kIGEgZGlmZmVyZW50IGJ1aWxkCj4gaXNzdWUuIFRoZW4gd2hpbGUgbG9v
a2luZyBpbnRvIGl0IEFwcGxlIHB1Ymxpc2hlZCBhIG5ldyBsaXN0IG9mIHNlY3VyaXR5Cj4gYnVn
cywgd2hpY2ggbWVhbnMgd2UgbmVlZCB0byBtYWtlIGEgbmV3ICh3aGljaCB3aWxsIGJlIDIuMzYu
MykgZm9yIGJvdGgKPiBwb3J0cyBpbmNsdWRpbmcgdGhlIGZpeGVzLi4uIHNvIEkgaGF2ZSBtZXJn
ZWQgdGhlIGJ1aWxkIGZpeCBmb3IgdGhlIFgxMQo+IGhlYWRlcnMgaW4gdGhlIHJlbGVhc2UgYnJh
bmNoIGFuZCB3ZSB3b24ndCBldmVuIG5lZWQgdG8gaW1wb3J0IHRoZSBwYXRjaAo+IGluIEJ1aWxk
cm9vdC4KPiAKPiBGV0lXOiBsZXQncyBub3QgbWVyZ2UgdGhlIDIuMzYuMiB1cGRhdGUgZm9yIHdw
ZXdlYmtpdCwgYmVjYXVzZSBpbiBhIGZldwo+IGRheXMgSSB3aWxsIHNlbmQgYW55d2F5IHBhdGNo
ZXMgdG8gZ28gZGlyZWN0bHkgdG8gMi4zNi4zCgpEb25lLCBoZXJlJ3MgdGhlIHVwZGF0ZXMgdG8g
Mi4zNi4zIGZvciBib3RoIHdwZXdlYmtpdCBhbmQgd2Via2l0Z3RrOgoKICBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNTMwMjE1NjI3LjE0
NDE3ODMtMS1hcGVyZXpAaWdhbGlhLmNvbS8KICBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNTMwMjIwMTQxLjE0NDU1NzgtMS1hcGVyZXpA
aWdhbGlhLmNvbS8KCkNoZWVycywK4oCUQWRyacOhbgo=

--dS7q61NAThrId1hZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYpU/zwAKCRCRxVnb5MkS
O0EjAJ40AeymBCGe5Oad1XTggaRY4RvM+wCffAUaYWJ5FwpKtR7+i9jU+gLc/Ms=
=13fG
-----END PGP SIGNATURE-----

--dS7q61NAThrId1hZ--

--===============4059608469097231058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4059608469097231058==--
