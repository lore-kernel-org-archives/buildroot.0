Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F7ACD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 13:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C3C841719;
	Wed,  3 Apr 2024 13:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxcYT5zPeIuo; Wed,  3 Apr 2024 13:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8216341723
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8216341723;
	Wed,  3 Apr 2024 13:16:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 054AC1BF982
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 13:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2B3F410E0
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 13:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BW1nnowBjv5r for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 13:15:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A9E7740330
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9E7740330
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9E7740330
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 13:15:57 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a4e62f3e63dso416710866b.0
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 06:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712150156; x=1712754956;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vu/oIn1d/GRw7ZSALOQKTk66snWI8fvsDJwjFH3AjCM=;
 b=FKwGS9Dl3nEEKYAiyIGIEloLyKYIFIKrCsxtCm5en/anRjwm2M54+Bz855MykOT+Qm
 0ryQRa7IQi+PLRNolWj+5RJJk2c0RNoILlTLpkySCIY7IsxD1EOVDjQu6sW5DlrkiIZL
 PRzO+T0jDeSWOi8YxKTWdx5PvrbpjlsxcFjkhl5GzukaE69w7MtEAmT4u/xT5MnHgg0X
 /x8z2mMndxd1p/5eGlPTaQZl5XLAQN+nAzoBpmiPaj5ZMG5KyC7SYHBeX2v42CB9yH0g
 Fzf1x2T5jZXnwFYn4Z0rCkrRAV+/1u11tmntdgFX2MaUYU45K7RLr03nVfyyd1m2K9/k
 qwxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIefGkTGVyslUBxABsi1720rpf6ezoiPJMxXXoglS2eOPV91Xb6xCkPre6SAqI9a6XEyHHYIysB/lb2KdAWllVD66Ir2v0yg==
X-Gm-Message-State: AOJu0YxDpEuJ7Wem0OQpP3TlGKHB7XQZW4AQ/cRfibhu/iW7DE61fGCq
 vgK8KvKSe+3dQqt1jjnLnu55Xlf5HfZ/hgzaGQhzuewhov6OgPeXwNjf8MlZAK14hTIHatt5Mgx
 EsWFKJ+FtzrycYSCfrMI1CntkehjKkRdM5odBrA==
X-Google-Smtp-Source: AGHT+IHnGkQkS9LHkB7DMBCaAaC1NqLeTVpAYAwTGP5wIgpHuK87ziAOSZqmV0XOLNXRw+eBsI6dgF6VxPQ1WHCYwjc=
X-Received: by 2002:a17:907:76f0:b0:a4e:757:989a with SMTP id
 kg16-20020a17090776f000b00a4e0757989amr9430116ejc.8.1712150156122; Wed, 03
 Apr 2024 06:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
 <20240330160244.3214733-7-dario.binacchi@amarulasolutions.com>
 <D0AICZ7BOW8A.2PLPZEPK1YG2E@kernel.org>
In-Reply-To: <D0AICZ7BOW8A.2PLPZEPK1YG2E@kernel.org>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 3 Apr 2024 15:15:45 +0200
Message-ID: <CAOf5uwnWwPdcLC8DRcd5qa_DGkGqXUbb8EO8CNcafi0RwNQhxg@mail.gmail.com>
To: Michael Walle <mwalle@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1712150156; x=1712754956;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vu/oIn1d/GRw7ZSALOQKTk66snWI8fvsDJwjFH3AjCM=;
 b=PtKPe4JN4lxSUk4ALvsezOxNGk1X6/zhKrqcEqY9di669K8SYCf38KBVlz0oRF6SDQ
 u1VNIw6pfUokR6WpvZw3Y/W9prTJMMkd9tuQdQh50bz1NCIHjTKs/2/Ctv7Hve3FD0Lm
 dk7ljNjlSbvpCj/U0OlyAbcAsvjlpe67atXuQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=PtKPe4JN
Subject: Re: [Buildroot] [PATCH v10 06/12] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, heiko.thiery@gmail.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . Morin" <yann.morin.1998@free.fr>,
 bryce@redpinelabs.com, Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWljaGFlbAoKT24gV2VkLCBBcHIgMywgMjAyNCBhdCAzOjA14oCvUE0gTWljaGFlbCBXYWxs
ZSA8bXdhbGxlQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gW3Jlc2VuZCBiZWNhdXNlIG1haWwgZ290
IGJvdW5jZWQgb24gdGhlIE1MLCBzb3JyeV0KPgo+IEhpIERhcmlvLAo+Cj4gT24gU2F0IE1hciAz
MCwgMjAyNCBhdCA1OjAyIFBNIENFVCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gPiBSZWNlbnQg
dmVyc2lvbnMgb2YgVS1Cb290IGFyZSBjYXBhYmxlIG9mIGJ1aWxkaW5nIHRpYm9vdDMuYmluIHVz
aW5nCj4gPiBCaW5tYW4uIEluIHRoaXMgY2FzZSwgbGV0J3MgY29weSBpdCB0byB0aGUgYmluYXJp
ZXMgZGlyZWN0b3J5Lgo+ID4KPiA+IFRoZSB1c2Ugb2YgYGZpbmQnIGNvbW1hbmQgaXMganVzdGlm
aWVkIGJ5IHRoZSBuZWVkIHRvIHVzZSBhIHJlZ2V4Cj4gPiBleHByZXNzaW9uIHRvIHNlbGVjdCB0
aGUgY29ycmVjdCBmaWxlLiBUaGlzIGlzIG5vdCBwb3NzaWJsZSB3aXRoIGEKPiA+IHNpbXBsZSBg
Y3AnIGNvbW1hbmQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlv
LmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4KPiA+IC0tLQo+ID4KPiA+IENoYW5n
ZXMgaW4gdjg6Cj4gPiAtIFVzZSB0aGUgYGZpbmQnIGNvbW1hbmQgaW4gcGlwZSB3aXRoIHRoZSBg
Y3AnIGNvbW1hbmQuCj4gPgo+ID4gQ2hhbmdlcyBpbiB2NjoKPiA+IC0gUmVwbGFjZSBgZmluZCcg
Y29tbWFuZCB3aXRoIGBjcCcgb25lLgo+ID4KPiA+IENoYW5nZXMgaW4gdjU6Cj4gPiAtIFJlcGxh
Y2UgdGlib290My0qLSQoVElfSzNfUjVfTE9BREVSX1NFQ1RZUEUpLSouYmluIHdpdGgKPiA+ICAg
dGlib290My0kKFRJX0szX1I1X0xPQURFUl9TT0MpLSQoVElfSzNfUjVfTE9BREVSX1NFQ1RZUEUp
LSouYmluCj4gPgo+ID4gQWRkZWQgaW4gdjQKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBC
aW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiAtLS0KPiA+
ICBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsgfCA0ICsrKysKPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Jvb3Qv
dGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayBiL2Jvb3QvdGktazMtcjUtbG9hZGVy
L3RpLWszLXI1LWxvYWRlci5tawo+ID4gaW5kZXggZmRiMDU4ZjNiNzJhLi45YTA1ZDAwNTA2N2Eg
MTAwNjQ0Cj4gPiAtLS0gYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsK
PiA+ICsrKyBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+ID4gQEAg
LTcwLDggKzcwLDEyIEBAIGRlZmluZSBUSV9LM19SNV9MT0FERVJfQlVJTERfQ01EUwo+ID4gICAg
ICAgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpICQoVElfSzNfUjVfTE9BREVSX01BS0UpIC1DICQo
QEQpICQoVElfSzNfUjVfTE9BREVSX01BS0VfT1BUUykKPiA+ICBlbmRlZgo+ID4KPiA+ICtUSV9L
M19SNV9MT0FERVJfU0VDVFlQRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9USV9LM19T
RUNUWVBFKSkKPiA+ICtUSV9LM19SNV9MT0FERVJfU09DID0gJChjYWxsIHFzdHJpcCwkKEJSMl9Q
QUNLQUdFX1RJX0szX1NPQykpCj4gPiArCj4gPiAgZGVmaW5lIFRJX0szX1I1X0xPQURFUl9JTlNU
QUxMX0lNQUdFU19DTURTCj4gPiAgICAgICBjcCAkKEBEKS9zcGwvdS1ib290LXNwbC5iaW4gJChC
SU5BUklFU19ESVIpL3I1LXUtYm9vdC1zcGwuYmluCj4gPiArICAgICBjZCAkKEBEKTsgZmluZCAu
LyAtdHlwZSBmIC1yZWdleCAiXC5cL3RpYm9vdDMtJChUSV9LM19SNV9MT0FERVJfU09DKS0kKFRJ
X0szX1I1X0xPQURFUl9TRUNUWVBFKS1bXi1dKi4uYmluIiAtZXhlYyBjcCB7fSAkKEJJTkFSSUVT
X0RJUikvdGlib290My5iaW4gXDsKPgo+IFRoZSBmaWxlbmFtZSBzaG91bGQgKm5vdCogYmUgaGFy
ZGNvZGVkIHRvIGxvb2sgbGlrZQo+IDxzb2M+LTxzZWN0eXBlPi5iaW4uIFRoaXMgaXMganVzdCBh
biBhcnRpZmFjdCBob3cgVEkgaXMgbmFtaW5nIHRoZWlyCj4gZmlsZXMgaW4gKnRoZWlyKiB1LWJv
b3QgYmlubWFuIGZpbGVzLiBJbnN0ZWFkIHRoaXMgc2hvdWxkIGp1c3QgYmUgYQo+IEtjb25maWcg
dmFyaWFibGUgKG1heWJlIEszX1I1X0xPQURFUl9GSUxFTkFNRT8pIHdoaWNoIGNhbiBiZSBzZXQg
YnkKPiB0aGUgdXNlci9ib2FyZCBjb25maWcgYW5kIHdoaWNoIGRlZmF1bHRzIHRvICJ0aWJvb3Qz
LmJpbiIuCj4gInRpYm9vdDMuYmluIiBpcyB0aGUgZmlsZW5hbWUgd2hpY2ggaXMgdXNlZCBieSB0
aGUgUk9NIGluIGZpbGVzeXN0ZW0KPiBib290IG1vZGUgYW5kIGZvciB3aGljaCB1LWJvb3QgaXMg
YWxyZWFkeSBjcmVhdGluZyBhIHN5bWxpbmsuCj4gU28gdGhpcyB3aWxsIHRoZW4ganVzdCBiZSBh
bm90aGVyIHNpbXBsZSAiY3AiLgo+Cj4gT24gYSBzaWRlIG5vZGUsIHdlIGFsc28gZm91bmQgb3V0
IHRoYXQgdGhlICJmaW5kIC4gLXJlZ2V4IiBpcyByYXRoZXIKPiBmcmFnaWxlIGluIHRoZSBzZW5z
ZSB0aGF0IGl0IG1pZ2h0IG5vdCBjb3B5IGFueXRoaW5nIGF0IGFsbCB3aXRob3V0Cj4gZ2VuZXJh
dGluZyBhbiBlcnJvci4KPgoKVGhlIGlkZWEgd2FzIHRvIG1lcmdlIHRoaXMgc2VyaWVzIGJhc2Vk
IG9uIHRoZSBzZXJpZXMgdG9waWMuIEkgd291bGQKbGlrZSB0byByZW1pbmQgeW91IHRoYXQKdGhl
IGNvZGUgaW4gYnVpbGRyb290IHdhcyBub3Qgd29ya2luZyBhbmQgd2Ugc2VudCBhIGZpcnN0IHNl
cmllcyBiYWNrCmluIE5vdmVtYmVyIHRoYXQgd2FzIHN1cHBvc2UKdG8gZml4IHNvbWV0aGluZyB0
aGF0IHdhcyAibWVyZ2VkIiBiZWZvcmUgYW5kIHVuZm9ydHVuYXRlbHkgYnJva2VuLgpXZSBsaWtl
IGFsbCB0aGUgc3VnZ2VzdGlvbnMgYW5kIHdlIHdvdWxkIG9mIGNvdXJzZSBsb3ZlCnRvIGltcHJv
dmUgdGhlIHNlcmllcyBidXQgaXQgd291bGQgYmUgbmljZSB0byBsaW1pdCB0aGUgc2VyaWVzIHRv
IHRoZQpzdWJqZWN0IGFuZCBub3QgY29udGludWUgdG8gYWRkIGEgbW9yZSBnZW5lcmFsaXN0IGFw
cHJvYWNoLgpUaGlzIGlzIGZyb20geW91IHRoZSBmaXJzdCBlbWFpbCBhbmQgdGhhbmsgeW91IGZv
ciBhZGRpbmcgeW91cgpjb250cmlidXRpb24gYW5kIHdlbGNvbWUgb24gYm9hcmQgdG9vLgpJIHRo
aW5rIHRoYXQgd2Ugc2hvdWxkIG5vdyB3YWl0IGZvciBWMTEKCk1pY2hhZWwKCgo+IC1taWNoYWVs
CgoKCi0tIApNaWNoYWVsIE5henphcmVubyBUcmltYXJjaGkKQ28tRm91bmRlciAmIENoaWVmIEV4
ZWN1dGl2ZSBPZmZpY2VyCk0uICszOSAzNDcgOTEzIDIxNzAKbWljaGFlbEBhbWFydWxhc29sdXRp
b25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgpBbWFydWxhIFNvbHV0
aW9ucyBCVgpKb29wIEdlZXNpbmt3ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MClQuICsz
MSAoMCk4NSAxMTEgOTE3MgppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCnd3dy5hbWFydWxhc29s
dXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
