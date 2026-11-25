Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63DA606A321
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 19:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Dc407ywh
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B25E44080A;
	Wed, 25 Nov 2026 19:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJt0BX1lfGBy; Wed, 25 Nov 2026 19:31:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DD88840812
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795635112;
	b=P0QKyIv+HRSAMwRURoEZ3OKpYBAmvvp0CJVtDXKNH2ALATDz5o4SySFaA+B4wrF0biL7
	 79pwMJxN2aJl5cSGI/z6Y/ZsaP2iuo4KTLSEH+pgNjxaYoRDPqaDg4WxGM6h4SZPNz3Hs
	 CJKOfwDH0og36a1m1myolwzTn8HwxWmVEPhfNF2ySKepnR/PNEE2FoLctoDHqkbQPk/GA
	 CNDb53W9VkChbWObzGwdgedTjz8BG9tlG1TDjsJ0s8I2Z0ibrluPtmPMemmUaTy+6uXXV
	 EOHpzsIFoqTPm86K9S++TZDmyfAiJ6FlhTj5Lo0Z4K5BNgOKFvqYhGvYfh5H1JnPxEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795635112;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=cLe7N9fZp1eC6oVcYjgAc7DcKCrzA+GelyTB+1o2v3g=;
	b=JZ4DhWcj0umPBrvax8chh/LhIe7Jmul76iPdH0EvnUiZ5y8NuL143o0pZxD7NNeaDmbL
	 jJRouutKWlcL0iKMD9gz2b5xRu8D4glot86OgrDz+yW40rcm0vG7LFznm3OYEb6p3QtN0
	 uoKdgTA/tir7eAqIQ7s232mshZP7ueP5SKhTqX0NFmX8FM6ocH0rX0F6WGEZPNHQH1QFj
	 hukH7Oy6obFIOE7F6nI9W/raPIBN2tfbcvzB5ZiPfq4EvemObjj2/gGAvzM2h1uM00lp0
	 No5OIrVLlwagD0HEZnKuEhjYMhJRnHSRDTGtkuzb13D2rCqN4TBRHsamUAQFVHBF6QQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795635112;
	bh=cLe7N9fZp1eC6oVcYjgAc7DcKCrzA+GelyTB+1o2v3g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dc407ywhGsr3iocemArUlyOcWZacYmxg+xDXhjJ5odZ8pXx9jfUKFQlxukjanUxWH
	 0rBecBg2SfwO/swp8uqMWaEeo/G4NnFIWEUzCNBXh/iw27B/FZL8NRDNqF+kEGG6To
	 ngy/fXZ5+Y0xfTNNmz3dTCFrXQfPFMnDMCfzw5P+N6EOH6CbIu/YJbaHEIVuds9sv2
	 nBE7brRmpmr5rxe0POEdK932szMNxaQ/fxQpn5ASENNyw4AUeP2P8Wd6WyLt4xWgej
	 1IOIrgNzHAd2eIrA0qp/Cj2JAqUkgZDRdNcfc/B8dhicuGDJOtEwW+5DfjtULY5rl7
	 50/7vxNwau1Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD88840812;
	Wed, 25 Nov 2026 19:31:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA55C26D
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 19:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F1E040812
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 19:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAGYe9QEOdDc for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 19:31:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7594E4080A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7594E4080A
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 19:31:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 542E919F5B2;
 Wed, 25 Nov 2026 20:31:43 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 25 Nov 2026 20:31:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 20:31:38 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261124172409.1613791-1-giulio.benetti@benettiengineering.com>
References: <20261124172409.1613791-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.22
Message-ID: <f8ab90f0ae2af16f5ef4bb15147a26c6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/kvmtool: drop 32-bit arm support
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

On 24/11/2026 18:24, Giulio Benetti wrote:
> Upstream kvmtool dropped support for 32-bit arm with commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/commit/?id=329fe56
> "Drop support for 32-bit arm"
> that was pulled in with the bump to 1117dbc8ceb2 (commit
> b393bff8c44be37f0b56bee61fdd1fef29f16e43), so building for arm now 
> fails
> with:
> 
> Makefile:224: *** This architecture (arm) is not supported in kvmtool.  
> Stop.
> 
> So let's drop BR2_arm and BR2_armeb from the supported architectures.
> 
> Fixes:
> https://autobuild.buildroot.org/results/c6c/c6c10d55e603831c520e7e21f4c404b095158e41/
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
