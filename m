Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C23C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 12:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDE3060611;
	Sun, 23 Feb 2025 12:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BIhf2Gs2PNJ; Sun, 23 Feb 2025 12:56:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB5F060A4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB5F060A4B;
	Sun, 23 Feb 2025 12:56:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C465920
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4802260611
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVCnqBNpeHMC for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 12:56:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 99F8660A4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99F8660A4B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99F8660A4B
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:56:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 4AF2C780375;
 Sun, 23 Feb 2025 13:56:41 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 13:56:41 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 13:56:41 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250218222057.141941-1-raphael.melotte@mind.be>
References: <20250218221145.140519-1-raphael.melotte@mind.be>
 <20250218222057.141941-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <b17b61d28dfe31bcf88371c8f805d4bd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740315402;
 bh=H9+KRTCbic3vLOiMklEkoq1HBubzG9DfueNnSCWLyKU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RLzV1+EiHWX0MdNek8ixbFTtV5G7XoxEd7efHta5FsD50xhniqc8EC6199TfZ9Vmy
 vU9UzIyCvKE1wF32P9CetINHEraUGvUBcU3sK9Ljjmv3+dB7QHuLmGAzwJ70qPC22z
 KK5xgsqjl+fBpoT7Ampnj+BjuBaAOGoIXoWHmb9tCrvdvHcp72vRr8lhnDwjVN29Ad
 XsjqJvGMjGUgGxdOtD9tTrGqN39b9pJ9W/p6QdqTUcN7lcfX4IvbiJwIMABiSkBlN7
 30dpE6RSvIGUdWNOi8RmpGjhymXePaK9zxjf0Ls93ZNA1aZooTvSgecZruLGT9phaD
 F1K1D68jY2j2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RLzV1+Ei
Subject: Re: [Buildroot] [PATCH v2 1/1] package/jbig2dec: bump to version
 0.20
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

T24gMTgvMDIvMjAyNSAyMzoyMCwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBTdGFydGluZyBmcm9tIHRoaXMgdmVyc2lvbiBuZXdlciByZWxlYXNlcyBhcmUgb25seSBh
dmFpbGFibGUgYXQgYSBuZXcKPiBkZWRpY2F0ZWQgcmVwb3NpdG9yeSwgc28gdGhlIHNpdGUgaXMg
dXBkYXRlZCBhY2NvcmRpbmdseS4KPiAKPiBIYXNoIGZpbGVzIG5vIGxvbmdlciBleGlzdCBpbiB0
aGUgbmV3IHJlcG8sIHNvIHJlbW92ZSB0aGUgcmVsYXRlZAo+IGNvbW1lbnQuCj4gCj4gSXQgdHVy
bnMgb3V0IHRoYXQgaW5zdGFsbC1zaCBoYXMgYmVlbiBhdmFpbGFibGUgaW4gdGhlIHRhcmJhbGwg
c2luY2UKPiB2ZXJzaW9uIDAuMTksIHNvIHJlbW92ZSBKQklHMkRFQ19BVVRPUkVDT05GLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5i
ZT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
