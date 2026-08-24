Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFC2C5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 20:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD51680BD3;
	Mon, 24 Aug 2026 20:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4HZmAwWpIE4; Mon, 24 Aug 2026 20:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787601628;
	bh=QKjnnHi6I4weKTs+bzZAPc7ot2jWeTxtricqWJvY7U0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Bk2SuNmkVqBQBIpKyCJJCtJZFNYeNxaNJqWiOunZoUUTbypdDvwZtucbGQ7QUMGgU
	 lSFsId9wNBY4YuY0rcTQQaMZ2/0FrZ67INDBEZLQaM4r0g3LyzdS4kHU00f4FCiNpY
	 CXxmr2oVPC+Ayrv+0sLkOsCF77ykUk3wUYiIrK7EBBzojfvlzqxNGmKSHprxwexhvR
	 j0G/jMEFSjxPrQEo2X1FvdYbPsLUITYPOKlK1ZX2MtpxCvuxNBtXVDtNofVYe57509
	 lVLzO9kEOTh2EGs+iXsy7ALyD8Gtnm5AsZTL7KkufVLDweSxLMTnzFB6FFWM2XBp7n
	 8mDZsp4DJYf/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBF4C806FC;
	Mon, 24 Aug 2026 20:00:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0615279
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A23C040510
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78lN5rGbGwkz for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 20:00:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A336A404F2
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:00:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 29CEC1A1804;
 Mon, 24 Aug 2026 20:00:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E32235FFC1;
 Mon, 24 Aug 2026 20:00:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B854711C79B90; 
 Mon, 24 Aug 2026 22:00:15 +0200 (CEST)
Date: Mon, 24 Aug 2026 22:00:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aoyivLhRbgBke6ou@windsurf>
References: <20260724164829.304335-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260724164829.304335-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/taglib: mp4 support needs
 threads
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

T24gRnJpLCBKdWwgMjQsIDIwMjYgYXQgMDY6NDg6MjdQTSArMDIwMCwgQmVybmQgS3VobHMgd3Jv
dGU6Cj4gQnVpbGRyb290IGNvbW1pdCAxYzU3MzBlYmI1ZThiOWE2NzQzM2FhOTk5N2U1Y2ZkNmNh
ZTE4Y2ZlIGJ1bXBlZCB0aGUKPiBwYWNrYWdlIGZyb20gdmVyc2lvbiAyLjIuMSB0byB2ZXJzaW9u
IDIuMyB3aGljaCBpbmNsdWRlcyB1cHN0cmVhbSBjb21taXQKPiBodHRwczovL2dpdGh1Yi5jb20v
dGFnbGliL3RhZ2xpYi9jb21taXQvNWQ2MzE4N2E4YjhkMjkxY2JmNGY3N2QxYmI5NzNiYzVlZTkx
Y2YwMwo+IHRoYXQgdXNlcyBzdGQ6OmNhbGxfb25jZSBhbmQgaXMgb25seSBhdmFpbGFibGUgd2l0
aCB0aHJlYWRzIHN1cHBvcnQuCj4gCj4gSW5zcGlyZWQgYnkgYnVpbGRyb290IGNvbW1pdCBmOWEy
ZDY1Y2FlODhjYTdjNjQxYWYyZjY5MTYxYWIwZDIxYmFjOTFjCj4gd2hpY2ggZml4ZWQgYSBzaW1p
bGFyIGVycm9yLgo+IAo+IFRoaXMgcGF0Y2ggZml4ZXMgYSBidWlsZCBlcnJvcgo+IAo+IC9idWls
ZHMvYmt1aGxzL2J1aWxkcm9vdC9ici10ZXN0LXBrZy9ici1hcm0tZnVsbC1ub3RocmVhZC9idWls
ZC90YWdsaWItMi4zL3RhZ2xpYi9tcDQvbXA0aXRlbWZhY3RvcnkuY3BwOjUxOjE2Ogo+ICBlcnJv
cjog4oCYb25jZV9mbGFn4oCZIGluIG5hbWVzcGFjZSDigJhzdGTigJkgZG9lcyBub3QgbmFtZSBh
IHR5cGUKPiAKPiBjYXVnaHQgYnkgdGhlIEdpdGxhYiBwaXBlbGluZXMuIFRvIHJlcHJvZHVjZSB1
c2UgdGhpcyBkZWZjb25maWc6Cj4gCj4gICBCUjJfYXJtPXkKPiAgIEJSMl9hcm0xMTc2anpmX3M9
eQo+ICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gICBCUjJfVE9PTENIQUlOX0VYVEVSTkFM
X0NVU1RPTT15Cj4gICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0RPV05MT0FEPXkKPiAgIEJSMl9U
T09MQ0hBSU5fRVhURVJOQUxfVVJMPSJodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvdG9v
bGNoYWlucy90YXJiYWxscy9ici1hcm0xMS1mdWxsLW5vdGhyZWFkLTIwMjAuMTEuMi50YXIuYnoy
Igo+ICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9HQ0NfOT15Cj4gICBCUjJfVE9PTENIQUlOX0VY
VEVSTkFMX0hFQURFUlNfNV85PXkKPiAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfTE9DQUxFPXkK
PiAgICMgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9IQVNfVEhSRUFEUyBpcyBub3Qgc2V0Cj4gICBC
UjJfVE9PTENIQUlOX0VYVEVSTkFMX0NYWD15Cj4gICBCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJ
RVM9eQo+ICAgQlIyX1BBQ0tBR0VfVEFHTElCPXkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBL
dWhscyA8YmVybmRAa3VobHMubmV0PgoKVGhhbmtzIGEgbG90LCBhcHBsaWVkIHRvIG1hc3RlciEK
ClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczov
L2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
