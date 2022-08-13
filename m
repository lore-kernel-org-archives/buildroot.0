Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1475C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 22:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7553B60A89;
	Sat, 13 Aug 2022 22:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7553B60A89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEVsfSCZNzDV; Sat, 13 Aug 2022 22:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF7B60A75;
	Sat, 13 Aug 2022 22:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CF7B60A75
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C64761BF5A4
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 22:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CD8B83E89
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 22:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CD8B83E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0UJi-CxJIgL for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 22:25:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A886683E87
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A886683E87
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 22:25:16 +0000 (UTC)
Received: from [IPV6:2a01:e0a:947:6e20:7c59:325:cbde:fc22] (unknown
 [IPv6:2a01:e0a:947:6e20:7c59:325:cbde:fc22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 24984BFBE3;
 Sun, 14 Aug 2022 00:25:11 +0200 (CEST)
Message-ID: <13d1b5f3-0571-66db-4f9e-064f586847ab@grenoble.cnrs.fr>
Date: Sun, 14 Aug 2022 00:25:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <a79265c3-bb87-b896-eb44-a8d96392d220@grenoble.cnrs.fr>
 <CA+TH9VkvGR70Tyi4--fWok28o_3QiwKvxBHhM2d=hrs5OvqLsg@mail.gmail.com>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <CA+TH9VkvGR70Tyi4--fWok28o_3QiwKvxBHhM2d=hrs5OvqLsg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1660429511;
 bh=H7a7BhEV/jcqym827txISQhf7r/6Avz+y5+2T9CF0mI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oMTd0oX6HYPBAtsQYydjtjYA+DdMss/TFJZgEEPnLqt4W4zPoV/yIkkdLApsGQeay
 JNb44Rfqsxy0GwZsSw74P4gj6JPabEAr/19/krNADzDsKVWt4n4KmqYxZpQEKDiasy
 rZn3POhyjsvsiG60Jh07NKSYp1pAbqI0PMvNXO2z9ltY2fyKx2FB4XKvj6ayBIaaAL
 BroKeoIZjU9XViXI65bK76aQP+HxuwbSQgLuyyfzO8cKN44SE4xfOezIZ0HjoYRs3B
 6Ifo0PXOviIc26tVN+7EFI7pr6nxbO4D+8iSVuCl7XP9IuOFuNH7QRXev/Zp3q+NxV
 WEQFMXB4h68eA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=oMTd0oX6
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: speed up DHCP lease
 acquisition
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
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkhCgpPbiAxMy8wOC8yMDIyIDIzOjM2LCBBbmdlbG8gQ29tcGFnbnVjY2kgd3JvdGU6Cj4gSSBz
dWdnZXN0IGNoZWNraW5nIHdoeSBvYnRhaW5pbmcgdGhlIGxlYXNlIGZhaWxzIG9uIHlvdXIgYm9h
cmQgb24gdGhlCj4gZmlyc3QgdHJ5CgpXaGF0IFdpcmVzaGFyayBzaG93cywgaXMgdGhhdCBvbiB0
aGUgZmlyc3QgdHJ5IHRoZSBob3N0IHRvb2sgdGhyZWUKc2Vjb25kcyB0byByZXNwb25kIHRvIHRo
ZSBESENQIHJlcXVlc3QuIFRocmVlIHNlY29uZHMgaXMganVzdCB0aGUKdGltZW91dCBvZiB1ZGhj
cGMsIHNvIGl0IGhhZCBqdXN0IGdpdmVuIHVwIHdhaXRpbmcgZm9yIHRoZSByZXNwb25zZS4KVGhp
cyBkb2VzIG5vdCBzZWVtIHRvIGJlIGJvYXJkLXNwZWNpZmljIHRvIG1lLgoKSSBkbyBub3Qga25v
dyB3aHkgdGhlIGhvc3RzIGRvZXMgbm90IHJlc3BvbmQgZmFzdGVyLiBJdCBpcyBhIHF1aXRlCnZh
bmlsbGEgVWJ1bnR1IDIwLjA0LCB3aXRoIHRoZSBFdGhlcm5ldCBwb3J0IGNvbmZpZ3VyZWQgYXMg
4oCcU2hhcmVkIHRvCm90aGVyIGNvbXB1dGVyc+KAnS4KClJlZ2FyZHMsCgpFZGdhci4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
