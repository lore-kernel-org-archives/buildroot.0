Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8782EEB64DD
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 09:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAF76402F4;
	Tue, 11 Jul 2023 09:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAF76402F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ke2yvj6iCAlV; Tue, 11 Jul 2023 09:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D3FD40204;
	Tue, 11 Jul 2023 09:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D3FD40204
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F9271BF28B
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 09:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5445D410E7
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 09:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5445D410E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f28qHjhmIPDt for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 09:43:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E61B5410C5
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E61B5410C5
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 09:43:39 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1b0138963ffso5157637fac.0
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 02:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689068619; x=1691660619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XeZCXJDmyOJklqYqN+w+Fc80XOFxGVGOOpf2RO9nt3E=;
 b=FCkXkNo3++ZlxPMUbjqAXevomFYYd0HtCJbOE9jgpr9CWAjEagE0bPTdXp9OQ+2inT
 zggLVDd/v9xyR6dA5zkeNwrENFGsM/6/zKQZJVc/Xp9+gS6OD34Sgc/bWiaqbClGne11
 YLhjql1MnbfrDzkUr2PD+I/0/Ncj/F3lULnQr3QGis4G6ozVZTKH2CIOxm0E5t7cvOzS
 jnp7hp+3Szg0+j3PlRICW1yh2ZiIaeQHob6MymINL4duTFg0i+3DBhagaZ354NimTLep
 CvJD3nFrkgX5IP6BTMIhLnsl7Y+mygXnseB0/Db0OfT429nFYKgmXGbNt8wkUHTAb/2s
 F1Gg==
X-Gm-Message-State: ABy/qLYMmHqOLh6s8DFnYAVy5nv5/PvBdgNj8PAZw2P0AnGLiFApIVmh
 1GMYR1fUiD2wX7W3J16TljyaVc2/IRCZzFbKwUqXQcYFwaY=
X-Google-Smtp-Source: APBJJlFfveElXErYhuAo/SxU/B6XQYq+/mEcHVjt3yFOjBaZ0ALz8667ywQMbOJyFF4lDQXRm6DfZxOoeVMV0dWe/rI=
X-Received: by 2002:a05:6870:4255:b0:19f:1a92:6e1a with SMTP id
 v21-20020a056870425500b0019f1a926e1amr16503704oac.5.1689068618796; Tue, 11
 Jul 2023 02:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230627072640.2437216-1-james.hilliard1@gmail.com>
 <20230627072640.2437216-2-james.hilliard1@gmail.com>
 <20230710200146.33aa4362@windsurf>
 <CADvTj4ruzjfhJ-Ns9rPYhrW4oGWGqCkf66gUjTT+DR+DB8C3Xw@mail.gmail.com>
 <20230711093249.73674060@windsurf>
 <CADvTj4r7QRpW3NaYQc+_iZ5Y1WnzBeMQsptvtrtTudDc47X12w@mail.gmail.com>
 <20230711100053.1d9d3671@windsurf>
In-Reply-To: <20230711100053.1d9d3671@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Jul 2023 03:43:26 -0600
Message-ID: <CADvTj4p1kQLf9J=s_xqHVZVeSwHUVVMBSMHPJsA-JT2oHHNCrQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689068619; x=1691660619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XeZCXJDmyOJklqYqN+w+Fc80XOFxGVGOOpf2RO9nt3E=;
 b=sinaS46yFTJOuOBFbuCGaakaFyc5oI2RBzz2xm3nOdyhIkUoTWoEElojUHDFcTlsmI
 i9sG93VG+fySd/n6zkvmV77QpnI6df98mjK8+jWB79ch/1L7Ql5+j0Lo39l7os0NxiP+
 rxWC7eUP/3mtLBge9nbaC1WjyonH5jty86eL5Ln7aySZS1iNcbU0Pg+3ZJO+xdhp0kob
 nHTbnY8K303rYaED1Sl37cJjLsGbpyc9NqbH0eHnij7kpCMxVZYpcgzsDZ6wZ8yyItWk
 fPkD/yErqr8MiShECmbPvD76Nqs/N0fOFLClVpgW/yD7X5TzG7Eixnw9WEy9f+wDxSgo
 5ZfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=sinaS46y
Subject: Re: [Buildroot] [PATCH 2/2] package/python-terminaltables: fix
 build backend
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgMjowMOKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAxMSBKdWwgMjAyMyAw
MTozNTo1NCAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gPiBTbyBpcyB0aGlzIHBhdGNoIHNlcmllcyBtb2RpZnlpbmcgcHl0aG9u
LXRlcm1pbmFsdGFibGVzIGEgcHJlcmVxdWlzaXRlCj4gPiA+IHRvIGFwcGx5aW5nIHRoZSBwYXRj
aCBhdAo+ID4gPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290
L3BhdGNoLzIwMjMwNjI2MTgxNTMxLjIzMTIwMDItNS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
LyA/Cj4gPgo+ID4gWWVzLCBpdCBzaG91bGQgYmUgYXBwbGllZCBiZWZvcmUgdGhhdCBvbmUuCj4K
PiBUaGVuLCBhcyBleHBsYWluZWQgaW4gYW5vdGhlciBlLW1haWwsIGl0IHNob3VsZCBiZSBwYXJ0
IG9mIHRoZSBzYW1lCj4gc2VyaWVzLiBZZXMsIEkgdW5kZXJzdGFuZCB0aGF0IHlvdSBzZW50IHRo
ZSBzZXJpZXMgYmVmb3JlIG5vdGljaW5nIHRoYXQKPiBweXRob24tdGVybWluYWx0YWJsZXMgbmVl
ZGVkIHRvIGJlIGNoYW5nZWQsIGFuZCB0aGF0J3MgZmluZTogc2VuZCBhIG5ldwo+IGNvbXBsZXRl
IGl0ZXJhdGlvbiBvZiB0aGUgc2VyaWVzIHdpdGggdGhlIGV4dHJhIHBhdGNoZXMuCj4KPiBBbmQg
Zm9yIHN1Y2ggY29tcGxpY2F0ZWQgc2VyaWVzLCBwbGVhc2UgKmFsd2F5cyogYWRkIGEgY292ZXIg
bGV0dGVyCj4gdGhhdCBnaXZlcyBzb21lIGJhY2tncm91bmQ6IHdoYXQgeW91J3JlIHRyeWluZyB0
byBkbywgYW5kIHdoYXQgaXMgdGhlCj4gcGF0aCB0YWtlbiB0byBhY2hpZXZlIHRoaXMuCgpUaGlz
IHNlcmllcyBjYW4gYmUgcmV2aWV3ZWQgZW50aXJlbHkgaW5kZXBlbmRlbnRseSBvZiB0aGUgb3Ro
ZXIgb25lLCBJCndlbnQgYWhlYWQgYW5kIG1hcmtlZCB0aGUgZmluYWwgcGVwNTE3IHNldHVwdG9v
bHMgbWlncmF0aW9uIHBhdGNoIGFzCmRlZmVycmVkIGZvciBub3cgc28gdGhhdCB0aGVyZSBhcmVu
J3QgZGVwZW5kZW5jeSBvcmRlcmluZyBpc3N1ZXMgb3IKY29uZnVzaW9uIHJlZ2FyZGluZyB0aGUg
cmVsYXRpb24gb2YgdGhpcyBzZXJpZXMgdG8gdGhlIG90aGVyIG9uZS4KCmh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzA2MjYxODE1MzEuMjMx
MjAwMi01LWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCgo+Cj4gVGhhbmtzIQo+Cj4gVGhvbWFz
Cj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczov
L2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
