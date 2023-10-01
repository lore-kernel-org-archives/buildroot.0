Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDEFE748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 08:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E867741723;
	Sun,  1 Oct 2023 08:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E867741723
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Jjw9JI_d4Gh; Sun,  1 Oct 2023 08:41:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28201401B1;
	Sun,  1 Oct 2023 08:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28201401B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A424E1BF5D7
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 08:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C17141DE0
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 08:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C17141DE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZeMRD9jMmJON for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 08:41:31 +0000 (UTC)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FDA441DD9
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 08:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FDA441DD9
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-4180d962b68so84697711cf.1
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 01:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696149690; x=1696754490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHlVw/lAxsYO00vz6c12fyq2N8mWz7udAmrH48d4WVI=;
 b=uwBZaS77tK7EfuHanxH3dFiYGRmlWG84rccW7nSQPvCB1W6SeMnJAN9bXe0z4xefVV
 CI6UdVR6+fEgqF/rtRezj0C3KpOtyJYn/2DdhCqFkwJkGFZG/mRj/BnpKr//5TJjdkCB
 wuE3s7ctjVSZL4YzSWUjAT2Rqfjyr50u0DLhGQRwyfl5I7XuM3tRfvJPiLoVGDtAx7EO
 cnDA8xckfPQMnBA/ruKTMSzRfpUyIJmjwuP+sYZPym85IQNyXA/aXx5IHZ1TtAcnGfGF
 4bLXEBN2ZopSQQsyyXW3zMCCvqLUAf8AGKeCARC/eSq42y3BZ33AZkwQkGAYobrl7PS7
 XIfw==
X-Gm-Message-State: AOJu0YwJFq9bDgB1ILpruvPmbXihqpvajMazbXdb8wvwa00/0wh28baq
 WhnUIH6F5pPoeKr3Xnj1Bw/G3l2kUFrtd6hhU5cXyrhh1ck=
X-Google-Smtp-Source: AGHT+IH3Rki7knix7XrnBGmr9OE4bCmCKRKN9FqMGZJJZQbsDTZimqYRm6zIiC9GJ/zsshWSNNCxhnG0w3VntitEoD0=
X-Received: by 2002:a05:622a:199d:b0:418:bdf:f4b with SMTP id
 u29-20020a05622a199d00b004180bdf0f4bmr9792610qtc.6.1696149689834; Sun, 01 Oct
 2023 01:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230930221727.1458825-1-arnout@mind.be>
 <CADvTj4qkFQXKXQp_brP2RJ-0KZCMd6U44xEuPY6pYLRtpaOFrA@mail.gmail.com>
 <4ea102e8-0fb6-b158-c96a-b1d9d6004925@mind.be>
In-Reply-To: <4ea102e8-0fb6-b158-c96a-b1d9d6004925@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 1 Oct 2023 02:41:17 -0600
Message-ID: <CADvTj4r8Wnn1x2=f=VMpou6v0TyNi6=4O51zx80zdnc+WAOc-g@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696149690; x=1696754490; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHlVw/lAxsYO00vz6c12fyq2N8mWz7udAmrH48d4WVI=;
 b=kXgcY5E/KKWS1PxJBdoUJnNHqEzp6alnupdK7/50V83cKXgIxFpSgXxvuuopOFom3O
 3FejQjVhF3LcfYfkDDT+YqadhWHK7Znp1d9JpyJPw9QiJD6eIO8T/LaYYnxxrIyx9MUX
 piMMRtSYzO4Y9p2aAB9zaN9wMCfL10dV42g71f91BFXWXgExhe9BPfotviLlKbhABjuI
 hUpUsPKWzU9ER+2Fslu7VJ1ek4kCA63GfV5d/G41QJm9H1jiZp+FhLsi6K44oWeBexmz
 BFiz+B7MJWjrpzywdO0kZLuZkkALRZtMk+OJMjpt/Y56St5B4CjSL+WPgmeZoyaOu0NR
 /QXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kXgcY5E/
Subject: Re: [Buildroot] package/pkg-python.mk: refactor setup-type variables
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
Cc: "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBPY3QgMSwgMjAyMyBhdCAyOjIx4oCvQU0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFy
bm91dEBtaW5kLmJlPiB3cm90ZToKPgo+Cj4KPiBPbiAwMS8xMC8yMDIzIDA2OjA1LCBKYW1lcyBI
aWxsaWFyZCB3cm90ZToKPiA+IE9uIFNhdCwgU2VwIDMwLCAyMDIzIGF0IDQ6MTfigK9QTSBBcm5v
dXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IHdyb3RlOgo+ID4+Cj4gPj4gTW9zdCBv
ZiB0aGUgcHl0aG9uLXBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUgY29uc2lzdHMgb2YgYSBiaWcgY29u
ZGl0aW9uYWwKPiA+PiB0cmVlIHRoYXQgc2V0cyB2YXJpb3VzIHZhcmlhYmxlcyBiYXNlZCBvbiB0
aGUgcGFja2FnZSdzIHNldHVwIHR5cGUuCj4gPj4gSW5pdGlhbGx5LCB0aGlzIHdhcyBxdWl0ZSBP
SywgYnV0IHNpbmNlIHdlIGhhdmUgNyBkaWZmZXJlbnQgc2V0dXAgdHlwZXMKPiA+PiBub3csIHNv
bWUgb2Ygd2hpY2ggc2hhcmUgc29tZSB2YXJpYWJsZXMgd2l0aCBvdGhlcnMsIGl0J3MgYmVjb21p
bmcgcXVpdGUKPiA+PiBjb21wbGljYXRlZCBhbmQgaGFyZCB0byByZWFkLgo+ID4KPiA+IEl0IG1p
Z2h0IGJlIGEgZ29vZCBpZGVhIHRvIGFwcGx5IG15IHNldHVwdG9vbHMgcGVwNTE3IHBhdGNoIGZp
cnN0IHdoaWNoCj4gPiBzaW1wbGlmaWVzIHRoaW5ncyBhIGJpdCBieSBsYXJnZWx5IGNvbWJpbmlu
ZyB0aGUgc2V0dXB0b29scyBzZXR1cCB0eXBlIHdpdGgKPiA+IHBlcDUxNyBidWlsZHMuCj4gPgo+
ID4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8y
MDIzMDkzMDE1MjUxNy4xMDc3NTc2LTMtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KPgo+ICAg
WWVhaCwgbXkgc2VyaWVzIHdhcyBhbHJlYWR5IGZpbmlzaGVkIHdoZW4geW91IHNlbnQgdGhhdCwg
YnV0IHRoZSB0ZXN0aW5nIHRvb2sKPiBtb3JlIHRoYW4gMjQgaG91cnMuLi4KPgo+ICAgVGhlIHR3
byB3aWxsIGNvbmZsaWN0IHdpdGggZWFjaCBvdGhlciwgb2J2aW91c2x5LCBidXQgSSB0aGluayB0
aGV5IGNhbiBiZQo+IGFwcGxpZWQgaW4gZWl0aGVyIG9yZGVyLgoKVHJ1ZSwgaG93ZXZlciB0aGUg
Y29tcGxleGl0eSByZWR1Y3Rpb24gb2YgdGhlIHBlcDUxNyBtaWdyYXRpb24gc2hvdWxkIGFsc28K
c2ltcGxpZnkgeW91ciBzZXJpZXMgYSBiaXQgYW5kIG1ha2UgaXQgYSBsb3QgZWFzaWVyIHRvIHJl
dmlldy4KCj4KPgo+ID4gV2UgY2FuIHByb2JhYmx5IGRyb3AgZGlzdHV0aWxzIHNldHVwIHR5cGUg
YXMgd2VsbCBhcyB3ZSBzaG91bGQgYmUgYWJsZSB0bwo+ID4gaW5zdGVhZCBqdXN0IHVzZSBzZXR1
cHRvb2xzIGZvciBhbnkgcGFja2FnZXMgdXNpbmcgdGhhdC4KPgo+ICAgVGhhdCdzIGEgYml0IGEg
bG9uZ2VyLXRlcm0gcHJvamVjdC4KCkkgb25seSBzZWUgNCBwYWNrYWdlcyBzdGlsbCB1c2luZyBk
aXN0dXRpbHMgc3RpbGwgc28gYXNzdW1pbmcgdGhleSB3b3JrIG9rIHVuZGVyCnNldHVwdG9vbHMg
dGhpcyBtYXkgYWN0dWFsbHkgYmUgcXVpdGUgc2ltcGxlLgoKSSdsbCB0cnkgYW5kIHRlc3QgaWYg
dGhvc2UgYnVpbGQgdW5kZXIgc2V0dXB0b29scyBhbmQgbWlncmF0ZSB0aGVtIGlmIHRoZXkgZG8u
Cgo+Cj4gICBUaGF0IHNhaWQsIGFzc3VtaW5nIHRoYXQgZGlzdHV0aWxzIGlzIGdvbmUsIGRvIHlv
dSB0aGluayB0aGUgY3VycmVudCBjb25kaXRpb24KPiB0cmVlIHdvdWxkIGJlIHNpbXBsZXIgdGhh
biB0aGUgaW5kaXJlY3QgdmFyaWFibGVzIHRoYXQgbXkgc2VyaWVzIGVuZHMgdXAgd2l0aD8KCkl0
J3MgYSBsaXR0bGUgaGFyZCB0byB0ZWxsLCB1bHRpbWF0ZWx5IHdlJ3JlIG9ubHkgZ29pbmcgdG8g
aGF2ZSBwZXA1MTcKc3R5bGUgYnVpbGRzIGZvcgpldmVyeXRoaW5nIHBsdXMgZmxpdC1jb3JlLWJv
b3N0cmFwIGZvciBib290c3RyYXBwaW5nIG91ciBwZXA1MTcgdG9vbGNoYWluIHNpbmNlCnRoZSBl
bnRpcmUgcHl0aG9uIGVjb3N5c3RlbSBhcHBlYXJzIHRvIGhhdmUgbW92ZWQgdG8gcGVwNTE3IHBh
Y2thZ2luZy4KCj4KPiAgIFJlZ2FyZHMsCj4gICBBcm5vdXQKPgo+IFtzbmlwXQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
