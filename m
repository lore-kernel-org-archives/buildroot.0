Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB0ACA1012
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 19:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6BA7606BD;
	Thu,  4 Sep 2025 19:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xm-DmuRrSFVs; Thu,  4 Sep 2025 19:24:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1F5460699
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1F5460699;
	Thu,  4 Sep 2025 19:24:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90C3AB69
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 773C940638
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JaisA5vilDzx for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 19:24:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E79440635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E79440635
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E79440635
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:24:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A073E2003F7;
 Thu,  4 Sep 2025 21:24:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Sep 2025 21:24:32 +0200
MIME-Version: 1.0
Date: Thu, 04 Sep 2025 21:24:32 +0200
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: buildroot@buildroot.org, Joel Stanley <joel@jms.id.au>
In-Reply-To: <20250831123953.391803-2-clg@kaod.org>
References: <20250831123953.391803-1-clg@kaod.org>
 <20250831123953.391803-2-clg@kaod.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <2c84c411910237aaed9d21e6edff7b38@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757013875;
 bh=FOGeZZVQvMlDzGFrDvquNfK9cfJjZduqLd1Ef3dG/pA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eyHQZb8KsiS7F7061StpFNLsQWsZqCZ7tcJmzww6U62l2pZmEuIvUKPILOxIxtkCk
 Lc9krgcWMqFZ/i9P2+L5HTScakS3HqCZ4Hkr8XUYgx1la8nyhGgzKUHk4X07hpTQYc
 fGrST2Dt/YG6uvmS+/bttREL0M59oNrAaMpWD+3r4LqXqvfMwtuXHAJgx5pDNgk0k8
 Lax3AIPVlOGWxikDhj1hyF2JyLoF28q0roh57X3HeMmOtIHrtgOOUXDwlbjERE6Rvl
 z8UvScgtMgJ5gMplRqxEVq5nqWKbZKnwrh3LqgguHy8PWjtfYStaG1FMkeM69cS/zU
 cJtlQ1jq8bPVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eyHQZb8K
Subject: Re: [Buildroot] [PATCH 1/4] configs/aspeed-*: bump Linux to 6.16.4
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

T24gMzEvMDgvMjAyNSAxNDozOSwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4gU2luY2UgTGlu
dXggNi41IG1vdmVkIC5kdHMgZmlsZXMgdG8gdmVuZG9yIHN1Yi1kaXJlY3RvcmllcywgYWRqdXN0
IHRoZQo+IHBvc3QtaW1hZ2Uuc2ggc2NyaXB0IHRvIHRha2UgaW50byBhY2NvdW50IHRoZSAnYXNw
ZWVkLycgcHJlZml4IGluIC5kdHMKPiBmaWxlIG5hbWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEPD
qWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+CgpTZXJpZXMgYXBwbGllZCB0byBuZXh0LCB0
aGFua3MuCgpDb3VsZCB5b3UgY29uc2lkZXIsIGluIGEgZm9sbG93dXAgcGF0Y2gsIHVwZGF0aW5n
IHRoaXMgZGVmY29uZmlnCnRvIHN3aXRjaCB0byBleHRlcm5hbCBCb290bGluIHN0YWJsZSB0b29s
Y2hhaW4gYW5kIGVuYWJsZQpCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkgcGxlYXNl
PwoKU2VlIGZvciBleGFtcGxlIGNvbW1pdDoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vY29tbWl0L2ZkYzAwMmVlMzhlNThlZjRhYmZiZDE2MTUyMTdhNTk3N2Y5
YTAwNzcKClNlZSBhbHNvOgpodHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9t
YW51YWwuaHRtbCNhZGRpbmctYm9hcmQtc3VwcG9ydAoKQW5kIG5ld2VyIGd1aWRlbGluZXMgZm9y
IGRlZmNvbmZpZ3M6Cmh0dHBzOi8vZWxpbnV4Lm9yZy9CdWlsZHJvb3Q6RGV2ZWxvcGVyRGF5c0VM
Q0UyMDI0I1J1bGVzX2Zvcl9kZWZjb25maWdzCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
