Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80294606A680
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 20:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ievTE1ze
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF86F607BE;
	Wed, 25 Nov 2026 20:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 558qj63M5J6x; Wed, 25 Nov 2026 20:29:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 921DA606BE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795638597;
	b=E9MMgEh9rNwqIGv9tKPdZpzPHqTe48tZfnkFHExjBjYtvYDXJrgR2ePj7XpQRIqKpUOS
	 Kanm70pT0RLij+nLLmR5kqugGd58dewF/RRW/POXriDIs4fs68YddL/pLhfDspBM7Ke+A
	 tkB7sNv4oT2NEvHcOW2F8l62zP71tMT6/O3cu8SLBNhM2ZpDr8WoNplGiYvQjpSQGrl5N
	 4+E30aCgM/Wcj3pDrinqrI3tcN4X57h8Fru2/RDA7VWAansxzY//myQdVJ1Csbt8j1NeG
	 zv3Vxz4AtQ23dIN6NG4fi9s1ikV2wm4ulqsQCU0g3iI5kmIlOrYqBX0t1ufkQmpyjrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795638597;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=r91hXyKlhClLyZaZJcK4a2KVj4KRG5pQPQbEYsv0Xfs=;
	b=Fl++Y6Mx7xulL9yGc85GLqcSAY6OXp7xDWCFXVE1qIGPqHHGRk3jOOQj8EDP9HVrVMnq
	 DV0J95MVAhEf4rDu7T9yzDgPSxho3J9BY4BW/T156i3gBPX1bwqSB/S3RZp6hEy4k4hPA
	 cF0stm4Rlx8fIvLjnS5buATbb+VZU08QwPlAQQL2mpVhrOxVatSVn3y4Je4vBraoJdywX
	 XRUbQBR9sQ6gYC4xAK8yN6UGjNK9fsrKqKJQ6TnIu2EHTHd5WDIykbQK0ZnRifkwDKi+S
	 P5s3hb3yqDKny2gaT0gWjdlX/IYhb8Vk1Zk7jAFqSvtrdpnYAtpGxTyyGdxkKtfScNg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795638597;
	bh=r91hXyKlhClLyZaZJcK4a2KVj4KRG5pQPQbEYsv0Xfs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ievTE1zeIxXjFtWU1F4ayFZK3Sz+GBzSOiPYEjLJ11dtriMzHOmXnJXyTryajKA0z
	 KJiR6/XNjZuTOk2a6LlzQ9GolU+BvQrpEL8bEnAztmXCkcbB+oEKUmZCrctQGSTbAz
	 RL5z/kru1TVJDdml6nvBVXXIrFnRJA3wlzfuXiVYl+33jxHGiP9/W5uy2VpxVcA/Q+
	 SZ3+5CPQ+hZn74s35NMqa1D6MMZAQ/HLOB9c0/CicuetnFzJ0aAxOw98c6FNPJ6qQ9
	 H9izau+mEYFyNCtCiXKh6MZokeLnzBwTb2H0AuYECu76fCyasTYbQFjJNm01HXARgX
	 /LNrcUqscyd8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 921DA606BE;
	Wed, 25 Nov 2026 20:29:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8172371
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 20:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B953C4054F
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 20:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6dqGsLMy14N for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 20:29:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EA83540549
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA83540549
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 20:29:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 61D0219F57B;
 Wed, 25 Nov 2026 21:29:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 25 Nov 2026 21:29:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 21:29:50 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20261125161404.859000-2-dario.binacchi@amarulasolutions.com>
References: <20261125161404.859000-1-dario.binacchi@amarulasolutions.com>
 <20261125161404.859000-2-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.22
Message-ID: <cb8b17f98caf1f6af1f9bd6159f5f10c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v7 1/5] package/sdl3: disable m68k builds
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/11/2026 17:14, Dario Binacchi wrote:
> SDL_alignment_test has a static assertion to ensure that its size is
> 2 * sizeof(void *), as SDL relies on this layout for its ABI.
> 
> Testing the SDL3 package by running:
> 
>   $ utils/test-pkg -p sdl3 -T bootlin-m68k-68040-uclibc
> 
> raised the following error:
> 
>   In file included from src/libm/k_sin.c:1:
>   include/SDL3/SDL_stdinc.h:230:42: error: static assertion failed: 
> "sizeof(SDL_alignment_test) == (2 * sizeof(void *))"
>     230 | #define SDL_COMPILE_TIME_ASSERT(name, x) _Static_assert(x, 
> #x)
>         |                                          ^~~~~~~~~~~~~~
>   include/SDL3/SDL_stdinc.h:1187:1: note: in expansion of macro 
> 'SDL_COMPILE_TIME_ASSERT'
>    1187 | SDL_COMPILE_TIME_ASSERT(struct_alignment, 
> sizeof(SDL_alignment_test) == (2 * sizeof(void *)));
> 
> Since the m68k ABI results in a different structure size, disable m68k
> builds.
> 
> Fixes: 2dd13e328f11 ("package/sdl3: new package")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
