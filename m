Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0D6C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 15:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAC8840273;
	Tue, 23 Jul 2024 15:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvZx-BXIkpSl; Tue, 23 Jul 2024 15:12:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54A91402AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54A91402AB;
	Tue, 23 Jul 2024 15:12:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3871BF2A7
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 15:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2957940374
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 15:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7_4oad5Xagu for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 15:12:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B75EE402F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B75EE402F5
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B75EE402F5
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 15:12:41 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-70388567d24so3132742a34.0
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721747560; x=1722352360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P3oyuVA6Q2zu3QNI5kpetLQPNC5Gj39qnqZONu+YDSM=;
 b=VLFG5vLZjujIBshI+LvCUAKcYS8zBqZ8GlwOCFY59xfmgLDRg3OIOOD5UDUkoZFtGo
 oA7pLUtXB9sY31wd3t7pAFMjVvz2htxLdhQpieFGiHClxZNKefP5wRIBJqyJhrn3N/ab
 oPEssEG1iLRBEWSRMjeJOvxxcGldnGmZ0RydLgxB3zzXkProrpL5dgpMaQNj9/pBkJ0m
 sAYK0EATJqGSk/7znEYxY+EvzFvR3QTF6kXKRkjt0dHigeJgH/P8pE9g4WOo1eyiwK/Y
 FQ0NyJjrzf3Uah5ocv1ryC7OVPa59LXjQkz0bhwsq+Y+GiWfFf16di6W05DJDwQNfq9+
 bUng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDAdIuYkW+sF8ykmn1akKhPDHVZAYeaam+RmExAMkLLwPDdThkIdVBjdAmqc2VFKEqYZ3b3QEXD3jw8wW7eMuApPy1r5yRAQ==
X-Gm-Message-State: AOJu0YzfZWtQuSAgQwGwItkgotboziSl2doIG68Ow7SkQH+kNoeYnawf
 /A2FEOwhPwI83vsKdBfrbX8e1cvFj8KnukvfzjsNo9NiG/46D0ITWwfcvjLlVS26OKC9vGdKvQq
 DwPsc14HOObaRdwy1zskg9T3hZsTklD0JUgU=
X-Google-Smtp-Source: AGHT+IHg2IokwrkB7lDhi15skDm10tE1DIL5TqwFhJaLBDFOQOU2jt4zSsl7lyqp1qnpY0bDugHOlinWqR7AWON22Qs=
X-Received: by 2002:a05:6830:2110:b0:704:4845:463d with SMTP id
 46e09a7af769-709009cfdcamr13030246a34.34.1721747560461; Tue, 23 Jul 2024
 08:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <170715461915.13905.5968173515742280918-0@git.sr.ht>
 <170715461915.13905.5968173515742280918-1@git.sr.ht>
 <20240722145236.4e7ec0bf@windsurf>
 <99a9d884-8052-4128-8f4e-f68517d80a65@bubu1.eu>
 <20240722180634.0bb07726@windsurf>
 <CADvTj4o7gnjhSheMmrd5Dp-6Wug4ohBoRFpJb+Q4R8ow=KeH3g@mail.gmail.com>
 <20240722183829.76708213@windsurf>
 <CADvTj4rwUSVjWAN-5ekBg0tXWO=QzkOkOMTVhfcdjmgQ1KXn=A@mail.gmail.com>
 <b2385554-a98b-4bc2-9c30-d893eb407ff9@bubu1.eu>
In-Reply-To: <b2385554-a98b-4bc2-9c30-d893eb407ff9@bubu1.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 23 Jul 2024 09:12:29 -0600
Message-ID: <CADvTj4q=LavfGR4=+jTJ3P+fGJSme-PRc18rNwPew+0836SLeg@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721747560; x=1722352360; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P3oyuVA6Q2zu3QNI5kpetLQPNC5Gj39qnqZONu+YDSM=;
 b=lj82CPsaFGapitAS7j4S7uBlOLbB0SFd5DYisNOzOm09mk9LJRO1B1bOnhSC7uPb2w
 5M5Atz6ktNlUQi8iR/V4AdQ8fpd7TjRvteBrEYI6v2UJTXr/8//JuvOqGgGfnuW45Fd7
 OhpBKZLBkyIsjuU8uf9vVprK4Gv1z5tE/3v9NMXCVunYDQXQtFIdlw6wrUNSc6/0YG18
 BYGl8htkncYolqeBv64wRnBvO1ORLWZTUuuReJ7Pd/iTyEp59zTbs94owdNNx4EDd35W
 FlaQwg//Ii2plZTky/Gr0ia3xEcsfDftcz4ftHPugkgZeD827Xxkj8dlJKpUhkf6cvHC
 vhsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lj82CPsa
Subject: Re: [Buildroot] [PATCH buildroot v2 2/2] support/testing: add
 fastapi runtime test
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
Cc: Asaf Kahlon <asafka7@gmail.com>, ~bubu <bubu@git.sr.ht>,
 ~bubu <bubu@bubu1.eu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdWwgMjMsIDIwMjQgYXQgNDoyMeKAr0FNIE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRy
b290QGJ1YnUxLmV1PiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMjIuMDcuMjQgMTk6MjEsIEphbWVz
IEhpbGxpYXJkIHdyb3RlOgo+ID4gT24gTW9uLCBKdWwgMjIsIDIwMjQgYXQgMTA6MzjigK9BTSBU
aG9tYXMgUGV0YXp6b25pCj4gPiA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6
Cj4gPj4KPiA+PiBPbiBNb24sIDIyIEp1bCAyMDI0IDEwOjExOjMxIC0wNjAwCj4gPj4gSmFtZXMg
SGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4+PiBX
ZSBoYXZlIHNvbWUgdXBkYXRlcyB0byBweWRhbnRpYy1jb3JlL3B5ZGFudGljIHBlbmRpbmc6Cj4g
Pj4+Pgo+ID4+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9v
dC9wYXRjaC8yMDI0MDcxOTA0MzczOS4zMjQxMzcyLTEtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bS8KPiA+Pj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3Qv
cGF0Y2gvMjAyNDA3MTkwNDI2MzIuMzIyNzI0Mi0xLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20v
Cj4gPj4+Pgo+ID4+Pj4gKEkgd2FzIGFib3V0IHRvIG1lcmdlIHRoZW0pCj4gPj4+Pgo+ID4+Pj4g
Tm90IHN1cmUgaWYgdGhleSBhcmUgcmVsYXRlZCAvIHNvbHZlIHRoZSBpc3N1ZT8KPiA+Pj4KPiA+
Pj4gVGhlc2Ugc2V0dXB0b29scy9zZXR1cHRvb2xzLXJ1c3QvbWF0dXJpbiBwYXRjaGVzIG1pZ2h0
IGFsc28gaGVscDoKPiA+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1
aWxkcm9vdC9wYXRjaC8yMDI0MDcxOTA0NTYzOS4zMzM2NTQxLTEtamFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbS8KPiA+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxk
cm9vdC9wYXRjaC8yMDI0MDcxOTA1MDEzNC4zMzM4MTE3LTEtamFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbS8KPiA+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9v
dC9wYXRjaC8yMDI0MDcxOTA1MjcwMC4zNDI3ODMwLTEtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bS8KPiA+Pgo+ID4+IEkgYXBwbGllZCB0aGVtLiBCdXQgY291bGQgd2UgaGF2ZSBzb21lIGJldHRl
ciBhbnN3ZXIgdGhhbiAibWlnaHQgYWxzbwo+ID4+IGhlbHAiPyBMaWtlIGFjdHVhbGx5IHRlc3Rp
bmcgd2hpY2ggdGhpbmcgaXMgZml4aW5nIHdoYXQ/Cj4gPgo+ID4gV2VsbC4uLnRob3NlIGFyZSBh
bGwgaW4gdGhlIGJ1aWxkIGRlcGVuZGVuY3kgdHJlZSBmb3IgcHlkYW50aWMtY29yZSwgc28KPiA+
IEkgaWYgdGhlcmUgd2FzIHNvbWV0aGluZyB0aGVyZSB0aGF0IG5lZWRlZCB0byBiZSB1cGRhdGVk
IHdhcyB0aGlua2luZyB0aGF0Cj4gPiBtaWdodCBoZWxwLgo+Cj4gSXQncyBzdGlsbCBmYWlsaW5n
IGFmdGVyIGFsbCB0aGUgYnVtcHMgYnV0IHJldmVydGluZwo+IGExNGM4NjJjMDg4NjVlMDUzZDVm
Y2U5MGEwZDAzMjNiOGY5ZTRiYzAKPiAiQ3JlYXRlIGEgLmdpdGlnbm9yZSBmaWxlIGluIHRoZSBD
QU5PTklDQUxfTyBkaXJlY3RvcnkiIGZpeGVzIGl0Lgo+Cj4gRm91bmQgYSBoaW50IGhlcmUKPiBo
dHRwczovL2dpdGh1Yi5jb20vY29uZGEtZm9yZ2UvcHlkYW50aWMtY29yZS1mZWVkc3RvY2svcHVs
bC84Mi9jb21taXRzL2Y1YzA5MDljNzlkZmYzNTZjNTUyYjZkYWNmOWRkNjJhNjIwMTNjNmEjZGlm
Zi1mMzcyNWE1NWJmMzM5NTk1YmY4NjVmZWM3M2JkYThhYzk5ZjI4M2IwODEwYzIwNTQ0MjAyMWYy
OWMwNmVlYTlhUjE3LVIyMAo+Cj4gQW5kIGFsc28gc29tZW9uZSBzZW50IGEgbWFpbCB0byB0aGUg
bGlzdCB0b2RheSBjb21wbGFpbmluZyBhYm91dCBhCj4gc2ltaWxhciBwcm9ibGVtLgo+Cj4gU28g
dGhlIGN1bHByaXQgc2VlbXMgdG8gYmUgaHR0cHM6Ly9naXRodWIuY29tL1B5TzMvbWF0dXJpbi9p
c3N1ZXMvMTkxMQoKSG1tLCBzbyB0aGlua2luZyB0aGlzIGlzIG1heWJlIGEgc2ltaWxhciBpc3N1
ZSB0byB0aGlzIHBvZXRyeSBidWcgSQpoYWQgZml4ZWQgYSB3aGlsZSBiYWNrOgpodHRwczovL2dp
dGh1Yi5jb20vcHl0aG9uLXBvZXRyeS9wb2V0cnktY29yZS9wdWxsLzYxMQoKPgo+IE1hcmN1cwo+
Cj4gPgo+ID4+Cj4gPj4gVGhvbWFzCj4gPj4gLS0KPiA+PiBUaG9tYXMgUGV0YXp6b25pLCBjby1v
d25lciBhbmQgQ0VPLCBCb290bGluCj4gPj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZyBhbmQgdHJhaW5pbmcKPiA+PiBodHRwczovL2Jvb3RsaW4uY29tCj4gPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
