Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF1ECA0EE8
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 21:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18E2841AA8;
	Sun, 14 Sep 2025 21:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0fpmWA8sKKa; Sun, 14 Sep 2025 21:24:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DADD41A77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DADD41A77;
	Sun, 14 Sep 2025 21:24:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DAEB12D
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 21:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FA0E6165D
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 21:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YxPbJ5lAdma for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 21:23:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 48144611F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48144611F5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48144611F5
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 21:23:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F38CAB00576;
 Sun, 14 Sep 2025 23:23:52 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Sep 2025 23:23:52 +0200
MIME-Version: 1.0
Date: Sun, 14 Sep 2025 23:23:52 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250914122628.3232001-1-romain.naour@smile.fr>
References: <20250914122628.3232001-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <464566117f524923936d9a9eb18dfb71@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757885034;
 bh=pQ3SELXsSAw3tYFDU85UowKpngWuwlFACmr1WZ3+7PY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AxaTdzRpQRf4Spww2dYwdGVJ15m243tvA3UALZ2L8PVZHdC8QS2rdSe6p5uEPSPI5
 +EputdYfIq7mXDiJTnUvkwhaiwuwBW8RwSlSo1kNM/Hn7RgbcDo/RbxZN+0nqPoldY
 ItGCjcufhtEXpZLPEmU9ceg/1jFRsFvFzXZNcCwuD1vvsSnoc8obV33w1cLQOyRl1s
 lo/tQ7ZHJp4AMXiSr8b0p0K4ayAFGdr/UXq+9Nyy/gY0V3PLmYMtAUA6QL2cdRK7tq
 LUbDW8wtW5AwxB/1qyh3mdrvEzRb7ga3taOJrL2OsEg7ERAGjRx6CXO/MY5yKjln1g
 pPhHq9Rhoup9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AxaTdzRp
Subject: Re: [Buildroot] [PATCH] package/luvi: bump to version 2.15.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/09/2025 14:26, Romain Naour via buildroot wrote:
> Luvi 2.14.0 fails to build with GCC 14.x for several reasons due to
> too old lua-openssl 0.8.2-0 submodule:
> 
> TestLuvi/build/luvi-2.14.0/deps/lua-openssl/src/ocsp.c: In function 
> 'openssl_ocsp_request_read':
> TestLuvi/build/luvi-2.14.0/deps/lua-openssl/src/ocsp.c:124:29: error: 
> passing argument 1 of 'PEM_ASN1_read_bio' from incompatible pointer 
> type [-Wincompatible-pointer-types]
>   124 |   OCSP_REQUEST *req = pem ? PEM_read_bio_OCSP_REQUEST(bio, 
> NULL, NULL)
>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
>       |                             |
>       |                             char * (*)()
> 
> Fixed in lua-openssl by [1].
> 
> TestLuvi/build/luvi-2.14.0/deps/lua-openssl/src/x509.c: In function 
> 'openssl_push_general_name':
> TestLuvi/build/luvi-2.14.0/deps/lua-openssl/src/x509.c:377:45: error: 
> passing argument 2 of 'openssl_push_asn1type' from incompatible pointer 
> type [-Wincompatible-pointer-types]
>   377 |     openssl_push_asn1type(L, general_name->d.x400Address);
>       |                              ~~~~~~~~~~~~~~~^~~~~~~~~~~~
>       |                                             |
>       |                                             ASN1_STRING * {aka 
> struct asn1_string_st *}
> 
> Fixed in lua-openssl by [2].
> 
> TestLuvi/build/luvi-2.14.0/deps/lua-openssl/src/openssl.c: In function 
> 'luaclose_openssl':
> TestLuvi/build/luvi-2.14.0/deps/lua-openssl/src/stdatomic.h:387:9: 
> error: implicit declaration of function '__c11_atomic_fetch_sub'; did 
> you mean '__atomic_fetch_sub'? [-Wimplicit-function-declaration]
>   387 |         __c11_atomic_fetch_sub(object, operand, order)
> 
> Fixed in lua-openssl by [3].
> 
> Instead of fixing one by one each issues, update to the latest release
> that include lua-openssl 0.9.0-0. Luvi v2.15.0 still have some GCC 14.x
> issues, backport two additional patches.
> 
> Download luvi sources using git method since the release archive
> no longer include the release version in its name [4].
> 
> Luvi switched to PCRE2 [5], update the optional dependency.
> 
> Update TestLuvi to select PCR2 package.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124430 
> (TestLuvi)
> 
> [1] 
> https://github.com/zhaozg/lua-openssl/commit/bfeedbe8c06d8b4400fa670edecd452a433ddac4
> [2] 
> https://github.com/zhaozg/lua-openssl/commit/e5b5420cc506c7507d1d0e7302ea3f1979a6b2ed
> [3] 
> https://github.com/zhaozg/lua-openssl/commit/cfcaa16d1acaab17f4f0178e61ea77ebc2c8f24c
> [4] 
> https://github.com/luvit/luvi/releases/download/v2.15.0/luvi-source.tar.gz
> [5] https://github.com/luvit/luvi/releases/tag/v2.15.0
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
