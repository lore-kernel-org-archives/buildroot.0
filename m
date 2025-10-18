Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C84CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 14:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 375CB60BD5;
	Sat, 18 Oct 2025 14:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wokw7r6eKPEQ; Sat, 18 Oct 2025 14:42:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BBDE60D79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BBDE60D79;
	Sat, 18 Oct 2025 14:42:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A0E4D8
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 14:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BEC740EBD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 14:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9rHvcLswIkR for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 14:42:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4220F40EBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4220F40EBB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4220F40EBB
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 14:42:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 56B0B5FFB7;
 Sat, 18 Oct 2025 16:42:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Oct 2025 16:42:13 +0200
MIME-Version: 1.0
Date: Sat, 18 Oct 2025 16:42:13 +0200
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251017-python-scp-v1-1-b45644fa9afb@bootlin.com>
References: <20251017-python-scp-v1-0-b45644fa9afb@bootlin.com>
 <20251017-python-scp-v1-1-b45644fa9afb@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4ea4862e694a32ea35c425b2d39c5320@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760798536;
 bh=06OJesmlPso8MX75l0+Be7UdsmoWOq25noBnXp2GjLw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Dx+mMySQFoNMAt8XlBYVkLk3aoTIqEYQ9iIWq/tzZjIfzEK1IHrDPiM6oLZJfkVQJ
 H7N13KGJ2lZ8pFyx3FW7G2D454A1hFtG/y501+PNI/1JOfmOksJx8dgZy0bxp4Rpf4
 5qDy70c96I2G2JnXcYZlzdQ3MJ6elx0qNT8Q8QdmXlhl3eSSuUvBHfxoQYadInrUze
 P52KOfDDj5fxu+PkSJGvwllkBGxj0IO1jViOrqsVPhEUzSOGntr9lFCg8W/jvh8Vvb
 gWSrNKjE8JOIdBDN0TyJT9NKtDhxCXu0Dcd7eRuo/1J+klZTO4pGJd441l8NBVsX3a
 sGlOEnTjNyymQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Dx+mMySQ
Subject: Re: [Buildroot] [PATCH 1/2] package/python-scp: new package
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

T24gMTcvMTAvMjAyNSAwOTo0MiwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gQWRkIHB5dGhvbi1zY3AgYXMgYSBuZXcgcGFja2FnZS4gcHl0aG9uLXNjcCBhbGxvd3MgdG8g
c2VuZCBhbmQgcmVjZWl2ZXMKPiBmaWxlcyBpbiBweXRob24gdGhyb3VnaCB0aGUgc2NwMSBwcm90
b2NvbCwgb24gdG9wIG9mIHBhcmFtaWtvLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Ro
b3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+CgpTZXJpZXMgYXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4KCkZvciBpbmZvLCBJIGRpZCBmZXcgbWlub3IgY2hhbmdlcyB0byB0aGUgcnVu
dGltZSB0ZXN0LiBTZWU6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC8tL2NvbW1pdC83NDcwNTg3Y2ZhOWEyNGQzYzQ5YWRjMGZiNmNjNjA1MTI5MDdmMzFhCgpCZXN0
IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
