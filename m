Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E66ECD6E4A
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 05:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D37061CB5;
	Thu,  4 Jun 2026 05:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFbnDK_ElyV3; Thu,  4 Jun 2026 05:11:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B95061CF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780549864;
	bh=8w3UQ54VGEXqEtNEFfit6DdY26qQf1i23kGF6AzN9i8=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WVzvu4yCv2m3ndeYaSybgwzcaW+JrZkhKNkmLsC84ClXa4VvZMrsUrvngMx1IQQMI
	 ZRf/4rJyZ5NaIsVhMea+Fz8jfWgMpRmzOKu099/qFfHtIA+1O13PnCW7AzOeH++fcu
	 GTf2HSNxjImTvsgKdL85axyLmUrxvOVq99H6T7L3PVZp7wy0IksCCj1zfJRZ21y5J0
	 yoR5LXJM0Nva+gKkUIoFMCu7JqFUGpttIW4SADb2C6s+Fg4Bsxw10eK9hzjTh8KS7K
	 W0RIXCTrQ8FBWV6wV0Iy+o0pb7HkRbpwpRztaSXMWxh8C4MspWHyJ1DMoNZDv9N8+z
	 6TBsZpRzDv42g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B95061CF7;
	Thu,  4 Jun 2026 05:11:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53B2CDE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 05:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4536E84AFE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 05:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGaGVPD0mnNq for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 05:11:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1382884AF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1382884AF1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1382884AF1
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 05:11:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE5BC2065C;
 Thu,  4 Jun 2026 05:10:51 +0000 (UTC)
Message-ID: <bcce0818-ac04-42c7-94f3-5db51e14f6dc@yoseli.org>
Date: Thu, 4 Jun 2026 07:10:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-11-jeanmichel.hautbois@yoseli.org>
 <ahmYo01FFmj7ewrC@windsurf> <92e32912-9e2f-4117-94a6-4679e2d33f38@rnout.be>
Content-Language: fr-FR, en-US, en-GB
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <92e32912-9e2f-4117-94a6-4679e2d33f38@rnout.be>
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTFngAVl6HEhFpfYBXkV1Z1TkKpINX1A57Gq3Nxt2XRr5O6UikDUo/T5CfPDyJ4kuphhy++mFUBWiu0XKLLwXAkQhgcmMs1kFOJWKwVGHjTGyaIh6BqyFaEbhAFOLBxNAYRHoykVXoIRZYWyo8m/u/P2QHWyygHPUVAUPY4d+VjpYaCVBttkIsDklWp39dgXrWZMJuk+rIcra1RhRBH/uoOGE4P15hnHFo0lBg4pjF/g7QOqjI1P6J0vaMK3OoDDBq+uDYNGs3OybH2GiqnYqqXNmTElq6d0pNqUnRcAL3m+SRQGFrn/YTXha8Z8SM1JXhrUTkBojen8DyZ/XflLMK09aGkoYVp1RpIWHkU7GZVFfwEPAWxY6iAnjTW0bFAsggMlCnDOm39NfysRSO7YoEDNP94m5dITVE4AXolpmXTUnL6cMgEhAE30/bMJt5tKemfr5fn/IQM0Tuq/Rrq1/UIG51scQhP56hTHpccB4aaOHsEbOp+iJwJ7LfBh6tZNXPELRoelmPqn1cZzY77G+kVxaFQWcoR02VL00iAhp7khKgmGyapFOkX9hCQ7t9/rDJKAN7X8ha2epnQcWTy+2w6PCS7ulkUHetnoh6NFKj12yGUiMbzCRGEA2P9XzVZO8jN1ssf2tkRrrbAhPjsi3YVt4jRF/hqUfN3qZiJlZzrblw
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780549852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3ux5IDYXDw8QsFwl+vxuPvYCMllDEDiyw5kEZ1aw4s=;
 b=kFPxXRa5LA5lZaC+UDPQZ96/SA5sOcFV1r2KPr41kwY5dMjF7IzNiZpTgVTj2GzcEaFz76
 x93N5LpO1LUiUPT3uWnPJilaZbBaljglp53QL9SrKlrRJba87yoTcQ6ZBz7miQjAup+S1D
 XhQFjuZR5ewi9G8mfhFNGAikefnF3SE0IkOB61an6kEQZL8MwS3LUv1N6FJgVqBKCdK0p7
 Rwu93uN9GyPckiUIimEhjFcLPNFSvQLCXUYirfPN2YIcXsZv2QUMFyhVMpnH9wb9ZKGayv
 ehXxfjRYvW5MPdmxGn3/C6/oULuW0Wq9BS2gNz8UP5eI69H3fq35zYGKX78WJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=kFPxXRa5
Subject: Re: [Buildroot] [PATCH 10/11] package/mawk: create awk symlink on
 install
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKTGUgMzAvMDUvMjAyNiDDoCAxNzo1MiwgQXJub3V0IFZhbmRlY2FwcGVsbGUg
dmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IAo+IAo+IE9uIDI5LzA1LzIwMjYgMTY6MDAsIFRo
b21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4gVGhlbiwgeW91IGFsc28gbmVl
ZCB0byBhdm9pZCB0aGUgY29uZmxpY3QgYmV0d2VlbiBnYXdrIGFuZCBtYXdrLiBBZnRlcgo+PiBk
aXNjdXNzaW5nIHdpdGggb3RoZXIgbWFpbnRhaW5lcnMsIGl0IHNlZW1zIGxpa2Ugb3VyIHByZWZl
cmVuY2UgaXMgdG8KPj4gaGF2ZSBtYXdrIHdpbiBvdmVyIGdhd2ssIHNvIHlvdSBzaG91bGQgYWRk
Ogo+Pgo+PiBpZmVxICgkKEJSMl9QQUNLQUdFX0dBV0spLHkpCj4+IE1BV0tfREVQRU5ERU5DSUVT
ICs9IGdhd2sKPj4gZW5kaWYKPj4KPj4gVGhpcyB3YXksIHdlIHdpbGwgYmUgc3VyZSB0aGF0IGdh
d2sgZ2V0cyBidWlsdCBiZWZvcmUgbWF3aywgZW5zdXJpbmcKPj4gdGhhdCBtYXdrIHdpbnMuCj4g
Cj4gIMKgV2hlbiBkaXNjdXNzaW5nIHRoaXMgSSBmb3Jnb3QgdGhhdCBpdCBkb2Vzbid0IGFjdHVh
bGx5IHdvcmsgbGlrZSB0aGF0LiAKPiBXaGF0IHdlIGhhdmUgdG8gZG8gaXMgdG8gYnVpbGQgZ2F3
ayBfYWZ0ZXJfIG1hd2ssIGFuZCBtYWtlIHN1cmUgdGhhdCAKPiBnYXdrIGRvZXNuJ3QgaW5zdGFs
bCB0aGUgYXdrIC0+IGdhd2sgc3ltbGluayBpZiB0aGVyZSBpcyBhbHJlYWR5IGFuIGF3ayAKPiBp
bnN0YWxsZWQuIFRoYXQgaXMgd2hhdCBidXN5Ym94IGRvZXMuCj4gCj4gIMKgSXQgaGFzIHRvIGJl
IHRoYXQgd2F5IGJlY2F1c2UgdGhlIGZpbmFsIHRhcmdldCBkaXIgaXMgbm90IHBvcHVsYXRlZCBp
biAKPiBkZXBlbmRlbmN5IG9yZGVyLCBidXQgaW4gYWxwaGFiZXRpY2FsIG9yZGVyLiBJdCBoYXBw
ZW5zIHRvIHdvcmsgYmVjYXVzZSAKPiBtYXdrIGNvbWVzIGxhdGVyIHRoYW4gZ2F3ayBzbyBpdCB3
aW5zLCBidXQgd2Ugc2hvdWxkbid0IHJlbHkgb24gdGhhdC4KPiAKClRoYW5rcyBmb3IgdGhlIGNv
cnJlY3Rpb24sIHRoYXQgbWFrZXMgc2Vuc2UuIFJlbHlpbmcgb24gdGhlIGFscGhhYmV0aWNhbCAK
aW5zdGFsbCBvcmRlciBpcyB0b28gZnJhZ2lsZS4KCkkgd2lsbCBmb2xsb3cgdGhlIGJ1c3lib3gg
bW9kZWwgaW5zdGVhZDogYnVpbGQgZ2F3ayBhZnRlciBtYXdrIGFuZCBtYWtlCmdhd2sgc2tpcCB0
aGUgJ2F3aycgc3ltbGluayB3aGVuIG9uZSBpcyBhbHJlYWR5IGluc3RhbGxlZCwgd2hpbGUga2Vl
cGluZwptYXdrIGluIEJVU1lCT1hfREVQRU5ERU5DSUVTIHNvIEJ1c3lCb3ggZG9lcyBub3Qgb3Zl
cndyaXRlIGl0IGVpdGhlci4KCkFzIHRoaXMgaXMgaW5kZXBlbmRlbnQgb2YgdGhlIENvbGRmaXJl
IHNlcmllcywgSSB3aWxsIHNlbmQgaXQgYXMgYQpzZXBhcmF0ZSwgZGVkaWNhdGVkIHBhdGNoLgoK
VGhhbmtzICEKSk0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
