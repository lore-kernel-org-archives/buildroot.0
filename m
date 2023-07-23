Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF79C001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 10:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9631541522;
	Sun, 23 Jul 2023 10:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9631541522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BuGCKu3K4ymW; Sun, 23 Jul 2023 10:30:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8716841505;
	Sun, 23 Jul 2023 10:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8716841505
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D232F1BF5EA
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA15741511
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA15741511
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hewC5EpOW1U3 for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 10:29:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1162E410D5
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 10:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1162E410D5
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB3FB40002;
 Sun, 23 Jul 2023 10:29:36 +0000 (UTC)
Date: Sun, 23 Jul 2023 12:29:34 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230723122934.1234822e@windsurf>
In-Reply-To: <20230715085130.103441-1-ju.o@free.fr>
References: <20230715085130.103441-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690108177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tw0tRhM+34vAxvEsa/MB/z65bEsSdanE9Q01y8UpVKw=;
 b=LAkiwxsXomrExDTxHb0Yd45FpI8z++v4Bn312+zOb68aAkGUMVAFtclfmHDonrVnYhopIb
 J6cglAwHHErumji/wT7Q7O3joFpTSqxwLCkVua79UUGue3xxZNmId8Oxm7INz0vEyiP/Yr
 UwneWkgnIsT7O0VCptMMWhDxiXDYVui0OQxuMV6WNO4yt6ZFVU1JHUZFPfXwuJWFN7Nlda
 cdUY4bRs0khCEUYwQANzgpaFX86iG4tiT2BoxcbCrs53pG+lPeqXh/w0sQ6K4TiC6biqZG
 fOnXNDF+7XVzCSfNrRN8hfLRaYYlCfbrm5HoAUF5xIzO87i+4dQdUzyN//xO/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LAkiwxsX
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_pixz.py: use test_compressor_base
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@laposte.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAxNSBKdWwgMjAyMyAxMDo1MTozMCArMDIwMApKdWxpZW4gT2xpdmFpbiA8anUub0Bm
cmVlLmZyPiB3cm90ZToKCj4gVGhlIHRlc3RfcGl4ei5weSB0ZXN0IHdhcyBpbml0aWFsbHkgd3Jp
dHRlbiBhcyBhIHN0YW5kYWxvbmUgdGVzdC4KPiAKPiBUaGUgY29tbWl0IGNmMTMyYTEzCj4gInN1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfY29tcHJlc3Nvcl9iYXNlLnB5OiBuZXcg
aGVscGVyIGNsYXNzIgo+IGludHJvZHVjZWQgYSBoZWxwZXIgY2xhc3MgZm9yIHRlc3RpbmcgZGF0
YSBjb21wcmVzc2lvbiBwcm9ncmFtcy4KPiAKPiBUaGlzIGNvbW1pdCByZXdyaXRlcyB0aGlzIHRl
c3QgdG8gdXNlIHRoaXMgaGVscGVyIGNsYXNzLgo+IAo+IFRoZSB0ZXN0IGNvdmVyYWdlIGlzIG1v
c3RseSB0aGUgc2FtZSBhcyBiZWZvcmUgdGhlIHJld3JpdGUuIE5vdGFibGUKPiBkaWZmZXJlbmNl
cyBhcmU6Cj4gLSB0aGUgdGVzdCBmaWxlIGlzIHNsaWdodGx5IHNtYWxsZXIgZm9yIGZhc3RlciB0
ZXN0aW5nLAo+IC0gaXRzIGNvbnRlbnQgbGF5b3V0IGFsc28gc2xpZ2h0bHkgZGlmZmVyZW50Lgo+
IAo+IENjOiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0Pgo+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gLS0tCj4gIHN1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcGl4ei5weSB8IDQ4ICsrKysrKy0tLS0tLS0t
LS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9u
cygtKQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6
em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcK
aHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
