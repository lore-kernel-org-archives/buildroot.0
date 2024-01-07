Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215F3C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B74AF400CF;
	Sun,  7 Jan 2024 16:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B74AF400CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U8loUQxNFuEB; Sun,  7 Jan 2024 16:54:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5A7B40191;
	Sun,  7 Jan 2024 16:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5A7B40191
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7581D1BF863
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E2C6812FC
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E2C6812FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y2yakJ_hwpSF for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:54:54 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1043781258
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1043781258
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 88899B0054E;
 Sun,  7 Jan 2024 17:54:47 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Jan 2024 17:54:47 +0100
Date: Sun, 7 Jan 2024 17:54:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZrXV0IzLjKOuvU7@landeda>
References: <20240107132346.3161192-1-fontaine.fabrice@gmail.com>
 <ZZrHtio9hrWSwB16@landeda>
 <CAPi7W82KB5bmo_+2C87CdS1kBy76UmMm0S1e0A2dg77ce1f1JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W82KB5bmo_+2C87CdS1kBy76UmMm0S1e0A2dg77ce1f1JQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704646490;
 bh=wMG0GBSqUo97HrFMeq9OPVSEEq8cqIwLFwrnKJ+bMGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I2jnPb/q9nlXE6WYM1eCFhw6CZU2ByFQTKvEzUmWWxQiM6gy81UnJgKjBMnm5MBm4
 Zng9vLPm56Vs2wU/mHyKktQy4g5DjYr/B6ycJ1+B5y4QjJdNCqkXyy9LnMiB5qRdFB
 xdsAWnURF4vn2TJ+J/lihk55AI+JPNJvytuDodZ8siokKToXOOxPuVFbMX1miVH2Ku
 iy8c1B0ioCWmrKaif99vXIuavO16/NLYZSB5Pfkno/f6/fMsyenGwL+HmRxuPCsuIg
 ZuABDJa4nQaDXjj8lREKL2acVxjPq4mq0Z/BufmTYvpVW4o3J53raZEKOeqjenSFNW
 UYmTR7Q5Tsq9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I2jnPb/q
Subject: Re: [Buildroot] [PATCH 1/1] package/liquid-dsp: fix build without
 neon
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyNC0wMS0wNyAxNzoxMSArMDEwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgZGltLiA3IGphbnYuIDIwMjQgw6AgMTY6NDgsIFlhbm4gRS4g
TU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4gPiBPbiAyMDI0LTAx
LTA3IDE0OjIzICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKWy0tU05JUC0t
XQo+ID4gPiAraWZlcSAoJChCUjJfYXJtKTokKEJSMl9BUk1fRlBVX05FT04pLHk6KQo+ID4gPiAr
TElRVUlEX0RTUF9DT05GX09QVFMgKz0gLS1lbmFibGUtc2ltZG92ZXJyaWRlCj4gPiBVc3VhbGx5
LCB3ZSBhZGQgYW4gZXhwbGljaXQgLS1kaXNhYmxlLiBBbnkgcmVhc29uIHdoeSBpdCB3YXMgbm90
IGFkZGVkCj4gPiBoZXJlPwo+IEJlY2F1c2UgLS1kaXNhYmxlLXNpbWRvdmVycmlkZSBpcyBub3Qg
c3VwcG9ydGVkLCB3b3JzdCwKPiAtLWRpc2FibGUtc2ltZG92ZXJyaWRlIGhhcyB0aGUgc2FtZSBl
ZmZlY3QgdGhhbiAtLWVuYWJsZS1zaW1kb3ZlcnJpZGUsCj4gYmVjYXVzZSB1cHN0cmVhbSBkb2Vz
bid0IGNoZWNrIHRoZSB2YWx1ZSBwcm92aWRlZCBieSB0aGUgdXNlcjoKPiBodHRwczovL2dpdGh1
Yi5jb20vamdhZWRkZXJ0L2xpcXVpZC1kc3AvYmxvYi81NDMyZTMxN2UzYzMxZjA2OWU4MjIzZDE4
NWMyODA3OGZjNDFjOGNjL2NvbmZpZ3VyZS5hYyNMNjQKCkFoLCBpbmRlZWQsIHRoYW5rcy4gSSBh
bHNvIHNhdyB0aGF0IHRoZSBleGlzdGluZyBjb2RlIGRpZCBub3QgYWRkIGl0LApub3csIHNvIEkn
dmUgcmVmYWN0b3JlZCB0aGUgY29kZSB0byBtYWtlIGl0IGV4cGxpY2l0IHdoeSB3ZSBkbyBub3Qg
cGFzcwotLWRpc2FibGUtc2ltZG92ZXJyaWRlLCBhbmQgSSBleHRlbmRlZCB0aGUgY29tbWl0IGxv
ZyB3aXRoIGFuIGV4Y2VycHQKZnJvbSB0aGUgY29uZmlndXJlLmFjIHdoaWxlIGF0IGl0LgoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRk
ZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3
NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAg
ICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAg
QUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEt
Z2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4g
IHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
