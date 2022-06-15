Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A274C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 08:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F6A840BA1;
	Wed, 15 Jun 2022 08:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id boQljnF1_T44; Wed, 15 Jun 2022 08:34:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23F534018F;
	Wed, 15 Jun 2022 08:34:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B62EE1BF954
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 08:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5244416DC
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 08:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cxe8nDiQ6glS for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 08:34:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DB5E410B7
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 08:34:25 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 g9-20020a4adc89000000b0041bef879199so1957523oou.10
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 01:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oRznMtmt0ynXbZHD2jx6eKwwcz6cGMDuDNbajE1NiXI=;
 b=YvqyWKTEkOkEQvIU5RzqJtOlh3kewovp1zogc0cNs5uzCzitvroCpIyu6Kcs4mpzRB
 Zt9TIdUKuLzSBpL3nPEZ4HF87LyTy6IQebIM1G7zIHfle6HIlnMCkD01SVtpRjEWzmVL
 Dp/ovh1F3MTFMI874TZj9yR3aIq5RZNd2PYgGy32NwWTpwtdIKpfI1pFZIxNUne3AsDl
 Ahs/Zsg1akRw+LRP90vmF7bJk7m6OlDClJe/HXiug2iJWavf3PYFBpauCqq95rYPiOco
 Ahxpu7fpGEk7p3XMb2wr+4/ufGCDD1FwRkfOpls2x0Fs0E/U4i478vcGEPOPLMfbgTZY
 7iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oRznMtmt0ynXbZHD2jx6eKwwcz6cGMDuDNbajE1NiXI=;
 b=zZagC69DYmnG7H0CZzVFTozI5m3nxFTMh3B1ONrgZ053+zuZ3rZwYJBvVptGqCbi28
 OlOCl7LzcqyRS1bIO///kIEAisXH3pJRvOy6hT6oEz1AVim/ghcMAJiTOLkhkjZtH5sM
 7l0rZWLKc0/kLLru7BA6vCoEL/43fgGKgBGtymARlIBohtXE1lujRMt9C1zaIKPjYpDO
 j7sueYgpxZjpIYa5SWM0WXcYcx6K1GaP/4my2cRw1sPegnIRo+GS+lZAnWyRXP7dKP4L
 rVHw9J96D9cnyklDPgRCCKjDwJhEkiejVzEvcmIVVXtDDOopTYX7wFPYKf67AeiIRGLU
 ZMJA==
X-Gm-Message-State: AOAM532VpdcrlcARgNcRThnc9DY0bxdgSZSIEAC9hUHLH7X1KZGlw3qU
 R29JuecoJa9dIY8GHFAb9E6jxTpeAwZQwNtWtJs=
X-Google-Smtp-Source: ABdhPJzYZdpditoV+DrWJzaLWO778kcb6HmB7Mq7u1API7hXmOpoYbN7qJ27YGRQx7D5LqWdC6NC+scQ8HGuC4YX4rQ=
X-Received: by 2002:a4a:9d48:0:b0:41b:8abb:8987 with SMTP id
 f8-20020a4a9d48000000b0041b8abb8987mr3668757ook.0.1655282064385; Wed, 15 Jun
 2022 01:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220615074543.41437-1-dimi@tpm.dev>
 <20220615075028.41612-1-dimi@tpm.dev>
 <2c1f96f051686a661c0a6a1fbba07e40@tpm.dev>
In-Reply-To: <2c1f96f051686a661c0a6a1fbba07e40@tpm.dev>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 15 Jun 2022 10:34:13 +0200
Message-ID: <CAPi7W82YatKcPLD7+rHDKhzngo_=cMnSG7GjV8bCebCb7iz2Cw@mail.gmail.com>
To: Dimi Tomov <dimi@tpm.dev>
Subject: Re: [Buildroot] [PATCH v4 1/1] package/wolftpm: Add config options
 for TPM 2.0 extra capabilities
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGltaSwKCkxlIG1lci4gMTUganVpbiAyMDIyIMOgIDA5OjUzLCBEaW1pIFRvbW92IDxkaW1p
QHRwbS5kZXY+IGEgw6ljcml0IDoKPgo+IEhpIFRob21hcywKPgo+IFRoaXMgcGF0Y2ggYWRkcyBu
ZXcgcGFja2FnZSBvcHRpb25zIHRoYXQgZW5hYmxlIGV4dHJhIFRQTSAyLjAKPiBjYXBhYmlsaXRp
ZXMuCj4KPiBwczogUGxlYXNlIGV4Y3VzZSB0aGUgZXh0cmEgdmVyc2lvbnMsIGl0IHNlZW1zIEkg
YW0gc3RpbGwgc2xlZXB5IHRoaXMKPiBtb3JuaW5nLgo+Cj4gVGhhbmtzLAo+IERpbWkKPiAtLQo+
IEZvdW5kZXIgb2YgVFBNLmRldgo+Cj4gT24gMjAyMi0wNi0xNSAxMDo1MCBBTSwgRGltaSBUb21v
diB3cm90ZToKPiA+IEZyb206IERpbWl0YXIgVG9tb3YgPGRpbWlAdHBtLmRldj4KPiA+Cj4gPiBT
b21lIFRQTSAyLjAgY2hpcHMgb2ZmZXIgZXh0cmEgY2FwYWJpbGl0aWVzLiBUaGlzIHBhdGNoIGFk
ZHMgYWRkaXRpb25hbAo+ID4gY29uZmlndXJhdGlvbiBvcHRpb25zIHRvIHRoZSB3b2xmdHBtIHBh
Y2thZ2UsIHNvIHN1Y2ggY2FwYWJpbGl0aWVzIGNhbgo+ID4gYmUgYXZhaWxhYmxlIHRvIHRoZSB1
c2VyLiBGb3IgZXhhbXBsZSwgdGhlIFNUTWljcm9lbGVjdHJvbmljcyBTVDMzIGFuZAo+ID4gTnV2
b3RvbiBOUENUNzUwIGJvdGggb2ZmZXIgc2VjdXJlIEdQSU8uIER1ZSB0byBjaGlwIGRpZmZlcmVu
Y2VzLAo+ID4gd29sZlRQTQo+ID4gcmVxdWlyZXMgZXhwbGljaXQgY29uZmlndXJhdGlvbiBvcHRp
b25zIHRvIGVuYWJsZSB0aGUgZXh0cmEKPiA+IGNhcGFiaWxpdGllcy4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBEaW1pdGFyIFRvbW92IDxkaW1pQHRwbS5kZXY+Cj4gPiAtLS0KPiA+IENoYW5nZXMg
djMgLT4gdjQ6Cj4gPiAtIEZpeCBjb21taXQgbWVzc2FnZS4gRm9yIHNvbWUgcmVhc29uIHRoZSB1
cGRhdGUgd2FzIG5vdCBpbmNsdWRlZCBpbgo+ID4gcGF0Y2ggdjMuCj4gPiBDaGFuZ2VzIHYyIC0+
IHYzOgo+ID4gLSBCZXR0ZXIgY29tbWl0IG1lc3NhZ2UKPiA+IENoYW5nZXMgdjEgLT4gdjI6Cj4g
PiAtIFJlbW92ZSBhIG5vdCBuZWVkZWQgcGFja2FnZSBkZXNjcmlwdGlvbiBjaGFuZ2UKCllvdSBz
aG91bGQgc2V0IHByZXZpb3VzIGl0ZXJhdGlvbnMgYXMgc3VwZXJzZWRlZCBpbiBwYXRjaHdvcms6
Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8KCj4g
PiAtLS0KPiA+ICBwYWNrYWdlL3dvbGZ0cG0vQ29uZmlnLmluICB8IDEyICsrKysrKysrKysrKwo+
ID4gIHBhY2thZ2Uvd29sZnRwbS93b2xmdHBtLm1rIHwgMTIgKysrKysrKysrKysrCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2th
Z2Uvd29sZnRwbS9Db25maWcuaW4gYi9wYWNrYWdlL3dvbGZ0cG0vQ29uZmlnLmluCj4gPiBpbmRl
eCAwYjk2NGMzZDdlLi4zMDI3YjdlMzNkIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS93b2xmdHBt
L0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS93b2xmdHBtL0NvbmZpZy5pbgo+ID4gQEAgLTIz
LDYgKzIzLDE4IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9XT0xGVFBNX1dPTEZDUllQVAo+ID4gICAg
ICAgICBlbmNyeXB0aW9uLiBEaXNhYmxpbmcgdGhpcyBvcHRpb24gaXMgbm90IHJlY29tbWVuZGVk
IGFzIGl0Cj4gPiAgICAgICAgIGNvdWxkIGNyZWF0ZSBhIHNlY3VyaXR5IGJyZWFjaCBpbiBtb3N0
IGVudmlyb25tZW50cy4KPiA+Cj4gPiArY29uZmlnIEJSMl9QQUNLQUdFX1dPTEZUUE1fU1QzMwo+
ID4gKyAgICAgYm9vbCAic3QzMyIKPiA+ICsgICAgIGRlZmF1bHQgbgo+ID4gKyAgICAgaGVscAo+
ID4gKyAgICAgICBFbmFibGUgc3VwcG9ydCBvZiBUUE0gMi4wIGV4dHJhIGZ1bmN0aW9uYWxpdHkg
b2ZmZXJlZCBieSB0aGUKPiA+IFNUTWljcm9lbGVjdHJvbmljcyBTVDMzIGNoaXAuCgpUaGlzIGxp
bmUgaXMgdG9vIGxvbmcgKGl0IHNob3VsZCBiZSB3cmFwcGVkIHRvIDcyIGNoYXJhY3RlcnMpLgpt
YWtlIGNoZWNrLXBhY2thZ2Ugd2lsbCB3YXJuIHlvdSBhYm91dCBpdAoKPiA+ICsKPiA+ICtjb25m
aWcgQlIyX1BBQ0tBR0VfV09MRlRQTV9OVVZPVE9OCj4gPiArICAgICBib29sICJucGN0NzUwIgo+
ID4gKyAgICAgZGVmYXVsdCBuCj4gPiArICAgICBoZWxwCj4gPiArICAgICAgIEVuYWJsZSBzdXBw
b3J0IG9mIFRQTSAyLjAgZXh0cmEgZnVuY3Rpb25hbGl0eSBvZmZlcmVkIGJ5IHRoZQo+ID4gTnV2
b3RvbiBOUENUNzUwIGNoaXAuCgpUaGlzIGxpbmUgaXMgYWxzbyB0b28gbG9uZy4KCj4gPiArCj4g
PiAgY29tbWVudCAid29sZkNyeXB0IGhvb2tzIG5lZWQgYSB0b29sY2hhaW4gdy8gdGhyZWFkcywg
ZHluYW1pYyBsaWJyYXJ5Igo+ID4gICAgICAgZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9IQVNf
VEhSRUFEUyB8fCBCUjJfU1RBVElDX0xJQlMKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93
b2xmdHBtL3dvbGZ0cG0ubWsgYi9wYWNrYWdlL3dvbGZ0cG0vd29sZnRwbS5tawo+ID4gaW5kZXgg
YTRhOWVkY2U4NS4uZDA0MjNjZDA2YiAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2Uvd29sZnRwbS93
b2xmdHBtLm1rCj4gPiArKysgYi9wYWNrYWdlL3dvbGZ0cG0vd29sZnRwbS5tawo+ID4gQEAgLTM1
LDQgKzM1LDE2IEBAIGVsc2UKPiA+ICBXT0xGVFBNX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtd29s
ZmNyeXB0Cj4gPiAgZW5kaWYKPiA+Cj4gPiAraWZlcSAoJChCUjJfUEFDS0FHRV9XT0xGVFBNX1NU
MzMpLHkpCj4gPiArV09MRlRQTV9DT05GX09QVFMgKz0gLS1lbmFibGUtc3QzMwo+ID4gK2Vsc2UK
PiA+ICtXT0xGVFBNX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtc3QzMwo+ID4gK2VuZGlmCj4gPiAr
Cj4gPiAraWZlcSAoJChCUjJfUEFDS0FHRV9XT0xGVFBNX05QQ1Q3NTApLHkpCj4gPiArV09MRlRQ
TV9DT05GX09QVFMgKz0gLS1lbmFibGUtbnV2b3Rvbgo+ID4gK2Vsc2UKPiA+ICtXT0xGVFBNX0NP
TkZfT1BUUyArPSAtLWRpc2FibGUtbnV2b3Rvbgo+ID4gK2VuZGlmCj4gPiArCj4gPiAgJChldmFs
ICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQoKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
