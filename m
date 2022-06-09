Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C3DC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C4C41C61;
	Thu,  9 Jun 2022 20:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qrGOR1DF_bae; Thu,  9 Jun 2022 20:40:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCF8C41C32;
	Thu,  9 Jun 2022 20:40:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89B151BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7836084037
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SkgTkphYi7wF for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:40:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79A19826E7
 for <buildroot@busybox.net>; Thu,  9 Jun 2022 20:40:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 59DC41C0004;
 Thu,  9 Jun 2022 20:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654807236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eb4l10sDtjy/9ytRgt3wzTnHU7W2dWvRui8nAjsqsPw=;
 b=IhBZXM7jqo6umhku80R117Ekvja0wCfz+5tPt7GAYZkqXVzG2TYfypm3DYoVLIS6j6leMI
 On9dpfU0olT5fHcRuyBfBLijLliIuGVnJUyLxNGhbI9+mWRzDTzsQ3978uA8eU1c2xoHEr
 spTrHLlEk5bzIRyZeaz0lQCRmAb1zCA1XmaE0IFO9ORT0jCR6SxI25YtJzAwxEV7yGqm/r
 iU3Kx9IdmJ6+XxZ+aUooNk9KnVeHiOoJVEEKg9mC+BAv8viFA9QMV7Zos9aoCLhqDgo6GD
 QxxuYzbahiRjNFGTfm4YnCouKvLuRfLdIGCWLpwfC6cBkdFM1tmxTSCDhIORdQ==
Date: Thu, 9 Jun 2022 22:40:35 +0200
To: =?UTF-8?B?RnJhbsOnb2lz?= Perrad <fperrad@gmail.com>
Message-ID: <20220609224035.5b836454@windsurf>
In-Reply-To: <CAGhdn57DSZhXfA_MCam2h3SorNAVmxUnQivP2e6W2xwRDPvN2g@mail.gmail.com>
References: <CAGhdn57DSZhXfA_MCam2h3SorNAVmxUnQivP2e6W2xwRDPvN2g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gnutls: bump to version 3.7.6
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
Cc: buildroot <buildroot@busybox.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKSSBhbSBub3Qgc3VyZSB3aGF0IHlvdSBkaWQgd2l0aCB0aGlzIHJl
Y2VudCBzZXQgb2YgcGF0Y2hlcywgYnV0IHRoZXkKZ290IGFsbCBtYW5nbGVkIGJ5IHlvdXIgZS1t
YWlsIGNsaWVudCwgc28gdGhleSBhcmUgaW1wb3NzaWJsZSB0byBhcHBseS4KCkNvdWxkIHlvdSBo
YXZlIGEgbG9vaywgYW5kIHJlc2VuZCB0aGUgZ251dGxzLCBodG9wLCBpcHRhYmxlcywgbGliZ3Rr
MywKbHNvZiBhbmQgbmV0dGxlIHZlcnNpb24gYnVtcHMgd2l0aCAiZ2l0IHNlbmQtZW1haWwiLCBz
byB0aGF0IHRoZQpwYXRjaGVzIGFwcGVhciBjb3JyZWN0bHkgb24gdGhlIG1haWxpbmcgbGlzdD8K
ClRoYW5rcyBhIGxvdCEKClRob21hcwoKT24gV2VkLCA4IEp1biAyMDIyIDEyOjQ5OjQ3ICswMjAw
CkZyYW7Dp29pcyBQZXJyYWQgPGZwZXJyYWRAZ21haWwuY29tPiB3cm90ZToKCj4gU2lnbmVkLW9m
Zi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+Cj4gLS0tCj4g
IHBhY2thZ2UvZ251dGxzL2dudXRscy5oYXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvZ251dGxzL2du
dXRscy5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nbnV0bHMvZ251dGxzLmhhc2gg
Yi9wYWNrYWdlL2dudXRscy9nbnV0bHMuaGFzaAo+IGluZGV4IGMwOWU0NjY1ZS4uZmYxOTEyNzhj
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZ251dGxzL2dudXRscy5oYXNoCj4gKysrIGIvcGFja2Fn
ZS9nbnV0bHMvZ251dGxzLmhhc2gKPiBAQCAtMSw2ICsxLDYgQEAKPiAgIyBMb2NhbGx5IGNhbGN1
bGF0ZWQgYWZ0ZXIgY2hlY2tpbmcgcGdwIHNpZ25hdHVyZQo+IC0jIGh0dHBzOi8vd3d3LmdudXBn
Lm9yZy9mdHAvZ2NyeXB0L2dudXRscy92My43L2dudXRscy0zLjcuNC50YXIueHouc2lnCj4gLXNo
YTI1NiAgZTZhZGJlYmNmYmM5NTg2N2RlMDEwNjBkOTNjNzg5OTM4Y2Y4OWNjMWQxZjZlZjllZjY2
MTg5MGY2MjE3NDUxZgo+ICBnbnV0bHMtMy43LjQudGFyLnh6Cj4gKyMgaHR0cHM6Ly93d3cuZ251
cGcub3JnL2Z0cC9nY3J5cHQvZ251dGxzL3YzLjcvZ251dGxzLTMuNy42LnRhci54ei5zaWcKPiAr
c2hhMjU2ICA3NzA2NTcxOWEzNDViZmIxOGZhYTI1MDEzNGJlNGM1M2JlZjcwYzFiZDYxZjZjMGMy
M2NlYjhiNDRmMDI2MmZmCj4gIGdudXRscy0zLjcuNi50YXIueHoKPiAgIyBMb2NhbGx5IGNhbGN1
bGF0ZWQKPiAgc2hhMjU2ICBlNzllOWM4YTBjODVkNzM1ZmY5ODE4NTkxOGVjOTRlZDdkMTc1ZWZj
Mzc3MDEyNzg3YWViY2YzYjgwZjBkOTBiCj4gIGRvYy9DT1BZSU5HCj4gIHNoYTI1NiAgNjA5NWU5
ZmZhNzc3ZGQyMjgzOWY3ODAxYWE4NDViMzFjOWVkMDdmM2Q2YmY4YTI2ZGM1ZDJkZWM4Y2NjMGVm
Mwo+ICBkb2MvQ09QWUlORy5MRVNTRVIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nbnV0bHMvZ251
dGxzLm1rIGIvcGFja2FnZS9nbnV0bHMvZ251dGxzLm1rCj4gaW5kZXggZjdmM2UwNDZlLi5mMWFm
MWU3YjMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9nbnV0bHMvZ251dGxzLm1rCj4gKysrIGIvcGFj
a2FnZS9nbnV0bHMvZ251dGxzLm1rCj4gQEAgLTYsNyArNiw3IEBACj4gCj4gICMgV2hlbiBidW1w
aW5nLCBtYWtlIHN1cmUgKmFsbCogLS13aXRob3V0LWxpYmZvby1wcmVmaXggb3B0aW9ucyBhcmUg
aW4KPiBHTlVUTFNfQ09ORl9PUFRTCj4gIEdOVVRMU19WRVJTSU9OX01BSk9SID0gMy43Cj4gLUdO
VVRMU19WRVJTSU9OID0gJChHTlVUTFNfVkVSU0lPTl9NQUpPUikuNAo+ICtHTlVUTFNfVkVSU0lP
TiA9ICQoR05VVExTX1ZFUlNJT05fTUFKT1IpLjYKPiAgR05VVExTX1NPVVJDRSA9IGdudXRscy0k
KEdOVVRMU19WRVJTSU9OKS50YXIueHoKPiAgR05VVExTX1NJVEUgPQo+IGh0dHBzOi8vd3d3Lmdu
dXBnLm9yZy9mdHAvZ2NyeXB0L2dudXRscy92JChHTlVUTFNfVkVSU0lPTl9NQUpPUikKPiAgR05V
VExTX0xJQ0VOU0UgPSBMR1BMLTIuMSsgKGNvcmUgbGlicmFyeSkKCgoKLS0gClRob21hcyBQZXRh
enpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
