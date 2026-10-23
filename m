Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C04F606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 11:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jAN1MULt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B7FC811C1;
	Fri, 23 Oct 2026 11:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMkYMabVI9tj; Fri, 23 Oct 2026 11:06:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4252281202
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792753600;
	b=bTYUXtz4xZJ4e4TCND16Ij92I2aRHWZOjPAd0GunQhputBlwoQXeoHzZ2r7LZ1OLVGaU
	 lu2HlJiLXRwvBimVNN8uFvpHR+yjuaZ0uTZFMe7UjyuvMkx37kRX4VLWHjgMbiioNQPzw
	 W2LfQCnn1DiGRjsVBBHeOqqLq6+s3qWi3bPMyzRpWRE3/mIQ9dfbfUSHRyA/itl22S0P/
	 +S1Bjd5IXxigH6FXy+aEx9PziGBVRhCrQpnvTSMuflH5GDOc4Ut9myn39GOgpV8Ze0pwf
	 2aFGdmsb2FXIVx98D+VQxtO0rcGXajPg1YEFKlyqgDAvXOarSVFzkCKaS31ya3utPqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792753600;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=2LrPnRQoGXTraD3pbZxPTsiEyt2PsXYYkXmImYsurp0=;
	b=os07di/rjUS6xGrrDJfwh/zU+S3L0m9y4xJc1+lOYS/i5lmiNK4pwRy5jeO+A96AZ0XI
	 OYCqLjpLZgX2aIY1nowLZoP5Fo5mCyE+RUFCfSy7uAfhSgALWeZm0rEPFQv5LMuIPziGm
	 /InyOf+KQCpPxn+vQRZZPoqAmCxDetx+rJrUEL5AhT/zjdPoTT6Qh2HcG5EkKlbB166kR
	 ID3uT8wszrjslm1UqugmPrPq2vEERXl7jYY3AfFGypAik2x27LZPHTs29Bfq4/d4lWHpi
	 lHz8VWVM4tpUwJiHYtCfi3zYyBHdEmN9/nVfFaiRQs8RhRCw1UquhcYGLU+mEB2Plgw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792753600;
	bh=2LrPnRQoGXTraD3pbZxPTsiEyt2PsXYYkXmImYsurp0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jAN1MULtFO2+LzXa5/LuTyQQ0zy8SA9Tqs1gLr47QnMeQE6Gx92SPXYWWBB6GsQru
	 vwS+4a+wskTODGBbUolt3+E5RoDr2xXYY+x6/1osB8gz2uoiNnndarXzGH5HIgZIZM
	 McldAnti5mIKx0dSAF+y18GGGeze0ThErgIdJ5A+Sca/0/NaZcLsP7zXiFvEDEmcRC
	 JER0oDf5au96+IbDb1bwhfVtnaejFb1XkdNFhzFehm1/tiOlrH4RD51sh84zyrG5EQ
	 UqmoQAROK6iCLsILXgF847lqDENjZVlJorvKiRxaj/uPpWRfHGMC52ipgd3LCVnlqv
	 N9FSeW+xb8ArA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4252281202;
	Fri, 23 Oct 2026 11:06:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED38A3C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2DC460666
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_yGTw7RTyMV for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 11:06:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 87EC06064B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792753597;
 b=OXuuUi19SKr6IsmlPScaKUZSSv7RqTn+rk4/r+OM24YAtkZGSJZLaqpRvd0nw3G75kPA
 kTfZcRAY5qsevivaJ30nQY1+Vg7Dpm9e+uRx11JjEUUEb7TTSy6i/tjnjyWGrYeUEcSfX
 zpXecDBYdq7iAdqFW0Xrp9Q6CTHQB16ixetnXtzUcLwxUsZBIYsg/LsKydj7u9o1RLh40
 844v9MPDAc/oXKGw1fpqWCMD/amZg9XOTe9OzU+8TAOK6v8CVPRwjz0F/tm7Kq2MpE4Dm
 8Is0GYGb/TYh7WtR8fLqlIsMeGO3w+hI5zkRcAFIgm1zRR00KXO1oryoQTA20WUvirg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792753597;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=4fny7ci8R55x9lEuUZt5UQDmI5okltLrMft+O4Ks+ng=;
 b=V1hoxkY0YbOgITei4MM4kziflwU1ctKJGYXa77Y+ZWKSGIUEU5bqFPlnGoTPzejSR8pB
 L1OPPeNexCPFnPZLJm6pod4qwmQxBN1UoPnZUSjqqmlBU4HZSLFMHFmOokUT1prxVZntR
 wCZIpOzKrXEn6kGkP//l7VT7awoyEWFjEcR64Q5PvcdNmKnDL/oyjSAz7j5wVgG/sWgyn
 QDsoh7Fui1+YqZ6brv+/V2NyjjogLgEpRWtLsPvjFNS9eRNdt9S3SkUUgKSOrWkoE/n07
 9h4TbNNF+sO/LOYTqtG37dR1GCqPdBDnQ/WLPYu5i8TMaXbJRXenEjWP6CiqygMYCAA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WM5gH1Ss; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87EC06064B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:06:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id DE6A113F846;
 Fri, 23 Oct 2026 13:06:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 13:06:29 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 13:06:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>, Valentin
 Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <20261022051033.5024-1-bernd@kuhls.net>
References: <20261022051033.5024-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <3972652d5e840115764541b8e9fd4bc8@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/3] package/llvm-project/libclc: fix
 build with llvm 23
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

On 22/10/2026 07:10, Bernd Kuhls wrote:
> Buildroot commit 5f79161e4a8756acdb25c8500de9b2dee663f2ac bumped the
> llvm packages from 22.1.8 to 23.1.0 causing configure errors with the
> libclc package:
> 
> -- Check for working CLC compiler: /usr/bin/gcc
> CMake Error at cmake/modules/CMakeTestCLCCompiler.cmake:29 (message):
>   The CLC compiler
> 
>     /usr/bin/gcc
> 
>   is not able to compile a simple OpenCL test program.
> 
>   Output:
> 
>   gcc: error: unrecognized command-line option
>   '--target=spirv64-unknown-unknown'
> 
> Update various configure options to switch to clang.
> 
> Fixes was inspired by Arch Linux:
> https://gitlab.archlinux.org/archlinux/packaging/packages/libclc/-/commit/ca75c4b19c76ae856a368d070d914b12f71203a5#line_9b9baac1e_A56
> 
> 'spirv64-unknown-unknown' is needed both for the host and target build,
> see LibreELEC commit for a similar fix:
> https://github.com/LibreELEC/LibreELEC.tv/commit/04c2de1c89b4946e822d1a977b918802ce4222e8
> 
> Fixes:
> https://autobuild.buildroot.net/results/3fc/3fcdcb71be590b090df2f765c68aeaecc44dd215/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
