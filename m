Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D2FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 09:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3909B84D26;
	Fri, 14 Jan 2022 09:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ox5NJ8uWPhSm; Fri, 14 Jan 2022 09:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 823F083ED7;
	Fri, 14 Jan 2022 09:33:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5481BF3DF
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 09:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78ADC41578
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 09:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bGP4NGwdwoq4 for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 09:33:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B623641576
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 09:33:30 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id p7so11713222iod.2
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 01:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=txPNgBFK1i7rtQOn2mdo3Yv9wc9Y9pw/OmnrhqODnFE=;
 b=pThNaqklY0BcX9/OM3iPcsInw1DS5PeWEsiAHWVIFMypp8r4qwFMoR4qxcvr76OXwl
 ZNOIn5EQ6rliqGVlqY1whT0eKFtpH2ORROuxetW+lhktenC+qqVBYSuEMqdtbAvnO/vw
 fuoGAl1fVye3WB+xzplzJ/Mlws+MvgkANILG53IBmcibP2uzmE26cU/K3zpzWM62tU1e
 hCCtjoMfBQDr48X8N8dL2g03uy8LDnGzcGe7lvNHMD1w4AXB8w1x5KKjdV2ZJuOTKqSD
 C+0dqa/o6z4T34QGC5BjgQbXSnk1cYB2WwHMKQxYUYYSdknmNkue31lg6Fs35Ag9Vns2
 sR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=txPNgBFK1i7rtQOn2mdo3Yv9wc9Y9pw/OmnrhqODnFE=;
 b=hmlBq95eCUA25FelHvK1c428D1liNogDnoQUU2ZcYfLXrl9zfdh6UKmGOkYsWlGGDi
 I4Qst9AP2wDDCmoRM3XL593C/sHfrkE8496ZpSmbkyCCd6vd2uDBY7W5JUqi9S8csZBr
 3TFroVT+aIuvoM7EXXLVpsPqGMlwE+0nvK1sMglS/dqkM1giVJyIfBFibkujogEO9C8e
 xU5LXDDRTfbNi/FSDyfsl5C9kam58Q5H4aqMLjRjZ0Ik00HS4/FZm8gyIRqDSku4CjsD
 Zf14NiN0Hu23Hy+OtR/XfZ3iHZCn8mv8Tv3WqDVqiuEwgzc9I4/hQsdvmh1CcngqHh0u
 UZYQ==
X-Gm-Message-State: AOAM530AhJLsRIq7ESGp4UcI2F+dAysd9MJoh4hZCyVHb8Fw/7YHEP6t
 l0ZWQPNrhTiEA3ZPX9M1KH4fc/f91j/Z3B2oy0A=
X-Google-Smtp-Source: ABdhPJwUwSGsPkhzf1k1TEACWrXCFBpMa2JkH6sy5zqB6AqWivnHVKuy9lX308ib5oOcROQ7lkk+IEYe/J013IxOBWI=
X-Received: by 2002:a05:6602:1641:: with SMTP id
 y1mr3973432iow.50.1642152809738; 
 Fri, 14 Jan 2022 01:33:29 -0800 (PST)
MIME-Version: 1.0
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
 <20210518113652.29609-5-patrickdepinguin@gmail.com>
 <55296fff-7a19-3691-22e2-52095bc5cc47@gmail.com>
In-Reply-To: <55296fff-7a19-3691-22e2-52095bc5cc47@gmail.com>
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 14 Jan 2022 10:33:18 +0100
Message-ID: <CAAXf6LWTdG58OKyvFUPycPfc4AsOCyDhtuTRUtWOiD9VFC1YfQ@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 4/4] perf: fix compilation in case of i386
 userspace with x86_64 kernel
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKRWwganVlLCAxMyBlbmUgMjAyMiBhIGxhcyAyMzoxNywgUm9tYWluIE5hb3Vy
Cig8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4pIGVzY3JpYmnDszoKPgo+IEhlbGxvIFRob21hcywK
Pgo+IExlIDE4LzA1LzIwMjEgw6AgMTM6MzYsIFRob21hcyBEZSBTY2hhbXBoZWxlaXJlIGEgw6lj
cml0IDoKPiA+IEZyb206IFRob21hcyBEZSBTY2hhbXBoZWxlaXJlIDx0aG9tYXMuZGVfc2NoYW1w
aGVsZWlyZUBub2tpYS5jb20+Cj4gPgo+ID4gSWYgYSA2NC1iaXQga2VybmVsIGlzIGNvbWJpbmVk
IHdpdGggMzItYml0IHVzZXJzcGFjZSwgYW5kIHRoaXMgaXMgYWNoaWV2ZWQKPiA+IHZpYSBhIG11
bHRpbGliIHRvb2xjaGFpbiB0aGF0IGRlZmF1bHRzIHRvIDY0LWJpdCB3aXRoICctbTMyJyBpbgo+
ID4gQlIyX1RBUkdFVF9PUFRJTUlaQVRJT04sIHRoZSAnPGNyb3NzPi1sZCcgY29tbWFuZCB3aWxs
IHN0aWxsIGRlZmF1bHQgdG8KPiA+IDY0LWJpdCBvdXRwdXQuCj4gPgo+ID4gSW4gdGhpcyBjYXNl
LCBwYWNrYWdlcyB0aGF0IHVzZSAnbGQnIGRpcmVjdGx5IG5lZWQgdG8gYmUgaW5zdHJ1Y3RlZCB0
byB1c2UKPiA+IHRoZSBjb3JyZWN0IEFCSSB2aWEgdGhlICctbScgcGFyYW1ldGVyLiAncGVyZicg
aXMgb25lIHN1Y2ggcGFja2FnZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgRGUgU2No
YW1waGVsZWlyZSA8dGhvbWFzLmRlX3NjaGFtcGhlbGVpcmVAbm9raWEuY29tPgo+ID4gLS0tCj4g
PiAgcGFja2FnZS9saW51eC10b29scy9saW51eC10b29sLXBlcmYubWsuaW4gfCAzICsrKwo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saW51eC10b29scy9saW51eC10b29sLXBlcmYubWsuaW4gYi9wYWNrYWdlL2xpbnV4LXRv
b2xzL2xpbnV4LXRvb2wtcGVyZi5tay5pbgo+ID4gaW5kZXggNGUyODEyOWY1MC4uYjg0YjVmZDQx
NSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvbGludXgtdG9vbHMvbGludXgtdG9vbC1wZXJmLm1r
LmluCj4gPiArKysgYi9wYWNrYWdlL2xpbnV4LXRvb2xzL2xpbnV4LXRvb2wtcGVyZi5tay5pbgo+
ID4gQEAgLTQ1LDYgKzQ1LDkgQEAgUEVSRl9NQUtFX0ZMQUdTICs9IExEPSIkKFRBUkdFVF9MRCkg
LW0gZWxmMzJsdHNtaXBuMzIiCj4gPiAgZWxzZQo+ID4gIFBFUkZfTUFLRV9GTEFHUyArPSBMRD0i
JChUQVJHRVRfTEQpIC1tIGVsZjY0bHRzbWlwIgo+ID4gIGVuZGlmCj4gPiArIyBjYXNlIGZvciB4
ODYgdG9vbGNoYWluIHRoYXQgZGVmYXVsdHMgdG8gNjQtYml0IG91dHB1dAo+ID4gK2Vsc2UgaWZl
cSAoJChCUjJfaTM4Nik6JChjYWxsIHFzdHJpcCwkKEJSMl9LRVJORUxfQVJDSF9PVkVSUklERSkp
LHk6eDg2XzY0KQo+ID4gK1BFUkZfTUFLRV9GTEFHUyArPSBMRD0iJChUQVJHRVRfTEQpIC1tIGVs
Zl9pMzg2Igo+Cj4gRG8geW91IGtub3cgd2h5IHRoZSBBUk0gdG9vbGNoYWluIGRvZXNuJ3QgbmVl
ZCBhIHNpbWlsYXIgaGFuZGxpbmcgPwoKSWYgeW91IGFyZSByZWZlcnJpbmcgdG8gdGhlIEFSTSB0
b29sY2hhaW4gdGhhdCBJIGFtIHVzaW5nLCB0aGVuIHllcy4KRm9yIEFhcmNoNjQsIGl0IHNlZW1z
IG5vdCBwb3NzaWJsZSB0byBwcm9kdWNlIGEgbXVsdGlsaWIgdG9vbGNoYWluCnN1cHBvcnRpbmcg
QVJNICgzMi1iaXQpIGFuZCBBYXJjaDY0ICg2NC1iaXQpLgpJIGRvbid0IGtub3cgdGhlIGRldGFp
bHMgYWJvdXQgd2h5LgoKSW4gb3JkZXIgdG8gc3VwcG9ydCB0aGF0IGNhc2UsIHdlIGFjdHVhbGx5
IHBhY2sgdHdvIHNlcGFyYXRlCnRvb2xjaGFpbnMgaW50byBvbmUgJ3Rvb2xjaGFpbicgYXJjaGl2
ZSwgYW5kIHBvaW50IEJ1aWxkcm9vdCB0byB0aGUKMzItYml0IG9uZSAodGhlIHRvcC1sZXZlbCBk
aXJlY3RvcmllcyBiaW4vIGxpYi8gZXRjLiBjb3JyZXNwb25kIHRvIHRoZQozMi1iaXQgb25lKS4K
Rm9yIExpbnV4L3UtYm9vdCB3ZSBzcGVjaWZpY2FsbHkgcG9pbnQgdG8gdGhlIDY0LWJpdCB0b29s
Y2hhaW4uClNvIHNpbmNlIHRoZXkgYXJlIHNlcGFyYXRlIHRvb2xjaGFpbnMsIHRoZXJlIGlzIG5v
ICctbTMyJyBhbnl3aGVyZToKZWl0aGVyIHRvb2xjaGFpbiBoYXMgYSBmaXhlZCBiaXRuZXNzLgoK
SG93IHdlIGNvdWxkIGhhbmRsZSB0aGlzIHNpdHVhdGlvbiBpbiBCdWlsZHJvb3QgaXMgdG8gYmUg
ZGlzY3Vzc2VkLgpUaGVzZSBjaGFuZ2VzIGFyZSBub3QgaW4gdGhpcyBzZXJpZXMuCgpCZXN0IHJl
Z2FyZHMsClRob21hcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
