Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8E0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F3D840B74;
	Sat, 28 May 2022 19:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Mk-WhGAI1Vk; Sat, 28 May 2022 19:26:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29A4340B71;
	Sat, 28 May 2022 19:26:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4961BF867
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39980416C6
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SsmvTdEDXeCb for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:26:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0294D416A3
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:26:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7899CC0002;
 Sat, 28 May 2022 19:25:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nv24V-004Jmm-4K; Sat, 28 May 2022 21:25:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Joel Stanley <joel@jms.id.au>
References: <20220510022055.67582-1-joel@jms.id.au>
Date: Sat, 28 May 2022 21:25:59 +0200
In-Reply-To: <20220510022055.67582-1-joel@jms.id.au> (Joel Stanley's message
 of "Tue, 10 May 2022 11:50:55 +0930")
Message-ID: <87fskt8nnc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] linux: Fix powerpc64le defconfig selection
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
Cc: mpe@ellerman.id.au, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkpvZWwiID09IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+IHdyaXRlczoKCiA+
IFRoZSBkZWZhdWx0IGRlZmNvbmZpZyB0YXJnZXQgZm9yIHRoZSA2NCBiaXQgcG93ZXJwYyBrZXJu
ZWwgaXMKID4gcHBjNjRfZGVmY29uZmlnLCB0aGUgYmlnIGVuZGlhbiBjb25maWd1cmF0aW9uLgoK
ID4gV2hlbiBidWlsZGluZyBmb3IgcG93ZXJwYzY0bGUgdXNlcnMgd2FudCB0aGUgbGl0dGxlIGVu
ZGlhbiBrZXJuZWwgYXMKID4gdGhleSBjYW4ndCBib290IExFIHVzZXJzcGFjZSBvbiBhIEJFIGtl
cm5lbC4KCiA+IEZpeCB1cCB0aGUgZGVmY29uZmlnIHVzZWQgaW4gdGhpcyBjYXNlLiBUaGlzIHdp
bGwgYXZvaWQgdGhlIGZvbGxvd2luZwogPiBhdXRvYnVpbGRlciBmYWlsdXJlOgoKID4gIFZEU08z
MkEgYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvMzIvc2lndHJhbXAubwogPiAgY2MxOiBlcnJvcjog
4oCYLW0zMuKAmSBub3Qgc3VwcG9ydGVkIGluIHRoaXMgY29uZmlndXJhdGlvaW4KID4gIG1ha2Vb
NF06ICoqKiBbYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvMzIvTWFrZWZpbGU6NDk6CiA+IGFyY2gv
cG93ZXJwYy9rZXJuZWwvdmRzbzMyL3NpZ3RyYW1wLm9dIEVycm9yIDEKCiA+ICBodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9kZDc2ZDUzYmFiNTY0NzBjMGI4M2UyOTY4NzJk
N2JiOTBmOWU4Mjk2LwoKID4gTm90ZSB0aGF0IHRoZSBmYWlsdXJlIGluZGljYXRlcyB0aGUgdG9v
bGNoYWluIGlzIGNvbmZpZ3VyZWQgdG8gZGlzYWJsZQogPiB0aGUgMzIgYml0IHRhcmdldCwgY2F1
c2luZyB0aGUga2VybmVsIHRvIGZhaWwgd2hlbiBidWlsZGluZyB0aGUgMzIgYml0CiA+IFZEU08u
IFRoaXMgaXMgb25seSBhIHByb2JsZW0gb24gdGhlIEJFIGtlcm5lbCBhcyB0aGUgTEUga2VybmVs
IGRpc2FibGVzCiA+IENPTkZJR19DT01QQVQsIGFrYSAzMiBiaXQgdXNlcnNwYWNlIHN1cHBvcnQs
IGJ5IGRlZmF1bHQuCgogPiBTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlk
LmF1PgogPiAtLS0KID4gQWx0ZXJuYXRpdmVseSwgd2UgY291bGQgZGlzYWxvdyBCUjJfTElOVVhf
S0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklHCiA+IHdoZW4gQlIyX3Bvd2VycGM2NGxlPXku
CgpDb21taXR0ZWQgdG8gMjAyMi4wMi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2Fh
cmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
