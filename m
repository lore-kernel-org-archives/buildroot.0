Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208E6E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 06:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C00C981362;
	Tue,  7 Jan 2025 06:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmFui6qmokxW; Tue,  7 Jan 2025 06:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45C2A81363
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45C2A81363;
	Tue,  7 Jan 2025 06:45:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 333DF7AA
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3DEA40264
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qzIQoHiw9tZ for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 06:45:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com;
 envelope-from=rabenda.cn@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58E2A40236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58E2A40236
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58E2A40236
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:45:06 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-518ae5060d4so4550872e0c.0
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 22:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736232305; x=1736837105;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qKMSoyjNdm4fZe9YOwVlwSMH7GH71oXvAUfChR24BnU=;
 b=Gz/mYKJ+SRqh/jpeJInB+jL7Qqu8mI3r+BhYfotDl6omO9gu3p5TCY0Nxaym2ZFQ69
 Kkk5HLzJki/KY35TTG9hJB6fbmmrZUWXOc8dV7DJYUzo3qClWH1Yv5bMUZvK9nPQruap
 njjyAC9ZYmc0ayfC7IHe1wAEzcLQQEfuw32DsHbdWrLvm0gHlvK0kCUKROlMuCbK8l4n
 f+pm7374xzZeyu1gtn2haMvT7H/wdqIQgYFTcUauxIwZq3QcH/KbaJ5rgjOmPU4dIZlQ
 029PuoiKopOP/GG6KZCOuPywOj023azlOkTM5JEDUmistuhBmdXhRjb7aRgsho8u4bP/
 0HgQ==
X-Gm-Message-State: AOJu0YxTSA+diKieQRRAS5l+Ybv2lw2i8vULx0IWD154xaKvsA9SqCZY
 njgeTsV3ph4CTQRArs3YcLbztonEMLhAYbsNkUuKY5Uwx1FJtHN5tYLRMxFIVvkedIVvnd2a7rn
 r/vzyopkT8+oYPcW50+GKLTRCJ0Q=
X-Gm-Gg: ASbGncvYC/8bdvLmg1JRu2E7GBETHw8JTuS6lqdAJrjEYL1FuYPhQbdvOCILPnn8+yV
 zbuEWmXwfxsySCelwKorlaSqcNld18Tevz30=
X-Google-Smtp-Source: AGHT+IHGjpOEPKUR8QHe5Uj17soUAvmSE9xWqLwdegNMcehVxb3IQFbuqpksi6zUEHYo+axpVbIGNrlrU6RVEd3aSX8=
X-Received: by 2002:a05:6102:511e:b0:4b2:5c0a:9afa with SMTP id
 ada2fe7eead31-4b2cc323ad4mr37073432137.4.1736232303926; Mon, 06 Jan 2025
 22:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20250101205435.1513140-1-kilian.zinnecker@mail.de>
 <3258931.5fSG56mABF@kilian-laptop> <8511014.NyiUUSuA9g@kilian-laptop>
 <10590208.nUPlyArG6x@kilian-laptop>
In-Reply-To: <10590208.nUPlyArG6x@kilian-laptop>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 7 Jan 2025 14:44:52 +0800
X-Gm-Features: AbW1kvZcvYpUkCiGedqUaEOzct0si-2hVFs6zt1MyOEnRMzGmuxYP2xzP-IpQSY
Message-ID: <CAAT7Ki9Y3ZfcbnQnYytgUon6iY8P8o6o2YXCXOeTw++gsoHJUg@mail.gmail.com>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: buildroot@buildroot.org, Drew Fustini <dfustini@tenstorrent.com>, 
 Drew Fustini <drew@beagleboard.org>, robertcnelson@beagleboard.org, 
 jkridner@beagleboard.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736232304; x=1736837104; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qKMSoyjNdm4fZe9YOwVlwSMH7GH71oXvAUfChR24BnU=;
 b=Po9xrZZ2/jxeXr4z3OZgUw0Zwr6se44HPLVEEdgkWRqJthEyI05vfnEIjywcYmpKVg
 A6RCg41Oshc0KY5UToouxHMqZa/B4DnNllbY6OPpKBVVdpSduvCDYa4K9p3eS1NTQUtM
 dp/ZnvIOBNkIq6w3zHhX8t01+He/NBqGJspzqpvNyG4pLPEQTDkjtl6b6Q/oIEsxycaK
 U6zRymKflLf4wDqsD4uqjKWLmmneLVjPCeSGLJjLKrwQsS0IjQT8ETFNMis2amIbUapg
 cplHra4nvMcMB3I0zCJOWDhQWMUrgeOXLGEXSdnC4R698y3n6TL/tmZWirxN7nllsx92
 xh2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Po9xrZZ2
Subject: Re: [Buildroot] [PATCH v6 0/2] Add board support for the
 BeagleV-Ahead
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksIEtpbGlhbgoKT24gVHVlLCBKYW4gNywgMjAyNSBhdCA1OjM04oCvQU0gS2lsaWFuIFppbm5l
Y2tlcgo8a2lsaWFuLnppbm5lY2tlckBtYWlsLmRlPiB3cm90ZToKPgo+IEhlbGxvIGFsbCwKPgo+
IChAVGhvbWFzLCBJIGFkZGVkIHlvdSwgYmVjYXVzZSBJIGhhdmUgYSBxdWVzdGlvbiBhYm91dCBo
b3cgdG8gZGVhbCB3aXRoIGtub3duCj4gaXNzdWVzIGFuZCB2dWxuZXJhYmlsaXRpZXMgcmVnYXJk
aW5nIGEgYm9hcmQgaW4gYnVpbGRyb290LCBhbmQgSSBob3BlIHlvdSBjYW4KPiBtYXliZSBnaXZl
IHNvbWUgZ29vZCBzdWdnZXN0aW9ucy4gU2VlIGJlbG93LikKPgo+ID4gYWN0dWFsbHkgdGhlIGN1
c3RvbSBkZXZpY2UgdHJlZSBjb250YWluaW5nIHRoZSByZXNldC1zYW1wbGUgbm9kZSBjb3VsZCBi
ZQo+ID4gd3JvbmcuIFdpdGggdGhlIG5vZGUgaXQgc2VlbXMgdGhhdCB0aGUgY29yZXMgMS0zIG1p
Z2h0IG5vdCBiZSBhY3RpdmF0ZWQKPiA+IGFmdGVyIGFsbCwgYnV0IHdoZW4gb21pdHRpbmcgdGhl
IG5vZGUsIGl0IHNlZW1zIHRoYXQgdGhlIGN1c3RvbSB1Ym9vdCBkb2VzCj4gPiBwcm9wZXJseSBh
Y3RpdmF0ZSB0aGVtLiBJIGhhdmUgdG8gaGF2ZSBhbm90aGVyIGxvb2sgYXQgdGhpcyAuLi4KPgo+
IFllcCwgdGhlIGFkZGl0aW9uYWwgZGV2aWNlIHRyZWUgbm9kZSBpbiBjb25qdW5jdGlvbiB3aXRo
IHRoZSBSZXZ5b3MgdWJvb3Qgd2FzCj4gd3JvbmcuIEkgcmVtb3ZlZCBpdCBhbmQgaXQgaXMgbm93
IHdvcmtpbmcgYWdhaW4gd2l0aCBhbGwgZm91ciBjb3JlcyEKPgo+IEZ1cnRoZXJtb3JlLCB0aGVy
ZSBpcyBub3cgYSByZXBvLCBjb250YWluaW5nIHRoZSAiWHVhbnRpZS1iaW5zIiwgd2hpY2ggaGFz
IGEKPiBMSUNFTlNFIGZpbGUgaW4gaXRbMV0hIEkgc3dpdGNoZWQgdG8gdXNpbmcgdGhhdCByZXBv
c2l0b3J5LiBBcyBpdCBpcyBhIGNvdXBsZQo+IG9mIDEwME1CcyBsYXJnZSwgSSBjaGFuZ2VkIHRo
ZSBwYWNrYWdlIG1ha2VmaWxlIHRvIG9ubHkgZmV0Y2ggdGhlIG5lZWRlZAo+IGJpbmFyaWVzIGFu
ZCB0aGUgTElDRU5TRSBmaWxlLiBIZW5jZSwgSSBwcmVwYXJlZCBhIDd0aCBpdGVyYXJ0aW9uIG9m
IHRoZSBib2FyZC4KClJlZ2FyZGluZyB0aGUgbGljZW5zZSBvZiB4dWFudGllLWJpblsxXSwgdGhl
IHh1YW50aWUgdGVhbSB0aGlua3MgaXQKc2hvdWxkIGJlIHJlbGVhc2VkIHVuZGVyIHRoZSBhcGFj
aGUgbGljZW5zZSwgYnV0IEkgZG91YnQgaWYgdGhpcwphcHBsaWVzIHRvIGJpbmFyeSBmaWxlcz8K
CkZvciBhbm90aGVyIGJpbmFyeSwgcGxlYXNlIGRvIG5vdCB1c2UgdGhlIHZlcnNpb24gZnJvbSB0
aGUKeHVhbnRpZS15b2N0byByZXBvc2l0b3J5LiBUaGlzIGlzIHYwLjkuNSBTREsuClRoZSByZXZ5
b3MgcmVwb3NpdG9yeSBoYXMgcmVsZWFzZWQgdjIuMC4yIFNESywgd2hpY2ggbmVlZHMgdG8gYmUg
dXNlZAppbiBjb25qdW5jdGlvbiB3aXRoIGl0LgoKVGhlIGJlaGF2aW9yIG9mIHRoZSBhb24gaGFz
IGJlZW4gbW9kaWZpZWQgaW4gdGhlIFNESyAxLjQuMCB2ZXJzaW9uIHVwZGF0ZS4KCj4KPiBIb3dl
dmVyLCBJIGhhdmUgZnVydGhlciBxdWVzdGlvbnMsIEkgd2FudGVkIHRvIGFzayBiZWZvcmUgc2Vu
ZGluZyBhIHY3OiBUaGVyZQo+IGV4aXN0IHZ1bG5lcmFiaWxpdGllcyByZXBvcnRlZCBmb3IgdGhl
IGJvYXJkJ3MgU29DLCBlLmcuLCAiR2hvc3R3cml0ZSJbMl0uIEhvdwo+IHdvdWxkIGJlIGEgcHJv
cGVyIHdheSB0byBkZWFsIHdpdGggc3VjaCBpc3N1ZXM/IFNwZWNpZmljYWxseSByZWdhcmRpbmcK
PiBHaG9zdHdyaXRlIHRoZSBhdXRob3JzIHNheSwgdGhhdCB0byBtaXRpZ2F0ZSBvbmUgd291bGQg
aGF2ZSB0byBkaXNhYmxlIHRoZQo+IFNvQ3MgdmVjdG9yIGV4dGVuc2lvbi4gSG93ZXZlciwgdGhl
IG9ubHkgd2F5IEkgYW0gY3VycmVudGx5IGF3YXJlIHRvIGRvIHRoYXQKPiBpcyB0byBkaXNhYmxl
IHRoZSBTb0MncyB2ZW5kb3IgZXh0ZW5zaW9ucyBhbGwgdG9naGV0aGVyICh1c2luZyB0aGUKPiAi
dGhlYWRpc2FlZSIgYml0IGluIHRoZSAibXhzdGF0dXMiIHJlZ2lzdGVyKS4gSWYgSSBkbyBzbywg
SSBkbyBnZXQgYSBrZXJuZWwKPiBvb3BzIHVwb24gYm9vdGluZywgYXMgdGhlIGtlcm5lbCBpcyBl
eGVjdXRpbmcgc29tZSB2ZW5kb3Igc3BlY2lmaWMKPiBpbnN0cnVjdGlvbnMuIElzIHRoZXJlIGEg
cHJvcGVyIHdheSB0byBkaXNhYmxlIHRoZSB1c2Ugb2YgdGhlIHZlbmRvciBzcGVjaWZpYwo+IGlu
c3RydWN0aW9ucyBieSB0aGUga2VybmVsLCB3aGljaCBkb2VzIG5vdCBpbnRyb2R1Y2Ugb3RoZXIg
aXNzdWVzPyBPcgo+IGFsdGVybmF0aXZlbHkgd291bGQgaXQgYmUgb2sgdG8gb25seSBtZW50aW9u
IHRoZSB2dWxuZXJhYmlsaXR5IGluIHRoZSBib2FyZCdzCj4gcmVhZG1lLCAob2ZjLiBpbmNsdWRp
bmcgbGlua3MgYW5kIENWRXMpLCBzdGF0aW5nIHRoYXQgdGhlIGJvYXJkIHN1cHBvcnQgZG9lcwo+
IG5vdCBmaXggdGhlc2VzIGlzc3Vlcz8KPgo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vWFVBTlRJ
RS1SVi94dWFudGllLXlvY3RvCj4gWzJdIGh0dHBzOi8vZ2hvc3R3cml0ZWF0dGFjay5jb20vCj4g
WzNdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEyLjYvc291cmNlL2FyY2gv
cmlzY3YvZXJyYXRhL3RoZWFkLwo+IGVycmF0YS5jCj4KPgo+Cj4KPgoKVGhlIG1haW5saW5lIGtl
cm5lbCBkb2VzIG5vdCBzdXBwb3J0IHh0aGVhZHZlY3RvciB5ZXQsIHNvIGl0IGlzIG5vdAphZmZl
Y3RlZCBieSBHaG9zdHdyaXRlLgpJIHRoaW5rIHRoZSB3YXkgdG8gdHVybiBpdCBvZmYgaXMgdG8g
ZGVsZXRlIHRoZSB4dGhlYWR2ZWN0b3IKZGVzY3JpcHRpb24gaW4gdGhlIGR0cywgYnV0IGl0IGRv
ZXNuJ3QgZXhpc3Qgbm93LCBzbyBkb24ndCB3b3JyeSBhYm91dAppdC4KClsxXSBodHRwczovL2dp
dGh1Yi5jb20vWFVBTlRJRS1SVi94dWFudGllLXlvY3RvL2Jsb2IvbWFzdGVyL0xJQ0VOU0UudHh0
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
