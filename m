Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99139C2D0CD
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 18:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63B7E80D7B;
	Wed, 21 May 2025 18:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ooTa3jC0mOX; Wed, 21 May 2025 18:21:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F5AF80CE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F5AF80CE1;
	Wed, 21 May 2025 18:21:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 272A0758
 for <buildroot@buildroot.org>; Wed, 21 May 2025 18:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 179EF40339
 for <buildroot@buildroot.org>; Wed, 21 May 2025 18:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ui1F_o9nweJr for <buildroot@buildroot.org>;
 Wed, 21 May 2025 18:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F07EE400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F07EE400E7
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F07EE400E7
 for <buildroot@buildroot.org>; Wed, 21 May 2025 18:21:03 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id Ho3oubltPD5sdHo3punTG0; Wed, 21 May 2025 20:21:01 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 21 May 2025 20:21:00 +0200
Message-Id: <17AA5324-5D3E-4976-8637-207289592825@benettiengineering.com>
References: <94b1e185a5c4c928493a2e96f700b8c5@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <94b1e185a5c4c928493a2e96f700b8c5@free.fr>
To: Julien Olivain <ju.o@free.fr>
X-Mailer: iPhone Mail (22F76)
X-CMAE-Envelope: MS4xfNhODpUBMJQrAnlaDovN8ISKa8OMFOKr9Qf5f0qc31J+OS8PnEZ0bV6lVGWVzN0ntZudrPvwqcKtLPdJwYkvom+MQ83trbOkXyv+FIR5u8Ath0oULC8h
 j5FkwIXEOoBh7fhMvwfJBc0ml2NV+rQp0X9W0E5dMk9eN6jRkoJyWhZzrG1mrP4njCDMWNTexZj1kZVlZUugI/gyUHFaT813OmwAb+CICupt0Ok3TIo5+WGq
 llYxWIhv3hZDAKf3TDzjeA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1747851661; bh=AjV9xczlWYVwCWZe6NK9hH3PlK+EAoeivVY0GUth8xA=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=bKt8X6NDx8+D25PNhxmluYb5L3G+duGmlrPf/RbD3Ivfwx3ICBnJw4ET/E21EwXBQ
 P2276A7TNK+tRcUNQTsgiJhz8kiSMx2rKCLvlPStBUCvpBKPmfGV8RyRwv3qC2U7XF
 3ODirtNQPMxZBOrOcHZcrI8nYEYgc5mVhY9atgNH3fPfarxquSU4v7UKPNUz/HdV0f
 yustlPYNAywsmXtbulU8I/Bo5FZfOKel+1qsqeE0i56PDawOGHn5D30EWNzGjaAypL
 K/VQrvZhZWCABU3G8bvkG40AJ9w1qoU05Y7PR/IQCKG+W6KzS4YMgGFKSvuhqgNF49
 950Ldd0ccAleg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=bKt8X6ND
Subject: Re: [Buildroot] [PATCH] package/libnvme: bump to version 1.14
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDIxIG1hZyAyMDI1LCBhbGxlIG9yZSAyMDowMywgSnVsaWVuIE9saXZhaW4g
PGp1Lm9AZnJlZS5mcj4gaGEgc2NyaXR0bzoKPiAKPiDvu79PbiAyMC8wNS8yMDI1IDIyOjQxLCBH
aXVsaW8gQmVuZXR0aSB3cm90ZToKPj4gQWRkIGxvY2FsIHBhdGNoIHRvIGF2b2lkIGJ1aWxkIGZh
aWx1cmUgb24gZXhhbXBsZXMgZm9sZGVyIHRoYXQgd2UgZG9uJ3QKPj4gbmVlZC4gVGhhdCBidWls
ZCBmYWlsdXJlIGlzIGR1ZSB0byBtaXNzaW5nIGJpdHMvcHRocmVhZHR5cGVzLmggb24gbXVzbCBh
bmQKPj4gc2luY2Ugd2UgZG9uJ3QgbmVlZCBleGFtcGxlcyBhdCBhbGwgbGV0J3MgZGlzYWJsZSBp
dHMgYnVpbGRpbmcgYnkgcGFzc2luZwo+PiAtRGV4YW1wbGVzPWZhbHNlLgo+PiBGb3IgcmVsZWFz
ZSBub3RlLCBzZWU6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1udm1lL2xpYm52bWUvcmVs
ZWFzZXMvdGFnL3YxLjE0Cj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8u
YmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+IAo+IEFwcGxpZWQgdG8gbmV4dCwgdGhh
bmtzLgo+IAo+IEZvciBpbmZvLCBJIGFkZGVkIHRoZSBsaW5rIHRvIHRoZSAiVXBzdHJlYW06IiB0
YWcgaW4gdGhlIHBhdGNoIHdoaWNoIHdhcwo+IG1pc3NpbmcgZm9yIHNvbWUgcmVhc29uLiBTZWU6
Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2My
ZmRjZWJjNmVlNmI1ODk2NjVmOTkwM2I5OTdiODg3YmMwMzI3ZDcKPiAKClRoYW5rIHlvdSBKdWxp
ZW4sIEnigJl2ZSBtaXNzZWQgaXQuCkJlc3QgcmVnYXJkcwpHaXVsaW8KCj4gQmVzdCByZWdhcmRz
LAo+IAo+IEp1bGllbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
