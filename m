Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D11F606A335
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Su5pQXed
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F108160903;
	Fri,  6 Nov 2026 21:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2y0LAyLss08x; Fri,  6 Nov 2026 21:15:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 274A060B01
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999722;
	b=JJXd/wdXZ+HXDIM8biqWYh7PgUZhWY0E6CQ2daFVFkAfSqWbUWl5FWKNoGfO7kqdoj6+
	 AY+R5r7HvSQbD7+tY42IkyFc9BIfLF1d53KXUPPMn0NATslMnCPuHuf9e+EmQ9E+NbgoE
	 qnsaz6IrMDqmg4taP5/MNdQqgPSibqazMNihSMaM0sjTBc8zADqrDTOeyramHaMyUoZas
	 kUQy80WAd8KAQQTuDqe8JGn3rQQAQF0L2FlttueFMsGGTy14EGExYSJQ4t1vrDJQxNZ1m
	 kESvPR4na7tvuYzsbsz2Z/Rn4dwU/NPFaGUdNgP7cicjsnHDaFmxsNq4nEJsuE0Dgqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999722;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=lOtZsu42xKaFt/hrg5807lWIHmxzxViBnatBFAjTVdM=;
	b=fQSpEpQ+FGNmnzwaeETgjKnpLiQMPHnmL4ZUQQGdxfCyUy5+Qvnv9kHkVOdMLYcEhOUO
	 NfXzkD3p2Y/rtcSnQs3iEB4tGZpe9M+dcIzaryDaDhIxcUcKQcOa3h2XpA10xGzoxyCcS
	 nG3rdhEcXDHUNhhPp6842RlDKTKphbzvebzhvTWOyCmXfH7rLdbsUL5/7JUImKlV+uZ0m
	 yWGLTBQNjMyc3YkvkFYu0Kxn3CmuPcJAQJsNWBSgBbaP17ot6Tjynp1fw76UsLEq1kqW4
	 JWd0ouYd10Dg6GuTTgy541C6GZcSncUhpfiZ+Y6MRZp2IdF2qVoV8RK541razPkrn2g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999722;
	bh=lOtZsu42xKaFt/hrg5807lWIHmxzxViBnatBFAjTVdM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Su5pQXedzYe7mEQ6GyLNEQCUGhnoq++FTwSUiJILsJUbLz7vqpgFebx/A6/8ck35d
	 OJvyQBnzivmHaHT88vqKZokkTKEqosxxFW7bSAiecCPNh8ratnCRNGoBLBgsjZH0DT
	 o8CmxNlj8rwW/divSiXqQ8rAt5DdUz40D66/hOxdk/T8Lo5FHqnblIFrGrQtNvttPU
	 r9GG1fnTLnadYzBtJAWUwgPpeQPQXzCpMgU1pActz1iYY5n3njyGz0Y5RvBGgIsaL4
	 d1wmo0O0rNdeFRjauVZXnhJBSP/F+YIb90zWA69oRedpIdp2aD3kK4yzuGJ0VnAPz1
	 YtSuAsqHpXxsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 274A060B01;
	Fri,  6 Nov 2026 21:15:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F7FB31F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75073403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKvY1YMEDJRt for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:15:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 22E96400A2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22E96400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:15:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8911D5FFC0;
 Fri,  6 Nov 2026 22:15:12 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:15:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:15:12 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-2-james.hilliard1@gmail.com>
References: <20261106191536.2120153-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <1a3a6ec201f6e3f2533b513c9acecee8@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-autobahn: security bump to
 version 26.11.1
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

On 06/11/2026 20:14, James Hilliard wrote:
> Fix GHSA-2gqc-mwv3-66rp: the WebSocket handshake parser accepted
> non-CRLF header separators, allowing forged proxy-injected identity
> headers.
> 
> https://github.com/crossbario/autobahn-python/security/advisories/GHSA-2gqc-mwv3-66rp
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
