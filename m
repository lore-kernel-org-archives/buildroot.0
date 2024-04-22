Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2EDC4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 13:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6B4881ED0;
	Mon, 22 Apr 2024 13:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WP3nkvXl-Q_t; Mon, 22 Apr 2024 13:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2C0481EF9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2C0481EF9;
	Mon, 22 Apr 2024 13:17:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0ABB11BF33F
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 13:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3DA060A93
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 13:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjyArolXqLI7 for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 13:17:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D1206064E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D1206064E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D1206064E
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 13:17:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([212.114.183.37]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnJhU-1sOIf93uWS-00jLl3; Mon, 22
 Apr 2024 15:11:56 +0200
Date: Mon, 22 Apr 2024 15:11:55 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <20240422151155.28acd5df@gmx.net>
In-Reply-To: <CAGm1_kudsdPfm+++_ZTXz2D23ezUJSxGaKaGpxC_ac45eK8sgQ@mail.gmail.com>
References: <CAGm1_kv4F+h1KZOiYTJ2ZActM6FMekfUc-OSQYt+ABEjdCsncA@mail.gmail.com>
 <20240422141405.10ed2e21@gmx.net>
 <CAGm1_ks=J-wT0QrPxMFO+DrXsRXYCLGnUdGJhaHUwOLaqPER+Q@mail.gmail.com>
 <CAGm1_kudsdPfm+++_ZTXz2D23ezUJSxGaKaGpxC_ac45eK8sgQ@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:TMr/zi1fuXbCsqy2UpdDbNPaZaDeXnhgaaa19JmTAEVltQO0QIC
 h47TZ4DVoH9u6nOXRc0zuDHBFLqCQZr8m2aeYsbI45QXtd1Vk6IwYRarSa4vLciYzgNn2rG
 7yi/vGF4jTJOJ1k0t5gf5FGT69f9nqyUfUxmd+KWsUSfHgM0mSV0MgWdx8sWD0EBTMkH3TX
 PfZsfLGYEEBIFWYJQNBnQ==
UI-OutboundReport: notjunk:1;M01:P0:wpS63dey98g=;1+eOrlN5zvt/KPBoJ84lN8YCdvZ
 kK3xwjZoDipNAP4G+TzcWrqWBFt3nR1sRWqXOdBZsNSTONOqbkqcrqJZuzPEQ6dX0M8Lo2Zmn
 xVJ6xYIFOOJxJKXDA3/wzkAHYVirIwigFSKgNwQ4nKNcqGQYVR+C5NMtEJDoQ4Kh3B/9yGCPn
 +V4uarKaKNCqDJ+8Yc/DL2hAqmJ7oBNY68kvBILLpsUN2jC4fdesUskhN8JCqp3hgaiHUWMlU
 SiXedyBpRzEBw9pJDMF9CBGEwy5DJmZTTKdhj0dTQuCvg82czKMsJLtlAGJplpuhbv7By+gGV
 b0EI2XAXsGSccN4NmOhxsHuuFi6bPCeEKHIFEJDaafId7hJ718N0UkdFA/3Qiwy2qk2rzjlKM
 QSJYKaxxxcYxdOwPJvfKRC9KJPI52DNr1NbpBmx1lCOHTXDVnCAtH+4YoXInSiaJByXqfQ57d
 F4xY5NzqHaFCYotHmS2uLDsLbrym7S2Q6cIzw+QA1SUgLqEK1PHsnpy3DKfpRRpxbDAM2feWE
 o2AYXiILHQv8sUHwwRVmJIALe4dyKfhQ9gvWGYn6ORv+eaF/H8JZv7mXXFjmkTOQIMHFaqYyo
 g5abVeKs1hhSg9CBIiujlATYk/1/J7s6n2TYelrYktOwuMBLnHe5tvNVGdyfAS8M3EKMffb63
 WwyAsXhXf3dTEea+Ni+5Fb6kKJ+goY3ZDxxX2FusaOBhAy7e2YVq+dZOnIq6q8gpdNyR5VQ/Y
 54cD+Zh9nIx8Zai8JjF/6Up2bD6Wafz/QS0L/0krWBi8hnhbyN16+jy1n2fXhQU06eG8E7hNw
 2eV/KEikbaU2+lULK5WY5mSb5v024ysvM8sWSC+QLG6Z4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1713791821; x=1714396621; i=ps.report@gmx.net;
 bh=LB6tMCrsvHiy29e29oDD8g5a0B1M7BnnLb+nL6+NnNA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UvJOfDAjGpCtNY4VyzsQgenwHQWUKS7v0RWmkgpr5iYMCvpNmdHoyF/TcQYQHqAb
 qKu2c/FWcXaTPQQh+E3Z3zLoadzPF3Tz6KVJyNHEgPZbxXQBc2UQih2969skajp4y
 cHVNdjPLb1L415jBMEAEgtnemtiwm0lHAep5/njFK9J8LY4rw3WdM0Vt79g2PzdZw
 dTAcHBmwOwFViBfDIcKvuMSFjomasTs8xIywscrA+TdL9E0BJd7r/shPf0Nv4QglI
 pI+ghScLHDntelimWJe885nM56ImEZi92ZcHRPTnIGb6C8iv7tFgEfSJcYxFBtuaC
 eHBx2YnJbdPNryNxjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=UvJOfDAj
Subject: Re: [Buildroot] pkg-meson.mk: support for the host python packages
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAyMiBBcHIgMjAyNCAxNDoyOTo0MiArMDIwMCwgWWVnb3IgWWVmcmVtb3YgPHllZ29y
c2xpc3RzQGdvb2dsZW1haWwuY29tPiB3cm90ZToKCj4gT24gTW9uLCBBcHIgMjIsIDIwMjQgYXQg
MjoyOOKAr1BNIFllZ29yIFllZnJlbW92Cj4gPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPiB3
cm90ZToKPiA+Cj4gPiBPbiBNb24sIEFwciAyMiwgMjAyNCBhdCAyOjE54oCvUE0gUGV0ZXIgU2Vp
ZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PiB3cm90ZTogIAo+ID4gPgo+ID4gPiBPbiBNb24sIDIy
IEFwciAyMDI0IDEyOjQ2OjA0ICswMjAwLCBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29v
Z2xlbWFpbC5jb20+IHdyb3RlOgo+ID4gPiAgCj4gPiA+ID4gbGliZ2xpYjIgMi44MC4wIHJlcXVp
cmVzIGhvc3QtcHl0aG9uLXBhY2thZ2luZyB0byBidWlsZCB0aGUgbGlicmFyeSBbMV0uCj4gPiA+
ID4KPiA+ID4gPiBXaGF0IGlzIHRoZSBiZXN0IHdheSB0byB0ZWxsIG1lc29uL25pbmphIHdoZXJl
IHRvIGxvb2sgZm9yIG91ciBob3N0Cj4gPiA+ID4gcHl0aG9uIHBhY2thZ2VzPwo+ID4gPiA+Cj4g
PiA+ID4gWzFdIGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9nbGliLy0vY29tbWl0L2Zj
NmYwNjEyN2NmZjlmZTNlNDY0YjViZThjOTJlYTA4YTY3OWI2MjAgIAo+ID4gPgo+ID4gPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5tayBiL3BhY2thZ2UvbGliZ2xpYjIv
bGliZ2xpYjIubWsKPiA+ID4gaW5kZXggYzA2ZGVkMmE1Yi4uODE5MjgyOTEwYSAxMDA2NDQKPiA+
ID4gLS0tIGEvcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5tawo+ID4gPiArKysgYi9wYWNrYWdl
L2xpYmdsaWIyL2xpYmdsaWIyLm1rCj4gPiA+IEBAIC0zNCw5ICszNCwxMSBAQCBIT1NUX0xJQkdM
SUIyX0NPTkZfT1BUUyA9IFwKPiA+ID4KPiA+ID4gIExJQkdMSUIyX0RFUEVOREVOQ0lFUyA9IFwK
PiA+ID4gICAgICAgICBob3N0LXBrZ2NvbmYgaG9zdC1saWJnbGliMiBcCj4gPiA+ICsgICAgICAg
aG9zdC1weXRob24zIGhvc3QtcHl0aG9uLXBhY2thZ2luZyBcCj4gPiA+ICAgICAgICAgbGliZmZp
IHBjcmUyIHpsaWIgJChUQVJHRVRfTkxTX0RFUEVOREVOQ0lFUykKPiA+ID4KPiA+ID4gIEhPU1Rf
TElCR0xJQjJfREVQRU5ERU5DSUVTID0gXAo+ID4gPiArICAgICAgIGhvc3QtcHl0aG9uMyBob3N0
LXB5dGhvbi1wYWNrYWdpbmcgXAo+ID4gPiAgICAgICAgIGhvc3QtZ2V0dGV4dCBcCj4gPiA+ICAg
ICAgICAgaG9zdC1saWJmZmkgXAo+ID4gPiAgICAgICAgIGhvc3QtcGNyZTIgXCAgCj4gPgo+ID4g
VGhpcyBqdXN0IGJ1aWxkcyB0aGUgcGFja2FnZSBidXQgbWVzb24gd29uJ3QgbG9vayBpbgo+ID4g
aG9zdC9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzLyBmb3IgcmVnZXguICAKClNvcnJ5LCB3
b3JrcyBmb3IgbWUgKGFuZCBhZGRpdGlvbmFsIHJlbW92ZWQgdGhlIGxvY2FsIHB5dGhvbjMxMS1w
YWNrYWdpbmcgb24gdGhlCmJ1aWxkIHN5c3RlbSwgYnV0IHdvcmtzIG90aGVyd2lzZSB0b28pOgoK
CSQgcm0gLXJmIGJ1aWxkL2hvc3QtbGliZ2xpYjItMi44MC4wICYmIHJtIC1yZiBidWlsZC9saWJn
bGliMi0yLjgwLjAgJiYgc3RyYWNlIC1mbyBvdXQubG9nIG1ha2UgbGliZ2xpYjIKCgkkIGdyZXAg
cGFja2FnaW5nIGJ1aWxkL2xpYmdsaWIyLTIuODAuMC9idWlsZC9tZXNvbi1sb2dzL21lc29uLWxv
Zy50eHQgCglQcm9ncmFtIHB5dGhvbjMgKHBhY2thZ2luZykgZm91bmQ6IFlFUyAoPG15X2xvY2Fs
X2J1aWxkX3BhdGg+L2hvc3QvYmluL3B5dGhvbjMpIG1vZHVsZXM6IHBhY2thZ2luZwoKCSQgZ3Jl
cCBwYWNrYWdpbmcgb3V0LmxvZwoJWy4uLl0KCTIxOTI5IG5ld2ZzdGF0YXQoQVRfRkRDV0QsICI8
bXlfbG9jYWxfYnVpbGRfcGF0aD4vaG9zdC9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzL3Bh
Y2thZ2luZy9fX2luaXRfXy5weSIsIHtzdF9tb2RlPVNfSUZSRUd8MDY0NCwgc3Rfc2l6ZT00OTYs
IC4uLn0sIDApID0gMAoJMjE5MjkgbmV3ZnN0YXRhdChBVF9GRENXRCwgIjxteV9sb2NhbF9idWls
ZF9wYXRoPi9ob3N0L2xpYi9weXRob24zLjExL3NpdGUtcGFja2FnZXMvcGFja2FnaW5nL19faW5p
dF9fLnB5Iiwge3N0X21vZGU9U19JRlJFR3wwNjQ0LCBzdF9zaXplPTQ5NiwgLi4ufSwgMCkgPSAw
CgkyMTkyOSBvcGVuYXQoQVRfRkRDV0QsICI8bXlfbG9jYWxfYnVpbGRfcGF0aD4vaG9zdC9saWIv
cHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzL3BhY2thZ2luZy9fX3B5Y2FjaGVfXy9fX2luaXRfXy5j
cHl0aG9uLTMxMS5weWMiLCBPX1JET05MWXxPX0NMT0VYRUMpID0gMwoKUmVnYXJkcywKUGV0ZXIK
Cj4gCj4gcy9yZWdleC9wYWNrYWdlCj4gCj4gPgo+ID4gU2hvdWxkIG9uZSBqdXN0IGFkZCBhIFBZ
VEhPTlBBVEggcG9pbnRpbmcgdG8KPiA+IGhvc3QvbGliL3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdl
cyBiZWZvcmUgaW52b2tpbmcgbWVzb24vbmluamEgYXMgd2UgZG8KPiA+IHdpdGggUFlUSE9OTk9V
U0VSU0lURT8KPiA+Cj4gPiBZZWdvciAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
