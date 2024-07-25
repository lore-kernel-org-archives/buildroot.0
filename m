Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B12DC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 08:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D7E040012;
	Thu, 25 Jul 2024 08:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FX0c8_XzQXHE; Thu, 25 Jul 2024 08:10:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8A3B4025C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8A3B4025C;
	Thu, 25 Jul 2024 08:10:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78C501BF425
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 08:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7377E40750
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 08:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SS1UbKdO_kn for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 08:10:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D5E31406C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5E31406C8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5E31406C8
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 08:10:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C391FF80A;
 Thu, 25 Jul 2024 08:10:28 +0000 (UTC)
Date: Thu, 25 Jul 2024 10:10:27 +0200
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@gmail.com>
Message-ID: <20240725101027.77f7b4e4@windsurf>
In-Reply-To: <D2YGQXWLNLWG.2S6K4TCJ7EDN6@gmail.com>
References: <20240723212011.23048-1-gael.portay@rtone.fr>
 <20240723212011.23048-2-gael.portay@rtone.fr>
 <20240724182122.6a1f75ee@windsurf>
 <D2YGQXWLNLWG.2S6K4TCJ7EDN6@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721895029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+RcQnXxsY9OZslLhGSGfGHF/9QxKNXXCc0gc+Kai48=;
 b=I1SW1qQsbxulZZXhaN82qYsTERlL+my2Nd7SWGm3epPGRemqCbN6adbqcu8cZB4cmwrI4w
 R0APvn/cF6RWohaqaT3IOm0MIPB6wIjA7UIDKNPhiCWswgYGlZeXm2wOAy72blj5om/FqX
 K7LLIilokfySXlJi6gJzyH37yVoh7cPI5Wn90CAetHUmgPk5e6I5iSsDeF8+SXplp0xg1c
 iGWYc4BRRUDZnkRhD9IboennDiBNykdNiXTo3ZR9efVa2eY/mOyWdNggYS7zHP2giRWYVt
 NU/KvaLjQPlphuUGiE/E/vu6fiKWMQH16PbFMQiUa0OzxWkpx8PjOOj7xHojlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I1SW1qQs
Subject: Re: [Buildroot] [PATCH 1/2] package/rpi-utils: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>, Mahyar
 Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUaHUsIDI1IEp1bCAyMDI0IDEwOjA1OjU0ICswMjAwCkdhw6tsIFBPUlRBWSA8
Z2FlbC5wb3J0YXlAZ21haWwuY29tPiB3cm90ZToKCj4gVGhlIENNYWtlTGlzdHMudHh0IG9mIHRo
ZSBkdG1lcmdlIHV0aWxzIGNyZWF0ZXMgYW4gaW50ZXJuYWwgbGlicmFyeSBieQo+IGRvaW5nWzFd
Ogo+IAo+IAlhZGRfbGlicmFyeSAoZHRvdmwgJHtTVEFUSUN9IGR0b3ZlcmxheS5jKQo+IAo+IEFj
Y29yZGluZyB0byBvbmxpbmUgZG9jdW1lbnRhdGlvbiBvZiBjbWFrZVsyXToKPiAKPiAJYWRkX2xp
YnJhcnkoPG5hbWU+IFs8dHlwZT5dIFtFWENMVURFX0ZST01fQUxMXSA8c291cmNlcz4uLi4pCj4g
Cj4gCQlBZGQgYSBsaWJyYXJ5IHRhcmdldCBjYWxsZWQgPG5hbWU+IHRvIGJlIGJ1aWx0IGZyb20g
dGhlCj4gCQlzb3VyY2UgZmlsZXMgbGlzdGVkIGluIHRoZSBjb21tYW5kIGludm9jYXRpb24uCj4g
Cj4gCQlUaGUgb3B0aW9uYWwgPHR5cGU+IHNwZWNpZmllcyB0aGUgdHlwZSBvZiBsaWJyYXJ5IHRv
IGJlCj4gCQljcmVhdGVkOgo+IAo+IAkJCVNUQVRJQyBBbiBhcmNoaXZlIG9mIG9iamVjdCBmaWxl
cyBmb3IgdXNlIHdoZW4KPiAJCQkgICAgICAgbGlua2luZyBvdGhlciB0YXJnZXRzLgo+IAo+IAkJ
CVNIQVJFRCBBIGR5bmFtaWMgbGlicmFyeSB0aGF0IG1heSBiZSBsaW5rZWQgYnkKPiAJCQkgICAg
ICAgb3RoZXIgdGFyZ2V0cyBhbmQgbG9hZGVkIGF0IHJ1bnRpbWUuCj4gCj4gCQkJTU9EVUxFIEEg
cGx1Z2luIHRoYXQgbWF5IG5vdCBiZSBsaW5rZWQgYnkgb3RoZXIKPiAJCQkgICAgICAgdGFyZ2V0
cywgYnV0IG1heSBiZSBkeW5hbWljYWxseSBsb2FkZWQgYXQKPiAJCQkgICAgICAgcnVudGltZSB1
c2luZyBkbG9wZW4tbGlrZSBmdW5jdGlvbmFsaXR5Lgo+IAo+IAkJSWYgbm8gPHR5cGU+IGlzIGdp
dmVuIHRoZSBkZWZhdWx0IGlzIFNUQVRJQyBvciBTSEFSRUQKPiAJCWJhc2VkIG9uIHRoZSB2YWx1
ZSBvZiB0aGUgQlVJTERfU0hBUkVEX0xJQlMgdmFyaWFibGUuCj4gCj4gSW4gcnBpLXV0aWxzLCB0
aGUgb3B0aW9uYWwgdHlwZSBpcyBjb250cm9sbGVkIHRoYW5rcyB0byB0aGUgZW52aXJvbm1lbnQK
PiB2YXJpYWJsZSAke1NUQVRJQ307IGl0IGlzIHVuc2V0IGJ5IGRlZmF1bHQuIEl0IGlzIGV4cGVj
dGVkIGNtYWtlIGJ1aWxkcwo+IGEgU1RBVElDIGxpYnJhcnk7IGJ1dC4uLgo+IAo+IGNtYWtlIGNy
ZWF0ZXMgYSBTVEFUSUMgbGlicmFyeSBpZiBjb25maWd1cmluZyB0aGUgcHJvamVjdCBmb3IgbXkg
aG9zdAo+IHN5c3RlbSAoQXJjaCBMaW51eCkuCj4gCj4gQW5kLCBjbWFrZSBjcmVhdGVzIGEgU0hB
UkVEIGxpYnJhcnkgdGhyb3VnaCBidWlsZHJvb3QgKG1heWJlIGJlY2F1c2Ugb2YKPiBCVUlMRF9T
SEFSRURfTElCUz8pLgo+IAo+IFRoZSBmaWxlIENNYWtlTGlzdHMudHh0IGRvZXMgbm90IGluc3Rh
bGwgdGhlIHNoYXJlZCBsaWJyYXJ5LCBhbmQgaXQKPiByZXN1bHRzIGluIGEgcnVuLXRpbWUgaXNz
dWUgc2F5aW5nIHRoZSBsaWJyYXJ5IGxpYmR0b3ZsLnNvIGlzIG5vdCBmb3VuZC4KPiAKPiBTbywg
SSBoYXZlIGRlY2lkZWQgdG8gZW5zdXJlIHRoZSBsaWJyYXJ5IGlzIHN0YXRpY2FsbHkgYnVpbGQg
Ynkgc2V0dGluZwo+IHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZSBTVEFUSUMgdG8gU1RBVElDLgo+
IAo+IERvIHlvdSBwcmVmZXIgSSBpbnN0YWxsIHRoZSBzaGFyZWQgbGlicmFyeSBmcm9tIGFuIGlu
c3RhbGwgaG9vayBvcgo+IHdoYXRzb3Zlcj8KCk1laCwgdGhpcyBpcyByZWFsbHkgY3JhcHB5IHN0
dWZmIGZyb20gcnBpLXV0aWxzJ3MgQ01ha2VMaXN0cy50eHQuIEknZApzYXkga2VlcCB0aGUgLURT
VEFUSUM9U1RBVElDIGFzIHlvdSBoYWQsIGJ1dCB3aXRoIGEgY29tbWVudCBhYm92ZSB0aGF0CmV4
cGxhaW5zIHdoYXQncyBnb2luZyBvbi4KCj4gV2VsbCwgSSB3YW50ZWQgdG8gZ2l2ZSBhIHRyeSBi
ZWZvcmUgc2VuZGluZyB0aGUgcGFja2FnZSwgYnV0IHRoZQo+IHRvb2xjaGFpbiBhbGwgc2tpcHBl
ZC4KCldlbGwsIHlvdXIgcGF0Y2ggd2FzIG5vdCBpbmNsdWRpbmcgcGFja2FnZS9ycGktdXRpbHMv
Q29uZmlnLmluLCBzbyB0aGUKb3B0aW9uIEJSMl9QQUNLQUdFX1JQSV9VVElMUyBkb2VzIG5vdCBl
eGlzdC4gUGVyaGFwcyB3aHkgaXQgZ2V0cwpza2lwcGVkPwoKQmVzdCByZWdhcmRzLAoKVGhvbWFz
Ci0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxp
bi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
