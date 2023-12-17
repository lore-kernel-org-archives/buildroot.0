Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600BFC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 21:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10D3281DF7;
	Sun, 17 Dec 2023 21:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10D3281DF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lpKSCehlVBnm; Sun, 17 Dec 2023 21:36:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56AA781DE7;
	Sun, 17 Dec 2023 21:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56AA781DE7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E1151BF37F
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 21:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53D9740936
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 21:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53D9740936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKpBD0_V-mAI for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 21:36:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7135640930
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 21:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7135640930
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55F77FF803;
 Sun, 17 Dec 2023 21:36:48 +0000 (UTC)
Date: Sun, 17 Dec 2023 22:36:47 +0100
To: =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <20231217223647.3c2d5ff2@windsurf>
In-Reply-To: <20231212134955.32728-1-sebastien.szymanski@armadeus.com>
References: <20231212134955.32728-1-sebastien.szymanski@armadeus.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702849008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0D+QsDF7IfVedwA7YtlIa4JVK2o4phbQUtbvsUZBxE=;
 b=F37CT8NjNdPplJ+peeLHbLHT8sZvd95aMGdUm2ZvaqAyVwDpoVxR1kWsL9z02yPv3Nud3V
 VMKqXfz5Q9kpzkn0gWxP6uKUVztVszpul/XMaGLUVWbD3jNuWwx0EgMkc3cp96rSxv3DKK
 pD3Uxv7IYoo96XxyFL73hXAAVedemI8+EcFU0MwXd9tjQJn+oYM2Oj0fGFJNfx/2HzPH1H
 sMi5El8jJXwGL/deZVss+nCRg7FutkV3pf70N6INmuoPnsC61Jwiu33Zvn+WWuie5BBSk0
 QcwfgPdBZuYImiRDbRHlrWYqWmNx9ELajOEw79nYINbFxZnsso4JPuhQjoWB+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F37CT8Nj
Subject: Re: [Buildroot] [PATCH 1/1] package/tree: update _SITE URL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxMiBEZWMgMjAyMyAxNDo0OTo1NSArMDEwMApTw6liYXN0aWVuIFN6eW1hbnNraSA8
c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+IHdyb3RlOgoKPiBUaGUgY3VycmVudCBU
UkVFX1NJVEUgVVJMIGRvZXNuJ3Qgd29yayBhbnltb3JlLgo+IE1vcmVvdmVyIHRoZSBSRUFETUUg
c3RhdGVzOgo+ICIKPiBUaGUgbWFpbiBkaXN0cmlidXRpb24gc2l0ZSBmb3IgdHJlZSBpcyBoZXJl
Ogo+IGh0dHA6Ly9vbGRtYW5wcm9ncmFtbWVyLm5ldC9zb3VyY2UucGhwP2Rpcj1wcm9qZWN0cy90
cmVlCj4gCj4gQmFja3VwIEdJVCBzaXRlcyBhcmU6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL09sZE1h
blByb2dyYW1tZXIvdW5peC10cmVlCj4gaHR0cHM6Ly9naXRodWIuY29tL09sZC1NYW4tUHJvZ3Jh
bW1lci90cmVlCj4gCj4gT2xkIHNpdGUgZm9yIGFzIGxvbmcgYXMgaXQgbGFzdHM6Cj4gaHR0cDov
L21hbWEuaW5kc3RhdGUuZWR1L3VzZXJzL2ljZS90cmVlLwo+IGZ0cDovL21hbWEuaW5kc3RhdGUu
ZWR1L2xpbnV4L3RyZWUvCj4gIgo+IAo+IFVzZSBodHRwOi8vb2xkbWFucHJvZ3JhbW1lci5uZXQv
dGFyL3RyZWUvIGZvciBUUkVFX1NJVEUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6
eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Cj4gLS0tCj4gIHBhY2th
Z2UvdHJlZS9Db25maWcuaW4gfCAyICstCj4gIHBhY2thZ2UvdHJlZS90cmVlLm1rICAgfCAyICst
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RP
LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9i
b290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
