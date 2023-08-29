Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E688C83F12
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 17:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B44F5414D6;
	Tue, 29 Aug 2023 17:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B44F5414D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dtx6JxLBsT8V; Tue, 29 Aug 2023 17:09:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D72E0414C9;
	Tue, 29 Aug 2023 17:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D72E0414C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4ABBD1BF282
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 17:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23B8481434
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 17:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23B8481434
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9CTw2OstYFgg for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 17:09:26 +0000 (UTC)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08B1F81425
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 17:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08B1F81425
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5925e580e87so50101867b3.1
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 10:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693328965; x=1693933765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VzuJQ2zDkTTj6I1dEsTTdKiDlTKzMx+mCcxjn3/gfDo=;
 b=SB4KCrcb0g+nTUa1mIx0ZluGTdJlBMaU33XNQcWgDQ2CNstLW7E0CT9k79Zg6lBX5P
 cwrX+MY9crx9eCoHroxvhxzSnoBjJnhfEi2H7iJ9/lYjEN5nP8HCjBrG8Coc+N8lK2kr
 OltKeJ3OKaiZF2ooE1fbOsUMjoWUvgVqnhYzERkhh1nEOpucTImbDuqB5PQRLJ90wSnq
 Tw9E3Y1kNa44+VrYKvLFNG+2XBcZb+V2opnHEze+UKfdTVsLsDAxd5NNiBkBKHebjc87
 /0CCmicRlZLF745ZZC/yxGZH6IvbzAX5vdEmpmRnczhC6xpPsfrnIS6lKM9koyXr9g1W
 n2Fg==
X-Gm-Message-State: AOJu0Yxid+fWOhN+vrMro8MeJp0qARdPn2ucNjRy/UH6GCTT+Q6TGnYL
 XwiZButsKsPnufm88oaVqqn0+KhU2UwoboGwCI9WVQ==
X-Google-Smtp-Source: AGHT+IFgs2iAqvRwWFWZe8gEndXMhfsFit5TmV9C+LU+qVhxIlQBrxRakFt6oYvdYIEDLDZmv+irPCsOZwr9M4WHRXM=
X-Received: by 2002:a25:b986:0:b0:d1a:b59c:502d with SMTP id
 r6-20020a25b986000000b00d1ab59c502dmr25073857ybg.18.1693328964889; Tue, 29
 Aug 2023 10:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230528113042.585399-1-dario.binacchi@amarulasolutions.com>
 <20230728230159.6440c601@windsurf>
 <CABGWkvoEvH=4=OmPQHm5T1XMAQ11x-SixLpAxkUL1CUtUrF2_A@mail.gmail.com>
 <20230729230335.3cd59db6@windsurf> <20230813124037.GX421096@scaer>
 <20230813223923.008e4347@windsurf>
In-Reply-To: <20230813223923.008e4347@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 29 Aug 2023 19:09:14 +0200
Message-ID: <CABGWkvqo42HLq2PRYFqL8CefMBcw_2MX+25+_LaR2NRghHY5fA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693328965; x=1693933765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VzuJQ2zDkTTj6I1dEsTTdKiDlTKzMx+mCcxjn3/gfDo=;
 b=YDNX067pX5Y/cWLZfaxGNIioB8ht9jZ7bZkjv6xd7GRWlnNdQGfgEUgKpcFPPPM1R6
 e2HcGRV1DBsfPYwVWKdYyhrlcTbuGb9MOLLCAFMErFcDgoG3oTW8NHCLJ+wEB3bQQcnp
 IbUvzJ/DNKBYY7T9FmZd8+8s2OkWKB2qj+Mao=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YDNX067p
Subject: Re: [Buildroot] [RFC PATCH 1/1] package/automake: include .m4 files
 of autoconf-archive
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiBhbmQgVGhvbWFzLAoKT24gU3VuLCBBdWcgMTMsIDIwMjMgYXQgMTA6NDHigK9QTSBU
aG9tYXMgUGV0YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+
IEhlbGxvLAo+Cj4gT24gU3VuLCAxMyBBdWcgMjAyMyAxNDo0MDozNyArMDIwMAo+ICJZYW5uIEUu
IE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gPiBBZnRlciB0aGlu
a2luZyBhIGJpdCBvbiB0aGlzLCBoZXJlJ3Mgd2hhdCBJIHRoaW5rIHdlIHNob3VsZCB0cnk7Cj4g
Pgo+ID4gRm9yIHBhY2thZ2VzIHRoYXQgaGF2ZSBfQVVUT1JFQ09ORiA9IFlFUywgd2UgZm9yY2li
bHkgYWRkCj4gPiBob3N0LWF1dG9jb25mLWFyY2hpdmUgdG8gdGhlaXIgX0RFUEVOREVOQ0lFUywg
YW5kIGFsd2F5cyBzZXQgdGhlIG1hY3Jvcwo+ID4gc2VhcmNoIHBhdGggYXMgcHJvcG9zZWQgaGVy
ZS4gU3VwcG9zZWRseSwgaGF2aW5nIG1hY3JvcyBmcm9tCj4gPiBhdXRvY29uZi1hcmNoaXZlIGF2
YWlsYWJsZSBzaG91bGQgbm90IGJlIGEgY2F1c2UgZm9yIGZhaWx1cmUgdG8KPiA+IHN1Y2Nlc3Nm
dWxseSBhdXRvcmNvbmYsIG90aGVyd2lzZSB0aGF0IHdvdWxkIG5vdCB3b3JrIG9uIHJhbmRvbSBz
eXN0ZW1zCj4gPiB3aGljaCBoYXZlIGl0IGluc3RhbGxlZCBmb3Igb3RoZXIgcmVhc29ucywgbGlr
ZSBuYXRpdmUgYnVpbGRzIG9uCj4gPiBzdGFuZGFyZCBkaXN0cm9zOyBhbHNvLCBhIG1pc3Npbmcg
ZGlyZWN0b3JyeSBpbiB0aGUgbWFjcm8gc2VhcmNoIGxpc3QKPiA+IHNob3VsZCBub3QgYmUgYSBj
YXVzZSBmb3IgZmFpbHVyZS4KPiA+Cj4gPiBDb25zZXF1ZW50bHksIHdlIGNhbiBkcm9wIHRoZSBh
ZC1ob2MgZGVwZW5kZW5jaWVzIGluIHRoZSBpbmRpdmlkdWFsCj4gPiBwYWNrYWdlcywgYW5kIGRy
b3AgdGhlIGFkLWhvYyBpbmNsdWRlIGRpcmVjdG92ZSBhcyB3ZWxsLgo+ID4KPiA+IGhvc3QtYXV0
b2NvbmYtYXJjaGl2ZSBpcyBhIHBsYWluIGF1dG9jbmYgcGFja2FnZSwgd2l0aG91dCBkZXBlbmRl
bmNpZXMKPiA+IChzYXZlIGZvciB0aGUgYXV0b2NvbmYgbWFjaGluZXJ5KSwgYW5kIGl0IG9ubHkg
ZXZlciBpbnN0YWxscyBhIGJ1bmNoYQo+ID4gZmlsZXMsIGRvZXMgbm90IGNvbXBpbGUgYW55dGhp
bmcsIHNvIGl0IGlzIHByZXR0eSBmYXN0LiBBZGRpbmcgaXQgdG8gYWxsCj4gPiBhdXRvcmVjb25m
aWd1cmVkIHBhY2thZ2VzIHNob3VsZCBoYXZlIGEgbWluaW1hbCwgYmFyZWx5IG5vdGljZWFibGUK
PiA+IGltcGFjdCBvbiB0aGUgYnVpbGQgdGltZS4KPiA+Cj4gPiBJZiB0aGUgYWJvdmUgY2F1c2Vz
IHRvbyBtdWNoIGJyZWFrYWdlLCB0aGVuIGV2ZW4gdGhpcyBwYXRjaCB3YXMgZ29pbmcgdG8KPiA+
IGJlIGluY29ycmVjdCwgYXMgaXQgd291bGQgdW5jb25kaXRpb25hbGx5IGFkZCB0aGUgYXV0b2Nv
bi1hcmNoaXZlIHBhdGgKPiA+IHRvIHRoZSBzZWFyY2ggbGlzdCBmb3IgYWxsIHBhY2thZ2VzIHRo
YXQgaW5kaXJlY3RseSBoYXZlCj4gPiBhdXRvY29uZi1hcmNoaXZlIGluIHRoZWlyIGRlcGVuZGVu
Y2llcy4KPgo+IFdlIGhhdmUgMzM2IHBhY2thZ2VzIHRoYXQgc2V0IEFVVE9SRUNPTkYgPSBZRVMu
IE91dCBvZiB0aGVzZSAzMzYKPiBwYWNrYWdlcywgb25seSA4IG5lZWQgaG9zdC1hdXRvY29uZi1h
cmNoaXZlLgo+Cj4gVG8gbWUsIGl0IG1ha2VzIG5vIHNlbnNlIHRvIGFkZCBob3N0LWF1dG9jb25m
LWFyY2hpdmUgdG8gdGhvc2UgMzM2LTgKPiBwYWNrYWdlcyB0aGF0IG5lZWQgYXV0b3JlY29uZiwg
YnV0IGRvIG5vdCB1c2UgYW55IG9mIHRoZSBtYWNyb3MKPiBwcm92aWRlZCBieSBob3N0LWF1dG9j
b25mLWFyY2hpdmUuIE9uZSBvZiBCdWlsZHJvb3QncyBiZWF1dHkgaXMgaXRzCj4gbWluaW1hbGlz
bTogaXQgYnVpbGRzIG9ubHkgd2hhdCdzIG5lZWRlZCwgYW5kIGV2ZXJ5IHRpbWUgaXQgYnVpbGRz
Cj4gc29tZXRoaW5nLCB0aGVyZSBpcyBhIHNvbGlkIHJlYXNvbiBmb3IgaXQuIEkgd291bGQgcmVh
bGx5IGRpc2xpa2UgaWYgd2UKPiB3ZXJlIHRvIHN0YXJ0IGJ1aWxkaW5nIHVzZWxlc3MgZGVwZW5k
ZW5jaWVzLCBldmVuIGlmIGFkbWl0dGVkbHkKPiBob3N0LWF1dG9jb25mLWFyY2hpdmUgaXMgc21h
bGwgYW5kIHF1aWNrIHRvIGJ1aWxkLiBCdXQgc21hbGwgYW5kIHF1aWNrCj4gdG8gYnVpbGQgaXMg
bm90IHRoZSBvbmx5IHRoaW5nLCBpdCdzIGFsc28gYWJvdXQgd2hldGhlciBpdCBtYWtlcyBzZW5z
ZS4KPiBJIHJlZ3VsYXJseSBzdGFyZSBhdCBteSBidWlsZCBnb2luZyBvbiwgYW5kIHdoZW4gc29t
ZXRoaW5nIGdldHMgYnVpbHQKPiB0aGF0IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgaXRzIGdldHMg
cHVsbGVkIGludG8gdGhlIGJ1aWxkLCBJIGNoZWNrCj4gd2l0aCAibWFrZSBncmFwaC1kZXBlbmRz
IiB3aHkgaXQgaXMgdGhlcmUsIGFuZCBzb21ldGltZXMgaW52ZXN0aWdhdGUKPiBmdXJ0aGVyIHRv
IG1ha2Ugc3VyZSB0aGVyZSdzIGEgZ29vZCBqdXN0aWZpY2F0aW9uLiBUbyBtZSwgdGhpcyBpcyBh
bgo+IGltcG9ydGFudCBwcm9wZXJ0eSBvZiBCdWlsZHJvb3QsIGFuZCBJIHdvdWxkIHJlYWxseSBs
aWtlIHRvIGtlZXAgdGhpcwo+IGFzcGVjdCBvZiBCdWlsZHJvb3QuCj4KPiBFc3BlY2lhbGx5LCBJ
IGRvbid0IHNlZSB3aGF0IHByb2JsZW0gd2Ugd291bGQgc29sdmUgYnkgbWFraW5nCj4gaG9zdC1h
dXRvY29uZi1hcmNoaXZlIGEgZGVwZW5kZW5jeSBvZiBhbGwgcGFja2FnZXMgdGhhdCBkbyBBVVRP
UkVDT05GID0KPiBZRVMuIFdoYXQgcHJvYmxlbSB3b3VsZCB0aGlzIHNvbHZlPwo+CgpJIGFtIGF2
YWlsYWJsZSB0byBhcHBseSB0aGUgY2hhbmdlcyBzdWdnZXN0ZWQgYnkgVGhvbWFzIGluIG9yZGVy
IHRvCnN1Ym1pdCB2ZXJzaW9uIDIKb2YgdGhlIHBhdGNoLiBBbHRlcm5hdGl2ZWx5LCBkbyB5b3Ug
dGhpbmsgaXQncyBiZXR0ZXIgdG8gc3RvcCBoZXJlIGFuZApub3QgcHJvY2VlZCBmdXJ0aGVyPwpB
cyBmYXIgYXMgSSdtIGNvbmNlcm5lZCwgdGhpcyBzb2x1dGlvbiBjb252aW5jZXMgbWUsIGJ1dCBJ
IGFsc28gYWRtaXQKdGhhdCBJIGRvbid0IGhhdmUgYQpjb21wbGV0ZSB1bmRlcnN0YW5kaW5nIG9m
IHRoZSB0b3BpYyBhbmQgaXRzIGltcGxpY2F0aW9ucy4KClRoYW5rcyBhbmQgcmVnYXJkcywKCkRh
cmlvCgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywg
Qm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWlu
aW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3Ig
RW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25z
LmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRp
b25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpU
LiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxh
c29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
