Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F1CC369A2
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 19:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 595AB812EF;
	Thu, 10 Apr 2025 19:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRf6fG4frt40; Thu, 10 Apr 2025 19:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FE0981BB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FE0981BB4;
	Thu, 10 Apr 2025 19:07:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D895B108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA0A18135A
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uBpRcUvz66Qs for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 19:07:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97B69812EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97B69812EF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97B69812EF
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:07:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DC575780395;
 Thu, 10 Apr 2025 21:07:48 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 10 Apr 2025 21:07:48 +0200
MIME-Version: 1.0
Date: Thu, 10 Apr 2025 21:07:48 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Jan_=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250409143443.528830-1-sairon@sairon.cz>
References: <20250409143443.528830-1-sairon@sairon.cz>
User-Agent: Webmail Free/1.6.10
Message-ID: <87d94583ae86d3c6f724837d1bf33e04@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744312071;
 bh=BoeOnIOZvAyq3r2rpHaTF6KTIfQmVLW7/vSdRM3qSyo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UvLZ91D2Sq5w6C1BeHtmJsqBNt7nCyWmTVK8kFGOya4MqvW/amsLCZ4dEBpD4iMe2
 ikTHRiG/g+I+zpuINP0enCMGXtbcUqgMYBGJpDKe6KWDm0Zzrrgr/FQwb8MAPGuSWs
 djpO+aC9xpgKkkiPnadFer9nM4q21T2umPxH2gSMgOJoejtzUd9jr+zhLUnmuUQlZb
 4VBhuk4cOLv5XWkhqBhpgdLLQguJNAc5t+RRqrS+VnFhaFgJdg6aVWTkxUn/mdeXo2
 W5p9YZN2MPxUUFD0eqOoAn5ioMtTJbBWYIo19PLsdfg+44KYjkqtCPME63PngbW/Oi
 693TtpzE7xXnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UvLZ91D2
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add RTL8125D
 firmware
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

T24gMDkvMDQvMjAyNSAxNjozNCwgSmFuIMSMZXJtw6FrIHdyb3RlOgo+IEFkZCBmaXJtd2FyZSBm
b3IgUlRMODEyNUQgYWRkZWQgaW4gWzFdLiBUaGUgcjgxNjkgZHJpdmVyIGN1cnJlbnRseSAKPiBz
dXBwb3J0cwo+IHRoaXMgY2FyZCBzaW5jZSBMaW51eCA2LjEzLgo+IAo+IFsxXSAKPiBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0
L2NvbW1pdC8/aWQ9Zjc1ZDFmYmU3ODA5YmM1ZWQxMzQyMDRiOTIwZmQ5ZTJmYzVkYjFkZgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEphbiDEjGVybcOhayA8c2Fpcm9uQHNhaXJvbi5jej4KCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
