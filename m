Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1E5CFB43F
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 14:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04C4480DC0;
	Mon,  7 Oct 2024 14:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbbBEkYiFi9j; Mon,  7 Oct 2024 14:54:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20EDE80DC5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20EDE80DC5;
	Mon,  7 Oct 2024 14:54:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2C7D1BF589
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 14:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1C3280DC5
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 14:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-9gPjHrtBpY for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 14:54:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=aduskett@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E355080DC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E355080DC0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E355080DC0
 for <buildroot@busybox.net>; Mon,  7 Oct 2024 14:54:41 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a1f1ef7550so17513215ab.1
 for <buildroot@busybox.net>; Mon, 07 Oct 2024 07:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728312881; x=1728917681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bEZWiy/PC0BY70AcCvtwTAA6uL9LvPOcpNr/bsLlTBU=;
 b=jZmDzAf4WSSV3uK24NrybdEygqav+9lzAn0dJICzKLGK+are2xNN4f0HPa+ars25XY
 3+KMGGD4Kb6uRI7GdmTY2aRJcTi5tPTgMHx0j8sSKPWZ4Nl85AxUXTnT4PnBDX3fA5PQ
 XaSgyWEEUdJFkjBb2rmyW78mKhddYqWAAcg1+pyKuYVHKKoZ94P/AhUqU7mp4Z5ZO6li
 V01Bd4N8Nh8uE7ucd9Om24GpiZQ0VkHDWb28dSvGUcMM7yIALN5U6jFj2x7k+LxYjtEy
 XXhguP6lzHfxSaG5vbK33g0+f9J28Dpc6DhmgoRWzeoaR9H7qi6x5VQrzbwoWpaGpAAi
 l5Lg==
X-Gm-Message-State: AOJu0YxpRC+7AqKcxya0vxNzpqnN8m16tIwxcNFiLCKIEPqBzWr9e4aZ
 hZeTBpR/YsIDvZo2qxGfc9umTOI8feWk7ntaRY0Kb0L1RxIOfpkOvSdju36XUcS8FtSDbQG5GKj
 0oSTtGOrbotxVBtHd6Xnf7gdRZ2Y=
X-Google-Smtp-Source: AGHT+IFML5bzEYKKbwS4ZPvtkmtXlQS7h6uDcFjWLOyPeA8SHbzUOVd3H+IflApjSrW9Ql22gCkHCj6JnXAgg9UxPU0=
X-Received: by 2002:a05:6e02:1d91:b0:3a0:9a32:dedc with SMTP id
 e9e14a558f8ab-3a37598a9fbmr112687965ab.6.1728312880657; Mon, 07 Oct 2024
 07:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240920181212.3572055-1-francois.perrad@gadz.org>
 <20240920181212.3572055-2-francois.perrad@gadz.org>
 <CAFSsvmoCpWY+RtT8K=eeO9wAfZSrG7Z0NKAFujfg9fCX1ishdg@mail.gmail.com>
In-Reply-To: <CAFSsvmoCpWY+RtT8K=eeO9wAfZSrG7Z0NKAFujfg9fCX1ishdg@mail.gmail.com>
From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 7 Oct 2024 16:54:27 +0200
Message-ID: <CAFSsvmoJ=Hseb5Hvgz4N-vh1oHpt4qRaTmLUHyzZ+29NoAc50w@mail.gmail.com>
To: Francois Perrad <francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728312881; x=1728917681; darn=busybox.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bEZWiy/PC0BY70AcCvtwTAA6uL9LvPOcpNr/bsLlTBU=;
 b=ccK8Yk836he6B2rBCKCwqi55rISKFbLuF2ebJDp+mBSHY/2ywgMQby0VkrzDDzyMWA
 1pU/wvNVTxkYyJxDrqusL8O5rbt0xN+/YiN28rzwG8uzbCqXimDTfpzuZlNzKpkKSzKE
 Cty1gVIMxxpql1yZM2gXgwt6EQzuh52aI53sX78s09DHow+c0/C2EDOiznKVjuZd2qHu
 lc7iSZGENUcypKTQOevVmiUJMWknPY/Ge8B+NpVxNMgNg/5LHutAtey1gA7v/oDxCdck
 bEaa3gjcfdmonkjn/YjVXq5VFcEvi/6+fKSawA3L7/nlGSaMVN+0BQME2exk7xI59ZX4
 gdhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ccK8Yk83
Subject: Re: [Buildroot] [PATCH v2 1/2] package/busybox: handle
 LIBFOO_BUSYBOX_CONFIG_FIXUPS
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dGVzdGVkLWJ5OiBhZGFtIGR1c2tldHQgPGFkdXNrZXR0QGdtYWlsLmNvbT4KCk9uIE1vbiwgT2N0
IDcsIDIwMjQgYXQgNDo1M+KAr1BNIEFkYW0gRHVza2V0dCA8YWR1c2tldHRAZ21haWwuY29tPiB3
cm90ZToKPgo+IHRlc3QtYnk6IGFkYW0gZHVza2V0dCA8YWR1c2tldHRAZ21haWwuY29tPgo+Cj4g
T24gRnJpLCBTZXAgMjAsIDIwMjQgYXQgODoxM+KAr1BNIEZyYW5jb2lzIFBlcnJhZAo+IDxmcmFu
Y29pcy5wZXJyYWRAZ2Fkei5vcmc+IHdyb3RlOgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5j
b2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgo+ID4gLS0tCj4gPiAgZG9jcy9t
YW51YWwvYWRkaW5nLXBhY2thZ2VzLWdlbmVyaWMuYWRvYyB8IDYgKysrKysrCj4gPiAgcGFja2Fn
ZS9idXN5Ym94L2J1c3lib3gubWsgICAgICAgICAgICAgICB8IDEgKwo+ID4gIHBhY2thZ2UvcGtn
LWdlbmVyaWMubWsgICAgICAgICAgICAgICAgICAgfCAzICsrKwo+ID4gIDMgZmlsZXMgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kb2NzL21hbnVhbC9hZGRp
bmctcGFja2FnZXMtZ2VuZXJpYy5hZG9jIGIvZG9jcy9tYW51YWwvYWRkaW5nLXBhY2thZ2VzLWdl
bmVyaWMuYWRvYwo+ID4gaW5kZXggODlmYzcwMDQ1Li5mMGIwNTA4ZjUgMTAwNjQ0Cj4gPiAtLS0g
YS9kb2NzL21hbnVhbC9hZGRpbmctcGFja2FnZXMtZ2VuZXJpYy5hZG9jCj4gPiArKysgYi9kb2Nz
L21hbnVhbC9hZGRpbmctcGFja2FnZXMtZ2VuZXJpYy5hZG9jCj4gPiBAQCAtNjMxLDYgKzYzMSwx
MiBAQCBkaWZmZXJlbnQgc3RlcHMgb2YgdGhlIGJ1aWxkIHByb2Nlc3MuCj4gPiAgICBUaGlzIGlz
IHNlbGRvbSB1c2VkLCBhcyBwYWNrYWdlIHVzdWFsbHkgaGF2ZSBubyBzdHJpY3QgcmVxdWlyZW1l
bnRzIG9uCj4gPiAgICB0aGUga2VybmVsIG9wdGlvbnMuCj4gPgo+ID4gKyogK0xJQkZPT19CVVNZ
Qk9YX0NPTkZJR19GSVhVUFMrIGxpc3RzIHRoZSBCdXN5Ym94IGNvbmZpZ3VyYXRpb24KPiA+ICsg
IG9wdGlvbnMgdGhhdCBhcmUgbmVlZGVkIHRvIHVzZSB0aGlzIHBhY2thZ2UgZXNwZWNpYWxseSBp
biBzb21lIHNjcmlwdHMsCj4gPiArICBvciBhdCBjb250cmFyaW8gdGhlIHVzZWxlc3Mgb3B0aW9u
cy4gVGhpcyBzaGFsbCBiZSBhIHNldCBvZgo+ID4gKyAgY2FsbHMgdG8gb25lIG9mIHRoZSBrY29u
ZmlnIHR3ZWFraW5nIG9wdGlvbjogYEtDT05GSUdfRU5BQkxFX09QVGAsCj4gPiArICBgS0NPTkZJ
R19ESVNBQkxFX09QVGAsIG9yIGBLQ09ORklHX1NFVF9PUFRgLgo+ID4gKwo+ID4gIFRoZSBwcmVm
ZXJyZWQgd2F5IHRvIGRlZmluZSB0aGVzZSB2YXJpYWJsZXMgaXM6Cj4gPgo+ID4gIC0tLS0KPiA+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2J1c3lib3gvYnVzeWJveC5tayBiL3BhY2thZ2UvYnVzeWJv
eC9idXN5Ym94Lm1rCj4gPiBpbmRleCAyMDRlYmUwMTAuLmVmNTUyMTEwNSAxMDA2NDQKPiA+IC0t
LSBhL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94Lm1rCj4gPiArKysgYi9wYWNrYWdlL2J1c3lib3gv
YnVzeWJveC5tawo+ID4gQEAgLTQxMSw2ICs0MTEsNyBAQCBkZWZpbmUgQlVTWUJPWF9LQ09ORklH
X0ZJWFVQX0NNRFMKPiA+ICAgICAgICAgJChCVVNZQk9YX1NFVF9TRUxJTlVYKQo+ID4gICAgICAg
ICAkKEJVU1lCT1hfU0VUX0xFU1NfRkxBR1MpCj4gPiAgICAgICAgICQoQlVTWUJPWF9TRVRfSU5E
SVZJRFVBTF9CSU5BUklFUykKPiA+ICsgICAgICAgJChQQUNLQUdFU19CVVNZQk9YX0NPTkZJR19G
SVhVUFMpCj4gPiAgZW5kZWYKPiA+Cj4gPiAgZGVmaW5lIEJVU1lCT1hfQlVJTERfQ01EUwo+ID4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsgYi9wYWNrYWdlL3BrZy1nZW5lcmlj
Lm1rCj4gPiBpbmRleCAxNzExNjNkY2IuLmZlY2I2OGZjNiAxMDA2NDQKPiA+IC0tLSBhL3BhY2th
Z2UvcGtnLWdlbmVyaWMubWsKPiA+ICsrKyBiL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsKPiA+IEBA
IC0xMjM3LDYgKzEyMzcsOSBAQCBlbmRpZgo+ID4gIGlmbmVxICgkJCgkKDIpX1VTRVJTKSwpCj4g
PiAgUEFDS0FHRVNfVVNFUlMgKz0gJCQoJCgyKV9VU0VSUykkJChzZXApCj4gPiAgZW5kaWYKPiA+
ICtpZm5lcSAoJCQoJCgyKV9CVVNZQk9YX0NPTkZJR19GSVhVUFMpLCkKPiA+ICtQQUNLQUdFU19C
VVNZQk9YX0NPTkZJR19GSVhVUFMgKz0gJCQoJCgyKV9CVVNZQk9YX0NPTkZJR19GSVhVUFMpJCQo
c2VwKQo+ID4gK2VuZGlmCj4gPiAgaWZuZXEgKCQkKCQoMilfTElOVVhfQ09ORklHX0ZJWFVQUyks
KQo+ID4gIFBBQ0tBR0VTX0xJTlVYX0NPTkZJR19GSVhVUFMgKz0gJCQoJCgyKV9MSU5VWF9DT05G
SUdfRklYVVBTKSQkKHNlcCkKPiA+ICBlbmRpZgo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
