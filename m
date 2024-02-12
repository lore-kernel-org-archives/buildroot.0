Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71A9C4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 22:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7557B40321;
	Mon, 12 Feb 2024 22:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPZimOjmHcTe; Mon, 12 Feb 2024 22:11:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8496540322
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8496540322;
	Mon, 12 Feb 2024 22:11:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 602541BF34E
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58E7881F85
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qSfHal6faXY4 for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 22:11:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A4BF81F83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A4BF81F83
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A4BF81F83
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 22:11:16 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-42a029c8e76so26654951cf.2
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 14:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707775875; x=1708380675;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KB12cCS0yfPx/J1GZrtMrAgpJaXRj8C8S7HT1Ocxr2s=;
 b=QxA10yQlGBsRiJ+FCNlbcfwws2xrX6iVd+x+Keu7fOnTnhCKg86I4IbFA4aa9O/oxk
 sz4seqPLGXDNGlCmjw7KCrmJCblTeKYfFv0cJksk1qGeKKTD40Oa1tz8N+C+kgvPnh65
 y8v7DvUfjvZefdkZkYTZLW36v/tyuB9k63SAA1wKy/2MlNrtHg/WnnOADpnOYEWG55Ip
 l4VBnMyMysLnmqRCrZHgIe65TZmPYB1vsAx+woveZkZSIElIyATJ85p9ZcNo+ff9Qhra
 ++96l75xGbciy7BcNL5M5HrYnM0hJYr7yHF2A/d6UInPEYhND9/EvQuaBjAMSidN1hHz
 QF3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAW7Dwau6GT5cA0P5JCY3zRg89DwoKvZWTB1GYcg94K4cwsKljIsBRXJnE53wFOjT9LK/82yrhIQMqOgYP5kWILUpwzpB3qg==
X-Gm-Message-State: AOJu0YyKeZZRKaKkyBDbOCuA/y8nM1GWtvANXiKk/fcsXQ8FDuQJ7cYH
 Y3A7GGBLVZnD23NhJBF3CIqqgKh0d3GmAVwrBvFKs/RK3QsZeODH/5okUYm7BzcAeJ5uTQk5xnu
 wIZAcZvvCm3dRT56O8Iy4GariP1s=
X-Google-Smtp-Source: AGHT+IGfoFmkxi9Kdu4I7r5fysz7rwFfYZ3PIA7tDYKXx4NvoWn/x3/GGI/mD7dRiM0AopeE9D4PgRTPtGCWG7OAGrs=
X-Received: by 2002:a05:622a:1049:b0:42b:ee17:a8b1 with SMTP id
 f9-20020a05622a104900b0042bee17a8b1mr10949950qte.66.1707775875339; Mon, 12
 Feb 2024 14:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20240209175631.1337370-1-james.hilliard1@gmail.com>
 <Zck6_sR8fspWF37e@landeda>
 <CADvTj4ppD06TSGnYUUBSzB_sV6vErb2ozyMuGr1QjyLtu_pvPA@mail.gmail.com>
 <ZclC3_dSvLTp6Ras@landeda> <18bea399-dc8e-424b-b087-3823d0bd4545@bubu1.eu>
 <CADvTj4pdnvNK3go=5t6PWhU8ax0gNpqwD3kpOUn9RCJV8b2NkA@mail.gmail.com>
 <ae0932bd-dd5c-4082-a34d-af0eea110b20@mind.be>
 <CADvTj4r3sY7qO4XJcPOdq3WieX_3zp7KEheVVkxNjuj64m6vSA@mail.gmail.com>
 <f556b1c4-2743-48bf-be95-457d746eefbf@mind.be>
In-Reply-To: <f556b1c4-2743-48bf-be95-457d746eefbf@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Feb 2024 15:11:02 -0700
Message-ID: <CADvTj4qxskccxqrP9Oq4dpW4dyothB3QY9-ETv8oJn6eGV5zLA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707775875; x=1708380675; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KB12cCS0yfPx/J1GZrtMrAgpJaXRj8C8S7HT1Ocxr2s=;
 b=b6EyfZ7VqgVwciiRw4r1+hgXB63vOme6meoq/MPAYmiDxBNIbhGXS/KXqTVeKHJqhO
 Hvy45qlWXGEQx4AeYssr2nBQp7M3qco9hKlSkXFMU5f6wsh9L+IdJ12ZXnLIVRQetLp8
 TKHnETcFoiW3ONOnDd7o2X0SVbGyxsMfQlr6X+fH69J+4YQELJk489fatOS81Bllj2/s
 8MUU2guVQWUE9VJbYn4/TB4j2K4lyTvPVdN/t+E8r0Ij4p4wEbEePtQv2gtZwAdBL+Vg
 71i6LeX38qgdq9qfcp9X+fgC9s4xWwHmPdPG3/DAioezVZKrYDhCs1FQnzYOgOABvVaG
 UC+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=b6EyfZ7V
Subject: Re: [Buildroot] [PATCH 1/2] package/python-uvloop: add support for
 cython3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBGZWIgMTIsIDIwMjQgYXQgMjo1M+KAr1BNIEFybm91dCBWYW5kZWNhcHBlbGxlIDxh
cm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4KPgo+Cj4gT24gMTIvMDIvMjAyNCAyMjowOSwgSmFtZXMg
SGlsbGlhcmQgd3JvdGU6Cj4gPiBPbiBNb24sIEZlYiAxMiwgMjAyNCBhdCAxMjo1MOKAr1BNIEFy
bm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4gPj4KPiA+Pgo+ID4+
Cj4gPj4gT24gMTIvMDIvMjAyNCAwMTo1MSwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gPj4+IE9u
IFN1biwgRmViIDExLCAyMDI0IGF0IDU6MTPigK9QTSBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9v
dEBidWJ1MS5ldT4gd3JvdGU6Cj4gPj4gW3NuaXBdPj4gSW4gc2hvcnQ6IGlmIHdlIGNvbnRpbnVl
IHRvIHVzZSB0aGUgc2Rpc3RzIGZyb20gcHlwaSwgY3l0aG9uIGlzIG5vdCBhCj4gPj4+PiByZWFs
IGJ1aWxkIGRlcGVuZGVuY3kgYW5kIHdlIGNhbiBqdXN0IHJlbW92ZSBpdCBmcm9tIHB5cHRvamVj
dC50b21sCj4gPj4+PiBpbnN0ZWFkIG9mIHRyeWluZyB0byBwcm92aWRlIHRoZSBjb3JyZWN0IHZl
cnNpb24gdGhhdCdzIG5ldmVyIGdvaW5nIHRvCj4gPj4+PiBiZSBpbnZva2VkLgo+ID4+Pgo+ID4+
PiBXZSBjYW4gcHJvYmFibHkganVzdCBwYXNzIC0tc2tpcC1kZXBlbmRlbmN5LWNoZWNrIGFzIGEg
YnVpbGQgYXJnIG9yCj4gPj4+IHNvbWV0aGluZyBsaWtlIHRoYXQgSSBzdXBwb3NlLgo+ID4+Cj4g
Pj4gICAgVGhhdCBza2lwcyBfYWxsXyBkZXBlbmRlbmN5IGNoZWNrcywgYW5kIHdlIHVzdWFsbHkg
d2FudCB0byBjaGVjayBkZXBlbmRlbmNpZXMuCj4gPj4gVW5sZXNzIHRoZSBkZXBlbmRlbmN5IGNo
ZWNrIHdpbGwgcmVxdWlyZSBob3N0IHBhY2thZ2VzIGZvciBydW50aW1lIGRlcGVuZGVuY2llcz8K
PiA+PiBCdXQgaWYgdGhhdCB3ZXJlIHRoZSBjYXNlIHdlJ2QgYWxyZWFkeSBoYXZlIGEgbG90IG9m
IHVzZWxlc3MgaG9zdC1weXRob24tZm9vCj4gPj4gcGFja2FnZXMgSSBleHBlY3QuLi4KPiA+Cj4g
PiBZZWFoLCBzbyBydW50aW1lIGRlcGVuZGVuY2llcyBhcmUgYmFzaWNhbGx5IG5vdCBjaGVja2Vk
IGF0IGFsbCBzaW5jZSB3ZSBkb24ndAo+ID4gZ2VuZXJhbGx5IGhhdmUgYnVpbGRyb290IHRhcmdl
dCBweXRob24gcGFja2FnZXMgd2hpY2ggZGVwZW5kIG9uIG90aGVyIGJ1aWxkcm9vdAo+ID4gdGFy
Z2V0IHB5dGhvbiBwYWNrYWdlcywgdGhleSBtZXJlbHkgc2VsZWN0IHRoZWlyIGRlcGVuZGVuY2ll
cyB3aGljaCBhbGxvd3MgZm9yCj4gPiB0aGVpciBkZXBlbmRlbmNpZXMgdG8gYmUgYnVpbHQgcGFy
YWxsZWwgYnV0IHByZXZlbnRzIGFueSBzb3J0IG9mIHRhcmdldCBwYWNrYWdlCj4gPiBkZXBlbmRl
bmN5IHZhbGlkYXRpb24uCj4gPgo+ID4gSSB0aGluayB0aGF0IC0tc2tpcC1kZXBlbmRlbmN5LWNo
ZWNrIGZsYWcganVzdCBkaXNhYmxlcyBwZXA1MTcgYnVpbGQgZGVwZW5kZW5jeQo+ID4gY2hlY2tz
IHdoaWNoIHdvdWxkIGJlIHRob3NlIGhvc3QtcHl0aG9uLWZvbyBidWlsZCBkZXBlbmRlbmNpZXMg
dGhhdCBzb21lIGhhdmUuCj4KPiAgIE9oLCBhbmQgYSBtaXNzaW5nIGJ1aWxkIGRlcGVuZGVuY3kg
KHRoYXQgaXMgYWN0dWFsbHkgdXNlZCkgd291bGQgYWN0dWFsbHkKPiB0cmlnZ2VyIGEgYnVpbGQg
ZXJyb3IsIHNvIGluZGVlZCBpdCBzb3VuZHMgbGlrZSB0aGUgcGVwNTE3IGJ1aWxkIGRlcGVuZGVu
Y3kKPiBjaGVjayBpcyBxdWl0ZSByZWR1bmRhbnQuCgpQcm9iYWJseSBhIGdvb2QgaWRlYSB0byBv
bmx5IHVzZSB0aGF0IGZsYWcgZm9yIHBhY2thZ2VzIHdoZXJlIHdlIHdhbnQgdG8KYnlwYXNzIGEg
YnVpbGQgZGVwZW5kZW5jeS4KCj4KPiAgIFJlZ2FyZHMsCj4gICBBcm5vdXQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
