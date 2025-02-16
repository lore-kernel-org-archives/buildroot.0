Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC74C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 13:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48E5D41480;
	Sun, 16 Feb 2025 13:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLutMBGVBsZ6; Sun, 16 Feb 2025 13:06:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D7B3414CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D7B3414CD;
	Sun, 16 Feb 2025 13:06:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0840C8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFE6460D71
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51GzMfSYi52M for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 13:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED3A360BD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED3A360BD3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED3A360BD3
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:05:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8D38619F5C6;
 Sun, 16 Feb 2025 14:05:54 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 14:05:54 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 14:05:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Jan_=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Cc: buildroot@buildroot.org, Gao Xiang <hsiangkao@aol.com>
In-Reply-To: <20250213200151.4113457-1-sairon@sairon.cz>
References: <20250213200151.4113457-1-sairon@sairon.cz>
User-Agent: Webmail Free/1.6.9
Message-ID: <c275b41b52d97bc02c7d7172be9e8e77@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739711156;
 bh=UyQlI3Wv4qJXof1lYIF/qg5JnvCwaKdKkJODp4Ws/9Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XCNdpJHqzfBwd1WspDvXbogYojgkSvsHvYivRjw+Uu5L3SsAOOnMX2oY5+EMrl/Z4
 InhazG9fLVVv2NUfeYl3ypQCyIxNJk4MBlRkCbS2JUuLYJBwjgOffNnQZZAbj7eKa0
 MKfawxpJhgIYBfyc+iBPCB4t8KKlb9mc2JzqR3+vIpw7FTPep3w4XOdm/R5ml883jS
 o74Jd5DjxoH11iEzK/rAB7IRr3QFlcbxWDmf4AZATUrn6KmXYJ3njM3HGxQZ0Ldavv
 +iBsihDyTsa9wuM8l9j4m4SlKOJSWONTY/tm7tVFFHx5jYw71UYUjF+knfivO8lJHN
 qynCGfABtinAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XCNdpJHq
Subject: Re: [Buildroot] [PATCH 1/1] package/erofs-utils: bump to version
 1.8.5
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

T24gMTMvMDIvMjAyNSAyMTowMSwgSmFuIMSMZXJtw6FrIHdyb3RlOgo+IEJ1bXAgdG8gbGF0ZXN0
IG1haW50ZW5hbmNlIHJlbGVhc2UgY29udGFpbmluZyB2YXJpb3VzIGZpeGVzIGFuZCAKPiBwZXJm
b3JtYW5jZQo+IGltcHJvdmVtZW50cywgZm9yIGRldGFpbHMgc2VlIHRoZSBjaGFuZ2Vsb2c6Cj4g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGlhbmcvZXJv
ZnMtdXRpbHMuZ2l0L3RyZWUvQ2hhbmdlTG9nP2g9djEuOC41Cj4gCj4gU2lnbmVkLW9mZi1ieTog
SmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5r
cy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
