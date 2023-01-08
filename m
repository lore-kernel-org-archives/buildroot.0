Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E53C54EBC
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 23:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7EBE401CC;
	Sun,  8 Jan 2023 23:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7EBE401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWJf-DEfcQsh; Sun,  8 Jan 2023 23:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1C4E40111;
	Sun,  8 Jan 2023 23:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1C4E40111
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B1501BF3E5
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 23:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2503E408F2
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 23:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2503E408F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_SHpkxF5dAO for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 23:22:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E6EA4077D
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E6EA4077D
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 23:22:57 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id l14so1298523qvw.12
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 15:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hxP9oPV6owr+JZxZV1sPNsIoO4Dcf51U7Q1q2IhZ9ms=;
 b=L95pkljhSlRKFP1aFFQPrJeGDJzFRqUpVwLRlexTtTUC5Y4MWfUWgVdpZugmh4b6zd
 ULgyc723xykrurx730j+6lZLxJrZKg951mlSg4FXu10D0r3FuTEhua4PpDKlPgGnwcGM
 mzJmDNu4qwj1+FLfWLN54jOTAKaDwos2hkxD6rsDQwvRRav9Ohl0zOGgrgvfUmS+oVib
 vmW0wuDd8J/OcJvUlb44nenawiygA6EPUmXZncqw+sJHQ6Mdfx9fZmRlJe0Ev5F3ZviB
 +jzf9Q8f73QgWDYvmJxVHBQ0OTXnbS5XGiaRkl+7HLYDc1yWwAGB9zP5gKYgjc9dk6Ta
 1A8A==
X-Gm-Message-State: AFqh2ko5thXFvFdvbr3QxRbUjyU5kyZMk+XKSHaXdPY56O1ZwnLxOliu
 dNd7pfNlQ2pteVEB84AADY5ks0Wg3BXRVDkr148=
X-Google-Smtp-Source: AMrXdXusvKRW1/vX920jXnipRA9pRZ4caBLCort63mz1gzpiiPJM37K99eLy/c5F5ZnnK4eDqyhO8xwriHCYG72Qm9U=
X-Received: by 2002:a05:6214:37c4:b0:4bb:70e9:7372 with SMTP id
 nj4-20020a05621437c400b004bb70e97372mr2237045qvb.30.1673220176935; Sun, 08
 Jan 2023 15:22:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1672006091.git.yann.morin.1998@free.fr>
 <2f9e844a3580077442585e16a137eb5a9161121e.1672006091.git.yann.morin.1998@free.fr>
In-Reply-To: <2f9e844a3580077442585e16a137eb5a9161121e.1672006091.git.yann.morin.1998@free.fr>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 9 Jan 2023 00:22:46 +0100
Message-ID: <CADYdroMyvHUSu58zbQc7s64j7LTHtJh0zCWX_xSnZH=ayt59hQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hxP9oPV6owr+JZxZV1sPNsIoO4Dcf51U7Q1q2IhZ9ms=;
 b=l6tVcaJm3Opr/idNlnYk0Qa/VIueHUcKMp/7ZlHaciIS+as7EsXiKY/niNN7PleVwN
 hvUluCxVlpRbdZrER5QI3MB3+nSZnAiU+yDTsxJzWFZpJBC7p5wBPpF1oPl/eho7t8Rt
 gj7NqZvIRRkPTP0MskMP/mfUbeAzHuP2+I6AllUE9ad970LUBw5trLM4jf3wSi46CmbV
 9PefD0i3KujSKzezTy6cbhfd3hfitRGJkv0diACNsU8YHatub9DT0+KBwKCaiRpV6b/+
 /XlPynnDo/FqGLx267WdUnTfYaa9Fl9k3fRZvOcBHA2hcumSzs9fIvuuRk5yF8IFECMf
 oV+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l6tVcaJm
Subject: Re: [Buildroot] [PATCH 1/3 v4] system: introduce a choice for /var
 management
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
Cc: Romain Naour <romain.naour@smile.fr>,
 "Yann E. MORIN" <yann.morin@orange.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gU28uLCAyNS4gRGV6LiAyMDIyIHVtIDIzOjA4IFVociBzY2hyaWViIFlhbm4gRS4gTU9SSU4K
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPjoKPgo+IEZyb206ICJZYW5uIEUuIE1PUklOIiA8eWFu
bi5tb3JpbkBvcmFuZ2UuY29tPgo+Cj4gQ3VycmVudGx5LCB3ZSBoYXZlIGEgc2luZ2xlIHNvbHV0
aW9uIHRvIGhhbmRsZSB0aGUgL3ZhciBjb250ZW50IG9uIGEKPiByZWFkLW9ubHkgcm9vdCBmaWxl
c3lzdGVtLCBhbmQgdXNlcnMgY2FuIG9wdCBvdXQgb2YgdXNpbmcgaXQuCj4KPiBXZSdyZSBnb2lu
ZyB0byBpbnRyb2R1Y2UgYW5vdGhlciBzb2x1dGlvbiAoYmFzZWQgb24gYW4gb3ZlcmxheWZzKSwg
d2hpY2gKPiBpcyBpbmNvbXBhdGlibGUgd2l0aCB1c2luZyB0aGUgZmFjdG9yeSwgc28gd2UnbGwg
aGF2ZSBhIGNob2ljZSBvZiB0aHJlZQo+IG11dHVhbGx5IGV4Y2x1c2l2ZSBvcHRpb25zLgo+Cj4g
SW50cm9kdWNlIHRoYXQgY2hvaWNlIG5vdyB3aXRoIGp1c3QgdGhlIGV4aXN0aW5nIC92YXIgZmFj
dG9yeSwgYW5kIGEgbmV3Cj4gb3B0aW9uIHRvIG9wdCBvdXQgb2YgaXQuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4gQ2M6IE5vcmJlcnQg
TGFuZ2UgPG5vbGFuZ2U3OUBnbWFpbC5jb20+Cj4gQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxlIChF
c3NlbnNpdW0vTWluZCkgPGFybm91dEBtaW5kLmJlPgo+IENjOiBSb21haW4gTmFvdXIgPHJvbWFp
bi5uYW91ckBzbWlsZS5mcj4KPiBDYyA6IEplzIFyZcyBbXkgUm9zZW4gPGplcmVteS5yb3NlbkBz
bWlsZS5mcj4KPiBBY2tlZC1ieTogTm9yYmVydCBMYW5nZSA8bm9sYW5nZTc5QGdtYWlsLmNvbT4K
CkhlbGxvIFlhbm4sCgpJIGtub3cgSSBhbHJlYWR5IGFja2VkIHRoaXMsIGJ1dC4uLgoKPiAtLS0K
PiAgc3lzdGVtL0NvbmZpZy5pbiB8IDIyICsrKysrKysrKysrKysrKysrKystLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvc3lzdGVtL0NvbmZpZy5pbiBiL3N5c3RlbS9Db25maWcuaW4KPiBpbmRleCA4MDZhNzQ3MzE1
Li44N2RmMDMxNTQ1IDEwMDY0NAo+IC0tLSBhL3N5c3RlbS9Db25maWcuaW4KPiArKysgYi9zeXN0
ZW0vQ29uZmlnLmluCj4gQEAgLTE1NiwxMCArMTU2LDE2IEBAIGVuZGNob2ljZQo+Cj4gIGlmIEJS
Ml9JTklUX1NZU1RFTUQKPgo+IC1jb25maWcgQlIyX0lOSVRfU1lTVEVNRF9WQVJfRkFDVE9SWQo+
IC0gICAgICAgYm9vbCAiYnVpbGQgYSBmYWN0b3J5IHRvIHBvcHVsYXRlIGEgdG1wZnMgb24gL3Zh
ciIKPiAtICAgICAgIGRlZmF1bHQgeSAgIyBsZWdhY3kKPiArY2hvaWNlCj4gKyAgICAgICBib29s
ICIvdmFyIG1hbmFnZW1lbnQiCj4gKyAgICAgICBkZWZhdWx0IEJSMl9JTklUX1NZU1RFTURfVkFS
X0ZBQ1RPUlkgICMgbGVnYWN5Cj4gICAgICAgICBkZXBlbmRzIG9uICFCUjJfVEFSR0VUX0dFTkVS
SUNfUkVNT1VOVF9ST09URlNfUlcKCkNvbnNpZGVyIHRoYXQgdGhlIG9wdGlvbiBpcyB1c2VkIHRv
ICpyZW1vdW50KiB0aGUgZmlsZXN5c3RlbSwKYnV0IHlvdSBjb3VsZCBtb3VudCB0aGUgZmlsZXN5
c3RlbSByZWFkLXdyaXRlLCBpbiB3aGljaCBjYXNlIHlvdQpwcm9iYWJseSAqZG9udCB3YW50KiBz
b21lIHNwZWNpZmljIHZhciBoYW5kbGluZy4KClNvIG1heWJlOgoKZHJvcCAgJ2RlcGVuZHMgb24g
IUJSMl9UQVJHRVRfR0VORVJJQ19SRU1PVU5UX1JPT1RGU19SVycKCmlmICFCUjJfVEFSR0VUX0dF
TkVSSUNfUkVNT1VOVF9ST09URlNfUlcKbWFrZSB0aGUgZGVmYXVsdCBCUjJfSU5JVF9TWVNURU1E
X1ZBUl9GQUNUT1JZCm90aGVyd2lzZQptYWtlIHRoZSBkZWZhdWx0IEJSMl9JTklUX1NZU1RFTURf
VkFSX05PTkUKCkkgYmVsaWV2ZSB0aGUgY2hvaWNlIHNob3VsZCBiZSBhbHdheXMgdGhlcmUuCgo+
ICsgICAgICAgaGVscAo+ICsgICAgICAgICBTZWxlY3QgaG93IEJ1aWxkcm9vdCBwcm92aWRlcyBh
IHJlYWQtd3JpdGUgL3ZhciB3aGVuIHRoZQo+ICsgICAgICAgICByb290ZnMgaXMgbm90IHJlbW91
bnRlZCByZWFkLXdyaXRlLgo+ICsKPiArY29uZmlnIEJSMl9JTklUX1NZU1RFTURfVkFSX0ZBQ1RP
UlkKPiArICAgICAgIGJvb2wgImJ1aWxkIGEgZmFjdG9yeSB0byBwb3B1bGF0ZSBhIHRtcGZzIgo+
ICAgICAgICAgaGVscAo+ICAgICAgICAgICBCdWlsZCBhIGZhY3Rvcnkgb2YgdGhlIGNvbnRlbnQg
b2YgL3ZhciBhcyBpbnN0YWxsZWQgYnkKPiAgICAgICAgICAgcGFja2FnZXMsIG1vdW50IGEgdG1w
ZnMgb24gL3ZhciBhdCBydW50aW1lLCBzbyB0aGF0Cj4gQEAgLTE4MSw2ICsxODcsMTYgQEAgY29u
ZmlnIEJSMl9JTklUX1NZU1RFTURfVkFSX0ZBQ1RPUlkKPiAgICAgICAgICAgdmFyLm1vdW50IHVu
aXQsIHRoYXQgb3ZlcnJpZGVzIHRoZSBXaGF0IGFuZCBUeXBlLCBhbmQgcG9zc2libHkKPiAgICAg
ICAgICAgdGhlIE9wdGlvbnMgYW5kIEFmdGVyLCBmaWVsZHMuCj4KPiArY29uZmlnIEJSMl9JTklU
X1NZU1RFTURfVkFSX05PTkUKPiArICAgICAgIGJvb2wgImRvIG5vdGhpbmciCj4gKyAgICAgICBo
ZWxwCj4gKyAgICAgICAgIENob29zZSB0aGlzIGlmIHlvdSBoYXZlIGN1c3RvbSBkaXNwb3NpdGlv
bnMgKGxpa2Ugb25lIG9yIG1vcmUKPiArICAgICAgICAgb2YgYSBwb3N0LWJ1aWxkIHNjcmlwdCwg
YSBmYWtlcm9vdCBzY3JpcHQsIHN5c3RlbWQgdW5pdHMsIGFuCj4gKyAgICAgICAgIGluaXRyYW1m
cywgb3Igc29tZXRoaW5nIGVsc2UpIHRoYXQgcHJlcGFyZSAvdmFyIHRvIGJlIHdyaXRhYmxlCj4g
KyAgICAgICAgIG9uIGEgcmVhZC1vbmx5IHJvb3Rmcy4KPiArCj4gK2VuZGNob2ljZQo+ICsKPiAg
Y29uZmlnIEJSMl9JTklUX1NZU1RFTURfUE9QVUxBVEVfVE1QRklMRVMKPiAgICAgICAgIGJvb2wg
InRyaWdnZXIgc3lzdGVtZC10bXBmaWxlcyBkdXJpbmcgYnVpbGQiCj4gICAgICAgICBkZWZhdWx0
IHkgICMgbGVnYWN5Cj4gLS0KPiAyLjI1LjEKPgoKTm9yYmVydApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
