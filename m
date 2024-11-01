Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE51E6B240
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 11:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E2DE80C13;
	Fri,  1 Nov 2024 11:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMaNY40Ekx3Q; Fri,  1 Nov 2024 11:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B7DA80C6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B7DA80C6C;
	Fri,  1 Nov 2024 11:31:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD54560
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 11:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C91FD80581
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 11:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPeoxTfiS4Dn for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 11:31:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0175A80561
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0175A80561
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0175A80561
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 11:30:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D5A6B19F5C6;
 Fri,  1 Nov 2024 12:30:55 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53676])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 01 Nov 2024 12:30:55 +0100
MIME-Version: 1.0
Date: Fri, 01 Nov 2024 12:30:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <49a0a3c1-93ae-4474-887e-ae007be648cd@smile.fr>
References: <20241031213348.2057705-1-ju.o@free.fr>
 <20241031213348.2057705-9-ju.o@free.fr>
 <49a0a3c1-93ae-4474-887e-ae007be648cd@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <5a2c1374954863ac78534a9822d8404c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730460658;
 bh=uYTpHDPBbEfYG5jjBsssRiqBz2PNpJhIltYcmTPZSWk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g45UCJbEdw0tRuc5I40FZpJVZh6v4L7S3nnOqWsG54w2/5LU/RW8IqJ7/pCAboEmL
 Yz0zitFvucXCEOJID0amNQaltq1W3YZNDziudFnMvY3iFakk/YWnTeGxQ5xmXBtYgF
 LA+GikKqnjzykAKyP/kvdlfrizmq83waglf9AeApWW409YyOz9KO1RAG0BaDmghI2U
 ThgsIiGfaZCg6sv1fn8t52p9ZIhHTOeaxurvfonGT9peyvv05gfjovqE5mwpibxiR6
 Wg4hKRZYFeFWL6Sf7k/GZSpxaruKkjKEBSosjt+iyBX13tRovHsTfxdjGMswUfDoja
 5u0xmGBiqwzRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g45UCJbE
Subject: Re: [Buildroot] [PATCH v3 8/8] support/testing: test_grub: update
 and re-enable the test
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

SGkgUm9tYWluLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKT24gMzEvMTAvMjAyNCAyMzoxMiwg
Um9tYWluIE5hb3VyIHdyb3RlOgo+IEhlbGxvIEp1bGllbiwKPiAKPiBMZSAzMS8xMC8yMDI0IMOg
IDIyOjMzLCBKdWxpZW4gT2xpdmFpbiBhIMOpY3JpdMKgOgo+PiBUaGUgRURLMiBidW1wIHRvIHN0
YWJsZTIwMjQwNSBpbnRyb2R1Y2VkIGFuIGluY29tcGF0aWJpbGl0eSB3aXRoIHRoZQo+PiBRZW11
IHZlcnNpb24gNS4yLjAgcHJlc2VudCBpbiB0aGUgcmVmZXJlbmNlIERvY2tlciBpbWFnZS4gRm9y
IHRoYXQKPj4gcmVhc29uLCB0aGlzIHRlc3Qgd2FzIGRpc2FibGVkLgo+PiAKPj4gVGhpcyBjb21t
aXQgZW5hYmxlcyBob3N0LXFlbXUgaW4gdGhlIGJ1aWxkLCB0byBiZSB1c2VkIGJ5IHRoZSBydW50
aW1lCj4+IHRlc3QgaW5mcmFzdHJ1Y3R1cmUuCj4+IAo+PiBTaW5jZSB0aGlzIGNvbW1pdCBzd2l0
Y2ggdG8gYSBtb3JlIHJlY2VudCBob3N0LXFlbXUsIGl0IGFsc28gcmVtb3Zlcwo+PiBmaXJtd2Fy
ZSBvcHRpb25zIHRvIHdvcmthcm91bmQgb2xkIHFlbXUgYnVncy4KPj4gCj4+IFRob3NlIGNoYW5n
ZXMgYXJlIGZpeGluZyB0aGlzIHRlc3QsIHdoaWNoIGlzIHdoeSB0aGlzIGNvbW1pdCAKPj4gcmUt
ZW5hYmxlcwo+PiBpdCBieSByZW1vdmluZyB0aGUgc2tpcFRlc3QoKSBpbnZvY2F0aW9uLgo+PiAK
Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAKPiBTYW1l
IHF1ZXN0aW9uIGFib3V0IG5lb3ZlcnNlLW4xLgoKSSB0aGluayB0aGlzIHNwZWNpZmljIHRlc3Qg
Y2FuIHN0YXkgYXMgaXQgaXMuCgpDb21wYXJlZCB0byB0ZXN0X2VkazIgYW5kIHRlc3RfZnd0cywg
dGhpcyB0ZXN0IGRvZXMgbm90IHVzZQpTQlNBIChpdCBkb2VzIG5vdCBzZWxlY3QgQlIyX1RBUkdF
VF9FREsyX1BMQVRGT1JNX1FFTVVfU0JTQT15KS4KCkl0IGlzICJqdXN0IiBFRkkuIFNvIEkgYmVs
aWV2ZSBpdCBjYW4gc3RheSB3aXRoIGNvcnRleC1hNTMuCgo+IFJldmlld2VkLWJ5OiBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWlu
CgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
