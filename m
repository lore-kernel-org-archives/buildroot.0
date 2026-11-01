Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BD8606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 15:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=psHs3A1t
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B14160623;
	Sun,  1 Nov 2026 15:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYcsBehGJGiv; Sun,  1 Nov 2026 15:26:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 363FB6061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793546816;
	b=GzSCZU25TuEPsL/r5QS2bEkHDl9/PFUc9+JuBlEu3jTQm531wv6ZtrIMWI1+jjDJeVlg
	 Mc46J/z1Hpbfls9/KdxRZJWDjRmRLB1uykKKYj4DsnSkm+1gSrBqqawDpogqBu1d7GJpr
	 sZTTRTbUxEzqpxUFKnksbOenfZw7Ed0keHDzvqTfC7T3P7dzitIkKrdRLlQu8WbbUlsa5
	 kriZ3dhapqLEL7IxxZQVATbq1f57YXk1sGgNme6ra9FWK8FUkh1qTpebtqAv2oJAfCElk
	 qe7fePwQ9+/tDSKw8OKUkQdGI3QgD9z/d2izkR3z/+iiIr8V6Kz2T5pAf52+aDOWDgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793546816;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejTulNPu0q3+DQAEKxaXiykR0W5UQuJ7hNOfJvvXPQ4=;
	b=NW0Q9/uTg0UMFPvhiL+OEKl1E82LZIPJ6B8uOKF+3a3fQhWutldjzQFB8FQcw3PQOZ95
	 +5nSGSDTmEsWtDvxZTUCZ0q79dLiP78SDmSb7We5FKGRFcrTCoZPRgGDCdlvDuID4AA67
	 7WDJnMIVM+PIEzxS6/QUFfqglSf5bQ+ycmmfwmRGDdrqqyupGJhbmcxpsChUXXqlqGmxX
	 3AGafYi0PbTshn9ORB0txLH2IiV1ziHpu0Lxtnw+xwRI1RkX08NaV9Z1vhC1sqyydZt2M
	 BCLCoTDBKC1Du2SNlZUOETaI74kbxoxS0lORT0IwVARsI0gb83pufpnU+qfmeFZ+z9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793546816;
	bh=ejTulNPu0q3+DQAEKxaXiykR0W5UQuJ7hNOfJvvXPQ4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=psHs3A1tCTQgXs0LuRL2tbFfLol326WtdJTx2+EiQoBg+Ll6DiIIg4v6BPyAanz1u
	 h4sAbvTNRp6Zdy9QXvQ3nde0GDHIhsNW5G9S2UfdyvD7aVlTHnVOQxGb2bc1xFNLnx
	 xCzGlQsxxe7jeqXvf46LkwCo3rwRWcyLvtz2IUYhcA2WQT95MTtZJ9kY5almYvZI88
	 vBxd51CVQnmzKurCgPe2zZIkXK6YE1xyhP4fNbj5uqEiE87FZsgcbRpdzDAOo7KCFj
	 yX7cnbyqrMHLCH6+lpAXGvnLIj1oaFjJkGFVFjTkUwZPhQabBx6T0GmTVFkAzYV/JN
	 4o/GTQ6uPecqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 363FB6061B;
	Sun,  1 Nov 2026 15:26:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F6EB2AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80AE080E16
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsFCOmS8Eloq for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 15:26:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CDC5180DF3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793546814;
 b=AtOPS517ngoPJGhn20bTmZ0JTNHwFhgKOhWjv6/k378YnpZXxWXNbFHnuUEy8Dqf2Z/4
 RdjioqiCGaT8WLRd5bvm6Ro1zQLR9F5G6CIesVdiGT7kVrK8Xr7MVPu+5tzLpK2anFao8
 rjmLWdBW6m2LEzmQWnOOxr3Qek6kbkqFl4RbSymI4IjGx44hWSZeaPrLScMaLW9AWzJJB
 ePmUaf5I8/RL3uxxUgGPmZSIN1P5pOcEHdwkAm/Uq1M5rMxOMnGCtIJmL98i2M9bpUyul
 tj3Ulc7FRqQEcYLjj+uj+QKdM2MUh58eAaHeU34HfiIrPPqWnF/BaJTAIc884qU2w8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793546814;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=FOxWGRarJhmB6egG8wJvCuvngTdC8PK6kelAD7bqMss=;
 b=eZt6ry0ZZUtNi7b5agZ8tWzKt0YosspnLBJP9b4Yz443pFAWnXNFYS209bpnpay0yGLK
 7OGVQx1KHc0NhvgyKPWYGdCmVFjE6Hi3yLQxSnHoep930TS92/C8pRVbZjOIi+d9XRI0N
 8+6UTts4jMoWhKeHKTJY5MAryNVI8+OarIG4YTFOELukUDI1P13id/YqH5ksveEQWB46z
 lylfMWaH2bUBw99ogy0VwkcSgRi7FoN1MhGr7ELuAR5reflUsfYw4e8i+l2iOkCfFxWpe
 IhRsC84iFjTelb7l1TN4MtHij0m4qKFQUVzAnB1kiisOq+doCe83z6t/19GCNhTP8xQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qQOXxUdt; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDC5180DF3
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:26:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 439442003CC;
 Sun,  1 Nov 2026 16:26:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 16:26:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 16:26:45 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20261031210314.3994785-1-yann.morin.1998@free.fr>
References: <20261031210314.3994785-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.20
Message-ID: <d7051ad377b1c64b46e7b86278cb469f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/mesa3d: fix dependency for i915
 comment
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

On 31/10/2026 22:03, Yann E. MORIN via buildroot wrote:
> Commit 52ae9f49b215 (package/mesa3d: i915 Gallium driver needs llvm)
> forgot to add the architecture part of the dependencies from the i915
> symbol when it added a comment when LLVM support was not enabled.
> 
> Fixes: 52ae9f49b215
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd@kuhls.net>
> Cc: Joseph Kogut <joseph.kogut@gmail.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
