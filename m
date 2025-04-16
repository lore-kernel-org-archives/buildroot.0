Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5D1C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9379F60F2F;
	Wed, 16 Apr 2025 21:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5b3_ZVjlCJpQ; Wed, 16 Apr 2025 21:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2AD76F652
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2AD76F652;
	Wed, 16 Apr 2025 21:03:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 29B9D159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BACD40CB1
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlHsv26jeNgC for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:03:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DBF95409B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBF95409B1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBF95409B1
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:03:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1F57A1C0083; Wed, 16 Apr 2025 23:03:24 +0200 (CEST)
Message-ID: <a9f575bc-f0b1-4cf7-b46c-6bcec9300bae@rnout.be>
Date: Wed, 16 Apr 2025 23:03:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250323190511.3336129-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20250323190511.3336129-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837404; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=hI9zKEV7HKKeXVewnYss+QwUEjQQXdwdBxNoSA7lMoU=;
 b=AqC5CWENh6jFW61mxsj/Wf3kMBtMv+8KNRCcG0dQ6YvIZj1QqSMPBUaVjRBLfFvG6uxkwV
 4HhCaV+0qPN0kbcEDVGz7ZYexC8J8kBqz/LmBCXJciWbpeCaqQh7ySQesd8OGFwa+Cv8Qd
 x5SGJpzvC5ujoH7jnjxF5M4y2PRq3vIA6cgwjjrgeMHuEYPY7GYCxluuYK08BQ9gqtCFIc
 tUocTx5t8rdcImR1xLv0121ViwfdNcQnbP/r5sfXWLgIRpOqHI3wMWTfc9cevwj8kFbCeI
 DR4K+bHm6p8DpbAqGGBZpepHbUZXsW5SWcB+26dMUK/nPxOPvtm7yw1aRnQgfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/tinyxml2: security bump version to
 11.0.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIzLzAzLzIwMjUgMjA6MDUsIEJlcm5kIEt1aGxzIHdyb3RlOgo+IFJlbGVhc2Ugbm90ZXM6
Cj4gaHR0cHM6Ly9naXRodWIuY29tL2xlZXRob21hc29uL3Rpbnl4bWwyL3JlbGVhc2VzL3RhZy8x
MC4xLjAKPiBodHRwczovL2dpdGh1Yi5jb20vbGVldGhvbWFzb24vdGlueXhtbDIvcmVsZWFzZXMv
dGFnLzExLjAuMAo+Cj4gRml4ZXMgQ1ZFLTIwMjQtNTA2MTU6IGh0dHBzOi8vZ2l0aHViLmNvbS9h
ZHZpc29yaWVzL0dIU0EtODg0eC1wN3FtLWdxM2YKPgo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgogwqBBcHBsaWVkIHRvwqAyMDI1LjAyLngsIDIwMjQuMTEu
eCBhbmQgMjAyNC4wMi54LCB0aGFua3MuCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4gLS0tCj4g
ICBwYWNrYWdlL3Rpbnl4bWwyL3Rpbnl4bWwyLmhhc2ggfCAyICstCj4gICBwYWNrYWdlL3Rpbnl4
bWwyL3Rpbnl4bWwyLm1rICAgfCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Rpbnl4bWwyL3Rp
bnl4bWwyLmhhc2ggYi9wYWNrYWdlL3Rpbnl4bWwyL3Rpbnl4bWwyLmhhc2gKPiBpbmRleCBhMTMx
Yjg2MjRkLi42ZWZlMjAyYjUyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvdGlueXhtbDIvdGlueXht
bDIuaGFzaAo+ICsrKyBiL3BhY2thZ2UvdGlueXhtbDIvdGlueXhtbDIuaGFzaAo+IEBAIC0xLDMg
KzEsMyBAQAo+ICAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAtc2hhMjU2ICAzYmRmMTUxMjhiYTE2
Njg2ZTY5YmNlMjU2Y2M0NjhlNzZjN2I5NGZmMmM3ZjM5MWNjNWVjMDllNDBiZmYzODM5ICB0aW55
eG1sMi0xMC4wLjAudGFyLmd6Cj4gK3NoYTI1NiAgNTU1NmRlYjUwODFmYjI0NmVlOTJhZmFlNzNl
ZmQ5NDNjODg5Y2VmMGNhZmVhOTJiMGI4MjQyMmQ2YTE4ZjI4OSAgdGlueXhtbDItMTEuMC4wLnRh
ci5nego+ICAgc2hhMjU2ICA5MzMyMjUyZTliOWU0NmRiODI4NWQ0YTNmMGJmMjVmMTM5YmYxZGNh
Njc4MWI5NTZkNTdmMjMwMmVmY2E2NDMyICBMSUNFTlNFLnR4dAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3Rpbnl4bWwyL3Rpbnl4bWwyLm1rIGIvcGFja2FnZS90aW55eG1sMi90aW55eG1sMi5tawo+
IGluZGV4IDA0NGI4ZjgyZGIuLmFiMDQwOTE3NTMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS90aW55
eG1sMi90aW55eG1sMi5tawo+ICsrKyBiL3BhY2thZ2UvdGlueXhtbDIvdGlueXhtbDIubWsKPiBA
QCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAt
VElOWVhNTDJfVkVSU0lPTiA9IDEwLjAuMAo+ICtUSU5ZWE1MMl9WRVJTSU9OID0gMTEuMC4wCj4g
ICBUSU5ZWE1MMl9TSVRFID0gJChjYWxsIGdpdGh1YixsZWV0aG9tYXNvbix0aW55eG1sMiwkKFRJ
TllYTUwyX1ZFUlNJT04pKQo+ICAgVElOWVhNTDJfTElDRU5TRSA9IFpsaWIKPiAgIFRJTllYTUwy
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4dApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
