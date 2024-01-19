Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B7AC4725D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 11:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8986642239;
	Fri, 19 Jan 2024 11:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8986642239
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VTRUQlghyK6t; Fri, 19 Jan 2024 11:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE0A421FB;
	Fri, 19 Jan 2024 11:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBE0A421FB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F5BE1BF5A6
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 11:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6ADDE83A90
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 11:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ADDE83A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ZjnUu70SBhK for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 11:25:04 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5974582664
 for <buildroot@busybox.net>; Fri, 19 Jan 2024 11:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5974582664
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66820E0002;
 Fri, 19 Jan 2024 11:25:01 +0000 (UTC)
Date: Fri, 19 Jan 2024 12:24:59 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20240119122459.253ad24c@windsurf>
In-Reply-To: <20240118182808.551258-1-francois.perrad@gadz.org>
References: <20240118182808.551258-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1705663501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iEEPQeLjmI1u6sxzXQiEjJQ1Li/QSp3qcQZO1qd3/x4=;
 b=Ahanc4HfH85PwXt7g2m1DepvGMttwHpS7/dyVvUQOaA1UPTRvgDA9hgY1KTYyyl0G46WWj
 KCeIKH2ExC1+ufnDce9MZeoPMzjoggY5CxD7cLzfHDZBnMTF6iaDEeV/8+A09LExGSBSSb
 XtZH4Y8Khlp3jBK4M3tNKU9AQeUB2mO2ZxwEuGuaCbiEjyEaGBz1k9gZl9OPGThVpNlZ1O
 DCaxkaQ9PtSEpu7jJjI083N8d2tJa8UPb9V38BfG5TT6Yx6rZi+D8fzGOj+AovTrB9SZFJ
 fILuXPwU4mN4px78bn6tSfWnDDWonJVhSL5dDh6BfMKETODT1JQEc/oWYK9OlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ahanc4Hf
Subject: Re: [Buildroot] [PATCH] package/autoconf: bump to version 2.72
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKT24gVGh1LCAxOCBKYW4gMjAyNCAxOToyODowOCArMDEwMApGcmFu
Y29pcyBQZXJyYWQgPGZwZXJyYWRAZ21haWwuY29tPiB3cm90ZToKCj4gaHR0cHM6Ly9naXQuc2F2
YW5uYWguZ251Lm9yZy9jZ2l0L2F1dG9jb25mLmdpdC90cmVlL05FV1M/aD12Mi43Mgo+IFNpZ25l
ZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgoKVGhh
bmtzIGZvciB0aGUgYnVtcC4gSG93IG11Y2ggdGVzdGluZyBkaWQgeW91IGRvIGFmdGVyIHRoaXMg
YnVtcCB3aXRoCnBhY2thZ2VzIHRoYXQgaGF2ZSBBVVRPUkVDT05GID0gWUVTID8KCkl0IGlzIGlu
ZGVlZCBmYWlybHkgY29tbW9uIGZvciBhdXRvY29uZiBidW1wcyB0byBicmVhayB0aGluZ3MuIFdl
CmNlcnRhaW5seSBkb24ndCBuZWVkIGEgZnVsbCB0ZXN0aW5nIGNvdmVyYWdlIGJlZm9yZSBtZXJn
aW5nICh3ZSBoYXZlCmF1dG9idWlsZGVycyBmb3IgdGhhdCksIGJ1dCB0aGUgdGVzdGluZyBvZiBh
IHJlYXNvbmFibHkgbGFyZ2UKY29uZmlndXJhdGlvbnMgb2YgcGFja2FnZXMgdGhhdCBzZXQgQVVU
T1JFQ09ORiA9IFlFUyB3b3VsZCBiZSBuaWNlLgoKVGhhbmtzIGEgbG90IQoKVGhvbWFzCi0tIApU
aG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
