Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B6AC433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 22:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC22282E1A;
	Mon, 17 Oct 2022 22:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC22282E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id meBiwYKWv30X; Mon, 17 Oct 2022 22:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F96C82E4C;
	Mon, 17 Oct 2022 22:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F96C82E4C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A4401BF3AD
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 22:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E056417D2
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 22:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E056417D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_CghiSSlaTR for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 22:45:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1B70417D1
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1B70417D1
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 22:45:51 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id f23so12115190plr.6
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 15:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dwW8diwW+71quM2ak+DL+UbA0W04Mxp0VqSLq2xbRVo=;
 b=bctORW2CCoVJ/nW+pHVDkEVr588cTey6CMFh2EXNnGwLnOZLqPT5Q1vyx17mWSWB0R
 Qz+RB7D5OKHpaMeJ6DNRnD8d7kC7qo4egB/OnkGNF3t++TKIYZ0578ohsLbgKlM654wa
 Jn7LZ2S3Z2rVDwJajmFFZGxMfYaIwaK9dwIQQfPBIpoSnqpdvMRtzl6UB8Gwp7wnMTxa
 6hZ2V+CSiPRR016hDkc+dU5/Wa15TiRhoSMqhOAdnaW0MayA6XxXsGoR6eRgXgAcIAvQ
 NU7VjzMzQONZim0ZL8jOm+qiqHldxTvmwfsfL0bZECU3frPnumyxeef2nrhBpo/DW/i6
 V2Og==
X-Gm-Message-State: ACrzQf2EL80Vy7wYyG+eIip7JatgUvrcrr09gBHTG0T4K/Gx8pJr7fL1
 RUFn0DWTl7SG1jv/APHZwsxVIm4lKZB5dDhFDBs=
X-Google-Smtp-Source: AMsMyM5YR0YUbK0VJwqDhsbkO3F9CrG4W1V3tryXAsELYbTj+wE4rrCI9PzouwqAsD+ToBrki4kt2Ia4JKelHDOAazg=
X-Received: by 2002:a17:902:b598:b0:184:e49d:3042 with SMTP id
 a24-20020a170902b59800b00184e49d3042mr171334pls.16.1666046751000; Mon, 17 Oct
 2022 15:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <K2AWJR.ZU8FSKYACOJE1@crapouillou.net>
 <20221017141843.0d7d2963@windsurf>
In-Reply-To: <20221017141843.0d7d2963@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 17 Oct 2022 18:45:39 -0400
Message-ID: <CADvTj4pBgWN2W+ARPaeBz52LXXvUyZ-NBSEKba6JLso1E5rkYw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Cercueil <paul@crapouillou.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dwW8diwW+71quM2ak+DL+UbA0W04Mxp0VqSLq2xbRVo=;
 b=BsQyatm6i29c/K+llzTRpP2ve/DE7Kvz1vEA8tpoXBoUbnzMVfu4Mbh/RJFzRjrLYi
 4Fy9YDOO28W4wq3fUCHpED1bBeBUb/ggz8dD11Yo7oj02iBOjaqQFIOddR6ViGFUQTj9
 vRn60wRdkmwpxvi59jmiXbQtBZyMs3cVaP7IFWyUquG0DN0nQe/usJhTEgVJySzMfklh
 OE1BtEo3IVc8jFhO+FO1aPa4Ey/BSUQHvJlPuXRCBxMI0vhGdgGlAQWrXMRJ7B88cKxz
 8qPzrZFkqiYyArS0GyIjgaCQjQcEuDgVpX3p6TzDFYwEv2NK+44OP3wGgx4aGOQ18zbJ
 ECjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BsQyatm6
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-10-15
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBPY3QgMTcsIDIwMjIgYXQgODoxOCBBTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvIFBhdWwsCj4KPiBUaGlzIGlz
IGhhcHBlbmluZyBvbiBKYW1lcyBhdXRvYnVpbGRlciwgd2hvIGhhcyBpbnRyb2R1Y2VkIHNvbWUg
c3BlY2lhbAo+IHJhbmRvbWl6YXRpb24gc3R1ZmYgdGhhdCB3b3VsZCBvbmx5IGFwcGVhciB3aXRo
IG1ha2UgNC40LiBJIGhhdmUgYWRkZWQKPiBKYW1lcyBpbiBDYyBzbyB0aGF0IGhlIGNhbiBjb21t
ZW50IGFuZCBzZWUgaWYgaGUgY2FuIHJlcHJvZHVjZSBhbmQKPiBwcm92aWRlIG1vcmUgZGV0YWls
cy4KClRoaXMgc2hvdWxkIGZpeCBpdDoKaHR0cHM6Ly9naXRodWIuY29tL3ZpdmVyaXMvdU1UUC1S
ZXNwb25kZXIvcHVsbC84NQoKPgo+IEJlc3QgcmVnYXJkcywKPgo+IFRob21hcwo+Cj4gT24gTW9u
LCAxNyBPY3QgMjAyMiAxMjoxODoyMCArMDEwMAo+IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91
aWxsb3UubmV0PiB3cm90ZToKPgo+ID4gSGkgVGhvbWFzLAo+ID4KPiA+IEkgY2FuJ3QgcmVwcm9k
dWNlLCB3aXRoIHRoaXMgYnVpbGQncyBkZWZjb25maWcgb24gbGF0ZXN0IG1hc3Rlci4gSXQKPiA+
IGp1c3QgYnVpbGRzIGZpbmUgaGVyZS4KPiA+Cj4gPiBDaGVlcnMsCj4gPiAtUGF1bAo+ID4KPiA+
Cj4gPiBMZSBkaW0uLCBvY3QuIDE2IDIwMjIgYXQgMDU6Mzg6MTkgLTAwMDAsIFRob21hcyBQZXRh
enpvbmkKPiA+IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4gPiA+
IEhlbGxvLAo+ID4gPgo+ID4gPiBBdXRvYnVpbGRlciBmYWlsdXJlcwo+ID4gPiA9PT09PT09PT09
PT09PT09PT09PQo+ID4gPgo+ID4gPiBCZWxvdyBpcyBhIGxpc3Qgb2YgYnVpbGQgZmFpbHVyZXMg
cmVwb3J0ZWQgYnkgdGhlIEJ1aWxkcm9vdAo+ID4gPiBhdXRvYnVpbGRlcnMKPiA+ID4gaW4gcmVs
YXRpb24gdG8gcGFja2FnZXMgb3IgQ1BVIGFyY2hpdGVjdHVyZXMgeW91IGFyZSBpbiBjaGFyZ2Ug
b2YuCj4gPiA+IFBsZWFzZSBoZWxwIHVzIGltcHJvdmluZyB0aGUgcXVhbGl0eSBvZiBCdWlsZHJv
b3QgYnkgaW52ZXN0aWdhdGluZwo+ID4gPiB0aG9zZQo+ID4gPiBidWlsZCBmYWlsdXJlcyBhbmQg
c2VuZGluZyBwYXRjaGVzIHRvIGZpeCB0aGVtLgo+ID4gPgo+ID4gPiBSZXN1bHRzIGZvciB0aGUg
J21hc3RlcicgYnJhbmNoCj4gPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+
ID4KPiA+ID4gQnVpbGQgZmFpbHVyZXMgcmVsYXRlZCB0byB5b3VyIHBhY2thZ2VzOgo+ID4gPgo+
ID4gPiAgICAgYXJjaCAgICAgfCAgICAgICAgICAgICByZWFzb24gICAgICAgICAgICAgfAo+ID4g
PiAgICAgICAgICAgICAgICAgdXJsCj4gPiA+IC0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ICAgICBhcm0g
ICAgICB8ICAgICAgICAgIHVtdHByZC0xLjYuMiAgICAgICAgICB8Cj4gPiA+IGh0dHA6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2M3Y2U5NzVkMzk4MTkwZmMxOTFjY2MwMzgxM2Y4
ZWMwYjM0NjRjN2QKPiA+ID4KPiA+ID4KPiA+ID4gVGhhbmtzIGZvciB5b3VyIGNvbnRyaWJ1dGlv
biB0byBCdWlsZHJvb3QhCj4gPiA+Cj4gPiA+IC0tCj4gPiA+IGh0dHA6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm5ldAo+ID4KPiA+Cj4KPgo+Cj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25l
ciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
