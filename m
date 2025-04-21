Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDAFC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 16:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E6F640759;
	Mon, 21 Apr 2025 16:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fVPUqUtgHBI; Mon, 21 Apr 2025 16:08:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62F5F40625
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F5F40625;
	Mon, 21 Apr 2025 16:08:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B86971C0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4BA8403D7
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwrGQUzxuzYH for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 16:08:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED4EC40445
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED4EC40445
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED4EC40445
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:08:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 97E752003A4;
 Mon, 21 Apr 2025 18:08:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Apr 2025 18:08:34 +0200
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 18:08:34 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250414171433.1233576-1-raphael.melotte@mind.be>
References: <20250414170922.1230348-1-raphael.melotte@mind.be>
 <20250414171433.1233576-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <2edc8c43fd0a4fe54b27cd04b49c24c0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745251715;
 bh=e4aqX5OLGwUpB91BD9T3dSsKjPjrodfgrRdRpfqmxtE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L/dGYA9hyl721KW8zl10DQNzhjrvfgIAy5B4PB0yNY3A+zOsmFn6u5k/8+tF+mfOW
 ZWmI3a1d203/xGn734L9+Jo1U79ICrJnZsMtSgd87/pez0MWJN4uofZwO4/WAKdjnj
 4MjIbZsxVqP4a5inILYfW83Tqbgob2wJ0Z9yXktfb2UU0jq5DLf3N0n2gDksd9ofcg
 rr/Q4O0NI2Mp+ZgdeSYC292imNfyglCbZAwiCDePf7mtwa302hRXke+2bMx0hQdmmS
 q3egNsL+QmgFRki0UNFQZRlyr5SuHrSqCZ1kYCy/z58IW4f6x9H1Yx55QSNbSB2bzc
 1Qt5bIEsGkiPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L/dGYA9h
Subject: Re: [Buildroot] [PATCH v2 1/2] support/testing: add new test for
 python-urllib3
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

T24gMTQvMDQvMjAyNSAxOToxNCwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBJbXBvcnRpbmcgdXJsbGliMyBhbHJlYWR5IGFsbG93cyB1cyB0byBjaGVjayB0aGF0IGZv
ciBleGFtcGxlIHpsaWIgY2FuCj4gYmUgbG9hZGVkIGF0IHJ1bnRpbWUuCj4gCj4gRm9yIGdvb2Qg
bWVhc3VyZSwgYWxzbyBjcmVhdGUgdGhlIFBvb2xNYW5hZ2VyIG9iamVjdCBtZW50aW9uZWQgaW4g
dGhlCj4gdXNlciBndWlkZSAoWzFdKSwgYW5kIGNoZWNrIHRoYXQgd2UgY2FuIG5vcm1hbGl6ZSBh
IFVSTCBsaWtlIGl0IGlzCj4gZG9uZSBpbiB1cmxsaWIzJ3MgJ3Rlc3QvdGVzdF91dGlsLnB5Jy4K
PiAKPiBbMV06IGh0dHBzOi8vdXJsbGliMy5yZWFkdGhlZG9jcy5pby9lbi9zdGFibGUvdXNlci1n
dWlkZS5odG1sCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwu
bWVsb3R0ZUBtaW5kLmJlPgoKU2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
