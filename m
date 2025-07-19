Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B4DC83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 11:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A19CF61B42;
	Sat, 19 Jul 2025 11:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WddNnfQjzdz; Sat, 19 Jul 2025 11:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C66D961B3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C66D961B3E;
	Sat, 19 Jul 2025 11:36:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59CCC222
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B153846A8
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F4gSPJIOPsCF for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 11:36:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B88284691
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B88284691
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B88284691
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:36:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 70345B00593;
 Sat, 19 Jul 2025 13:36:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 13:36:44 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 13:36:44 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250715112951.1211144-1-buildroot@bubu1.eu>
References: <20250715112951.1211144-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <7df2aa9229588a2bbf2c46a60cf576e7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752925006;
 bh=WTRfOWadXYkCyCIopIGJ9qhEt5TFEhE0E6wSYIPlW30=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XwhCR4Y5oX4HqLfnZlMaO+ekN7zV693HFqIPL6JZw5lTwqNpwS5szib3TVE3O2O2U
 FeK87lteUCEELkRVPjSboO1CYEORek3qOYdmsO+ZHAai7SeiKJ6KYpC6gzdK1V+B5B
 ZcIvLkpzba3/PXKDyrKPLNs99nz6aDtKkUeeSkYOFi+nnn7yuYSJIyGe4PDJSO4Bnx
 ddfLEgmFQ402YMtauxd2kCjIGecfOpTkaXDBB2J9qRnHwaDVCXjBOviujlfNpxrC00
 U43VSdRjcS/cDdZXywQdoYy0eV9rwM7Jbb5KX3dUmCZjWZ9OxHABiJ8VbFnGGQKozI
 qCsyhPFoPciEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XwhCR4Y5
Subject: Re: [Buildroot] [PATCH 1/2] package/python-asgiref: bump to 0.9.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTUvMDcvMjAyNSAxMzoyOSwgTWFyY3VzIEhvZmZtYW5uIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gUmVsZWFzZSBOb3RlczoKPiAKPiAqIEZpeGVkIGRlbGV0aW9uIG9mIExvY2FsIHZhbHVlcyBh
ZmZlY3Rpbmcgb3RoZXIgY29udGV4dHMuICgjNTIzKQo+IAo+ICogU2tpcCBDUHl0aG9uIHNwZWNp
ZmljIGdhcmJhZ2UgY29sbGVjdGlvbiB0ZXN0IG9uIHB5cHkuICgjNTIxKQo+IAo+IDMuOS4wICgy
MDI1LTA3LTAzKQo+IC0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+ICogQWRkcyBzdXBwb3J0IGZvciBQ
eXRob24gMy4xMy4KPiAKPiAqIERyb3BzIHN1cHBvcnQgZm9yIChlbmQtb2YtbGlmZSkgUHl0aG9u
IDMuOC4KPiAKPiAqIEZpeGVzIGFuIGVycm9yIHdpdGggY29uZmxpY3Rpbmcga3dhcmdzIGJldHdl
ZW4gQXN5bmNUb1N5bmMgYW5kIHRoZSAKPiB3cmFwcGVkCj4gICBmdW5jdGlvbi4gKCM0NzEpCj4g
Cj4gKiBGaXhlcyBMb2NhbCBpc29sYXRpb24gYmV0d2VlbiBhc3luY2lvIFRhc2tzLiAoIzQ3OCkK
PiAKPiAqIEZpeGVzIGEgcmVmZXJlbmNlIGN5Y2xlIGluIExvY2FsICgjNTA4KQo+IAo+ICogRml4
ZXMgYSBkZWFkbG9jayBpbiBDdXJyZW50VGhyZWFkRXhlY3V0b3Igd2l0aCBuZXN0ZWQgYXN5bmNf
dG9fc3luYyDihpIKPiAgIHN5bmNfdG9fYXN5bmMg4oaSIGFzeW5jX3RvX3N5bmMg4oaSIGNyZWF0
ZV90YXNrIGNhbGxzLiAoIzQ5NCkKPiAKPiAqIFRoZSBBcHBsaWNhdGlvbkNvbW11bmljYXRvciB0
ZXN0aW5nIHV0aWxpdHkgd2lsbCBub3cgcmV0dXJuIHRoZSB0YXNrIAo+IHJlc3VsdAo+ICAgaWYg
aXQncyBhbHJlYWR5IGNvbXBsZXRlZCBvbiBzZW5kX2lucHV0IGFuZCByZWNlaXZlX25vdGhpbmcu
IFlvdSBtYXkgCj4gbmVlZCB0bwo+ICAgY2F0Y2ggKGUuZy4pIHRoZSBhc3luY2lvLmV4Y2VwdGlv
bnMuQ2FuY2VsbGVkRXJyb3IgaWYgc2VuZGluZyAKPiBtZXNzYWdlcyB0bwo+ICAgYWxyZWFkeSBm
aW5pc2hlZCBjb25zdW1lcnMgaW4geW91ciB0ZXN0cy4gKCM1MDUpCj4gCj4gU291cmNlOiBodHRw
czovL2dpdGh1Yi5jb20vZGphbmdvL2FzZ2lyZWYvYmxvYi9tYWluL0NIQU5HRUxPRy50eHQKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9vdEBidWJ1MS5ldT4KClNl
cmllcyBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
