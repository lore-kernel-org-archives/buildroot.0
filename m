Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA08C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 23:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBF2C852C6;
	Sun, 29 Oct 2023 23:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBF2C852C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAmgf_QJ8Vqe; Sun, 29 Oct 2023 23:42:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF190852C1;
	Sun, 29 Oct 2023 23:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF190852C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE0EF1BF308
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 23:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5B22435D4
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 23:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5B22435D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMR2XC0wxqG6 for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 23:42:20 +0000 (UTC)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 660494056E
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 23:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 660494056E
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-41cb76f3cf0so26533821cf.2
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 16:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698622939; x=1699227739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ysU77elVCRsT6VKjGBfih6htbVD+wCjncQrE0G1m/D4=;
 b=TMynE9lfUvgbEh+WrRosvK1yVLm5mpz/knFfBkHmfCQy+4V9r20VW2gVhaNeQRi9of
 PlOx/J67i6saBD0a7I6OAlVEPdRIMyBxmuGcv+mSW++4d/SsmuyJLvA3tNcYc2X2e/qU
 63g4SRwgISEI0knXzfrqCooUJSRz+YXCmubujka13g9Tc2SiIxRG14IEK790J54La6U2
 eO8MwdkOb04KWbkXesfSa5GnYCIkMV6QPKG143wJ/QVTxIADskQMzzzJYLVTHuicjwmV
 bl9Eg76ZgXpf533pq1ClI/dH5TX8pq34KJzt3W4buLMCLccN0+NnITynKZjCtF5T/yFN
 jQRg==
X-Gm-Message-State: AOJu0YwxWOs2XbIARnnhP6RCNxrqY2m7vy7sI2pFS9yMEDCsCHmmNXmP
 ncqlrSdO9lVayuAi3rd9twSxZfUYCkVk5dwiVUc=
X-Google-Smtp-Source: AGHT+IGaQmZyRF+jl8pFZ/HLcq+isYWLhQsUUat3vNKXt6BgQggHluaWi/OjWz54tCA3vdson0eRsmFgoqQrDP0H9/w=
X-Received: by 2002:a05:622a:1113:b0:417:b45b:84c7 with SMTP id
 e19-20020a05622a111300b00417b45b84c7mr11202837qty.19.1698622939091; Sun, 29
 Oct 2023 16:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231028102435.1771460-1-yegorslists@googlemail.com>
 <CAGm1_kt2d-MUxuoJ+LF_pnNeiXXWyFGzZ1XYwnTAnp84ff+FZg@mail.gmail.com>
 <CADvTj4pyC-HhUAK3iJ=zRAUaw0WRQv09n-7Y45v2L-nkwgv-Vg@mail.gmail.com>
 <CAGm1_kvXMmZwf16m0h3-EqiSHjDXu07kS1pJA3eMLP9BoyC4dA@mail.gmail.com>
In-Reply-To: <CAGm1_kvXMmZwf16m0h3-EqiSHjDXu07kS1pJA3eMLP9BoyC4dA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 29 Oct 2023 17:42:07 -0600
Message-ID: <CADvTj4od6Lxc=sYZhg1DJu2sOexV8+QvKdTue5Ua676CARfbnw@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698622939; x=1699227739; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ysU77elVCRsT6VKjGBfih6htbVD+wCjncQrE0G1m/D4=;
 b=F85FdFadRgOto+qLxjUwr742/Yt2Mq+BAOxvn/qQ9CJPL7NyKAskBvCjL8jdpt7WFl
 p0pk/jzD05HbW9HoX6N2/1MxOdBWpyZfndU3GSXcx51ApcTd7Jh43+JIYDCQ6nVLGj+Y
 c7Yd8MDIfpO4/cFk3FSAnyos3/VcvqAqCYedhx/z3Jd9xHabKWdovkOB04HldX2IAl2+
 CqhVxyBnQ8sLC07wxB4loXh/qhSpSmDl+spQfLeoJMKkr19Y9Rtqc5NcKuji64u9p5gY
 PAgh/0cDrA64XP/A1+0E3tPgDVmnMto8ozZ21U9ub3SgdgBtwEH2K12ipcILCTEKE1go
 7LVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F85FdFad
Subject: Re: [Buildroot] [RFC PATCH] package/pkg-python.mk: PEP517: add
 support for setuptools backend
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
Cc: adam.duskett@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBPY3QgMjksIDIwMjMgYXQgMjoxMuKAr1BNIFllZ29yIFllZnJlbW92Cjx5ZWdvcnNs
aXN0c0Bnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBKYW1lcywgYWxsLAo+Cj4gT24gU2F0
LCBPY3QgMjgsIDIwMjMgYXQgMTI6NDTigK9QTSBKYW1lcyBIaWxsaWFyZAo+IDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBTYXQsIE9jdCAyOCwgMjAyMyBhdCA0
OjMx4oCvQU0gWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPiB3cm90
ZToKPiA+Pgo+ID4+IEhpIGFsbCwKPiA+Pgo+ID4+IE9uIFNhdCwgT2N0IDI4LCAyMDIzIGF0IDEy
OjI14oCvUE0gPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPiA+PiA+Cj4gPj4g
PiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gPj4g
Pgo+ID4+ID4gU2luY2UgdmVyc2lvbiA0MS4wLjAsIHNldHVwdG9vbHMgaGFzIGFuIGV4cGVyaW1l
bnRhbCBQRVA1MTcgc3VwcG9ydC4KPiA+PiA+Cj4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZ
ZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gPj4gPiAtLS0KPiA+PiA+ICBw
YWNrYWdlL3BrZy1weXRob24ubWsgfCAyICstCj4gPj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4gPgo+ID4+ID4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcGtnLXB5dGhvbi5tayBiL3BhY2thZ2UvcGtnLXB5dGhvbi5tawo+ID4+ID4gaW5kZXggMjhl
ZTRjYjg1Zi4uMDBmNzFmNmIxOSAxMDA2NDQKPiA+PiA+IC0tLSBhL3BhY2thZ2UvcGtnLXB5dGhv
bi5tawo+ID4+ID4gKysrIGIvcGFja2FnZS9wa2ctcHl0aG9uLm1rCj4gPj4gPiBAQCAtMzAwLDcg
KzMwMCw3IEBAIGlmZXEgKCQkKCQoMilfU0VUVVBfVFlQRSksc2V0dXB0b29scy1ydXN0KQo+ID4+
ID4gICQoMilfREVQRU5ERU5DSUVTICs9IGhvc3QtcHl0aG9uLXNldHVwdG9vbHMtcnVzdAo+ID4+
ID4gIGVuZGlmCj4gPj4gPiAgZWxzZSBpZm5lcSAoJCQoZmlsdGVyIGZsaXQgbWF0dXJpbiBwZXA1
MTcsJCQoJCgyKV9TRVRVUF9UWVBFKSksKQo+ID4+ID4gLSQoMilfREVQRU5ERU5DSUVTICs9IGhv
c3QtcHl0aG9uLXB5cGEtYnVpbGQgaG9zdC1weXRob24taW5zdGFsbGVyCj4gPj4gPiArJCgyKV9E
RVBFTkRFTkNJRVMgKz0gaG9zdC1weXRob24tcHlwYS1idWlsZCBob3N0LXB5dGhvbi1pbnN0YWxs
ZXIgaG9zdC1weXRob24tc2V0dXB0b29scwo+ID4+ID4gIGlmZXEgKCQkKCQoMilfU0VUVVBfVFlQ
RSksZmxpdCkKPiA+PiA+ICAkKDIpX0RFUEVOREVOQ0lFUyArPSBob3N0LXB5dGhvbi1mbGl0LWNv
cmUKPiA+PiA+ICBlbmRpZgo+ID4+Cj4gPj4gVGhpcyBwYXRjaCBpcyBtb3JlIGEgd29ya2Fyb3Vu
ZCB0byBjb252ZXJ0IHN1Y2ggcGFja2FnZXMgYXMKPiA+PiBweXRob24tdG9ybmFkbywgcHl0aG9u
LWNvbmZpZ29iaiwgZXRjLiB0byBQRVA1MTcgaW5mcmFzdHJ1Y3R1cmUuIFRoZXNlCj4gPj4gcGFj
a2FnZXMganVzdCB1c2UgYSBidWlsZC1zeXN0ZW0gc2VjdGlvbiBhbmQgb3RoZXJ3aXNlIHJlbHkg
b24gdGhlCj4gPj4gc2V0dXAucHkgZmlsZToKPiA+Cj4gPgo+ID4gQXJlIHRoZXNlIGZhaWxpbmcg
dG8gYnVpbGQgd2l0aG91dCBQRVA1MTcgaW5mcmFzdHJ1Y3R1cmUgZm9yIHNldHVwdG9vbHM/Cj4K
PiBObywgdGhleSBhcmUgd29ya2luZyBhcyBleHBlY3RlZCBpbiBib3RoICJ3b3JsZHMiLgo+Cj4g
Pj4KPiA+PiBbYnVpbGQtc3lzdGVtXQo+ID4+IHJlcXVpcmVzID0gWyJzZXR1cHRvb2xzIl0KPiA+
PiBidWlsZC1iYWNrZW5kID0gInNldHVwdG9vbHMuYnVpbGRfbWV0YSIKPiA+Pgo+ID4+IFdoYXQg
aXMgdGhlIHBsYW4gdG8gc3VwcG9ydCB0aGlzIGJhY2tlbmQ/IEp1c3QgdXNlIHNldHVwdG9vbHMt
cnVzdCBvcgo+ID4+IGNvbnZlcnQgIl9TRVRVUF9UWVBFPXNldHVwdG9vbHMiIHRvIFBFUDUxNyBh
ZnRlciB0aGUgaW50cm9kdWN0aW9uIG9mCj4gPj4gUHl0aG9uIDEyLng/Cj4gPgo+ID4KPiA+IEkg
YWxyZWFkeSBoYXZlIGEgcGF0Y2ggY29udmVydGluZyBvdXIgc2V0dXB0b29scyBpbmZyYXN0cnVj
dHVyZSB0byBQRVA1MTc6Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAy
MzA5MzAxNTI1MTcuMTA3NzU3Ni0zLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCj4KPiBJIGhh
dmUgb3Zlcmxvb2tlZCB5b3VyIHNlcmllcy4gTWVhbndoaWxlLCBJIGNvdWxkIHRlc3QgaXQgKGFz
IHlvdSBoYXZlCj4gcHJvYmFibHkgc2VlbikgYW5kIHNvIGZhciwgYm90aCBteSBwYWNrYWdlcyBh
bmQgdG9ybmFkbyBjb3VsZCBiZQo+IHN1Y2Nlc3NmdWxseSBidWlsdC4gQnV0IGF0IHNvbWUgcG9p
bnQsIEkgcmFuIGFjcm9zcyB0aGUgcHl0aG9uLW1zZ3BhY2sKPiBpc3N1ZSwgd2hpY2ggeW91IGhh
dmUgYWxyZWFkeSB0cmllZCB0byBmaXguIEFyZSB5b3UgZ29pbmcgdG8gcG9zdCB2NAo+IG9mIHlv
dXIgc2VyaWVzIGNvbnRhaW5pbmcgdGhlIHB5dGhvbi1tc2dwYWNrIGZpeD8KClNlbnQgYXMgcGFy
dCBvZiB2NDoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9w
YXRjaC8yMDIzMTAyOTIzNDAwMy4yNjA2MDA2LTMtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8K
Cj4KPiBSZWdhcmRzLAo+IFllZ29yCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
