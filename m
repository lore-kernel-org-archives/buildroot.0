Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355E1CAC5A5
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 20:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6DF26102F;
	Wed, 24 Sep 2025 20:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpB7YqPIyTNG; Wed, 24 Sep 2025 20:54:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 189656102A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 189656102A;
	Wed, 24 Sep 2025 20:54:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF5C612D
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A188A80C01
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1I3hHvKArSs for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 20:54:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F04E807B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F04E807B0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F04E807B0
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:54:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A98C15FFB1;
 Wed, 24 Sep 2025 22:54:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 24 Sep 2025 22:54:16 +0200
MIME-Version: 1.0
Date: Wed, 24 Sep 2025 22:54:16 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, romain.naour@gmail.com, ibai.erkiaga-elorza@amd.com
In-Reply-To: <20250818113038.3885637-1-neal.frager@amd.com>
References: <20250818113038.3885637-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c9ea632e6e213771a6cc2828deb00334@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758747262;
 bh=6pP49wPVLkXnakXHCc1gMi7TwyCv0CpJiPoPjb23Ox4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pL5BFeLJvpc55n+oBG7ZlXYQVd+7l3cp+O9zb9OkJPTIBdz1NLpoGnB+Mpo5xeFx8
 XwQ9c0qPPvtzuROj/XbLT1AAGQtwzizG27JGBi1qP3oRI3P5fEeRasoDsNmQU729io
 EzriHjWFe89IwOqkV/GwmnIR2zcLHzadhjn6QI0uo8RR1KPfp5ID30I7vIpOufCQSn
 VPYVac/ZupI4PYBzrNI3EZCHsnMzCRTx6DrNSXkjEV/EZ2AIQybYYvhKFqR0mAhqJl
 vIsu55Xgv1V8F9Od1YTrLk+nHr15zPG9fENRwLoEZ6/jJUzJT6YqxG11LKnzD6ict5
 GEFPqljjk4iOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pL5BFeLJ
Subject: Re: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: bump to
 binutils 2.45
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

On 18/08/2025 13:30, Neal Frager via buildroot wrote:
> This patch bumps the binutils-bare-metal package to version 2.45. In 
> the
> process, it also decouples binutils-bare-metal from the binutils 
> package
> since the binutils package does not yet have support for version 2.45.
> 
> With the decoupling, the 3 downstream binutils 2.44 patches were 
> evaluated.
> 
> Patches not needed for binutils-bare-metal:
> 0001-sh-conf.patch
> 0002-poison-system-directories.patch
> 
> Patches already included with binutils version 2.45:
> 0003-objdump-memleak.patch
> https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d
> 
> Since none of these patches need to be applied to binutils-bare-metal 
> 2.45,
> the link to the binutils patch directory is deleted.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
