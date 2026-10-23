Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562DD606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 10:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jAhPynwK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 347158128D;
	Fri, 23 Oct 2026 10:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNqefBbdFutu; Fri, 23 Oct 2026 10:51:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 199F981232
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792752665;
	b=bjJfmz5bc3lgGnDAdJD4I2x2p9bl6e9fBdoo696/u/T/PQLdn+zrvzSAeiZSATzx2cLR
	 G9tIKbRuGFqB6KeYlw4/595pHjE76Gb2TnL956woYVsWBbD91viYSMlY1pT6Vw4tz2+9z
	 O46o08yfLWfwY9pc520nTaROUwDuG3Vh/r4x8iVmUih9YKn5MGPX5qhhTpcw7rZTNMIgV
	 XBymSy17ZqaNVTrSEBSuvAt7bhhDf9y9zqYsPuKR6tgUOcdJ8nm1wVq1Um/bXh50rGcfC
	 1H4bSKoz8aa/Lsl2zK9jtd2mDiZlsbE0wKGRF6FX4MG0MTtziR83BextBJh8621Nq/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792752665;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ugvZ/XnUTWKqlvaX8AVBMed9LL//3IwcsUDsPfVb5Tc=;
	b=sBCHqwvICf2kXzuQT5vVR5hJCodVsYVkVFSJEg2IR3CpDTQKaod4YRC2J0O35sw8FeFP
	 xItWqi7COozvvF002tvBEyA3u5jo+XbEIG6tmoysggmZ2XgmyAZ2VNnJ0cwY1AoYHeJvx
	 j+3EsFM4csDDh1g1lWlFNI6KtFAgo8NXF9jgJz6lCTm2MWyKso6yOEYAs1yOqUheJtM2P
	 0qkc265Ytw23HSVn52obwg5UZu5VK9pmCjbcP3k3Y990PnLsH1EDAdb48HQmsS4DnZAPP
	 MOOAaGqgkijwtXgUix1ktmGQrY0VNaMoOfuPlYbGozbsFTKqDHNLTIb/irrXvvz3+0A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792752665;
	bh=ugvZ/XnUTWKqlvaX8AVBMed9LL//3IwcsUDsPfVb5Tc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jAhPynwKPpKv9iIrM850C3suqzODyEr4ShZL8LP3RXUoiXJV2Ou9N6c7IotrhOaDC
	 +rGzHsYaUZ62XMrs/jpmBaT7l1dbt/9VUbZ5UeTL8UHVzx9vDulr8t3AQ5m+KgSfgd
	 Cas83l9KmXsuX0q/bs89BGKpFdYkpXuHeK4LrbPMWNEKk5YuOrWIC3I6F+erxeCmOP
	 ZyDov6wbx5SgL+YCd4m/1dgOV5OU7VTYhQLWmrX2PZI1Gsyh+F2ZWA3SmW+QMf/X2x
	 9iHoyQNEeQff76HiaMSbPsMj6VOuVVKO5VdvC7btK7CJllLp9Ya8LF7fyK3JL7njzH
	 XufXbsUIFS+hA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 199F981232;
	Fri, 23 Oct 2026 10:51:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42E203C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF390811C0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztONsIEuCkqC for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 10:51:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E7A20811AA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792752661;
 b=eRSGiNpHm7Yhf0A8mGSjfeZJX0re/Rerj7w8DCh+PC0yxXvJn0wSetJJoSkRFNOivSaD
 xjyc6okNAZs6dIoHAZftD9+haCVMWqBf9w24bV0ckZVeP+VpupurhFQnbphNrIyqVEOll
 cIMhJUTd6nWhMAc0VcQz1tv9/QvHWTClCA7hF7dTQzovMg3SYG6iaGsacP3mF9utt8eOX
 UeaYAvR+7heS8p/GokQZ50KFknJa54x4PQJ7XP38N+5yfAymVejhIYOrqMrooTXNFsbQq
 JaQf9LozhVkcRAtbUOyKluUHTcGtV5Me5Rvp/nqfnryJULUYjdJ1+jK1YcCZNaUz0tg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792752661;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=BaXNhM5Gbv+iNBjRfYjby7M4oAy6Fz0iDJwmMcCcITM=;
 b=LsEeo1sRf9629jmfW1HPxUXJthk+uX2KxDhZT0mBE7ODjPTuNuYuaprVhan+bi2xLO+Y
 ZuGmgDP9O6u0TcbgWwvAzPrCiRkH7o0vA7q8BWHTKmw5Jc9t1+HKMq9dbCNgsGNe+PpMU
 bNkvbE4PB2RL3Pkp3bOxREA9fTAbJGJnZJ7ySHF2TnLXxZ85MiRPNZ+mfil9YLxSsYz/A
 hMr8YSRrDPY3O1eUI0x6gFM01gqjV8Myg4iqVGkaBcbcUgPF9Dabhbsi8UJjuGvmodZhc
 PfnTAle7uMcxYA90ZDbdH0K/Yqnj4xZS2vPysgC8y3SGsQOv3BxynviVn4k0Lfwy/4w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UusgW0od; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7A20811AA
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:51:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E33E15FFA3;
 Fri, 23 Oct 2026 12:50:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 12:50:55 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 12:50:55 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20261023073509.3714686-1-peter@korsgaard.com>
References: <20261023073509.3714686-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <c13b29b00c81ea09930d2f75160cff89@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/brotli: security bump to
 version 1.2.1
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 09:35, Peter Korsgaard wrote:
> Fixes the following vulnerability:
> 
> CVE-2026-111497: out-of-bounds write permits remote code execution
> 
> https://github.com/advisories/GHSA-9v8h-qqgm-4m35
> 
> https://github.com/google/brotli/releases/tag/v1.2.1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
