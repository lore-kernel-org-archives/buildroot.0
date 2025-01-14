Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4CDE77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 20:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C67C360F81;
	Tue, 14 Jan 2025 20:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAWbkuuJZVwN; Tue, 14 Jan 2025 20:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D375D60FA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D375D60FA8;
	Tue, 14 Jan 2025 20:03:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15949B8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB3A382C91
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2RQw98niMvD for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 20:03:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED31180FA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED31180FA9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED31180FA9
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:03:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9F28519F73C;
 Tue, 14 Jan 2025 21:03:32 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45896])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 21:03:32 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 21:03:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250113221402.3300-1-vincent.stehle@laposte.net>
References: <20250113221402.3300-1-vincent.stehle@laposte.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <01170973bec252bdf95707ded5532855@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736885013;
 bh=uh01bGPHzS5IgqiBaLO1wPfPkFoWgBlG+cCrE6gvoDk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JXnQ+hcujp1iSwKWJKsiY3S70ErsZCVeFjk7Ezq5nuXJhxSkPGv4AgwpqvILHtYRC
 hEPMV///vOOxhspcFJZ3J+EviTSrGcgs4gm2+iNv44R9mXXMPrbLuTvIRrfRqe918u
 shZN25pUC4QBEkT1ADYgxN0fH/jO3s7wLstDx9C3BtqPwSWWFeyw65hSz7zp/SvsCU
 YGJl4r8WyjxI0qr+ED2PbG8N3MX6kdHgTPLkiTTkRyqpNWnpD0VOd51O63dAmolZw9
 R+FCBpiOiiM70UDVh0bGFXykJgt19XgXS49rw1KKw5zimdVWiJChR8ORDznXbtRO2U
 0GZ2yxhqXOYfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JXnQ+hcu
Subject: Re: [Buildroot] [PATCH] support/testing: new xen runtime test
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

SGkgVmluY2VudCwKCk9uIDEzLzAxLzIwMjUgMjM6MTQsIFZpbmNlbnQgU3RlaGzDqSB2aWEgYnVp
bGRyb290IHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5z
dGVobGVAbGFwb3N0ZS5uZXQ+CgpBcHBsaWVkIHRvIG1hc3Rlci4gVGhhbmtzIGZvciB0aGlzIGlu
dGVyZXN0aW5nIHRlc3QhCgpJIGRpZCBhIG1pbm9yIGNoYW5nZSBpbiBnZW5pbWFnZS5jZmcsIHNl
ZSBiZWxvdy4KCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfeGVuL2dlbmltYWdlLmNmZyAKPiBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfeGVuL2dlbmltYWdlLmNmZwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMC4uNDk2MTgxNmU2Mgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X3hlbi9nZW5pbWFnZS5jZmcKClsuLi5dCgo+ICtpbWFnZSBkaXNr
LmltZyB7Cj4gKwloZGltYWdlIHsKPiArCQlwYXJ0aXRpb24tdGFibGUtdHlwZSA9ICJncHQiCj4g
Kwl9Cj4gKwo+ICsJcGFydGl0aW9uIGJvb3Qgewo+ICsJCWltYWdlID0gImVmaS1wYXJ0LnZmYXQi
Cj4gKwkJcGFydGl0aW9uLXR5cGUtdXVpZCA9IFUKPiArCQlvZmZzZXQgPSAzMksKPiArCQlib290
YWJsZSA9IHRydWUKPiArCX0KPiArCj4gKwlwYXJ0aXRpb24gcm9vdCB7Cj4gKwkJcGFydGl0aW9u
LXR5cGUtdXVpZCA9IGI5MjFiMDQ1LTFkZjAtNDFjMy1hZjQ0LTRjNmYyODBkM2ZhZQoKVGhlIGdl
bmltYWdlIHZlcnNpb24gd2UgYXJlIHVzaW5nIG5vdyByZWNvZ25pemUgaHVtYW4gcmVhZGFibGUg
c2hvcnRjdXRzCmZvciBwYXJ0aXRpb24gdHlwZSBVVUlEcy4gU2VlOgpodHRwczovL2dpdGh1Yi5j
b20vcGVuZ3V0cm9uaXgvZ2VuaW1hZ2UvYmxvYi92MTgvaW1hZ2UtaGQuYyNMMjg4CgpTbywgSSd2
ZSBwdXQgdGhlIGNvcnJlc3BvbmRpbmcgc2hvcnRjdXQuCgo+ICsJCWltYWdlID0gInJvb3Rmcy5l
eHQyIgo+ICsJfQo+ICt9CgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
