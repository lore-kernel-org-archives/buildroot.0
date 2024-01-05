Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BC9C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90D3E83EF7;
	Fri,  5 Jan 2024 13:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90D3E83EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAu250i2CKyi; Fri,  5 Jan 2024 13:26:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB5C483EEC;
	Fri,  5 Jan 2024 13:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB5C483EEC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 457FD1BF841
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0ABDB4221C
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ABDB4221C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MLHdOqpGdmI for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:26:02 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A8E342207
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A8E342207
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51FDF1BF20C;
 Fri,  5 Jan 2024 13:26:00 +0000 (UTC)
Date: Fri, 5 Jan 2024 14:25:59 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240105142559.5c8bd100@windsurf>
In-Reply-To: <13943A12-FC50-4F95-B5E8-45941CB925B2@benettiengineering.com>
References: <20240105140611.6a19a037@windsurf>
 <13943A12-FC50-4F95-B5E8-45941CB925B2@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704461160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWRLXefcX+9+Ki5ViTW7XTd5nq/H0NiowwR9Rm8c1pk=;
 b=AggYwOTsUH3ye106orDY3DcBrMrQPziA/CBWFCJS/htG3+dyYYC3jdKwdBx1TnKAndKHEd
 OGZOgQvFwIgw8gTCouaB2aDNtMcb6ovYI/bpdc24wJ1pjNKKD+LlfNl0neTZA7jH2hxh5u
 i0M6FkNiH9xAIUBnO87LQt6PiPI2Dt8PzcgPg0kyXvLmB74lsMyA3sG+5qtACsZVk/Tj9h
 fYuhLcP2HFORc0EHUvKrVyb4w0u+tBK3KP9dirJ2k0wEjmvM3+aQy3C1igVj2TusLQgD3J
 jXher3SiEYrp4ML2X5/9a1r6SD0HnbaLtOKg3B5Q+cjGS59UHpi4WiqZL2Ex0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AggYwOTs
Subject: Re: [Buildroot] [PATCH v2] package/swugenerator: add missing
 runtime dependencies
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2l1bGlvLAoKT24gRnJpLCA1IEphbiAyMDI0IDE0OjIyOjE1ICswMTAwCkdpdWxpbyBC
ZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKCj4g
WWVzLiBUbyB0ZWxsIHRoZSB0cnV0aCBJIGRvbuKAmXQgZXZlbiByZW1lbWJlciB3aHkgSSBoYXZl
IHNlbnQgVjIgc2luY2UKPiBJIHN0aWxsIGhhdmUgdG8gYW5zd2VyIHRvIHByZXZpb3VzIGVtYWls
LCBpbmNsdWRpbmcgdGhlIHJ1bnRpbWUgdGVzdAo+IHRvIGNoZWNrIGZvciBob3N0IGRlcGVuZGVu
Y2llcy4KCkEgcnVudGltZSB0ZXN0IHdvdWxkIG9idmlvdXNseSBiZSBnb29kLCBidXQgSSBjbGVh
cmx5IHRvIG1ha2UgdGhhdCBhCnJlcXVpcmVtZW50IHRvIG1lcmdlIHRoaXMgcGF0Y2guIE9ubHkg
dG8gaGF2ZSBhIHNsaWdodGx5IGJldHRlciBjb21taXQKbG9nIHRoYXQgZXhwbGFpbnMgaG93L3do
eSBvcGVuc3NsL2d6aXAvenN0ZCBhcmUgdXNlZCBieSBzd3VnZW5lcmF0b3IuCgpUaG9tYXMKLS0g
ClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
