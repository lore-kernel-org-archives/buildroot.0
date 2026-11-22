Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5102C606A32C
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 16:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f8hKIaky
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 199C180D60;
	Sun, 22 Nov 2026 16:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNAK1QeLo57Z; Sun, 22 Nov 2026 16:36:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4D42580D1E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795365405;
	b=SR7BKNHn/e6Lb3RUEpoVOIvV0Ns3VRJejAT0NOt5Qyqm9naSYYTn+5WInLYA1L/j7itB
	 STMXC4jnVgXFzbbsyxfOHpVnx0ixGeyINCNzEak/TeLbp1kc63QsEWR/2X4GNOnQsQEeZ
	 hzQUFBzUPPe7tCKpaNIjciAS25wRLrPGwAJfG/jQzDMIn61Z1Xuq72Ra1Yk7WBFa8z+f7
	 sNNZP8eUhi5IvY24PW0WwT9QRO9F5TVXXDwUwgnsSwTpoMytHL8FD3fH93EY1SpzWIMEh
	 j1xhl/QOhChchQVH3eE/6lqoMUbngpSFwPGudqPsP8Fy+zBcxrYQ/4jMhkX3nn2JTog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795365405;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=vUqbNJsG+9r8Bf7OdASneD5faUSBHHFjs7Tj3IDgEhU=;
	b=aBS5TJCggl1qnkLebLrPg4Ay/Rn2/5fODE4LUjsDBnL1sWwPri4YXtjm+EgCWRxh8byO
	 FByDg8UN2ftPaMrcvieO7AHfEqyNeAMQlxKHSxpVfm+wWVMEDCadhOZiGJmzN9k7sw9BH
	 E/MoAsaviouB7BWxXI0USMIiheIby3gVk1StxQferOUnhR+93CHTfH2+H3y8rihZDShRf
	 pl3tmImyxNRrV9JBvE48IVIF0sfDNEAxAEH9q6+BHkjd+Va2kEqx/KBg1MfKcnKuGh6wk
	 l47BleLQdcWoSXTiMw1eYQBltI2gX6wKbKL/yVux0+WBvX113kS/BxdKcboxvsfG/2A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795365405;
	bh=vUqbNJsG+9r8Bf7OdASneD5faUSBHHFjs7Tj3IDgEhU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f8hKIakyzvPgnAgNpbjX//xEiAo0wXOmpVnk8GTszPNWkUghViJ6S7rXKCtxoqLi3
	 uk+fpv5C5OOdKiQS5iTWpY1lxzp4SZJn9l5rU0JA4zx51lCbg9DdcqEZDezGcdLH9X
	 SRM6DhAw6rFAOK+MRbIDstpLLF1dhl0mO8iGNmVyyp+XkDwSgBIWDvXockPcaQIr3t
	 CjaIYGfi3qFh6uOMKGoMUcu1dgqvufODg8q1KQNiBTomSDUD8ZSRCUPTepS4V+NA9Z
	 hEmMhGBAL43CP08vQcnVqXsINw6eDacfZS+BgcMlAfDvwWF6cJkfHEh8Lf8zomCLV9
	 WkHgqbZL/34Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D42580D1E;
	Sun, 22 Nov 2026 16:36:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14B0E310
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 16:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 121A380D1E
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 16:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWZ2ddpFxc76 for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 16:36:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DBB2880D05
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBB2880D05
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 16:36:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 09EDB5FFB1;
 Sun, 22 Nov 2026 17:36:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 22 Nov 2026 17:36:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 17:36:34 +0100
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>
In-Reply-To: <20261122151607.287365-1-maxime.chevallier@bootlin.com>
References: <20261122151607.287365-1-maxime.chevallier@bootlin.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <0fd5f3f97e5c8337cfaa166227f0ec3d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/bpftool: enable on loongarch64
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22/11/2026 16:16, Maxime Chevallier via buildroot wrote:
> All the requirements to get bpftool to build on loongarch are there,
> there's proper kernel support, all the syscalls are implemented, let's 
> allow
> compiling it for this architecture.
> 
> This was tested on Loongson 2K0300 (on a Banana Pi BPI-2K0300), that 
> I'm
> using to run networking tests for the stmmac driver, and bpftool is
> required there for some kselftests.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
