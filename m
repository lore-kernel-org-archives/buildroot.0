Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509A1C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A50383B52;
	Wed,  4 Jun 2025 18:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvIi6EtuT92D; Wed,  4 Jun 2025 18:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F97883B57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F97883B57;
	Wed,  4 Jun 2025 18:27:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD1861A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADDDA83B57
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ccH9_-chau3F for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:27:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5FDC83B52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5FDC83B52
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5FDC83B52
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 98BC91C010A; Wed,  4 Jun 2025 20:27:46 +0200 (CEST)
Message-ID: <201882a0-9729-4540-b5e7-b28bda8007a7@rnout.be>
Date: Wed, 4 Jun 2025 20:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250414-ska-bump-v2-0-efb0a276750d@gmx.net>
 <20250414-ska-bump-v2-3-efb0a276750d@gmx.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250414-ska-bump-v2-3-efb0a276750d@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061666; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=oFyxjXQtABtx98nKiBMyzHzZZ7JvBS6tCJtzC06V/OU=;
 b=RHXDhv/Vlgzh/J4IVcHXMQl4kq3faVzMqL8HsQhRo5YdlDGoSe4oqgrP/W+BTA+CYVXxz9
 3AAqr7t0ucNYcNSfhFL/O6F2rM9WLLN1DXA83zwKMIvZE8c9s2oPWwH3z8WXVEHGISiQg1
 9Tt3HOxQb9CxlFXxb1SqU48K5Lci4TuabWWhcW7lCKOw3218ACy5B0Gbmu3TfXMR5pFJG2
 +0XTjox9b/c0D71O0DfjNxdrHp0KAnjEZVpRzMesO9mWLesc0Y96jxsqiEenOfJFLQBJHe
 TF1zSXTd12DGrmMmEH9QSi8QjhdbcWk9cIpORmvTrpvY4MMo94fHXn0vfhN1eA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=RHXDhv/V
Subject: Re: [Buildroot] [PATCH v2 3/3] package/execline: remove
 -D_GNU_SOURCE
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

CgpPbiAxNC8wNC8yMDI1IDEzOjE5LCBKLiBOZXVzY2jDpGZlciB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IGV4ZWNsaW5lIGlzIHdyaXR0ZW4gYWdhaW5zdCBQT1NJWCBDIGFuZCBhdXRvbWF0aWNhbGx5
IHNldHMKPiAtRF9QT1NJWF9DX1NPVVJDRT0yMDA4MDlMIGFuZCAtRF9YT1BFTl9TT1VSQ0U9NzAw
LiB1Y2xpYmMgaGFkIGEgYnVnCj4gY29uc2lzdGVudCB3aXRoIHRoZSBlcnJvciByZXBvcnRlZCBp
biB0aGUgY29tbWl0IHRoYXQgYWRkZWQKPiAtRF9HTlVfU09VUkNFWzFdLCBidXQgaXQgaGFzIHNp
bmNlIGJlZW4gZml4ZWRbMl0uCj4gCj4gWzFdOiBzZWUgY29tbWl0IDEwNmU0M2UzMDMgKCJwYWNr
YWdlL2V4ZWNsaW5lOiBmaXggdWNsaWJjIGJ1aWxkIikKPiBbMl06IGh0dHBzOi8vY2dpdC51Y2xp
YmMtbmcub3JnL2NnaS9jZ2l0L3VjbGliYy1uZy5naXQvY29tbWl0Lz9pZD0zNTQxMjk4MDdkYjEy
Yzc5MjY5NmI3NGQwY2QzOGYyYzVkMmZkNzA0Cj4gCj4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2No
w6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCiAgQXBwbGllZCB0byAyMDI1LjAyLngsIHRo
YW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gLS0tCj4gICBwYWNrYWdlL2V4ZWNsaW5lL2V4
ZWNsaW5lLm1rIHwgMSAtCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2V4ZWNsaW5lL2V4ZWNsaW5lLm1rIGIvcGFja2FnZS9leGVjbGlu
ZS9leGVjbGluZS5tawo+IGluZGV4IDRkOWI2Njg4MTljYzI5NmIwODM4YzA5ZDcwOTFkMGYwMzg5
MDJjMjYuLjlmNjAyY2Y2MGFmNzAzZWIwMGVjM2RmZjQwOWIzZTE0YWNjNzY2YWMgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9leGVjbGluZS9leGVjbGluZS5tawo+ICsrKyBiL3BhY2thZ2UvZXhlY2xp
bmUvZXhlY2xpbmUubWsKPiBAQCAtMTIsNyArMTIsNiBAQCBFWEVDTElORV9JTlNUQUxMX1NUQUdJ
TkcgPSBZRVMKPiAgIEVYRUNMSU5FX0RFUEVOREVOQ0lFUyA9IHNrYWxpYnMKPiAKPiAgIEVYRUNM
SU5FX0NPTkZfT1BUUyA9IFwKPiAtCUNGTEFHUz0iJChUQVJHRVRfQ0ZMQUdTKSAtRF9HTlVfU09V
UkNFIiBcCj4gICAJLS13aXRoLXN5c2RlcHM9JChTVEFHSU5HX0RJUikvdXNyL2xpYi9za2FsaWJz
L3N5c2RlcHMgXAo+ICAgCS0td2l0aC1pbmNsdWRlPSQoU1RBR0lOR19ESVIpL2luY2x1ZGUgXAo+
ICAgCS0td2l0aC1keW5saWI9JChTVEFHSU5HX0RJUikvbGliIFwKPiAKPiAtLQo+IDIuNDguMC5y
YzEuMjE5LmdiNmI2NzU3ZDc3Mgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
