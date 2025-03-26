Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59975C36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 12:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E83E041380;
	Wed, 26 Mar 2025 12:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDWORybup5OQ; Wed, 26 Mar 2025 12:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17A164179C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17A164179C;
	Wed, 26 Mar 2025 12:24:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A6201B8
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 12:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C4594179C
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 12:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7jhAksNQM5n for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 12:24:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.216.53;
 helo=mail-pj1-f53.google.com; envelope-from=maxime.leroys@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8327B41380
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8327B41380
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8327B41380
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 12:24:51 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3031354f134so7992212a91.3
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 05:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742991891; x=1743596691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sno9Bzwfpr6HJ24b+9A8JRPsIWvxyYWbs4jh7ikpARc=;
 b=sLVRoIX4sjg8YzpUb1H4ztV8wklLIDE2F7gNwCiqYyheE51kiPjjBVuyhptxbrlhu+
 P+lA686L/wqfYZK9DMxTgaXf7d67BykTUEuz6uq5tK1YHpxRXU+btz5a0SMwDQVGsFSv
 /iAN8YBd71zAA1dGFQfaSGcVD1+WS08WdT8h8cEdsl43Jgi0GIBmZ5zd5aNWdQBA6gKM
 Z161nm2l/aYHcnFl7gj1SUeA+bsAVF5pAuXjWnxw4CvvY6dW8lR6i6HZpxNUizgFwr9q
 VB5O3Fv1wktXV+UbnaCAUtAtS8lQ9vaiUa+xlVYHgOqgzRtJnhIhsP/oVsvnHuUzMFwP
 hePw==
X-Gm-Message-State: AOJu0YzBZRyTpst0MGdK4oUv7xBA3XjWqtDBE2f7+mlWmLrkfUocaZD0
 4gSOP+F/P9ie85OY/0laIUfpQvRX29MT4w+aqWYiRmPu7v2OO0mi8KG81y6iOMpUMVRvMXisw5o
 Tfu8gw+lnFpa963t/ejYiW+RbhGI=
X-Gm-Gg: ASbGncsJlv9S32xhqCdyA/rhtvy6BEx+hcdm6srVrsd5rK9P007fBVANkyAX6s5wBtl
 GsE/YyO/nLl8S1+D5HpO1F9V33RARtiywSQzVEe58LyvzUsKruWqs8UeKwudq0BG9hSxB75tEoU
 P4+ERp5zL9XjmJ8Fltpf9FzqU=
X-Google-Smtp-Source: AGHT+IExJMun0Tp5NctrXzvcZWFRpmubxHKSdSnfslyfFqjzKYNZ5IEtCbvt77T87BCoOui3mrWsPNLjbYjHJX7F9Fg=
X-Received: by 2002:a17:90a:ec8c:b0:2ff:6e72:b8e9 with SMTP id
 98e67ed59e1d1-3030fee7104mr34916876a91.25.1742991890693; Wed, 26 Mar 2025
 05:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250326111651.23707-1-maxime@leroys.fr>
 <20250326111651.23707-2-maxime@leroys.fr>
 <la7npnj2anu62uqhucuhrig7w3n4h4ta32nrwwzjuf6h7uaubp@fxxjoqq3fojj>
In-Reply-To: <la7npnj2anu62uqhucuhrig7w3n4h4ta32nrwwzjuf6h7uaubp@fxxjoqq3fojj>
From: Maxime Leroy <maxime@leroys.fr>
Date: Wed, 26 Mar 2025 13:24:39 +0100
X-Gm-Features: AQ5f1Jo13eOqhMpf899ZMC_twqBxLuQsBkJh7gjUhR8-4GB8UriNGY6YA0t3ik0
Message-ID: <CAHHRULVxhQ4wLnaj54VBrNUyxDwDrY+aHAaQQf96GxDWU_ALYA@mail.gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Robin Jarry <robin@jarry.cc>,
 Julien Olivain <ju.o@free.fr>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
Subject: Re: [Buildroot] [PATCH 2/2] package/grout: new package
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

SGkgVmluY2VudCwKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCkxlIG1lci4gMjYgbWFycyAyMDI1
IMOgIDEyOjI2LCBWaW5jZW50IEphcmRpbiA8dmphcmRpbkBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4K
PiBIaSBNYXhpbWUsCj4KPiBzZWUgYmVsb3cKPgo+IEkgYW0gbm90IGNvbmZvcnRhYmxlIHdpdGgg
dGhlIENvbmZpZy5pbidzIHNlbGVjdC9kZXBlbmQgeWV0LCBzbyBJJ2QgcHJlZmVyIHRvCj4gbGVh
dmUgdGhvc2UgY29tbWVudHMgZm9yIHNvbWUgQnVpbGRyb290J3MgbWFpbnRhaW5lcnMuCj4KPiBP
biBXZWQsIE1hciAyNiwgMjAyNSBhdCAxMjoxNjo1MVBNICswMTAwLCBNYXhpbWUgTGVyb3kgd3Jv
dGU6Cj4gPiBHcm91dCBpcyBhIEdyYXBoIHJvdXRlciBiYXNlZCBvbiBEUERLLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IE1heGltZSBMZXJveSA8bWF4aW1lQGxlcm95cy5mcj4KPiA+IC0tLQo+ID4g
IERFVkVMT1BFUlMgICAgICAgICAgICAgICB8ICAzICsrKwo+ID4gIHBhY2thZ2UvQ29uZmlnLmlu
ICAgICAgICB8ICAxICsKPiA+ICBwYWNrYWdlL2dyb3V0L0NvbmZpZy5pbiAgfCAxMyArKysrKysr
KysrKysrCj4gPiAgcGFja2FnZS9ncm91dC9ncm91dC5oYXNoIHwgIDIgKysKPiA+ICBwYWNrYWdl
L2dyb3V0L2dyb3V0Lm1rICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICA1IGZp
bGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9ncm91dC9Db25maWcuaW4KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ncm91
dC9ncm91dC5oYXNoCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ3JvdXQvZ3JvdXQu
bWsKPiA+Cj4gPiArKysgYi9wYWNrYWdlL2dyb3V0L2dyb3V0Lmhhc2gKPiA+IEBAIC0wLDAgKzEs
MiBAQAo+ID4gKyMgTG9jYWxseSBjb21wdXRlZDoKPiA+ICtzaGEyNTYgIDEwZjhlMjBiNGFhMWE4
ZmU5MjhjODdiMjQ5ZTIzMjY3ZWVmMzU2ZjM5YjA0OTk0YTBiODhiNTI5MzFmY2FhNGIgIHYwLjgu
NC50YXIuZ3oKPgo+IFlvdSBuZWVkIHRvIGFkZCB0aGUgTElDRU5TRSdzIGhhc2ggdG9vLgoKSSB3
aWxsIGFsc28gYWRkIFJFQURNRSBoYXNoIHRvby4KCj4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2dyb3V0L2dyb3V0Lm1rIGIvcGFja2FnZS9ncm91dC9ncm91dC5tawo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLjBkNmZiOGRjZTkKPiA+IC0tLSAvZGV2L251
bGwKPiA+ICsrKyBiL3BhY2thZ2UvZ3JvdXQvZ3JvdXQubWsKPiA+IEBAIC0wLDAgKzEsMjQgQEAK
PiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4gKyMKPiA+ICsjIGdyb3V0Cj4gPiArIwo+
ID4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPiArCj4gPiArR1JPVVRfVkVSU0lPTiA9IDAu
OC40Cj4gPiArR1JPVVRfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9EUERLL2dyb3V0L2FyY2hp
dmUvcmVmcy90YWdzCj4gPiArR1JPVVRfU09VUkNFID0gdiQoR1JPVVRfVkVSU0lPTikudGFyLmd6
Cj4gPiArR1JPVVRfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+ID4gK0dST1VUX0xJQ0VOU0VfRklM
RVMgPSBMSUNFTlNFCj4gPiArCj4gPiArIyBBdm9pZCB1c2luZyBidWlsZHJvb3QgY29tbWl0IGhh
c2gKPiA+ICtHUk9VVF9DT05GX0VOViArPSBHUk9VVF9WRVJTSU9OPSQoR1JPVVRfVkVSU0lPTikK
PiA+ICsKPiA+ICtHUk9VVF9ERVBFTkRFTkNJRVMgPSBcCj4gPiArICAgICBob3N0LXBrZ2NvbmYg
XAo+ID4gKyAgICAgZHBkayBcCj4gPiArICAgICBsaWJldmVudCBcCj4gPiArICAgICBudW1hY3Rs
IFwKPiA+ICsgICAgIGxpYmVjb2xpIFwKPiA+ICsgICAgIHV0aWwtbGludXgKPiA+ICsKPiA+ICsk
KGV2YWwgJChtZXNvbi1wYWNrYWdlKSkKPgo+IFNpbmNlIERQREsgaXMgYSBjb21wbGV4IHRvcGlj
LCB3aWxsIHlvdSBhZGQgYSBHcm91dCBiYXNpYyBjaGVjay90ZXN0IGp1c3QKPiBsaWtlIGl0IHdh
cyBkb25lIGZvciBEUERLIHRvbyA/CgpZZXMgaXQncyBteSBuZXh0IHRhc2suIEkgd2lsbCBkbyB0
aGF0IGludG8gYW4gb3RoZXIgc2VyaWUuCgpSZWdhcmRzLAoKTWF4aW1lCgo+Cj4gVGhhbmtzLAo+
ICAgVmluY2VudAoKCgotLSAKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNYXhpbWUg
TGVyb3kKbWF4aW1lQGxlcm95cy5mcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
