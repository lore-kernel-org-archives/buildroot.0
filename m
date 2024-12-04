Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852D4E7716D
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 07:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3610B84750;
	Wed,  4 Dec 2024 07:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLw1d62MolGI; Wed,  4 Dec 2024 07:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53C6E8486B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53C6E8486B;
	Wed,  4 Dec 2024 07:43:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6E871DC8
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 07:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A414C60F3E
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 07:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0VjOpIp-4Ey for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 07:43:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D916860F72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D916860F72
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D916860F72
 for <buildroot@uclibc.org>; Wed,  4 Dec 2024 07:43:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1tIk2O-000228-PP
 for buildroot@uclibc.org; Wed, 04 Dec 2024 08:43:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 04 Dec 2024 08:42:10 +0100
Message-ID: <pan$195e7$fd7fefb7$b25efed4$ee4a9dda@ID-313208.user.individual.net>
References: <20241202190647.1211779-1-bernd@kuhls.net>
 <20241202190647.1211779-8-bernd@kuhls.net>
 <c2be6e5c80cb8a212f3c60c7d7414dd1@free.fr>
 <87ldwwbc1j.fsf__10394.9673286238$1733267303$gmane$org@draig.linaro.org>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 8/8] package/vkmark: add vkmark benchmarking
 tool
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

QW0gVHVlLCAwMyBEZWMgMjAyNCAyMzowNzo1MiArMDAwMCBzY2hyaWViIEFsZXggQmVubsOpZToK
Cj4gVGhpcyB3YXMgYWxyZWFkeSBmaXhlZCBpbjoKPiAKPiAgIFN1YmplY3Q6IFtQQVRDSCAwLzJd
IEVuYWJsZSB2ZW51cyBhbmQgYWRkIHZrbWFyayBEYXRlOiBNb24sICAyIERlYwo+ICAgMjAyNCAx
ODoyMDo1OSArMDAwMCBNZXNzYWdlLUlkOgo+ICAgPDIwMjQxMjAyMTgyMTAxLjQxMDMyMC0xLWFs
ZXguYmVubmVlQGxpbmFyby5vcmc+CgpIaSBBbGV4LAoKdGhlc2UgZXJyb3JzIHdlcmUgbm90IGZp
eGVkIGJ5IHlvdXIgdXBkYXRlZCBwYXRjaDoKCiAgICAgcGFja2FnZS92a21hcmsvQ29uZmlnLmlu
OjI2OiBhdHRyaWJ1dGVzIG9yZGVyOiB0eXBlLCBkZWZhdWx0LCAKZGVwZW5kcyBvbiwgc2VsZWN0
LCBoZWxwIChodHRwczovL25pZ2h0bHkuYnVpbGRyb290Lm9yZy8jX2NvbmZpZ19maWxlcykKCiAg
ICAgcGFja2FnZS92a21hcmsvQ29uZmlnLmluOjI5OiBhdHRyaWJ1dGVzIG9yZGVyOiB0eXBlLCBk
ZWZhdWx0LCAKZGVwZW5kcyBvbiwgc2VsZWN0LCBoZWxwIChodHRwczovL25pZ2h0bHkuYnVpbGRy
b290Lm9yZy8jX2NvbmZpZ19maWxlcykKCkFsc28gdGhlIGRlcGVuZGVuY3kKCglkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfOSAKCmNhbiBiZSBkcm9wcGVkIGJlY2F1c2UK
CglkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcgIyBhc3NpbXAKCmV4aXN0
cy4KClRoZSBkZXBlbmRlbmN5CgoJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAKCmlz
IHByZXNlbnQgdHdpY2UuCgpTaG91bGQgIUJSMl9VU0VfV0NIQVIgYmUgYWRkZWQgdG8gdGhlIGNv
bW1lbnQ/CgpSZWdhcmRzLCBCZXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
