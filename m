Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BD2C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D4E3417F8;
	Wed, 30 Aug 2023 20:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D4E3417F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ckG5dC-m5PQl; Wed, 30 Aug 2023 20:39:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F96A417E9;
	Wed, 30 Aug 2023 20:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F96A417E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58ACD1BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2511A81FF7
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2511A81FF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgzmxbJz4PGN for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:39:47 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13AAE81FDE
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13AAE81FDE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 958111C0002;
 Wed, 30 Aug 2023 20:39:43 +0000 (UTC)
Date: Wed, 30 Aug 2023 22:39:42 +0200
To: Martin =?UTF-8?B?QsO2aA==?= via buildroot <buildroot@buildroot.org>
Message-ID: <20230830223942.2070adb8@windsurf>
In-Reply-To: <20230223201817.224238-1-contact@martb.dev>
References: <20230223201817.224238-1-contact@martb.dev>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693427984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VjG/RYFVg8cUqZkL2g20fvDwzoXIXKbf2X2IS8cBoY=;
 b=kiS9j+Ja2O9MKyicm+hyk6ERmCDBf51Kq8K1kaTAzrb5Z8zy0UFCiOYU5anzaxtfLoipsb
 wtIjTrYGojcinhVwjTr1bBjU4n7p6b20KSV04J2ZKfvM6H0PJNrRETeYRPT1txSkKIEnZU
 IQ4mG9oBUqgBXh/OnCeQt2cV5waukQ9mPddhrf29Gt0/KPiSJUoVaNKSrET60I/pe0V5Yq
 2m4Xu0HiTvTqnmvtgArOp8ONtqyBwOd63n4STvdgBCe351DgGQtuj7GKhKDSGph1CexRkb
 yyJK/VMz1J/KJ24+jNKdQhi/wytFOntaU0+fZ0fIAZUVEnc9wDp3RwewetJojg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kiS9j+Ja
Subject: Re: [Buildroot] [PATCH 1/1] package/gr-osmosdr: add support for
 HACKRF receivers
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Martin =?UTF-8?B?QsO2aA==?= <contact@martb.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWFydGluLAoKT24gVGh1LCAyMyBGZWIgMjAyMyAyMToxODoxNyArMDEwMApNYXJ0aW4g
QsO2aCB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IFNp
Z25lZC1vZmYtYnk6IE1hcnRpbiBCw7ZoIDxjb250YWN0QG1hcnRiLmRldj4KPiAtLS0KPiAgcGFj
a2FnZS9nci1vc21vc2RyL0NvbmZpZy5pbiAgICAgfCA2ICsrKysrKwo+ICBwYWNrYWdlL2dyLW9z
bW9zZHIvZ3Itb3Ntb3Nkci5tayB8IDcgKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKykKCkFwcGxpZWQgdG8gbmV4dCBhZnRlciBjaGFuZ2luZyB0aGUgImRlcGVuZHMg
b24iIHRvIGEgInNlbGVjdCIgbGlrZSBJCnN1Z2dlc3RlZCBpbiBteSByZXZpZXcgYmFjayBpbiBG
ZWJydWFyeS4KCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RP
LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9i
b290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
