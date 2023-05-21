Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44D0C77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 18:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5831C822A3;
	Sun, 21 May 2023 18:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5831C822A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UIS3hpdgwp7w; Sun, 21 May 2023 18:36:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FE098225A;
	Sun, 21 May 2023 18:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FE098225A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4795E1BF3C2
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 18:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2752D60FA2
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 18:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2752D60FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b6C0nI3no_YR for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 18:36:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 243E160B5A
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 243E160B5A
 for <buildroot@buildroot.org>; Sun, 21 May 2023 18:36:15 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-561f10b6139so34029247b3.2
 for <buildroot@buildroot.org>; Sun, 21 May 2023 11:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684694174; x=1687286174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f0kLdXcwM9Bx98eOFDiqZ656uqC5aELj2jLKLwYqQng=;
 b=RpVsCbmJZCgvuHumZuk+01Q9DaDH1DxuSNZqAkPyzrsU+eUjqPVSi0neOvfoUP1TUm
 JaOA48FxpYAECAPG1WjCmJ5S38FaTmnhu2BHAlwra3yUN6xQ1sBa2OE71uBhcLPJLTb2
 VC/vZdDHNK+9SyQyvnDjrfLXGh1J6maP8X5nr2NvdP0yk6MDGFyyHUGrqX4ugjvMGbra
 TDK/R5GXcZu5h9LsbZHJqB5nAzw3JiutUJEm+3lrk9S+W3TZ3JbfonqGGSLWuONOvRMA
 GaoLoS+RzdeIs7Jsd4Bo+AneCd0/dhZaqDawU1SH9KeHgDBXikR4NEOMshJQoGP9kr4R
 RD6w==
X-Gm-Message-State: AC+VfDwTjON8kM5+HFkgvOp7EDkExs40FBCOK6ox3iGH34G+WR3cFwsB
 zyOxsHAlmPu638TogyC6LVxMkszEE4PXnwYopyqAFAghvBZcm/DJOdHGxQ==
X-Google-Smtp-Source: ACHHUZ51WtOdxEJyZ+npbw1mVW6mx8P9AaZLdi+QAZr4abAZbDmDTMR6JMEcSQF4uZ/8JbHMhPtLrRV9zH4qa1GJVWQ=
X-Received: by 2002:a0d:e288:0:b0:545:637c:3ed7 with SMTP id
 l130-20020a0de288000000b00545637c3ed7mr8876076ywe.1.1684694174019; Sun, 21
 May 2023 11:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230520210153.3944842-1-dario.binacchi@amarulasolutions.com>
 <20230521151038.GA171618@scaer> <20230521151644.GC171618@scaer>
In-Reply-To: <20230521151644.GC171618@scaer>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 21 May 2023 20:36:02 +0200
Message-ID: <CABGWkvo-xhQAJWc2+Jqn=ni-kzH7fqqzOnzwkGLVhe7_wn2GWQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684694174; x=1687286174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f0kLdXcwM9Bx98eOFDiqZ656uqC5aELj2jLKLwYqQng=;
 b=Fce63y7tJUpvcq9h0ywVpd532j8goGvmHHr7fg5n1IGLVV2YQOufDBzL1wGqdhUiia
 VpyTHlV/cUGYzgBCL1zskqTDSmSKxDtwP5SC5oPZB8Sq3XJp511LEE5RIXj9HDqWFNHf
 byHVP8OddlpK5WNfmaITaI4GKEh7NIWMff214=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Fce63y7t
Subject: Re: [Buildroot] [PATCH 1/1] package/libmnl: fix build failure
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
Cc: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFN1biwgTWF5IDIxLCAyMDIzIGF0IDU6MTbigK9QTSBZYW5uIEUuIE1PUklO
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBEYXJpbywgQWxsLAo+Cj4gT24g
MjAyMy0wNS0yMSAxNzoxMCArMDIwMCwgWWFubiBFLiBNT1JJTiBzcGFrZSB0aHVzbHk6Cj4gPiBE
YXJpbywgQWxsLAo+ID4KPiA+IE9uIDIwMjMtMDUtMjAgMjM6MDEgKzAyMDAsIERhcmlvIEJpbmFj
Y2hpIHNwYWtlIHRodXNseToKPiA+ID4gVGhlIGFkZGVkIHBhdGNoIGlzIGFuIGFkYXB0YXRpb24g
b2YgdGhlIG9uZSBzdWJtaXR0ZWQgdG8gdGhlIGxpYm1ubAo+ID4gPiBwcm9qZWN0Lgo+ID4gPgo+
ID4gPiBGaXhlczoKPiA+ID4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0
cy8zNmMxNjE5YzhiMDJlZmVhZjljYWViYWU4YmI1YzNlYjhhMjYyMzhiLwo+ID4gPiAtIGh0dHA6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzE1ZjZkYzEwM2VlYzdiZGViNTAyMGFj
YmMwYWU5OWRjOTdjMDBlNGUvCj4gPgo+ID4gVGhvc2UgZmFpbHVyZXMgYXJlIGR1ZSB0byBpbXBy
b3BlciBkZXBlbmRlbmN5IG9uIGtlcm5lbCBoZWFkZXJzOgo+ID4gICAtIElGTEFfQ0FOX1RFUk1J
TkFUSU9OICAgICAgICAtPiBpbnRyb2R1Y2VkIGluIDQuMTEKPiA+ICAgLSBDQU5fQ1RSTE1PREVf
RkQgICAgICAgICAgICAgLT4gaW50cm9kdWNlZCBiZWZvcmUgdGhhdAo+ID4gICAtIENBTl9DVFJM
TU9ERV9GRF9OT05fSVNPICAgICAtPiBpbnRyb2R1Y2VkIGJlZm9yZSB0aGF0Cj4gPiAgIC0gQ0FO
X0NUUkxNT0RFX1BSRVNVTUVfQUNLICAgIC0+IGludHJvZHVjZWQgYmVmb3JlIHRoYXQKPiA+Cj4g
PiBTbyBsaWJtbmwgbmVlZHMgdG8gZ2FpbiBhIGRlcGVuZGVuY3kgb24ga2VybmVsIGhlYWRlcnMg
YXQgbGVhc3QgNC4xMTsKPgo+IEFoLCBpdCdzIGluIGZhY3QganVzdCB0aGUgbmV3IENBTiB0b29s
IHRoYXQgbmVlZHMgdGhhdCBkZXBlbmRlbmN5LCBzbyBpdAo+IG5lZWRzIG5vdCBiZSBwcm9wYWdh
dGVkLCBzb3JyeS4KPgo+IFN0aWxsLCB0aGUgcHJvcGVyIHdheSBpcyB0byBhZGQgYSBkZXBlbmRl
bmN5IG9uIGtlcm5lbCBoZWFkZXJzID49IDQuMTEKPiBmb3IgdGhlIGxpYm1ubCBleGFtcGxlcy4K
CkluIHRoZSBsaWJtbmwgcmVwb3NpdG9yeSwgdGhlcmUgYXJlIGNvbW1pdHMgYWRkaW5nIGtlcm5l
bCBoZWFkZXJzIHRvIGF2b2lkCmRlcGVuZGVuY3kgaXNzdWVzLiBUaGUgQ0FOIGhlYWRlciB3YXMg
bWlzc2luZyBiZWNhdXNlIHRoZSBhZGRlZCBleGFtcGxlCndhcyB0aGUgZmlyc3Qgb25lIHJlbGF0
ZWQgdG8gQ0FOLiBJdCdzIHdvcnRoIG5vdGluZyB0aGF0IGV2ZW4gdGhlCmNhbi11dGlscyBwYWNr
YWdlCnN5bmNocm9uaXplcyBpdHMgaW50ZXJuYWwgaGVhZGVycyB3aXRoIHRoZSBrZXJuZWwgaGVh
ZGVycyB3aGVuZXZlciB0aGV5IGNoYW5nZS4KSW4gZmFjdCwgaW4gdGhlIGNhbi11dGlscyBwYWNr
YWdlIGluIGJ1aWxkcm9vdCwgdGhlcmUgYXJlIG5vCmRlcGVuZGVuY2llcyBvbiBrZXJuZWwKaGVh
ZGVycy4gSWYgeW91IGFncmVlLCBJIHdvdWxkIHdhaXQgdG8gdmVyaWZ5IGlmIHRoZSBwYXRjaCBJ
IHN1Ym1pdHRlZAp0byBsaWJtbmwgaXMKYWNjZXB0ZWQuIElmIGl0IGlzLCB3ZSBjYW4gYXBwbHkg
b25seSB0aGF0IHBhdGNoLgoKV2hhdCBkbyB5b3UgdGhpbms/CgpUaGFua3MgYW5kIHJlZ2FyZHMs
CkRhcmlvCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiAtLQo+IC4tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAv
IlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1
NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAg
ICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFH
QUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEt
Z2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4g
IHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwoKCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5p
b3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRp
b25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29s
dXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElU
CgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFy
dWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
