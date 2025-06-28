Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7956C77B7F
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 12:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7913660AC2;
	Sat, 28 Jun 2025 12:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZXiOyu2soCR; Sat, 28 Jun 2025 12:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1DA06083E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1DA06083E;
	Sat, 28 Jun 2025 12:22:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 554BBAF7
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 12:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BA444088B
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 12:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RE_bTPg2UaVL for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 12:22:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6596540881
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6596540881
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6596540881
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 12:22:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 11F3513F8B9;
 Sat, 28 Jun 2025 14:22:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Jun 2025 14:22:18 +0200
MIME-Version: 1.0
Date: Sat, 28 Jun 2025 14:22:18 +0200
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250627121948.1933049-1-raphael.melotte@mind.be>
References: <20250627121948.1933049-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <08585e4962ffe98f9faa307813c19ddc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751113340;
 bh=BXRVk9GWriFttCxqMGWxY0CtKH5za0M2ocZC7jN0zkk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qu8CS9NYqCBJFo4EDtS5xXJ6Dzp8emvB0zCfGM6E724fV/f6DsVI+Kv79/eX340et
 Y2ciVLq09brhrocYPO0yX+HDAohQ/9juzIyRqDbMLM6MvyOl0QevWv6JuWubYUk05W
 M9T591zAbGq6bMV27kGALLNkxVbCigRX9kR4GsJRuEHcd/ZFk2c/8njv+fnKHSXiDe
 n+1TRRmgo9p5ybVcoKWRGF8fUPLk4jz9e0r3yMAhFX9mqgFl5PjuaOw1RATDTJMlJO
 uo6kkoVkcY1ABwobs5OZdKrMI/oI4X9V4m5p1WbnHtUsc50XdsyzcrWSBk28ClKkvl
 Pf81zMrHmx41g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Qu8CS9NY
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: add new test for
 nginx-modsecurity
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

T24gMjcvMDYvMjAyNSAxNDoxOSwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBUaGlzIHRlc3QgdmVyaWZpZXMgdGhhdCB3ZSBjYW4gcnVuIG5naW54IHdpdGggdGhlIG1v
ZHNlY3VyaXR5Cj4gZGlyZWN0aXZlcy4KPiBJdCBhbHNvIGNoZWNrcyBhIHZlcnkgc2ltcGxlIHJ1
bGUgdGhhdCBibG9ja3MgcmVxdWVzdHMgY29udGFpbmluZyB0aGUKPiBrZXl3b3JkICJibG9ja21l
Ii4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRl
QG1pbmQuYmU+CgpTZXJpZXMgYXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkZvciBpbmZvLCBJ
IGRpZCBmZXcgbWlub3IgY2hhbmdlcywgc2VlOgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvNWNkYTg1Y2I1NjZiZmNkOWQ3YTZjNWJkNzAxZDMyNmE0
N2NiNzI1YgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
