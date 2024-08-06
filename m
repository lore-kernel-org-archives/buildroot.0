Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B86FC52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 15:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34EDE40533;
	Tue,  6 Aug 2024 15:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4eTUDOY5yiin; Tue,  6 Aug 2024 15:50:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C72EB40556
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C72EB40556;
	Tue,  6 Aug 2024 15:50:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3044E1BF408
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BC7A40556
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PN2vjQ5VPCxa for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 15:50:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9915C400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9915C400C7
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9915C400C7
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 15:50:06 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-8318b4d9539so246148241.2
 for <buildroot@buildroot.org>; Tue, 06 Aug 2024 08:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722959405; x=1723564205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nv7jNcTB0aK8fvtiXOGjh4t4EqNX1/4dWceqjGJBZio=;
 b=obKhEBAn8fJRFxbY0DX3Q3C1YVgsYSgDAdWo01qPxC96U88anm/wgNS3Qn0xI4rs23
 /AauRsxz0WBXT9u/rZ0hkD5/Oj7v98uhf5DzKMaZ/aDFvGPl5aVJzly9tzLygsafL6VV
 g8cSHPOhp3AQolL2LDD7ihURzsQudkqREPFxEHFu2oaqjuv9NhzU9ht9pQUc3dhAQ0uH
 IZOn8Ql7hTyqHwdkS9gaMU7oW2IRnJsrNorEb/OdG6ylmCTgH1XFxtipywdO5ziaPM9/
 V0DPprOjfjgo1k6i0Ri0A7TCT0nAgAUA5WtAO/jFgG8DGZTnxUxoxmwOdbxmrGxwgtdr
 66ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzDqylN8SDeab3P7FrddfAHoKfpV82SGNRJ6e/vlpHpra+opM+kZ6WQ6L2vHID7lmxbCJfIr6dv5TN+6PRF3eSHmDC5Tk3cQ==
X-Gm-Message-State: AOJu0YweDegE/sNw2ymSUWFUzl6DMyDrtUuJKv8qENenKtrvDj8YZNme
 pbQEvhYKsHF9S0SF7ottHAGj9rJ8CGqJQDBi49VD+hZOM4etUf48O7tlDQiiPrQsB4d+mZV/MZe
 DoXQ++4sHU10u32wdRcghMWCvsIB7Bj7JGSp5hg==
X-Google-Smtp-Source: AGHT+IHCVcBUIqal8Gfux+Ilj1djubSRt2+PfMyUN5pNYSJQW/I90jCnvAQsRXIlsbqWi0MjI76i/a6eDKxSwqwvGYc=
X-Received: by 2002:a05:6102:162c:b0:493:e587:3251 with SMTP id
 ada2fe7eead31-4945bea8d82mr17576492137.20.1722959405252; Tue, 06 Aug 2024
 08:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
In-Reply-To: <20240806165050.234235b4@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 6 Aug 2024 09:49:53 -0600
Message-ID: <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722959405; x=1723564205; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nv7jNcTB0aK8fvtiXOGjh4t4EqNX1/4dWceqjGJBZio=;
 b=W33EZpZvg0R8tDEGVe+eEW+hRuqfqqgBBrT7TS4lQfJ0ezszSvHPqT5a6X90D/m1CL
 ysLxe1Ddb87je+ilzQr/NXhUHMehHQowuwYgZp1z+dsN6bOpJ7gbuhbD4cDhn0k7v9M8
 gYs9nFOkRcr8G5QSLJKZF8IePVTJjm9OAeTimRb0My52uDpa4Rlx7Sq4ik9y2EZWcT7E
 tDPTQ6/7N3XjdPMW0k1Ze/O+wQXC8ra+NzoMwIpd7tyJ4bI/hH85Z+DO2DUU8sb1UNi7
 z41ikRlrGEUHUG6pxo2xDMT2KnUzq0D7Ec9mKJ3IrTV+s8rsxxqyfk0tTd1yCft9BiSc
 tftQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W33EZpZv
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBBdWcgNiwgMjAyNCBhdCA4OjUw4oCvQU0gVGhvbWFzIFBldGF6em9uaQo8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIDUgQXVnIDIwMjQgMTg6
MDc6MzcgLTA3MDAKPiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPiB3
cm90ZToKPgo+ID4gTXkgc3VnZ2VzdGlvbiBpcyB0byBlaXRoZXIgc2V0IEdPUFJPWFk9ZGlyZWN0
IGZvciBhbGwgcGFja2FnZXMsIG9yIGZvcgo+ID4gbm9uZSBvZiB0aGVtLgo+ID4KPiA+IFdlIGNv
dWxkIGRlZmF1bHQgdG8gc2V0dGluZyBHT1BST1hZIHRvIGVtcHR5LCB3aGljaCB1c2VzIHRoZSBk
ZWZhdWx0Cj4gPiBHb29nbGUgcHJveHkuCgpXaHkgd2VyZW4ndCB3ZSBqdXN0IHVzaW5nIHRoZSBk
ZWZhdWx0IHNldHRpbmdzIGluIHRoZSBmaXJzdCBwbGFjZT8gSSBtZWFuCmlmIHVwc3RyZWFtcyBi
YXNpY2FsbHkgb25seSB0ZXN0IHdpdGggZGVmYXVsdCBzZXR0aW5ncyBoZXJlIHRoZW4gdXNpbmcK
c29tZXRoaW5nIGRpZmZlcmVudCBzZWVtcyBwcm9ibGVtYXRpYyBpbiBnZW5lcmFsLgoKPiA+Cj4g
PiBUaGUgYmVzdCBhcHByb2FjaCBpcyBsaWtlbHkgdG8gYWRkIGEgQ29uZmlnLmluIG9wdGlvbjoK
PiA+Cj4gPiBTb21ldGhpbmcgbGlrZTogSE9TVF9HT19HT1BST1hZCj4gPgo+ID4gVGhlbiB3ZSBj
YW4gZGVmYXVsdCB0aGF0IHRvOiAiaHR0cHM6Ly9wcm94eS5nb2xhbmcub3JnLGRpcmVjdCIKPiA+
Cj4gPiBXaGljaCBpcyB0aGUgZGVmYXVsdCB2YWx1ZSBpbiB0aGUgR28gc291cmNlIGNvZGUuCj4g
Pgo+ID4gSSB0aGluayB0aGlzIHdvdWxkIGJlIHRoZSBiZXN0IGFwcHJvYWNoIGlmIHdlIGRvIHdh
bnQgdG8gZW5hYmxlCj4gPiBHT1BST1hZLiBUaGlzIHdheSwgdXNlcnMgdGhhdCBkb24ndCB3YW50
IHRvIHVzZSB0aGUgcHJveHkgY2FuIG92ZXJyaWRlCj4gPiBIT1NUX0dPX0dPUFJPWFkgdG8gImRp
cmVjdCIKPgo+IEJ1dCB0aGF0IGlzIGluZGVwZW5kZW50IG9mIHRoZSBjdXJyZW50IHByb2JsZW0g
d2UncmUgdHJ5aW5nIHRvIHNvbHZlCj4gd2l0aCB0YWlsc2NhbGUuCj4KPiA+IFdlIGNvdWxkIGtl
ZXAgaXQgYXMgImRpcmVjdCIgb25jZSB0aGlzIGlzc3VlIGlzIGNsb3NlZDoKPiA+IGh0dHBzOi8v
Z2l0aHViLmNvbS90YWlsc2NhbGUvdGFpbHNjYWxlL2lzc3Vlcy8xMjg1OQo+Cj4gU3RpbGwsIEkg
dGhpbmsgaXQncyBhIHByb2JsZW0gaWYgd2UgY2FuJ3QgZml4IHByb2JsZW1zIG9uIG91ciBzaWRl
IGFuZAo+IHRoYXQgd2UgaGF2ZSB0byB3YWl0IGZvciB1cHN0cmVhbSB0byBtYWtlIGEgbmV3IHJl
bGVhc2UuIEZvciBhbGwgb3RoZXIKPiBwcm9ibGVtcywgd2UgY2FuIGFwcGx5IGEgcGF0Y2ggaW4g
QnVpbGRyb290IHRoYXQgZ2V0cyB1cyBnb2luZyB1bnRpbAo+IHVwc3RyZWFtIGZpeGVzIHRoZSBw
cm9ibGVtIGFuZCBtYWtlcyBhIHJlbGVhc2UuIEkgd291bGQgbGlrZSB0byBoYXZlCj4gdGhlIHNh
bWUgYWJpbGl0eSB0byBmaXggR28gdmVuZG9yaW5nIGlzc3Vlcy4KClRvIG1lIGl0IHNvdW5kcyBs
aWtlIGp1c3Qgc3dpdGNoaW5nIHRvIHRoZSBkZWZhdWx0IEdPUFJPWFkgc2V0dGluZ3MKbWF5IGJl
IHRoZSBiZXN0IHNvbHV0aW9uIHNpbmNlIHRoYXQncyB0eXBpY2FsbHkgd2hhdCBtb3N0IHByb2pl
Y3RzIHVzZS4KClRoZXJlJ3MgcmVwb3J0cyB0aGF0IEdPUFJPWFk9ZGlyZWN0IGlzIGtpbmRhIGJy
b2tlbjoKaHR0cHM6Ly9kcmV3ZGV2YXVsdC5jb20vMjAyMS8wOC8wNi9nb3Byb3h5LWJyZWFrcy1n
by5odG1sCgo+Cj4gQ291bGQgeW91IGV4cGxhaW4gdG8gYSBHbyBpZ25vcmFudCBsaWtlIG1lIGhv
dyBpcyB0aGlzIHByb3h5IHRoaW5nCj4gaGVscGluZyBpbiBzb2x2aW5nIHRoaXMgaXNzdWU/IFNo
b3VsZCBhIHByb3h5IGp1c3QgInNwZWVkIHVwIiB0aGUKPiBkb3dubG9hZD8gV2h5IGRvZXMgaXQg
ZXhoaWJpdCBhIGRpZmZlcmVudCBiZWhhdmlvciBiZXR3ZWVuIGEKPiBHT1BST1hZPWRpcmVjdCBi
dWlsZCBhbmQgYSBHT1BST1hZPXNvbWV0aGluZ2Vsc2UgPwoKUHJlc3VtYWJseSB0aGUgcHJveHkg
YWN0cyBhcyBhIGNhY2hlIHdoaWNoIHByZXZlbnRzIGJyZWFrYWdlIGlmCnRoZSBkZXBlbmRlbmN5
IGRpcmVjdCBzb3VyY2UgY2hhbmdlcyBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgoKPgo+IFRoYW5r
cyEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywg
Qm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWlu
aW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
