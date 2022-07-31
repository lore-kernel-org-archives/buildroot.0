Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40CAC00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 06:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C3BD83265;
	Sun, 31 Jul 2022 06:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C3BD83265
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wwn-Ql3J69G4; Sun, 31 Jul 2022 06:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A58D82E22;
	Sun, 31 Jul 2022 06:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A58D82E22
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E37061BF5A0
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 06:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDE6081321
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 06:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDE6081321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y5hVSbKSV8vW for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 06:43:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BD4E8127C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BD4E8127C
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 06:43:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed0d:5473:88a:e206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 50F4260133;
 Sun, 31 Jul 2022 08:43:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 31 Jul 2022 08:43:20 +0200
Date: Sun, 31 Jul 2022 08:43:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Message-ID: <20220731064320.GZ3168@scaer>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-4-joel@jms.id.au>
 <b1b0b11a-6c49-9d7c-5d1b-b6ec8e6a2966@kaod.org>
 <20220729213721.GH1554632@scaer>
 <5ba970ce-7cd0-acb3-c6be-7ddeafbad876@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ba970ce-7cd0-acb3-c6be-7ddeafbad876@kaod.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659249808;
 bh=KlH3KIwuzrGihjxElApBHvlDS0DME0IZxYlNoElbk3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ONMJ+Pi1yOFpmUmCHfmtF68ngASjQVIMXBxRMFS6cOdElKap7TJ5FMc788QBR+IOR
 C61WTar2D84VpieEwAtKsTUN85rcSbbu69kwrUnYcqd5h+1OMRajvbybbErz8moURf
 KuW136chmh9hOyV95/C7ygeHaf6wMKf5oqKtisHnhDMcNM6sjwj/pnBu+1Bd8W0oYY
 qNBiL1wwgdizO6JWpXr1uSpHGleZTLgga7L6F3XJyXVLEtU87zfFYpvruH0lKY7yLj
 cpXZow8bS8pYPJ93kOT4975xuNB8kEaQMTt+n+E6kcraIVc0bJk/P0Eo/cDV+higin
 KdAr1VD8GhRYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ONMJ+Pi1
Subject: Re: [Buildroot] [PATCH 3/9] arch/powerpc: Enable powerpc64le only
 on CPUs that support it
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q8OpZHJpYywgQWxsLAoKT24gMjAyMi0wNy0zMCAyMzoxOCArMDIwMCwgQ8OpZHJpYyBMZSBHb2F0
ZXIgc3Bha2UgdGh1c2x5Ogo+IE9uIDcvMjkvMjIgMjM6MzcsIFlhbm4gRS4gTU9SSU4gd3JvdGU6
Cj4gPk9uIDIwMjItMDctMjkgMDg6NTIgKzAyMDAsIEPDqWRyaWMgTGUgR29hdGVyIHNwYWtlIHRo
dXNseToKPiA+Pk9uIDcvMjkvMjIgMDI6MDgsIEpvZWwgU3RhbmxleSB3cm90ZToKPiA+Pj5JbiBv
cmRlciB0byBydW4gYSBwcGM2NGxlIHVzZXJzcGFjZSBhIGtlcm5lbCB0aGF0IHJ1bnMgaW4gdGhp
cyBtb2RlIGlzCj4gPj4+cmVxdWlyZWQuIFRoZSBvbmx5IENQVSBzdXBwb3J0ZWQgaW4gYnVpbGRy
b290IHRoYXQgY2FuIGJvb3QgYSBwcGM2NGxlCj4gPj4+a2VybmVsIGlzIFBvd2VyOCwgc28gbWFy
ayBhbGwgb2YgdGhlIG90aGVyIDY0LWJpdCBjYXBhYmxlIENQVXMgYXMgbm90Cj4gPj4+c3VwcG9y
dGluZyBwcGM2NGxlLgo+ID4+SSBkb24ndCB0aGluayB3ZSBjYXJlIG11Y2ggYnV0IFBvd2VyNyBj
b3VsZCBydW4gYWxzbyBpbiBMRS4KPiA+Sm9lbCBzZWVtZWQgdG8gc3RhdGUgdGhhdCBvbmx5IHRo
ZSBwb3dlcjggY2FuIGJlIExFLCBzbyB3aG8ncyByaWdodD8gOy0pCj4gSG9uZXN0bHkgd2UgZG9u
J3QgcmVhbGx5IGNhcmUgYWJvdXQgUG93ZXI3L0xFLiBJdCBuZXZlciBjYW1lIG91dCBvZgo+IHRo
ZSBsYWIuIFBvd2VyOCB3YXMgdGhlIGZpcnN0IHJlbGVhc2VkLCBsZXQncyBrZWVwIGl0IHRoYXQg
d2F5LgoKVGhhdCdzIHBlcmZlY3RseSBmaW5lIHdpdGggbWUuIFRoYW5rcyEKClJlZ2FyZHMsCllh
bm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJ
TiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNw
aXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FN
UEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0t
LS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwK
fCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAg
IHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
