Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4046EE0AE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 21:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EAD28345D;
	Sat,  7 Feb 2026 21:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGYbwO5x34un; Sat,  7 Feb 2026 21:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EECE83381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770500782;
	bh=k7qnkEU43jaIyl4wnmf1nmtvZuMrqgBB8OCIUv5OPSM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WSspNZYC63dYn9RAqFtRVD+5Kfh/c0s9jbgl42Fly2vGDfR/BgMdOJIn6srn3IMfR
	 LU1In6Wxtu13mEYUrGjBY5ogsh/SbedCRs4IZXYW7i0xWVsuqACIaBUe69O665xlNi
	 9g8U28ZQAwYW+Fwj2ddgCvCsmo3GMDaZEnHrm23uVWdbT1YmrwMISHm+MGKa+0TZuF
	 pMEnYDZyxQyWbb+nGKi/D/WQ6y5MvITpLLfkHeE4TOd3jDnryT6H7Z9///8PqPZs51
	 4pTxcohqH9M6U6Q75rUJCpbHbZ2b7p84iRah/jaECb41xOMFzbgPZdPOWdFT42rD35
	 p+G+Nlm8umCSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EECE83381;
	Sat,  7 Feb 2026 21:46:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BC31173
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F150383381
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToTac_oknFU7 for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 21:46:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDAA380ED6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDAA380ED6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDAA380ED6
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:46:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0B7F72003B4;
 Sat,  7 Feb 2026 22:46:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Feb 2026 22:46:15 +0100
MIME-Version: 1.0
Date: Sat, 07 Feb 2026 22:46:15 +0100
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>
In-Reply-To: <ea7cef9a9d5fae4f69e8e177a54202c60b6ba13a.1770208629.git.yann.morin@orange.com>
References: <cover.1770208629.git.yann.morin@orange.com>
 <ea7cef9a9d5fae4f69e8e177a54202c60b6ba13a.1770208629.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <8787b556d6fb3553104c6f90947786d1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770500778;
 bh=WVRQ3v3nnbGOgubB1gJm51zXbJiyr0n2Zdh87GuUkuc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bkp1/Vwg3UyBoqHavEDp//bMHPAA9MTNOkKXV/vQxFhI9wI6qaYo+XJYz9eN/TP0M
 GCf/HOfSOS59AoxzCMmtovfJGOMgut2BTznJLSrU8C6qL5p3J0B9DCtXr488IXFQ89
 hGalHVLoY/NKslqNFwSgz+W65QmGhqyy4nlAgsAYVPsjB6GBlOcpZn34PeuCTVo4sP
 tLhRnZgqh7O1SFt4RogE0nnlmvUEJox/E+9XHWmhogJPiMMDSVKPAbEf2gBpRFSRZJ
 gaipgBeaiVTTguChX1Sut45OrXshR3v3fhdc1ppCQPP2tRbcD4BQXdm1kH0NqkaoyB
 +L6HCtUNaXf3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bkp1/Vwg
Subject: Re: [Buildroot] [PATCH 1/3] package/blake3: explicitly disable
 threading & examples
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

On 04/02/2026 13:37, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Use of threading requires a C++20 compiler, and the oneTBB
> implementation. oneTBB is missing from Buildroot, but a system
> one may be used if found.
> 
> Even if the default for threading is disabled, explcitly state so, in
> case the default changes in the future.
> 
> Also disable examples, we don't and won't need them.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Heiko Thiery <heiko.thiery@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
