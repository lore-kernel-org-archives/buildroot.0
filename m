Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB214CAC5B8
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 13:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8550941312;
	Mon,  6 Oct 2025 13:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Rq-6znFc1IB; Mon,  6 Oct 2025 13:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5E9A411D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5E9A411D0;
	Mon,  6 Oct 2025 13:19:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5682C272
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 13:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CBC46127F
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 13:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNwN1y94COAd for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 13:19:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0DFD961340
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DFD961340
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DFD961340
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 13:19:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id F23101A117F;
 Mon,  6 Oct 2025 13:19:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C7C26606B7;
 Mon,  6 Oct 2025 13:19:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C4DE6102F1CFB; 
 Mon,  6 Oct 2025 15:18:48 +0200 (CEST)
Date: Mon, 6 Oct 2025 15:18:47 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20251006151847.0cf9c6a0@kmaincent-XPS-13-7390>
In-Reply-To: <20250602164917.5f7d59a1@kmaincent-XPS-13-7390>
References: <20250528-fix_license_toolchain-v1-0-34295630709b@bootlin.com>
 <20250528-fix_license_toolchain-v1-3-34295630709b@bootlin.com>
 <20250528184617.1f4b9130@windsurf>
 <20250602164917.5f7d59a1@kmaincent-XPS-13-7390>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1759756741; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=f+xv1qucTgWaszhlkn4dKd1ZssRMZowq+HV582BE+XY=;
 b=zkzn9+KS6olIgrqWnFd6BLIMZOuXLX0WVHFX32krVaWoJZe5EkxFaXAVSUWrkj2xEE7d84
 7GYMnPCIP6JlkV56yZfymMQ4t0eXKc8buLQ5uecSefbX3bAPi9oKOBp+YHLXr5PiEJ77ub
 FP/Qe/u9mm2HxRhyifEIkFSS/B+vdmYTGyHJNwUdKsdrd+IKHquav12BPTZfOYirAU4WQ8
 bs1QyztfRsnqIfsdUmEZzp+318wEn3GRe3JvHD5FKVPCOPqn8FBVKuJUTIqtoNiVJkb1T7
 wEkvskmUPxFn9QjlK4OlwD2AyF30M5uvDHCBDRakpO/V1xpIOq+qH3Gd8piksQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zkzn9+KS
Subject: Re: [Buildroot] [PATCH 3/5] toolchain-external-linaro*: Add support
 for license file description
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAyIEp1biAyMDI1IDE2OjQ5OjE3ICswMjAwCktvcnkgTWFpbmNlbnQgPGtvcnkubWFp
bmNlbnRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBMZSBXZWQsIDI4IE1heSAyMDI1IDE4OjQ2OjE3
ICswMjAwLAo+IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+
IGEgw6ljcml0IDoKPiAKPiA+IE9uIFdlZCwgMjggTWF5IDIwMjUgMTY6NTg6MDAgKzAyMDAKPiA+
IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+IHdyb3RlOiAgCj4gCj4g
Li4uCj4gIAo+ID4gPiAyMzFhNGZmMmYzZGMwZjAxMDkxZjNjYTA3MjBkYmNmMTM3NDQ0MWE1Yzlm
YzgyYTQ5MDNkOGIwN2U4NWRkOGZhCj4gPiA+IHNoYXJlL2luZm8vbXBjLmluZm8gK3NoYTI1Ngo+
ID4gPiA5ZDEyNTYzOGZlMGNiMTdiOTg0MzRhZjllZDUyNjMwZmQ0NDM2NTNkODdhODhkMWU1YmU0
MmM5MmFiY2EzNTVmCj4gPiA+IHNoYXJlL2luZm8vbXBmci5pbmZvICtzaGEyNTYKPiA+ID4gODNh
MTEwZGNjMzYzMTM5YzY1MmVlZjBhNmQ4MDYxZTkxZGYzZDBlNTZlM2NiNDZiMTcyZWE2YzYxNjM4
MzY0ZQo+ID4gPiBzaGFyZS9pbmZvL3N0YWJzLmluZm8gICAgCj4gPiAKPiA+IEkgZ3Vlc3MgdGhv
c2UgaW5mbyBmaWxlcyBhcmUgdGhlIGZ1bGwgZG9jdW1lbnRhdGlvbiBvZiBnZGIsIGdjYywgYXMs
Cj4gPiBldGMuID8gVGhleSB3aWxsIGNoYW5nZSB2ZXJ5IG9mdGVuLCBjb21wbGV0ZWx5IHVucmVs
YXRlZCB0byB0aGUgbGljZW5zZQo+ID4gY2hhbmdlcywgbm8/ICAKPiAKPiBNYXliZSBidXQgdGhl
c2UgYXJlIHRoZSBvbmx5IGZpbGUgcmVsYXRlZCB0byBsaWNlbnNlcyBJIGhhdmUgZm91bmQgb24g
dGhlc2UKPiB0b29sY2hhaW5zLgoKV2hpY2ggb3RoZXIgTGljZW5zZSBmaWxlcyBzaG91bGQgSSB1
c2U/CiAKPiA+ID4gK1RPT0xDSEFJTl9FWFRFUk5BTF9MSU5BUk9fQUFSQ0g2NF9CRV9MSUNFTlNF
ID0gbXVsdGlwbGUgICAgCj4gPiAKPiA+IEknbSB3b25kZXJpbmcgaWYgc3RhdGluZyAibXVsdGlw
bGUiIHJlYWxseSBoZWxwcy4gU2hvdWxkbid0IHdlIGFjdHVhbGx5Cj4gPiBsaXN0IHRoZSBsaWNl
bnNlcz8KPiAKPiBZb3VyIGNhbGwsIGlmIHNvIEkgd2lsbCBkbyB0aGUgc2FtZSBmb3IgYWxsIGV4
dGVybmFsIHRvb2xjaGFpbnMuCgpBbnkgb3BpbmlvbiBvbiB0aGlzPwogCj4gPiBUaGUgY29uY2Vy
biBJIGhhdmUgaXMgdGhhdCBhIHRvb2xjaGFpbi1leHRlcm5hbCBwYWNrYWdlIGlzIHJlYWxseSBq
dXN0Cj4gPiBhIHRhcmdldCBwYWNrYWdlLCBzbyB3ZSBjYW4ndCBkaXN0aW5ndWlzaCBlYXNpbHkg
d2hhdCBnb2VzIG9uIHRoZQo+ID4gdGFyZ2V0IHZzLiB3aGF0IHN0YXlzIG9uIHRoZSBob3N0IGFu
ZCB0aGF0J3MgcXVpdGUgaW1wb3J0YW50Cj4gPiBsaWNlbnNlLXdpc2UuIFRoaXMgaXMgQlRXIHdo
eSB3ZSBpbnRyb2R1Y2VkIHRoZSBnY2MtcnVudGltZSBwYWNrYWdlCj4gPiB3aGVuIEJ1aWxkcm9v
dCBpcyBidWlsZGluZyB0aGUgdG9vbGNoYWluLCBpdCBhbGxvd3MgdG8gY2xhcmlmeSB0aGUKPiA+
IGxpY2Vuc2luZyBvZiBob3N0IHBhY2thZ2VzIChob3N0LWdjYywgaG9zdC1iaW51dGlscywgaG9z
dC1nZGIpIHZzLiB0aGUKPiA+IGxpY2Vuc2luZyBvZiB3aGF0IGdvZXMgaW50byB0aGUgdGFyZ2V0
IChnY2MtcnVudGltZSkuCj4gPiAKPiA+IFNob3VsZCB3ZSBtYWtlIGV4dGVybmFsIHRvb2xjaGFp
biBwYWNrYWdlcyBob3N0IHBhY2thZ2VzLCBhbmQgaGF2ZSBhCj4gPiBzaW5nbGUgdGFyZ2V0IHBh
Y2thZ2UgbGlrZSB0b29sY2hhaW4tZXh0ZXJuYWwtcnVudGltZSB0aGF0IHRha2VzIGNhcmUKPiA+
IG9mIGNvcHlpbmcgdGhpbmdzIG92ZXIgdG8gc3RhZ2luZy90YXJnZXQgPyAoQnV0IHRoZW4gaWYg
dGhlIGxpY2Vuc2luZwo+ID4gaXMgZGlmZmVyZW50IHBlciB0b29sY2hhaW4gdGhhdCdzIGFubm95
aW5nKS4gT3Igc2hvdWxkIGVhY2ggZXh0ZXJuYWwKPiA+IHRvb2xjaGFpbiBwYWNrYWdlIGJlIGJv
dGggYSB0YXJnZXQgYW5kIGEgaG9zdCBwYWNrYWdlID8KPiA+IAo+ID4gTWFueSBxdWVzdGlvbnMg
Zm9yIHdoaWNoIEkgZG9uJ3QgaGF2ZSBpbW1lZGlhdGUgYW5zd2VycyBJIG11c3QgYWRtaXQuICAK
PiAKPiBJIGRvbid0IHJlYWxseSBoYXZlIG9waW5pb24gb24gdGhpcywgdGhpcyBpcyBtb3JlIEJ1
aWxkcm9vdCBkZXNpZ24gcG9saWN5LiBJCj4gd2lsbCBsZXQgeW91LCBtYWludGFpbmVycywgZGVj
aWRlIHRoZSBpbnN0cnVjdGlvbnMuIAoKQW55b25lIGhhdmUgYW4gb3BpbmlvbnMgb24gdGhpcz8K
QXJub3V0IEkga25vdyB5b3UgYXJlIHRoZSB0b29sY2hhaW4gZXhwZXJ0LCB3aGF0IGRvIHlvdSB0
aGluaz8KClJlZ2FyZHMsCi0tIApLw7ZyeSBNYWluY2VudCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQga2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
