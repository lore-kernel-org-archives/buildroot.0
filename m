Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC14AC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 09:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82122400FE;
	Mon, 12 Aug 2024 09:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FAsJmL0sxCHT; Mon, 12 Aug 2024 09:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F7E04014D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F7E04014D;
	Mon, 12 Aug 2024 09:51:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2B491BF27C
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C54EC81095
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVs-s_LsTC89 for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 09:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAD7381097
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAD7381097
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAD7381097
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 09:51:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F40261BF20B;
 Mon, 12 Aug 2024 09:51:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sdRiO-006u0d-2T;
 Mon, 12 Aug 2024 11:51:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240216211344.1807353-2-raphael.melotte@mind.be>
 <20240607163208.1445715-1-raphael.melotte@mind.be>
 <20240607163208.1445715-2-raphael.melotte@mind.be>
 <20240713223529.6d8961bd@windsurf>
Date: Mon, 12 Aug 2024 11:51:48 +0200
In-Reply-To: <20240713223529.6d8961bd@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 13 Jul 2024 22:35:29 +0200")
Message-ID: <878qx2kr0r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 2/5] support/testing: add new test for
 python-pymupdf
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
Cc: =?utf-8?Q?Rapha?= =?utf-8?Q?=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gSGVsbG8sCiA+IE9uIEZyaSwgIDcgSnVuIDIw
MjQgMTg6MzI6MDMgKzAyMDAKID4gUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCA8YnVp
bGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKID4+IFRvIGdpdmUgdXMgYSBjaGFuY2UgdG8g
Y2F0Y2ggcnVudGltZSBpc3N1ZXMgKHN1Y2ggYXMgbWlzc2luZwogPj4gZGVwZW5kZW5jaWVzKSBt
b3JlIGVhc2lseSwgYWRkIGEgdGVzdCB0aGF0IHdyaXRlcyBhIHNhbXBsZSBQREYgZmlsZSwKID4+
IHJlYWQgaXQgYmFjayBhbmQgdmVyaWZ5IHRoZSB0ZXh0IHRoYXQgd2FzIHJlYWQuCiA+PiAKID4+
IExpa2Ugc2ltaWxhciBwYWNrYWdlcyB0aGF0IGxlYWQgdG8gYSBiaWcKID4+IHJvb3RmcyAoZS5n
LiBweXRob24tYm90b2NvcmUpLCB0aGlzIHRlc3QgcmVxdWlyZXMgYSBzZXBhcmF0ZSBleHQyCiA+
PiByb290ZnMgdG8gYXZvaWQgZmlsbGluZyB0aGUgZGVmYXVsdCBhbW91bnQgb2YgUkFNIGF2YWls
YWJsZQogPj4gZW50aXJlbHkgKHdoaWNoIHdvdWxkIGNhdXNlIG1pc3NpbmcgZmlsZXMgZnJvbSB0
aGUgcm9vdCBmaWxlc3lzdGVtIGFuZAogPj4gaW4gdHVybiwgdGVzdCBmYWlsdXJlcykuCiA+PiAK
ID4+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWlu
ZC5iZT4KCiA+IFZlcnkgZ29vZCBpZGVhIHRvIGhhdmUgYSB0ZXN0IQoKCiA+PiArY2xhc3MgVGVz
dFB5dGhvblB5M1B5TXVQREYoVGVzdFB5dGhvblBhY2thZ2VCYXNlKToKID4+ICsgICAgX190ZXN0
X18gPSBUcnVlCiA+PiArICAgIGNvbmZpZyA9IFRlc3RQeXRob25QYWNrYWdlQmFzZS5jb25maWcg
KyBcCiA+PiArICAgICAgICAiIiIKID4+ICsgICAgICAgIEJSMl9QQUNLQUdFX1BZVEhPTjM9eQog
Pj4gKyAgICAgICAgQlIyX1BBQ0tBR0VfUFlUSE9OX1BZTVVQREY9eQogPj4gKyAgICAgICAgQlIy
X1BBQ0tBR0VfWE9SRzc9eQoKID4gSW4gZmFjdCB3YXMgbm90IG5lZWRlZC4KCiA+PiArICAgICAg
ICBCUjJfVVNFX1dDSEFSPXkKID4+ICsgICAgICAgIEJSMl9JTlNUQUxMX0xJQlNURENQUD15Cgog
PiBUaGVzZSB0d28gb3B0aW9ucyB3ZXJlIG5vdCByZWxldmFudCwgb3VyIFRlc3RQeXRob25QYWNr
YWdlQmFzZS5jb25maWcKID4gdXNlIGFuIGV4dGVybmFsIHRvb2xjaGFpbiBieSBkZWZhdWx0LgoK
ID4+ICsgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQogPj4gKyAgICAgICAgQlIyX1RB
UkdFVF9ST09URlNfRVhUMl9TSVpFPSIyNTBNIgoKID4gUmVkdWNlZCB0byAxMjBNLCB3aGljaCB3
YXMgZW5vdWdoIG5vdyB0aGF0IHdlIG5vIGxvbmdlciBoYXZlIFgub3JnLgoKID4gQXBwbGllZCB3
aXRoIHRob3NlIGNoYW5nZXMhCgpDb21taXR0ZWQgdG8gMjAyNC4wMi54IGFuZCAyMDI0LjA1Lngs
IHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
