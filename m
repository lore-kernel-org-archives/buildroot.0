Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1505C19F2C
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 20:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E5BB410A1;
	Wed,  3 Aug 2022 20:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E5BB410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EcocfVL1awbA; Wed,  3 Aug 2022 20:19:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAC5840331;
	Wed,  3 Aug 2022 20:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAC5840331
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FC2F1BF3CA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FCE440331
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FCE440331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLRY4-Vfk2aP for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 20:19:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D55B240275
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D55B240275
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 20:19:11 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20220803215825.30affd56@windsurf>
Date: Wed, 3 Aug 2022 22:19:06 +0200
Message-Id: <222B2DCF-D2D6-498D-85FE-51793DCD79B7@cutebit.org>
References: <A46AAF2E-D74E-4308-A9B3-3B18C3E1CD09@cutebit.org>
 <20220803215825.30affd56@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cutebit.org; s=mail; 
 t=1659557947; bh=f7StgMGNkku3sN4OJt/umOLwWqT+iKmq4/35F7a803k=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=pCrxsX6Oy04wu1Pg1NL6v8NlO6pfRffoJGRi+0GXaSpQr0PepTJFyL07vO+lGHuTH
 pdQx5Vdtfl09A1k5LYkeXM0KCbVC30ZuhoYbiXTR6p+yV3QIPP0SaLxu0opkaUkJfK
 kNZQGFI+ekgJ3q1/uKCHz/G5jOFJUxrmj3D37Txg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.a=rsa-sha256 header.s=mail header.b=pCrxsX6O
Subject: Re: [Buildroot] [PATCH 1/1 RESEND] package/python-construct: new
 package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gT24gMy4gOC4gMjAyMiwgYXQgMjE6NTgsIFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRh
enpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+IAo+IEhlbGxvIE1hcnRpbiwKCkhpIFRob21hcyEK
Cj4gCj4gT24gV2VkLCAzIEF1ZyAyMDIyIDE3OjQyOjQ4ICswMjAwCj4gTWFydGluIFBvdmnFoWVy
IDxwb3ZpaytsaW5AY3V0ZWJpdC5vcmc+IHdyb3RlOgo+IAo+PiBjb25zdHJ1Y3QgaXMgYSBQeXRo
b24gbGlicmFyeSBmb3IgZGVjbGFyYXRpdmUgc2VyaWFsaXphdGlvbi8KPj4gZGVzZXJpYWxpemF0
aW9uIG9mIHN0cnVjdHVyZWQgYmluYXJ5IGRhdGEuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJ0
aW4gUG92acWhZXIgPHBvdmlrK2xpbkBjdXRlYml0Lm9yZz4KPj4gLS0tCj4+IEkgZG9uJ3Qga25v
dyBpZiB5b3Ugc2V0IGEgYmFyIGZvciB0aGUgaW5jbHVzaW9uIG9mIHBhY2thZ2VzIGluCj4+IGJ1
aWxkcm9vdCwgYnV0IEkgdGhpbmsgYnkgaXRzIG5hdHVyZSBjb25zdHJ1Y3QgbWFrZXMgZm9yIGEg
dXNlZnVsCj4+IHBhY2thZ2Ugb24gZW1iZWRkZWQgc3lzdGVtcy4KPiAKPiBUaGFua3MgZm9yIHlv
dXIgY29udHJpYnV0aW9uISBJdCBsb29rZWQgZ29vZCwgYnV0IHRoZXJlIHdhcyBvbmUgaXNzdWU6
Cj4gdGhlIHBhdGNoIHdhcyBkYW1hZ2VkLCBwZXJoYXBzIGJlY2F1c2UgeW91IGRpZG4ndCBzZW5k
IGl0IHVzaW5nIGdpdAo+IHNlbmQtZW1haWw/CgpZZWFoLCBJIHNlbnQgZmlyc3QgZW1haWwgd2l0
aCBnaXQgc2VuZC1lbWFpbCwgZ290IGEgYm91bmNlIGJhY2sgYmVjYXVzZQpJIHdhc27igJl0IHN1
YnNjcmliZWQgdG8gdGhlIE1MLCB0aGVuIEkgdG9vayBteSBjaGFuY2VzIHJlc2VuZGluZyB1c2lu
Zwp0aGUgQXBwbGUgTWFpbCBjbGllbnQuIFVzZWZ1bCB0byBrbm93IHRoYXQgZG9lc27igJl0IHdv
cmsuCgo+IFNvIEkgZml4ZWQgdXAgdGhlIGRhbWFnZSwgYnV0IGFsc28gYWRkZWQgYSB0ZXN0IGlu
IG91ciBydW50aW1lIHRlc3QKPiBpbmZyYXN0cnVjdHVyZSBmb3IgdGhpcyBuZXcgcGFja2FnZS4g
VGhpcyBhbGxvd3MgdG8gdmVyaWZ5IHRoYXQgdGhlCj4gcGFja2FnZSB3b3JrcyBhdCBydW50aW1l
LCB3aGljaCBpcyBxdWl0ZSBpbXBvcnRhbnQgZm9yIFB5dGhvbiBtb2R1bGVzLgo+IAo+IFNlZToK
PiAKPiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fY29uc3RydWN0
LnB5Cj4gCj4gd2hpY2ggYnVpbGRzIGEgc2ltcGxlIEJ1aWxkcm9vdCBjb25maWd1cmF0aW9uIHdp
dGggcHl0aG9uLWNvbnN0cnVjdAo+IGVuYWJsZWQsIGJvb3RzIGl0IHVuZGVyIFFlbXUsIGFuZCBy
dW5zOgo+IAo+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2Nv
bnN0cnVjdC5weQo+IAo+IGluc2lkZSB0aGlzIGVudmlyb25tZW50LgoKQ29vbCEKCj4+ICtQWVRI
T05fQ09OU1RSVUNUX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9uLXNldHVwdG9vbHMtc2NtCj4g
Cj4gSSBhbHNvIGRyb3BwZWQgdGhpcyBkZXBlbmRlbmN5LCBiZWNhdXNlIEkgY291bGRuJ3Qgc2Vl
IGluIHNldHVwLnB5IHdoeQo+IHRoaXMgZGVwZW5kZW5jeSB3b3VsZCBiZSBuZWVkZWQsIGFuZCBh
IHRlc3QgYnVpbGQgd2l0aG91dCB0aGlzCj4gZGVwZW5kZW5jeSBzaG93ZWQgaXQgd2FzIHdvcmtp
bmcuIEhvcGVmdWxseSBJIHdhcyBub3Qgd3Jvbmcgb24gdGhpcyA6LSkKCk1vc3QgbGlrZWx5IHlv
dSBhcmUgbm90IHdyb25nLiBJIGNvcGllZCBpdCBmcm9tIGVsc2V3aGVyZSBhbmQgdGhvdWdodAp0
aGF0IG1lYW50IHNldHVwdG9vbHMgaW4gZ2VuZXJhbCwgYnV0IEkgZ3Vlc3MgdGhlIC1zY20gcG9z
dGZpeCBtYXR0ZXJzCmhlcmUuCgo+IFNlZSB0aGUgZmluYWwgY29tbWl0IGF0Ogo+IAo+ICBodHRw
czovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvYzA1Y2FhNzU1
NzIzNzM3ZTkxZmZkNTdlNzM2Mjk4Y2IxOWM5Yzg3Zgo+IAo+IEFnYWluLCB0aGFua3MgZm9yIHlv
dXIgY29udHJpYnV0aW9uIQoKVGhhbmtzIGZvciB0aGUgZmluYWwgdG91Y2hlcyBvbiBpdCEgTG9v
a2luZyBmb3J3YXJkIHRvIGhhdmluZyB0aGlzIGluCmJ1aWxkcm9vdCBvdXQtb2YtdGhlLWJveC4K
Cj4gCj4gVGhvbWFzCgpNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
