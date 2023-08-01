Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38152C00528
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BC05600C7;
	Tue,  1 Aug 2023 21:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BC05600C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvcCXI94VNB8; Tue,  1 Aug 2023 21:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5507E60DFF;
	Tue,  1 Aug 2023 21:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5507E60DFF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 428551BF869
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E804980C3D
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E804980C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eg8wBU7IgS_b for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:09:23 +0000 (UTC)
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF31880D96
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF31880D96
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1bf0c4489feso1035497fac.0
 for <buildroot@buildroot.org>; Tue, 01 Aug 2023 14:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690924162; x=1691528962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Le/LpapWc6Y+kZDS5cFjU5xHuFxjPCgI1Gyv29/6YI=;
 b=UshkkHFsJyYgjX41so63A+qkJKEGtQx08mGo1SNfqzDH+X9rA53fUdZg+HeX1m/JvF
 A+B3ZDW5cCBp+AD7YuRR9W3e8r+k0r0SpflCrTuZQwMOgdlvYT3FhtDBWpOdFdiJmG04
 elzQTHBELWNQfiAJIA3uFlY8PDX5ucrjiAgl9lXLMeHgoNu71733KxGX8/+PrIdPDzp8
 wrers4DjA57UowZegK9gV/ZtBqs7SjUUup7ZsHK24DJTpWH3jQZxurWbtRyRAljV0uvN
 Nt/ZeidN5rwxl7CBhnLSBu/3dL7MEIUTba2rrH9ExcltiSKZ7aBs8rb55EhcO2pdIJjT
 eDFw==
X-Gm-Message-State: ABy/qLbIQ3Hx4zZ91TMpmq+6ZcQUcDSpyNgUftQcJy0mUDnELc8H1HLR
 Fl7LF7zCRi0Ydrjqh7s5jm1v/+do7FVM2hggEYk=
X-Google-Smtp-Source: APBJJlFHx06o1oNui7+oWXUY2ytAnmRjmpgYlQL6SxMkQg9F7D1Q8WeAkBYRyceC33j+mP0RrbbVslpg4omr/v3/4BU=
X-Received: by 2002:a05:6870:1608:b0:1bb:4c5f:6db0 with SMTP id
 b8-20020a056870160800b001bb4c5f6db0mr16447244oae.36.1690924162571; Tue, 01
 Aug 2023 14:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230731214559.99648-1-james.hilliard1@gmail.com>
 <20230801200154.GE421096@scaer>
In-Reply-To: <20230801200154.GE421096@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 1 Aug 2023 15:09:10 -0600
Message-ID: <CADvTj4r5Zv4t1RsAFBMRyKwTRYCJ2FWOC1nWwQjdrzvwD=q+tw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690924162; x=1691528962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Le/LpapWc6Y+kZDS5cFjU5xHuFxjPCgI1Gyv29/6YI=;
 b=aiKky8faWKhifW/dia7gjG2LpmH4S11v9IUltdUf+1CAGSMJvXqqAm7f10Ug4clDzP
 o83BFFhIN7zFgaDI/o7ks53h5qpTvoGUEFGfc8AsWutqTXQbkj5zTxraNeeQrGvFJ55m
 t1LiP4uyldU3jkjrMCyC85D4Bmzz/NbpE9yYEZ8oOFCO0p8clcsjDoX2mAFRVZoltp0+
 9NmOSgoTCRxRW9lKP+jZpHEs/M+C5bsqwgrEG1qU2J34rSqcW6J2Gz+Jt+zimW0TwYV0
 MJnYohl5+A5suO5PJD0bztz4ErO79+0atZ8WMyCr0wlNlYIWEEO+JgJ0Ikwqw/r15JCz
 X2xQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=aiKky8fa
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: select kdb
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBBdWcgMSwgMjAyMyBhdCAyOjAx4oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gSmFtZXMsIEFsbCwKPgo+IE9uIDIwMjMtMDctMzEg
MTU6NDUgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiA+IFdlIG5lZWQgdG8g
c2VsZWN0IEJSMl9QQUNLQUdFX0tCRCB3aGVuIGJ1aWxkaW5nIHN5c3RlbWQgd2l0aCB2Y29uc29s
ZS4KPiA+Cj4gPiBGaXhlczoKPiA+IHN5c3RlbWQtdmNvbnNvbGUtc2V0dXBbMTI5XTogL3Vzci9i
aW4vbG9hZGtleXMgZmFpbGVkIHdpdGggZXhpdCBzdGF0dXMgMS4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+
ID4gIHBhY2thZ2Uvc3lzdGVtZC9Db25maWcuaW4gfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kL0NvbmZp
Zy5pbiBiL3BhY2thZ2Uvc3lzdGVtZC9Db25maWcuaW4KPiA+IGluZGV4IGJlYTcxN2E0NTYuLmYz
ZTU2MWU2NjEgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluCj4gPiAr
KysgYi9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluCj4gPiBAQCAtNTYzLDYgKzU2Myw3IEBAIGNv
bmZpZyBCUjJfUEFDS0FHRV9TWVNURU1EX1VUTVAKPiA+ICBjb25maWcgQlIyX1BBQ0tBR0VfU1lT
VEVNRF9WQ09OU09MRQo+ID4gICAgICAgYm9vbCAiZW5hYmxlIHZjb25zb2xlIHRvb2wiCj4gPiAg
ICAgICBkZWZhdWx0IHkKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9LQkQKPgo+IFRoaXMg
aXMgdHJpdmlhbCB0byBleHBsYWluLCBpbmRlZWQsIGJ1dCB3aGF0IGlzIG5vdCB0cml2aWFsIHRv
IGV4cGxhbgo+IGJ1dCBtb3N0IGludGVyZXN0aW5nLCBhbmQgYXMgSSBkaWQgYXNrIGluIG15IHBy
ZXZpZXcgbWFpbCwgaXMgdG8gZXhwbGFpbgo+IHdoeToKPgo+ICAgLSBpbiBzeXN0ZW1kIDI1Miwg
bG9hZGtleXMgd2FzIGFscmVhZHkgbmVlZGVkIGFuZCBjYWxsZWQgZnJvbQo+ICAgICBzeXN0ZW1k
LXZjb25zb2xlLXNldHVwIChjaGVjayB0aGUgY29kZSwgaXQgd2FzIGFscmVhZHkgdGhlcmUgaW4g
MjUyCj4gICAgIGFuZCBtb3N0IHByb2JhYmx5IGV2ZW4gbG9uZyBiZWZvcmUgdGhhdC4uLikKPgo+
ICAgLSB3aXRoIHN5c3RlbWQgMjUyLCBvdXIgdGVzdCBjYXNlcyB3ZXJlIG5vdCBmYWlsaW5nLCBl
dmVuIHRob3VnaAo+ICAgICBsb2Fka2V5cyB3YXMgbmVlZGVkCj4KPiAgIC0gd2l0aCBzeXN0ZW1k
IDI1NCwgdGhlIHNhbWUgdGVzdCBjYXNlIG5vdyBmYWlscy4KPgo+IFRoaXMgd2UgbmVlZCB0byB1
bmRlcnN0YW5kLgoKWWVhaCwgSSB0cmllZCB0byBmaWd1cmUgdGhhdCBvdXQsIGJ1dCBJIGNvdWxk
bid0IGZpbmQgYW55IHJlYXNvbiBmb3IKdGhlIHRlc3Qgbm90CmZhaWxpbmcgcHJldmlvdXNseS4K
Cj4KPiBUaGF0IHdheSwgd2Uga25vdyBpZiBvdXIgdGVzdCB3YXMgYnJva2VuLCBvciBpZiB0aGUg
bmV3IGRlcGVuZGVuY3kKPiBzaG91bGQgYmUgYmFja3BvcnRlZCB0byBwcmV2aW91cyBtYWludGVu
YW5jZSBicmFuY2hlcy4uLgo+Cj4gKGFuZCBub3cgSSBzZWUgdGhhdCBUaG9tYXMgaGFkIHRoZSBz
YW1lIHF1ZXN0aW9ucykuCj4KPiA+ICAgICAgIGhlbHAKPiA+ICAgICAgICAgc3lzdGVtZC12Y29u
c29sZS1zZXR1cCBpcyBhbiBlYXJseSBib290IHNlcnZpY2UgdGhhdAo+ID4gICAgICAgICBjb25m
aWd1cmVzIHRoZSB2aXJ0dWFsIGNvbnNvbGUgZm9udCBhbmQgY29uc29sZSBrZXltYXAuCj4gPiAt
LQo+ID4gMi4zNC4xCj4gPgo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlh
bm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVy
aWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwg
LyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
