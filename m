Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F50C606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 04:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FnW0FrRh
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13A9880F92;
	Wed, 21 Oct 2026 04:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDkxzLNPVjRe; Wed, 21 Oct 2026 04:13:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 07FF480FFD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792555991;
	b=Gb5XzVrxnYqNxIMg7QGPf2UgHKhIPIu9LZaKyxXiu/edkVEgbwaaAI/gu3U8N4IMMZHD
	 xOeorzS7bOfmp8IsAl1TU4+cmnwyf7szEDKgrJrL86+3lzFW/MOTEzPHV8Pf8GLcXul0q
	 lj5ss9t4iczZD/aRCMEtQGztdsu2avIevtiTjDXXfFv3alQpQIKSY/AocA9YOdg11NXvE
	 NDy/KJeJTtPeDB8dPmDr7We0ABNj5yGmqDn5aiNJviEECkXChyBJscuIEthRgL2WbT3JO
	 rMO39h9fcr5GnI24CPHs6T8U+tJFWYfmobhO3esJDK4H/HQQjRUVoHmurGFZ8gfck+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792555991;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:User-Agent:Date:Message-ID:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Zvb3iXmh12xL16/RRTI/av7EbmCSnNMsZJVQvyiqCY0=;
	b=hhQXjG6IGJmoLkETAKDPPJaCD5BfIG5+qXUK/PvbDVUB5vBm0kFa78RZPWwrPoApW6AS
	 dWwrL/MN8zU8q2h6KAtdtt4M0eoVLOkMVhm8Ea6BvE7kIeXgd+y18UcJlOuIpiEDbv42X
	 iYKw8DEDjICN2tQZolb0sNt1F0+bqXXn0hDubFOAsuTVECLJvRIsXd8OV76QXAcvcLUKw
	 cX2eIc+tHPligb7cSg/0Og0yQXMSZH141yzPHJfPGLUc3pftpH9b5EuMsiaAVtq6Ifii8
	 f0PZ0M6Zs23mdJ74RAcqgRu7Ni4uj/K8+yZzu3AmBIwH07UbHhjVpDmLyujw9vv8NtQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792555991;
	bh=Zvb3iXmh12xL16/RRTI/av7EbmCSnNMsZJVQvyiqCY0=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FnW0FrRhmhsOaqdzI7jBwUK9muGsvmWOwWOEQseQQocFRHqCbhpBwLFaGHwd9WP/f
	 O3x9AqO+KJ9+kHMOtmEmPDNYKP8ngPVQdPL8siF3TUQJar2dn4rId+Tc1zdVgZlRa7
	 VLvk72g7HtwDReqWpjOtFqdZLAiaO7MszJqZCImzJwKmkfQle8RfXbhPVdImmcSLpI
	 feiuf4wDc9NYJ2G+AcFk+bJP7GaEPpoEOhU96mtd6iy5i4q16oB8CuRovTo0JZ2c0H
	 hZm4hNIlviiF1eEgdhK+0b6jLvnCFbt4+16wB2pb1o73iS2eAaadjZzGckGCqqh/ST
	 vBrl9Ogi2XMaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07FF480FFD;
	Wed, 21 Oct 2026 04:13:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 279022A8
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 04:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D73260755
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 04:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qntycBjxKolK for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 04:13:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2331C6074D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792555988;
 b=Hv6A7N8JiaCiIsVjo1Nz21AhgBya7PqDKLoHrLn+ImctWH/DOwM8O1qilBIHDMlQkQA3
 QI7qJcT9bTUvGbKK5nxpukf8SMYHUoo4Q6r4xsbVRLmAXzX9Ie/Ya+pf1zsdfCAp/yWTk
 VhmV1kDHaXdJRo7zuArRT+jJl3t/4ZIcewwMA0e320C4+Y0XsreZ7xoen/XFEk37Bn3vL
 zWdn50BbZ2qJHWYK7LjvzM0VEtwGxMbHtUqxOSb7nRUQI47pOMra9ZTBaByyzZtEkPtd0
 bC8bLZert1mFcRiMieSifRfN0pL2daNIh/+9rWus8ugeUAfh2PqQUMpDpZZ8FqS3eHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792555988;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=ulHrxhj5vXNQ+pThZ3odiAgA1qMJoidLIjXSvxhA1bo=;
 b=NQgTw+diX0rvmBJiYnm47oOxJCaHm0eESHyQNncS8u2sjcdMSwRBsecV6QZqENo35isZ
 tGWeMUt9sYPTylP/4MerOiYqjK8ksPTaX4kEa+gCtUeVFptsLVEZbvgWweON4WR/TMq+z
 x8eGPOuPWKnG0nXePaq1BmIoeZi4pbcIEGoHLQ5FqdSzvzCAUOJ6WjI5Q2ysunBJy9ILd
 aavM0fCFtnhiHnJgCYfKF+gtX8Ih7xDPkIjoyOKHAxB2cBTREQ1NHGIvuScrgJ30mUO++
 qvhlQ/hUa/ZbNr/cfvoBkSUdt0rzpMEZ1cLC1VuH/H/ac5hpt3tThzF3tn1sqSlciUA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=tkos.co.il;
 dkim=pass header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b="BMH2/uiL"; 
 arc=none smtp.remote-ip=84.110.109.230
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (unknown [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2331C6074D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 04:13:07 +0000 (UTC)
Received: from localhost (unknown [10.0.8.4])
 by mail.tkos.co.il (Postfix) with ESMTP id D2569440513;
 Wed, 21 Oct 2026 07:11:41 +0300 (IDT)
To: Martin Contamin <martin.contamin@murena.io>
Cc: buildroot@buildroot.org
In-Reply-To: <9993a016-508d-49a8-977d-f5e712c12a6d@murena.io> (Martin
 Contamin's message of "Tue, 20 Oct 2026 10:13:49 +0200")
References: <20261019180050.1175211-1-martin.contamin@murena.io>
 <20261019180050.1175211-2-martin.contamin@murena.io>
 <877bjdk0g1.fsf@tarshish>
 <9993a016-508d-49a8-977d-f5e712c12a6d@murena.io>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Wed, 21 Oct 2026 07:13:03 +0300
Message-ID: <87v76vitdc.fsf@tarshish>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/libtool: make v2.6 patch apply
 to libtool 2.6.0 ltmain.sh
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFydGluLAoKUGxlYXNlIGtlZXAgdGhlIGJ1aWxkcm9vdCBsaXN0IG9uIENjLgoKT24gVHVl
LCBPY3QgMjAgMjAyNiwgTWFydGluIENvbnRhbWluIHdyb3RlOgo+IFRoYW5rcyBmb3IgdGhlIHBv
aW50ZXIuIFRoZSBwZXItdmVyc2lvbiBzcGxpdCBpcyBpbmRlZWQgY2xlYW5lciB0aGFuCj4gbXkg
c2luZ2xlIHZlcnNpb24tYWdub3N0aWMgcGF0Y2gsIHNvIEknbSBoYXBweSB0byBkcm9wIG1pbmUg
aW4gZmF2b3IKPiBvZiBoaXMuCj4KPiBTZWUgeW91IG9uIG15IG5leHQgY29udHJpYnV0aW9uISAK
ClRoYW5rcyBmb3IgeW91ciBjb250cmlidXRpb24uCgpJdCB3b3VsZCBiZSBuaWNlIGlmIHlvdSBt
b2RpZnkgdGhlIHN0YXR1cyBvZiB5b3VyIHBhdGNoIGluIHBhdGNod29yayBhcwpkZXNjcmliZWQg
aW4gdGhlIEJ1aWxkcm9vdCBtYW51YWwgbmVhciB0aGUgZW5kIG9mIHNlY3Rpb24gMjIuNS40IChQ
YXRjaApyZXZpc2lvbiBjaGFuZ2Vsb2cpOgoKICBodHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxv
YWRzL21hbnVhbC9tYW51YWwuaHRtbCNzdWJtaXR0aW5nLXBhdGNoZXMKClRoYW5rcywKYmFydWNo
Cgo+IEJlc3QgcmVnYXJkcywgCj4KPiBNYXJ0aW4gQ29udGFtaW4KPgo+IExlIDE5LzEwLzIwMjYg
w6AgMjA6MzAsIEJhcnVjaCBTaWFjaCB2aWEgYnVpbGRyb290IGEgw6ljcml0IDoKPgo+ICBIaSBN
YXJ0aW4sCj4KPiBPbiBNb24sIE9jdCAxOSAyMDI2LCBNYXJ0aW4gQ29udGFtaW4gdmlhIGJ1aWxk
cm9vdCB3cm90ZToKPgo+ICBDb21taXQgNWRiYmEyNjE2ZiAoInBhY2thZ2UvcGtnLWF1dG90b29s
cy5tazogYWxzbyBoYW5kbGUgbGlidG9vbCAyLjYueCIpCj4gZW5hYmxlZCB0aGUgbGlidG9vbCAy
LjYgcGF0Y2ggZm9yIHBhY2thZ2VzIHNoaXBwaW5nIGFuIGx0bWFpbi5zaAo+IGdlbmVyYXRlZCB3
aXRoIGxpYnRvb2wgMi42LjAsIHN1Y2ggYXMgbGlibW9kYnVzIDMuMS4xMi4gQnV0IHRoaXMgcGF0
Y2gKPiB3YXMgd3JpdHRlbiBhZ2FpbnN0IGxpYnRvb2wgMi42LjIsIHdoZXJlIHRoZSAtc3RhdGlj
LWxpYnRvb2wtbGlicwo+IHBhdHRlcm4gd2FzIG1lcmdlZCB3aXRoIC0tc3RhdGljIGFuZCAtQnN0
YXRpYy4gSW4gbGlidG9vbCAyLjYuMCB0aGUKPiBjb3JyZXNwb25kaW5nIGNvbnRleHQgbGluZSBv
bmx5IHJlYWRzICItc3RhdGljLWxpYnRvb2wtbGlicykiLCBzbwo+IGh1bmsgIzQgZmFpbGVkIHRv
IGFwcGx5IGFuZCB0aGUgYnVpbGQgc3RvcHBlZCBhdCB0aGUgIlBhdGNoaW5nIGxpYnRvb2wiCj4g
c3RlcC4KPgo+IFJlbW92ZSB0aGUgY29udGV4dCBsaW5lcyBhcm91bmQgdGhpcyBkZWxldGlvbiBz
byB0aGUgaHVuayBvbmx5IHJlbGllcwo+IG9uIHRoZSBkZWxldGVkIGxpbmVzIHRoZW1zZWx2ZXMs
IHdoaWNoIGFyZSBpZGVudGljYWwgaW4gYm90aCB2ZXJzaW9uczsKPiB0aGUgcGF0Y2ggbm93IGFw
cGxpZXMgdG8gbHRtYWluLnNoIGZyb20gYm90aCBsaWJ0b29sIDIuNi4wIGFuZCAyLjYuMi4KPgo+
IEZpeGVzOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMTFmM2M0NjA0
MDdjODE2ZDk4MjlmMTAxZjBlZTU1ZTRiMDM5NjVjZC8KPgo+IFNpZ25lZC1vZmYtYnk6IE1hcnRp
biBDb250YW1pbiA8bWFydGluLmNvbnRhbWluQG11cmVuYS5pbz4KPgo+Cj4gWW91IG1pZ2h0IHdh
bnQgdG8gdGFrZSBhIGxvb2sgYXQgdGhlIHBhdGNoIFRob21hcyBzdWdnZXN0ZWQ6Cj4KPiBodHRw
czovL3BhdGNod29yay5idWlsZHJvb3Qub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjYx
MDExMDc0NjU4LjE4ODg1NjktMS10aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tLwo+Cj4gYmFy
dWNoCj4KPiAgLS0tCj4gIHN1cHBvcnQvbGlidG9vbC9idWlsZHJvb3QtbGlidG9vbC12Mi42LnBh
dGNoIHwgOCArLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDcgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9saWJ0b29sL2J1aWxkcm9vdC1saWJ0
b29sLXYyLjYucGF0Y2ggYi9zdXBwb3J0L2xpYnRvb2wvYnVpbGRyb290LWxpYnRvb2wtdjIuNi5w
YXRjaAo+IGluZGV4IGIzOTY4YjEyODkuLjA2MGFjYWFkNWQgMTAwNjQ0Cj4gLS0tIGEvc3VwcG9y
dC9saWJ0b29sL2J1aWxkcm9vdC1saWJ0b29sLXYyLjYucGF0Y2gKPiArKysgYi9zdXBwb3J0L2xp
YnRvb2wvYnVpbGRyb290LWxpYnRvb2wtdjIuNi5wYXRjaAo+IEBAIC00MiwxOSArNDIsMTMgQEAg
U2lnbmVkLW9mZi1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29t
Pgo+ICAgCSAgaWYgdGVzdCB5ZXMgPSAiJGJ1aWxkX2xpYnRvb2xfbGlicyIgJiYgdGVzdCAteiAi
JGxpbmtfc3RhdGljX2ZsYWciOyB0aGVuCj4gICAJICAgIGZ1bmNfd2FybmluZyAiY29tcGxldGUg
c3RhdGljIGxpbmtpbmcgaXMgaW1wb3NzaWJsZSBpbiB0aGlzIGNvbmZpZ3VyYXRpb24iCj4gICAJ
ICBmaQo+IC1AQCAtNzA3MiwxMiArNzA3Niw2IEBACj4gLSAJICBmaQo+IC0gCSAgcHJlZmVyX3N0
YXRpY19saWJzPXllcwo+IC0gCSAgOzsKPiArQEAgLTcwNzIsNiArNzA3NiwwIEBACj4gIC0JLXN0
YXRpYykKPiAgLQkgIGlmIHRlc3QgLXogIiRwaWNfZmxhZyIgJiYgdGVzdCAtbiAiJGxpbmtfc3Rh
dGljX2ZsYWciOyB0aGVuCj4gIC0JICAgIGRsb3Blbl9zZWxmPSRkbG9wZW5fc2VsZl9zdGF0aWMK
PiAgLQkgIGZpCj4gIC0JICBwcmVmZXJfc3RhdGljX2xpYnM9YnVpbHQKPiAgLQkgIDs7Cj4gLSAJ
LXN0YXRpYy1saWJ0b29sLWxpYnMgfCAtLXN0YXRpYyB8IC1Cc3RhdGljKQo+IC0gCSAgaWYgdGVz
dCAteiAiJHBpY19mbGFnIiAmJiB0ZXN0IC1uICIkbGlua19zdGF0aWNfZmxhZyI7IHRoZW4KPiAt
IAkgICAgZGxvcGVuX3NlbGY9JGRsb3Blbl9zZWxmX3N0YXRpYwo+ICBAQCAtNzM5Myw3ICs3Mzkx
LDggQEAKPiAgICAgICAgIHByZXZhcmc9JGFyZwoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfi4gLn4gICBUayBPcGVuIFN5c3RlbXMKPX0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1vb08tLVUtLU9v
by0tLS0tLS0tLS0tLXs9CiAgIC0gYmFydWNoQHRrb3MuY28uaWwgLSB0ZWw6ICs5NzIuNTIuMzY4
LjQ2NTYsIGh0dHA6Ly93d3cudGtvcy5jby5pbCAtCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
