Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BC7C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 21:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7547860AA8;
	Sat,  1 Mar 2025 21:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ew1m133di1j9; Sat,  1 Mar 2025 21:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 885D460B36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 885D460B36;
	Sat,  1 Mar 2025 21:45:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61116181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 21:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5172260AA8
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 21:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ottJGKDOrOV for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 21:45:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 285E860B3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 285E860B3F
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 285E860B3F
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 21:45:20 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:c9c5:d2da:9767:caee] (unknown
 [IPv6:2a01:e0a:12:eba0:c9c5:d2da:9767:caee])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id D36B0BFBA5
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 22:45:10 +0100 (CET)
Message-ID: <310eae0e-6e47-45a9-a35a-184211d1dcbe@grenoble.cnrs.fr>
Date: Sat, 1 Mar 2025 22:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1740865510;
 bh=9T+7EokSoKRqlqMg0mcEWyL/jtu4CVPotmzW316Y4mU=;
 h=Date:To:From:Subject:From;
 b=GDgdsB2z9ShtSLZlFbLWrdM+608CRQQc++/R0pIct08XMFv9QJYJdBqEG8ZZPiMd7
 UmMykWsXN8vTTgEMXBHBGL1pGqwPT0inHdWX8yIC2nl1bkHFiS3RdgwZg4Mw69trUD
 yTsjyh6hYO2CCgKD8AnF48UfP8VdVdk4qbnyrhPzBOrd8IFXsCDNB8Gk7viTIKZt8v
 yGR5nUtJ/mY3gB5Y5a21j/Iw7SJRxL0XRM7PKmBVfkNZAtBQeY9epknXZ4XCjIEYfg
 9fXz2DGSqJnR3am6sAqCRbyR9+WJqTiSwpIzXaawn/bKuY42ju2B2vd572vuKtmlho
 51kQnhm2FFANA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=GDgdsB2z
Subject: [Buildroot] [PATCH 0/2] Bump Acqua boards to Linux 6.12.17
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

SGVsbG8gYWxsIQoKVGhpcyBzZXJpZXMgYnVtcHMgdGhlIExpbnV4IGtlcm5lbCBvZiB0aGUgQWNx
dWEgQTUgYm9hcmRzIHRvIDYuMTIuMTcuClRoZSBmaXJzdCBwYXRjaCB0dXJucyB0aGUgY3VzdG9t
IERUUyBmaWxlIGludG8gYSBrZXJuZWwgcGF0Y2guIEl0IGlzCm5lZWRlZCBiZWNhdXNlIEJSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIIGRvZXMgbm90IHdvcmsgb24gQVJNCndpdGgga2Vy
bmVscyDiiaUgNi4xMlsxXS4gV291bGQgaXQgYmUgcG9zc2libGUgdG8gbWVyZ2UgdGhpcyBzZXJp
ZXMgaW50bwptYXN0ZXIgcmF0aGVyIHRoYW4gbmV4dCBwbGVhc2U/CgpJIGtub3cgaXQgaXMgcHJl
ZmVyYWJsZSB0byBzZW5kIHZlcnNpb24gYnVtcHMgcHJpb3IgdG8gdGhlIHJlbGVhc2Ugb2YKdGhl
IC1yYzEuIFRoZSByZWFzb24gSSB3YWl0ZWQgaXMgYmVjYXVzZSBJIHdhcyBob3BpbmcgdGhhdCB0
aGUKQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX0RJUiBwYXRjaCBzZXJpZXNbMl0gd291bGQg
YmUgbWVyZ2VkIGJlZm9yZQp0aGUgMjAyNS4wMiBmZWF0dXJlIGZyZWV6ZS4gVGhhdCBzZXJpZXMg
cHJvdmlkZXMgYSBuaWNlIGZpeCBmb3IgdGhlCmJyb2tlbiBCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9EVFNfUEFUSCBpc3N1ZS4gVW5mb3J0dW5hdGVseSwgaXQgZGlkbid0Cm1ha2UgaXQgdG8gdGhl
IGZlYXR1cmUgZnJlZXplLCBhbmQgdGhpcyBpcyB3aHkgSSBhbSBzdWJtaXR0aW5nIHRoaXMKdmVy
c2lvbiBidW1wIG5vdy4KClsxXSBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWls
L2J1aWxkcm9vdC8yMDI0LU9jdG9iZXIvNzY1NDYzLmh0bWwKWzJdIGh0dHBzOi8vcGF0Y2h3b3Jr
Lm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTQ0NTU4MgoKLS0tCkVk
Z2FyIEJvbmV0ICgyKToKICBib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNTogYWRkIGRldmljZSB0
cmVlIGFzIGEga2VybmVsIHBhdGNoCiAgY29uZmlncy9hY21lc3lzdGVtc19hY3F1YV9hNV8qOiBi
dW1wIHRvIExpbnV4IDYuMTIuMTcKCiAuLi4vYWNxdWEtYTUvYXQ5MS1zYW1hNWQzX2FjcXVhLmR0
cyAgICAgICAgICAgfCAzNDAgLS0tLS0tLS0tLS0tLS0tLS0KIC4uLk0tZHRzLWFkZC1BY21lc3lz
dGVtcy1BY3F1YS1BNS1ib2FyZC5wYXRjaCB8IDM1OSArKysrKysrKysrKysrKysrKysKIC4uLi9h
Y3F1YS1hNS9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2ggICAgICAgICB8ICAgMiArLQogY29uZmln
cy9hY21lc3lzdGVtc19hY3F1YV9hNV8yNTZtYl9kZWZjb25maWcgIHwgICA2ICstCiBjb25maWdz
L2FjbWVzeXN0ZW1zX2FjcXVhX2E1XzUxMm1iX2RlZmNvbmZpZyAgfCAgIDYgKy0KIDUgZmlsZXMg
Y2hhbmdlZCwgMzY2IGluc2VydGlvbnMoKyksIDM0NyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9hdDkxLXNhbWE1ZDNfYWNxdWEuZHRz
CiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvYWNtZXN5c3RlbXMvYWNxdWEtYTUvcGF0Y2hlcy9s
aW51eC8wMDAxLUFSTS1kdHMtYWRkLUFjbWVzeXN0ZW1zLUFjcXVhLUE1LWJvYXJkLnBhdGNoCgot
LSAKMi4zNC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
