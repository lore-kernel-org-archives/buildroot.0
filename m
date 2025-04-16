Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E353C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DD246F7B4;
	Wed, 16 Apr 2025 21:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOvqVkomqKKN; Wed, 16 Apr 2025 21:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0E2A6F722
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0E2A6F722;
	Wed, 16 Apr 2025 21:03:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B01B9920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8338460E82
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWQx-RRRtlJM for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:02:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DC38B6F64A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC38B6F64A
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC38B6F64A
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:02:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D45FB1C0083; Wed, 16 Apr 2025 23:02:54 +0200 (CEST)
Message-ID: <42681e6f-2118-4a46-b010-924d75bbb77f@rnout.be>
Date: Wed, 16 Apr 2025 23:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Mauro Condarelli <mc5686@mclink.it>
References: <20250323190351.3335904-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20250323190351.3335904-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837375; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=D48ClSBIvthn0F0dFZ/GwlV7irQEpfxeZEwYOq5MzW8=;
 b=mRcQfVPEXSKzHr2e9zNr8U8NU/ug4Txq2fMBiYbj5NfMHY7Bi3ArMrLdWHj72E20HGxhyx
 s8t06LAIV47hYv8FKnEbAvnRZzBoKeCE5lz2NIKOMdMQnPP/rbORCYydN4jTJXAbr8oGYl
 MkLrRKmyhlPqEQ2h6RlkZTdJr69k4OIdaeJgsnKOKDd2dod3ruRzIGZqQXN0sj12oujrWT
 HXhx+HJFX/JQi3RjruyQYf4K6G4pBjgzgdXqn/JiqpNiM22OaC0HSLNkLlDM6rtWq/pryF
 czqyou8dXns523UAecU6/fFBZUf+cmcuBS57UkeFIaiaQ+iaaOYOoYI6XJ9CEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/mc: bump version to 4.8.33
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIzLzAzLzIwMjUgMjA6MDMsIEJlcm5kIEt1aGxzIHdyb3RlOgo+IENoYW5nZWxvZzogaHR0
cHM6Ly9naXRodWIuY29tL01pZG5pZ2h0Q29tbWFuZGVyL21jL2Jsb2IvbWFzdGVyL2RvYy9ORVdT
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgoKIMKgQXBw
bGllZCB0b8KgMjAyNS4wMi54IGFuZCAyMDI0LjExLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDC
oEFybm91dAoKPiAtLS0KPiAgIHBhY2thZ2UvbWMvbWMuaGFzaCB8IDQgKystLQo+ICAgcGFja2Fn
ZS9tYy9tYy5tayAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tYy9tYy5oYXNoIGIvcGFj
a2FnZS9tYy9tYy5oYXNoCj4gaW5kZXggMDFjMGY2MWI0NC4uMDlmZGNkMjRhNSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL21jL21jLmhhc2gKPiArKysgYi9wYWNrYWdlL21jL21jLmhhc2gKPiBAQCAt
MSw0ICsxLDQgQEAKPiAtIyBIYXNoIGZyb20gaHR0cDovL2Z0cC5taWRuaWdodC1jb21tYW5kZXIu
b3JnL21jLTQuOC4zMi5zaGEyNTYKPiAtc2hhMjU2ICA0ZGRjODNkMWVkZTlhZjIzNjNiM2VhYjk4
N2Y1NGI4N2NmNjYxOTMyNDExMGNlMmQzYTBlNzA5NDRkMTM1OWZlICBtYy00LjguMzIudGFyLnh6
Cj4gKyMgSGFzaCBmcm9tIGh0dHA6Ly9mdHAubWlkbmlnaHQtY29tbWFuZGVyLm9yZy9tYy00Ljgu
MzMuc2hhMjU2Cj4gK3NoYTI1NiAgY2FlMTQ5ZDQyZjg0NGU1MTg1ZDhjODFkN2RiMzkxM2E4ZmEy
MTRjNjVmODUyMjAwYTlkODk2YjQ2OGFmMTY0YyAgbWMtNC44LjMzLnRhci54ego+ICAgIyBzaGEy
NTYgbG9jYWxseSBjb21wdXRlZDoKPiAgIHNoYTI1NiAgNTU3NmJiZWM3NjI5NmUxYzhlMDgxZjcw
MzdlYmQwMWJkYWRhMzg4NjM1ZjU4ZDg0NGEyZjIwZDM3YmJlNDI4NCAgQ09QWUlORwo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL21jL21jLm1rIGIvcGFja2FnZS9tYy9tYy5tawo+IGluZGV4IGI3ZTdl
MTA3YzcuLjk0MDFiOGExOTEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tYy9tYy5tawo+ICsrKyBi
L3BhY2thZ2UvbWMvbWMubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4gICAKPiAtTUNfVkVSU0lPTiA9IDQuOC4zMgo+ICtNQ19WRVJTSU9OID0g
NC44LjMzCj4gICBNQ19TT1VSQ0UgPSBtYy0kKE1DX1ZFUlNJT04pLnRhci54ego+ICAgTUNfU0lU
RSA9IGh0dHA6Ly9mdHAubWlkbmlnaHQtY29tbWFuZGVyLm9yZwo+ICAgTUNfTElDRU5TRSA9IEdQ
TC0zLjArCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
