Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355C6606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kWoezjDb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C44280A95;
	Wed,  4 Nov 2026 17:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNPUQDOswtj6; Wed,  4 Nov 2026 17:18:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3250180A68
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793812720;
	b=N01iYZIjwyZoWbnKQoHQzWroWx72WRrPJD5/hvwgOdpg9HZh68LFzRnj6oBj2HhVujBx
	 XRfbyfOzWC3+7S/sc+sPsUP9qLVXY1rublnTXxcUtkGxK6r6f324gIOkWmIrZCS++qBRr
	 NzaxeR371E2UrIt4xjwcWIQMPFFrpoCWCgRl9Q0VtkcuFHo9oNOGr+36lbQ/vMKl19k7j
	 sLzbW6Mqd6f8t29ILYLiq0tV29rk7l4KBSjM/xYwHH79EcH7H39tjl78+gOpDjoiIOBg1
	 pkVj/oIlTslAXRF4IGHT2LjaeMRU/eoiBNiCfL/e5Rf+KcgQtwbW5pjAQFKta76Xj6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793812720;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=bwKn8o5sraTfH9eMGQTYyeTDfX7mJ5hXKApYu8+QkZw=;
	b=djijyfrV3jVc9hpx2K67hjlZfKqy4OYkwt/jBopZdtGAmBWHrglhckdgjO9AF0EusrRf
	 d9RdS3hosqZj5bDPa2+HhJkTtbpQEWWCsNS2g8VbvPGnnbQbGza29oowmyAd7dJWKHw+3
	 Iqan3rlG4po+ZGWvkVhFXKDBwjQbV+sRgQR6RhxaWtE94za4+YaLLE+l9iSfukENmTNhN
	 8Gr8kIOE6j3ldUrCOvhhb8WkxSTr2aHJjxr1S15NacMqaJBAD4vaVADouTXzeij7Msc3u
	 nYYBTQZSImnZlJBNismLOuYkUzKaCLtmc54CUWy55cpvJfY3uehZ7kF6xWwraGtJHIw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793812720;
	bh=bwKn8o5sraTfH9eMGQTYyeTDfX7mJ5hXKApYu8+QkZw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kWoezjDb69FqpbcUGVEMFUEM7GoRiDr4srEATs4eWH87RyjS9WWiIByIkK77zoQLM
	 NmHqy/4SS4SLtOglvYfU1F/JI1bldtT44cNzhV7YybLC2od4q/kJ7iccryGKj/K2kQ
	 TH2M6947NHc2VbA36nGRlMvyjmqWTkXTWELLOKJ4OqLTjJHCjnVojP/lvSS2unDMDA
	 iU+rqU5VHBSVORYu3NKLtQudtCJrxFK5Z1AB2GYEtJaXJdychp8hvYCjHJ7CLyWA6u
	 PRujyiWsxSZcCu0xujk0tO5LKSCFJOkQYRA961GT+hRABNhIZC7XuWFITIJrY00KBs
	 FDOtiR9HkYn3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3250180A68;
	Wed,  4 Nov 2026 17:18:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5A5C341
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BC9280A06
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cu1TXn3MjVJg for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:18:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C7719809BE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7719809BE
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:18:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BF60E19F5A7;
 Wed,  4 Nov 2026 18:18:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 04 Nov 2026 18:18:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 18:18:34 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261102181345.3238554-2-james.hilliard1@gmail.com>
References: <20261102181345.3238554-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <b5f24bcd47e09b48666e7704996ad0ba@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-cbor2: security bump to
 version 6.2.0.post2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 19:13, James Hilliard wrote:
> Fix shared references bypassing the decoder's nesting limit, which can
> crash the interpreter when deeply nested objects are hashed:
> https://github.com/agronholm/cbor2/commit/c2c8062eb28d6c4a884f6a4ba9418ac9d1476ab2
> 
> Also add the strict_hashable_types decoding option to mitigate denial 
> of
> service through hash-colliding map keys and set elements:
> https://github.com/agronholm/cbor2/security/advisories/GHSA-p6xp-9h6j-r278
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
