Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AB6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 09:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B243F824DC;
	Thu, 14 Apr 2022 09:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nk-1NF9DjjxG; Thu, 14 Apr 2022 09:59:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7C2C81DCA;
	Thu, 14 Apr 2022 09:59:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4721BF239
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 09:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3961360ACF
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 09:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glht7j21_9IH for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 09:59:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B8F660A82
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 09:59:50 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 i11-20020a9d4a8b000000b005cda3b9754aso3006246otf.12
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 02:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ic+acfmr06ddcOutEQkAt1xqCOnfLhLFOVcWK8thSFE=;
 b=n43IhNEYPuEwQPs5sT+JCjFs48mmmrdIiAeHsFRLZAb/Y4GdeMxS3myjQifl9RBVCo
 3ZxYEIdtrMMNq/YGb2AXoGL4SN1Brg/oci+hsV8JpMUXxbcU5lql0qae/EE0RT8FdFw7
 Y0bVR63ejCsuORu9TcN5vB9dKN9aAkU+XiWJo4+B0MNxxVe6hpJRSdKcjTijumMXvk3T
 isvEePn8eoPgwXDl3lIwOKeCHEo+Ze85GLghl8XFngfc/4syFnBEQQd4/UHmJeaa+V16
 meV05MLJKKG0QARJ6/DIkBSz6Ph7MoAVoxvmR1M9JDDw5sSc2dS7yx0dCAwXJMkX7SSt
 81/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ic+acfmr06ddcOutEQkAt1xqCOnfLhLFOVcWK8thSFE=;
 b=SAAWhcHiU6XIxV+OSUZCA1tA5eOZQHKOi4zBBBbbrXn6zrxR8yAYLsGMowx0jmuQKR
 /pfoWppGge6crNjkXgVgmh2FUx6QbWeTOd6CpPFv5/h9+FZp9cGSMtphmaUrb/QZhhpk
 C6/H99YL1q2/9Czmcd01XAIb4q741557hpNr/URYL0A2RgTzZB/re6yLpVkd6DXEWRwI
 Sgjz1vMQkkHDNePYpV94rLvVC7qfg1EatsMHK4jobRyU+9P8EG2WSn0h2AOwMAQzyW8A
 i1V+wl00P9YRM5X2NeFApeeLOlYCBVWdCp+CA2k5Vy6buE73TIHiaFilPweE00tUihqv
 iE9A==
X-Gm-Message-State: AOAM5339UtMj6Lic+N/pubAmJa7fiAbut0Y64Uc1v4ggPdoD4rJf5xxB
 casK3+UTcXmhpM3tAS9+NdV1Mfti9SId1BMt2tIlMXIs
X-Google-Smtp-Source: ABdhPJzULnP9LmnNIwuRQ2Q3mSfSvl6U98Tb5x3TMOOE+Pe6CcVEVorwhCWV1mUUUhCTCABCPS9Bd23aNADvhshtd24=
X-Received: by 2002:a9d:6a84:0:b0:5cd:ad64:a50 with SMTP id
 l4-20020a9d6a84000000b005cdad640a50mr646761otq.114.1649930389193; Thu, 14 Apr
 2022 02:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
 <8735ims60b.fsf@dell.be.48ers.dk>
 <d1a1ead3-98a8-35fe-4c4c-e7fd3f02e058@microchip.com>
 <CAPi7W81VbAArhoyDEJrNMeseVXgmJzu2+K39njx1j5y3_5mb5g@mail.gmail.com>
 <8735iifser.fsf@dell.be.48ers.dk>
 <34fddc8f-8710-65f9-330d-81fefe64354a@microchip.com>
 <87y20aeb04.fsf@dell.be.48ers.dk>
 <CAPi7W83dikm9d7KWjKfqYwr7mP3U4WzAzdw6iLF6gmOkTgwB-Q@mail.gmail.com>
 <8d53da79-2a90-8649-6f46-22b33b7bdbe5@microchip.com>
 <87bkx5crop.fsf@dell.be.48ers.dk>
 <d864ae21-b68f-b30b-ce07-cd66b473e4f9@microchip.com>
In-Reply-To: <d864ae21-b68f-b30b-ce07-cd66b473e4f9@microchip.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Apr 2022 11:59:37 +0200
Message-ID: <CAPi7W82XAg4jMw6z5LR=rg-HoZGBbfDC13XbpXtr0hppW92QEw@mail.gmail.com>
To: Eugen.Hristev@microchip.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRXVnZW4sCgpMZSBqZXUuIDE0IGF2ci4gMjAyMiDDoCAxMToxMCwgPEV1Z2VuLkhyaXN0
ZXZAbWljcm9jaGlwLmNvbT4gYSDDqWNyaXQgOgo+Cj4gT24gNC8xMy8yMiAxMToyOSBBTSwgUGV0
ZXIgS29yc2dhYXJkIHdyb3RlOgo+ID4+Pj4+PiAgICA8RXVnZW4uSHJpc3RldkBtaWNyb2NoaXAu
Y29tPiB3cml0ZXM6Cj4gPgo+ID4gICA+IE9uIDQvMTIvMjIgOToxNyBQTSwgRmFicmljZSBGb250
YWluZSB3cm90ZToKPiA+ICAgPj4gTGUgbWFyLiAxMiBhdnIuIDIwMjIgw6AgMTQ6MzQsIFBldGVy
IEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+ID4gICA+Pj4KPiA+
ICAgPj4+Pj4+Pj4gPEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbT4gd3JpdGVzOgo+ID4gICA+
Pj4KPiA+ICAgPj4+IEhpLAo+ID4gICA+Pj4KPiA+ICAgPj4+ID4+IFllYWguIEV1Z2VuLCBpcyB0
aGVyZSBhbnkgc3BlY2lmaWMgcmVhc29uIHdoeSB5b3UgdXNlIHRoZSBkaGNwIHBhY2thZ2UKPiA+
ICAgPj4+ID4+IG92ZXIgdGhlIG90aGVyIERIQ1AgY2xpZW50cyB3ZSBwcm92aWRlPwo+ID4gICA+
Pj4KPiA+ICAgPj4+ID4gSGlzdG9yaWNhbCByZWFzb25zLCBhbmQgdGhlIGZhY3QgdGhhdCBwZW9w
bGUgaGF2ZSB3b3JraW5nIGNvbmZpZ3VyYXRpb25zCj4gPiAgID4+PiA+IHVzaW5nIHRoaXMgcGFj
a2FnZS4uLiBJIHdhcyB1bmF3YXJlIHRoYXQgaXQgd2FzIGR1ZSB0byBiZSByZW1vdmVkLgo+ID4g
ICA+Pj4gPiBXZSB3aWxsIHRyeSB0byBzd2l0Y2ggdG8gYSBkaWZmZXJlbnQgcGFja2FnZSBpbiB0
aGUgZnV0dXJlLiBUaGFua3MgZm9yCj4gPiAgID4+PiA+IGxldHRpbmcgbWUga25vdy4KPiA+ICAg
Pj4+ID4gSG93ZXZlciwgaWYgdGhlIHBhY2thZ2UgaXMgc3RpbGwgaW4gdGhpcyBidWlsZHJvb3Qg
cmVsZWFzZSwgaXQgaGFzIHRvCj4gPiAgID4+PiA+IHdvcmsgcmlnaHQgPwo+ID4gICA+Pj4KPiA+
ICAgPj4+IFllcywgdGhhdCBpcyB0aGUgaWRlYS4gSWYgaXQgaXMgZGVhZCB1cHN0cmVhbSBhbmQg
aGFyZCB0byBmaXggdGhlbiB0aGF0Cj4gPiAgID4+PiBuYXR1cmFsbHkgbWFrZXMgaXQgaGFyZGVy
IHRvIGRvLCBidXQgdGhlIGludGVudGlvbiBpcyB0byBmaXggaXQuCj4gPiAgID4+Cj4gPiAgID4+
IFRoZSBmb2xsb3dpbmcgcGF0Y2ggc2hvdWxkIGZpeCB0aGUgaXNzdWU6Cj4gPiAgID4+IGh0dHBz
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjA0MTIx
ODE2MDcuMTQ1MTU4MC0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tLwo+ID4KPiA+ICAgPiBI
aSwKPiA+Cj4gPiAgID4geW91ciBwYXRjaCB0b2dldGhlciB3aXRoIHRoZSBvdGhlciBvbmUgKAo+
ID4gICA+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0
Y2gvRFUwUDI1MU1CMDc3OTdDQUFFODBDOTg1REM4OTc2MzM1RTNFNzlARFUwUDI1MU1CMDc3OS5F
VVJQMjUxLlBST0QuT1VUTE9PSy5DT00vCj4gPiAgID4gKSwKPiA+Cj4gPiAgID4gc29sdmUgdGhl
IGJ1aWxkIHByb2JsZW0gZm9yIHRoaXMgcGFja2FnZS4KPiA+Cj4gPiBUaGV5IGFyZSBub3cgYm90
aCBhZGRlZCB0byB0aGUgMjAyMi4wMi54IGJyYW5jaCwgdGhhbmtzLgo+ID4KPiA+IC0tCj4gPiBC
eWUsIFBldGVyIEtvcnNnYWFyZAo+ID4KPgo+IEhlbGxvIGFnYWluIEZhYnJpY2UsCj4KPiBBZnRl
ciBtYW5hZ2luZyB0byBzdWNjZXNzZnVsbHkgYnVpbGQgYWxsIG91ciBkZWZjb25maWdzIG5vdywg
d2hpbGUKPiB0ZXN0aW5nIG9uIGFub3RoZXIgYm9hcmQgKHNhbWE3ZzVlayksIEkgbm90aWNlZCB0
aGlzIG1lc3NhZ2UgYXQgYm9vdCBsb2cgOgo+Cj4gU3RhcnRpbmcgREhDUCBzZXJ2ZXI6IC91c3Iv
c2Jpbi9kaGNwZDogZXJyb3Igd2hpbGUgbG9hZGluZyBzaGFyZWQKPiBsaWJyYXJpZXM6IGxpYmly
cy5zby4xNjE6IGNhbm5vdCBvcGVuIHNoYXJlZCBvYmplY3QgZmlsZTogTm8gc3VjaCBmaWxlCj4g
b3IgZGlyZWN0b3J5Cj4KPiBEaWdnaW5nIHlpZWxkcyB0aGF0IGxpYmlycyBpcyBwYXJ0IG9mIGJp
bmQgcGFja2FnZS4gRG8geW91IGtub3cgd2h5IHRoaXMKPiBoYXBwZW5zIGFuZCB3aGF0IGNvdWxk
IGJlIHRoZSBjYXVzZT8gQ291bGQgbGF0ZXN0IHBhdGNoZXMgYWZmZWN0IHRoZSBkaGNwZCA/CgpJ
bmRlZWQsIHRoZSBpbnRlcm5hbCBiaW5kIGxpYnJhcmllcyAoaW5jbHVkaW5nIGxpYmlycy5zby4x
NjEpIGFyZQpjb3JyZWN0bHkgaW5zdGFsbGVkIGluIHN0YWdpbmcgZGlyZWN0b3J5IGJ1dCBub3Qg
aW4gdGhlIHRhcmdldApkaXJlY3RvcnkgYmVjYXVzZSBkaGNwLm1rIGlzIG92ZXJyaWRpbmcgREhD
UF9JTlNUQUxMX1RBUkdFVF9DTURTLgpJJ2xsIHNlbmQgYSBwYXRjaCBieSB0aGUgZW5kIG9mIHRo
ZSBkYXkuCgo+Cj4gVGhhbmtzICEKPiBFdWdlbgoKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
