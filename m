Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959E1C79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 21:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FDA94057C;
	Sun,  6 Sep 2026 21:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWq-4HrQ3Tcq; Sun,  6 Sep 2026 21:15:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5DF6F40514
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788729355;
	b=fTGIMiBSaDvv5ZahR3q2AmxsfzcJOp5+ztiK7y6BOE1pUZHWfvwACd5tPRArInP/pLQJ
	 +A95JbOHa54njaW61aD3ZH23PR5aezmzlRNyCzRFS+SRuhF21ixaIIQ6P+7vU5gVOlTuT
	 10N7fBBpsBqBsC93wGUKCLzpoKyBvWlOX1syBYVVqucWEliJ3j2XtWRDqJ5lJOKmLmO3u
	 0ww79OQ+2g3vJTOfusE6cy5/6kzapMGB9Tj5l/nJlIvVDpa4aDAqJ8q3wNRl6Mn0NmpDU
	 Pd46jV3hDf61BB01PeQMcwK+dyzNxbdIyXnc1cwfrTVLnj9yCaRz7Cu/dLSOYsFGTyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788729355;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=m+aSgtlXau0vHLKjWiihWnnF1HRqwpwx4kKMx9X6Zwg=;
	b=cbnH4NKl2lc50NBkrVjbagDaPNdaqWX2TR7yI5E1f0tCFdzkf+XvtL1hSMvso5ENddCT
	 NlUlO5r8D4dO7/fMyUgKj5qe7j/nRbgD84vCsHZrpLaHOhAbBnaIXQFKiyNI8tYqXdC8g
	 37meQSGTnjKY82ARGkaKfwQ3cuK+GuvaTb0AKuhkXREeBSsqmrnsXC1NEdIjV8q/7fhaR
	 BHROhf9/uf405hLO4PqPhBWV3UX2idaRKs6hzecdQnGs6VDRZ7C2h1yV1IiqtUMKeKLIF
	 F72iQkAvycFwNwoDUqzwwNNwDnWR0+lUl0qhXJewCNjyAEczq7A46f9l2Ls7zyIoykQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788729355;
	bh=m+aSgtlXau0vHLKjWiihWnnF1HRqwpwx4kKMx9X6Zwg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hYd+vCgrxFDsOgVX12sBkwAZPmaPeYO3kZguVvNafieLgym/pO7jeAHslDRNzp2oo
	 XzfZjT7/f6NanvGgInPGOcJ6GOdfHKNgh9lHQjjbr5NP41PkuL3VAo97ab+tVdJGbi
	 j/hB0o/s3LzbLW/kJywWwwQ3sB1Tsg6uSAupm/7THqYCXfZEirNkEORp+FbUVFZKem
	 f80UusZzxxmXGsPqShwRhs0NSM1T31YS2lIPJCck04fLo3gu1IfvueIUbIu5uGXlDY
	 C1o8QPVhCtAEnDoDP/VHhI8ay+Eo26I8JWEShloT5JTxC/KoEkDu28StgFbIRK586N
	 GKnYDhwfFMtUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DF6F40514;
	Sun,  6 Sep 2026 21:15:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B755C388
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 21:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A91CE605E9
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 21:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnYWT2CllWVE for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 21:15:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 95097605C7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788729351;
 b=VxgZqF34iELHgYg4O9hTcRA21Vdr+AqdOlNy2D3m4du2NGFk4EfaWmFhxG43aTT3Z1Cn
 rARcdPj/AqPCBYSTgWlQj1Ta7+crnfzod9DxRhHa1qw3I5hgJIrxOE4wAP8mnsfFhT5xw
 nkHMyxtyj86ZipSpAobK5CGmZ/HnndHKW1Eu6fShjG70yyLNj6gE3f7H/6wGOY0KQaeOJ
 evNHSCQP3xN0EawyMXkvf6FrN3I2QVFsBAeP8RM/t2a+c8njxgpezA6D5ehwVafKJJasL
 lkxqkHuldd8/giaLgX/z6wSGK3sdvDKzpwR6aC4HT2G8Opju6XMCGfZDjLt0R1bemfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788729351;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=49ijh17AyP+635QqzLV4I0FXpnpceuD488Jxk+0RNOE=;
 b=JqtjUBTBcjBGGc9xD3QC0hpGkB+eTTJnthFM2jPK69BLNJGzhKoUaC3b0dnxTHUg5L6B
 KSWmrQdyz1rLefNgXwx5VcXht8Gt3xrezNsTXIhINkCeH0gJTEaBFtkBqpatqGyUxG0Lt
 udkR/z2a850rtlbvk2eW3B86tI14dmaMk/CHWD/uBNUwqgqo80QkkL5f7NxSfy0hmPQq4
 6BQdmxGBe5S5zDSdqeJMQuA+AHJlolNl1rJFQQ6LmXz/32ZV6ZEtFRA7x2KJUDL94AF7t
 cRgaKr0dDrnhmELI988dWuH3+aB5vRDE4ze1BJ2wC3H0a8LMx3DCW39ahjDjM1RMvJA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Cfd6KkVb; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95097605C7
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 21:15:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B1E734E414D7
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 21:15:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 70B7760288;
 Sun,  6 Sep 2026 21:15:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C5BA111C79FF0; 
 Sun,  6 Sep 2026 23:15:40 +0200 (CEST)
Date: Sun, 6 Sep 2026 23:15:39 +0200
To: Joseph Kogut <joseph@anodize.com>
Cc: buildroot@buildroot.org, joseph.kogut@gmail.com
Message-ID: <ap3Xvv4F7Mgi3mve@windsurf>
References: <20260818-passt-20260728-v1-0-aa8bc1ce2c5a@anodize.com>
 <20260818-passt-20260728-v1-2-aa8bc1ce2c5a@anodize.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260818-passt-20260728-v1-2-aa8bc1ce2c5a@anodize.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/passt: bump to version
 2026_07_28.f8df3f1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zZXBoLAoKT24gVHVlLCBBdWcgMTgsIDIwMjYgYXQgMDE6NTU6MzRQTSAtMDcwMCwg
Sm9zZXBoIEtvZ3V0IHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IEpvc2VwaCBLb2d1dCA8am9zZXBo
QGFub2RpemUuY29tPgo+IC0tLQo+ICBwYWNrYWdlL3Bhc3N0L3Bhc3N0Lmhhc2ggfCAyICstCj4g
IHBhY2thZ2UvcGFzc3QvcGFzc3QubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpUaGFua3MgZm9yIHRoaXMgcGF0Y2guIFdpdGgg
dGhpcyB2ZXJzaW9uIGJ1bXAsIHRoZSBidWlsZCBmYWlscyB3aXRoOgoKaXNvbGF0aW9uLmM6IElu
IGZ1bmN0aW9uIOKAmGlzb2xhdGVfZmRz4oCZOgppc29sYXRpb24uYzoyNzc6MTM6IGVycm9yOiBp
bXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhjbG9zZV9yYW5nZeKAmTsgZGlkIHlv
dSBtZWFuIOKAmFNZU19jbG9zZV9yYW5nZeKAmT8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFy
YXRpb25dCiAgMjc3IHwgICAgICAgICBpZiAoY2xvc2VfcmFuZ2UoY2xvc2VfZnJvbSwgfjBVLCBD
TE9TRV9SQU5HRV9VTlNIQVJFKSkgewogICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+CiAg
ICAgIHwgICAgICAgICAgICAgU1lTX2Nsb3NlX3JhbmdlCmlzb2xhdGlvbi5jOjI3Nzo0MjogZXJy
b3I6IOKAmENMT1NFX1JBTkdFX1VOU0hBUkXigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRo
aXMgZnVuY3Rpb24pCiAgMjc3IHwgICAgICAgICBpZiAoY2xvc2VfcmFuZ2UoY2xvc2VfZnJvbSwg
fjBVLCBDTE9TRV9SQU5HRV9VTlNIQVJFKSkgewogICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fgppc29sYXRpb24uYzoyNzc6
NDI6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25j
ZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6
MTAzOiBwYXNzdF0gRXJyb3IgMQptYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvdGhv
bWFzL3Byb2pldHMvYnVpbGRyb290L291dHB1dC9idWlsZC9wYXNzdC0yMDI2XzA3XzI4LmY4ZGYz
ZjEnCm1ha2U6ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5tazoyNzM6IC9ob21lL3Rob21hcy9w
cm9qZXRzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvcGFzc3QtMjAyNl8wN18yOC5mOGRmM2YxLy5z
dGFtcF9idWlsdF0gRXJyb3IgMgoKV2l0aCB0aGUgZm9sbG93aW5nIGNvbmZpZ3VyYXRpb246CgpC
UjJfYWFyY2g2ND15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQpCUjJfVE9PTENIQUlOX0VYVEVS
TkFMX0JPT1RMSU49eQpCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fQUFSQ0g2NF9NVVNM
X0JMRUVESU5HX0VER0U9eQpCUjJfSU5JVF9OT05FPXkKQlIyX1NZU1RFTV9CSU5fU0hfTk9ORT15
CiMgQlIyX1BBQ0tBR0VfQlVTWUJPWCBpcyBub3Qgc2V0CkJSMl9QQUNLQUdFX1BPRE1BTj15CiMg
QlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKCk5vdGUgdGhhdCBJIGRpZG4ndCB0cnkg
X2JlZm9yZV8gdGhlIGJ1bXAsIHNvIEkgYW0gbm90IDEwMCUgc3VyZSB0aGUKYnVpbGQgaXNzdWUg
aXMgY2F1c2VkIGJ5IHRoZSBidW1wLgoKQ291bGQgeW91IGhhdmUgYSBsb29rPwoKVGhhbmtzIQoK
VGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8v
Ym9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
