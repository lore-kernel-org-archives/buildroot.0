Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31165C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 18:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8A7381F6E;
	Mon, 17 Feb 2025 18:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0FGIMsGsuGQI; Mon, 17 Feb 2025 18:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C652481319
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C652481319;
	Mon, 17 Feb 2025 18:31:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01E77DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 18:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F11CC408AF
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 18:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVC7a8dWiGRs for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 18:31:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32231400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32231400C8
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32231400C8
 for <buildroot@uclibc.org>; Mon, 17 Feb 2025 18:31:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1tk5tb-000050-7G
 for buildroot@uclibc.org; Mon, 17 Feb 2025 19:31:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 17 Feb 2025 19:30:08 +0100
Message-ID: <pan$d2311$8be6fdda$4a9646ab$a7de60d7@ID-313208.user.individual.net>
References: <20250209112915.401359-1-bernd@kuhls.net>
 <f638ed96-aa7b-46af-8c5a-1ca9763e41f7__42677.383792919$1739226794$gmane$org@smile.fr>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/libcdio: needs host-pkgconf
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gTW9uLCAxMCBGZWIgMjAyNSAyMzozMjo0MyArMDEwMCBzY2hyaWViIFJvbWFpbiBOYW91ciB2
aWEgYnVpbGRyb290OgoKPiBIZWxsbyBCZXJuZCwKPiAKPiBMZSAwOS8wMi8yMDI1IMOgIDEyOjI5
LCBCZXJuZCBLdWhscyBhIMOpY3JpdMKgOgo+PiBXaXRoIGNvbW1pdAo+PiBodHRwczovL2dpdGh1
Yi5jb20vbGliY2Rpby9saWJjZGlvL2NvbW1pdC8KMWY5NDY2NGY3NjZlZjY2Yjk5MmUxYzUzYTVl
ODE3YTM3OTg4ZDg5NAo+PiB1cHN0cmVhbSBhZGRlZCBhIG1hbmRhdG9yeSBkZXBlbmRlbmN5IHRv
IHBrZ2NvbmYgaW4gdmVyc2lvbiAyLjEuMS4KPiAKPiBBY3R1YWxseSwgaG9zdC1wa2djb25mIHNl
ZW1zIG1pc3Npbmcgc2luY2UgaXQgd2FzIGFkZGVkIGludG8gQnVpbGRyb290Lgo+IAo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9saWJjZGlvL2xpYmNkaW8vY29tbWl0LwoxNDZiYmE5ZTFlZmMwMmZlYzJj
ZGVjNjhmYWIzYjAzM2FkYjU5MGQxCgpIaSBSb21haW4sCgpJIGZhaWwgdG8gc2VlIHdoeSB0aGUg
Y3JlYXRpb24gb2YgbGliY2Rpby5wYyBieSBsaWJjZGlvIHJlcXVpcmVzIHBrZ2NvbmYgCmR1cmlu
ZyBidWlsZHRpbWUuIEluIGZhY3QgSSByZXZlcnRlZCB0aGUgYnVtcCB0byAyLjIuMCBhbmQgYnVp
bGQgbGliY2RpbyAKdXNpbmcgdGhpcyBkZWZjb25maWcKCkJSMl94ODZfNjQ9eQpCUjJfeDg2X2Nv
cmVpNz15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQpCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JP
T1RMSU5fWDg2XzY0X0NPUkVfSTdfR0xJQkNfQkxFRURJTkdfRURHRT15CkJSMl9QQUNLQUdFX0xJ
QkNESU89eQoKd2l0aG91dCBwcm9ibGVtczoKCiQgbHMgLWxhIG91dHB1dC9idWlsZC8gfCBncmVw
ICJjZGlvXHxwa2djb25mIgpkcnd4ci14ci14IDExIGJlcm5kIGJlcm5kIDQwOTYgMTcuIEZlYiAx
OToyNSBsaWJjZGlvLTIuMS4wCiQgCgpSZWdhcmRzLCBCZXJuZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
