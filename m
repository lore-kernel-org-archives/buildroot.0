Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4B7C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 09:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E85F881346;
	Fri, 14 Feb 2025 09:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6van7y4H2Krg; Fri, 14 Feb 2025 09:32:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2C0B8131C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2C0B8131C;
	Fri, 14 Feb 2025 09:32:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C04DBC2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 09:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFE71812FE
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 09:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ub_BLknUkYh3 for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 09:32:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E35C812FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E35C812FA
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E35C812FA
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 09:32:36 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1757A352084A; Fri, 14 Feb 2025 10:32:33 +0100 (CET)
Date: Fri, 14 Feb 2025 10:32:33 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Scott Fan <fancp2007@gmail.com>
Message-ID: <Z68NsSRTlm0aGSi4@waldemar-brodkorb.de>
References: <20250214021416.392363-1-fancp2007@gmail.com>
 <20250214074235.917242-1-fancp2007@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250214074235.917242-1-fancp2007@gmail.com>
X-Operating-System: Linux 5.10.0-33-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1739525554; bh=4HbVToowaSkws+LGthbGHUHLkLnQXC5M4OKkApDU/QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cbiLkxS2Ed9p0R3O89/pc9P5YZjvq8SKHdxJFIPVqIZyIQGsUOHQtsY/NFcqx8aay
 DRgY1THhblHK3CdMQQ5fJgwk06qmohuMMVcZ0lvWLc3+GvzHfSyoX2jpNepm4wRj6L
 aa4nmAhC/2Jv1efcHXYAg3VMh7rKICdcPoxdkxa/Zn/T9dTNj28FEeeQGufVUSDT02
 BrvsuugmF/hwWiKRD2QKe9uGp6m/6HrukLxs7WyRFvcWIdA4fCe/x2lDk21TGffozq
 owZXI+TVBqJi55v6mPm+uG3a0dtiToIV/27wRuFWD+4jSySf1xB++/69DFPOZW3zG3
 iCYQLxYFzXi7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=cbiLkxS2
Subject: Re: [Buildroot] [PATCH v2] package/sqlite: fix configure options
 for readline/editline support
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpzb3JyeSBJIGZvcmdvdCB0byBkcm9wIHYxIG9mIHRoZSBwYXRjaC4KCldvcmtzIG5vdy4g
WW91IGNhbiBhZGQgYSAKVGVzdGVkLWJ5OiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5hZGsu
b3JnPgoKYmVzdCByZWdhcmRzCiBXYWxkZW1hcgoKU2NvdHQgRmFuIHdyb3RlLAoKPiBUaGUgYXV0
b3NldHVwIHNjcmlwdCB3aWxsIHNraXAgY2hlY2tpbmcgZm9yIHJlYWRsaW5lLmggd2hlbiBjcm9z
cy1jb21waWxpbmcsCj4gd2hpY2ggd2lsbCBjYXVzZSBsaW5lLWVkaXRpbmcgc3VwcG9ydCBmb3Ig
dGhlIHNxbGl0ZTMgc2hlbGwgdG8gYWx3YXlzIGJlICJub25lIi4KPiAKPiBJbiB0aGlzIGNhc2Us
IGlmIHRoZSAtLWVkaXRsaW5lIG9wdGlvbiBpcyBwcm92aWRlZCwgYW4gZXJyb3Igd2lsbCBiZSBy
ZXBvcnRlZDoKPiBFUlJPUjogRXhwbGljaXQgLS1lZGl0bGluZSBmYWlsZWQgdG8gZmluZCBhIG1h
dGNoaW5nIGxpYnJhcnkuCj4gCj4gSG93ZXZlciwgd2UgY2FuIGVuYWJsZSByZWFkbGluZSBvciBl
ZGl0bGluZSBzdXBwb3J0IGJ5IHNwZWNpZnlpbmcgdGhlIENGTEFHUwo+IGFuZCBMREZMQUdTIHZh
bHVlcyDigIvigItpbnN0ZWFkIG9mIGhhdmluZyBpdCBoYW5kbGVkIGF1dG9tYXRpY2FsbHkgYnkg
dGhlCj4gYXV0b3NldHVwIGNvbmZpZ3VyZSBzY3JpcHQuCj4gCj4gSW4gYWRkaXRpb24sIHRoZSBs
aWJlZGl0IHBhY2thZ2UgYWN0dWFsbHkgZGVwZW5kcyBvbiB0aGUgbmN1cnNlcyBwYWNrYWdlLAo+
IGp1c3QgbGlrZSB0aGUgcmVhZGxpbmUgcGFja2FnZS4gU28gd2hlbiB1c2luZyB0aGUgbGliZWRp
dCBwYWNrYWdlLAo+IGFsc28gYWRkIHRoZSBuY3Vyc2VzIGRlcGVuZGVuY3kuCj4gCj4gU2lnbmVk
LW9mZi1ieTogU2NvdHQgRmFuIDxmYW5jcDIwMDdAZ21haWwuY29tPgo+IAo+IC0tLQo+IENoYW5n
ZXMgdjEgLT4gdjI6Cj4gICAtIHVzZSB0aGUgQ0ZMQUdTIGFuZCBMREZMQUdTIHZhbHVlcyBpbnN0
ZWFkIG9mIGF1dG9zZXR1cCBjb25maWd1cmUgb3B0aW9ucwo+ICAgLSB1cGRhdGUgY29tbWl0IG1l
c3NhZ2UKPiAtLS0KPiAgcGFja2FnZS9zcWxpdGUvc3FsaXRlLm1rIHwgMTEgKysrKysrKy0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9zcWxpdGUvc3FsaXRlLm1rIGIvcGFja2FnZS9zcWxpdGUvc3Fs
aXRlLm1rCj4gaW5kZXggNWE4YjAzM2NlMC4uMjU1ZGRjOTM3YiAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL3NxbGl0ZS9zcWxpdGUubWsKPiArKysgYi9wYWNrYWdlL3NxbGl0ZS9zcWxpdGUubWsKPiBA
QCAtNDQsOSArNDQsMTIgQEAgZW5kaWYKPiAgCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTkNVUlNF
UykkKEJSMl9QQUNLQUdFX1JFQURMSU5FKSx5eSkKPiAgU1FMSVRFX0RFUEVOREVOQ0lFUyArPSBu
Y3Vyc2VzIHJlYWRsaW5lCj4gLWVsc2UgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJFRElUKSx5KQo+
IC1TUUxJVEVfREVQRU5ERU5DSUVTICs9IGxpYmVkaXQKPiAtU1FMSVRFX0NPTkZfT1BUUyArPSAt
LWRpc2FibGUtcmVhZGxpbmUgLS1lZGl0bGluZQo+ICtTUUxJVEVfQ0ZMQUdTICArPSAtREhBVkVf
UkVBRExJTkU9MQo+ICtTUUxJVEVfTERGTEFHUyArPSAtbHJlYWRsaW5lIC1sbmN1cnNlcwo+ICtl
bHNlIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTkNVUlNFUykkKEJSMl9QQUNLQUdFX0xJQkVESVQpLHl5
KQo+ICtTUUxJVEVfREVQRU5ERU5DSUVTICs9IG5jdXJzZXMgbGliZWRpdAo+ICtTUUxJVEVfQ0ZM
QUdTICArPSAtREhBVkVfRURJVExJTkU9MQo+ICtTUUxJVEVfTERGTEFHUyArPSAtbGVkaXQgLWxu
Y3Vyc2VzCj4gIGVsc2UKPiAgU1FMSVRFX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtcmVhZGxpbmUK
PiAgZW5kaWYKPiBAQCAtNTksNyArNjIsNyBAQCBpZmVxICgkKEJSMl9QQUNLQUdFX1NRTElURV9F
TkFCTEVfSlNPTjEpLCkKPiAgU1FMSVRFX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtanNvbgo+ICBl
bmRpZgo+ICAKPiAtU1FMSVRFX0NPTkZfRU5WID0gQ0ZMQUdTPSIkKFNRTElURV9DRkxBR1MpIgo+
ICtTUUxJVEVfQ09ORl9FTlYgPSBDRkxBR1M9IiQoU1FMSVRFX0NGTEFHUykiIExERkxBR1M9IiQo
U1FMSVRFX0xERkxBR1MpIgo+ICAKPiAgZGVmaW5lIFNRTElURV9DT05GSUdVUkVfQ01EUwo+ICAJ
KGNkICQoQEQpOyAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgJChTUUxJVEVfQ09ORl9FTlYpIC4v
Y29uZmlndXJlIFwKPiAtLSAKPiAyLjQzLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
