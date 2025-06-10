Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381B5C61DB2
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 21:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03F5D4213A;
	Tue, 10 Jun 2025 21:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANfaxDpCOO9J; Tue, 10 Jun 2025 21:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30D134209D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30D134209D;
	Tue, 10 Jun 2025 21:54:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05F721F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 21:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03897400E7
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 21:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kg3TN114dsY0 for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 21:53:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2ECC740069
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2ECC740069
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2ECC740069
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 21:53:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E22C213F88F;
 Tue, 10 Jun 2025 23:53:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Jun 2025 23:53:47 +0200
MIME-Version: 1.0
Date: Tue, 10 Jun 2025 23:53:47 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250610150957.39838-1-neal.frager@amd.com>
References: <20250610150957.39838-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a6e88f7630c70ee27bea960268c569ff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749592435;
 bh=5rsklg9fd71kw+EMz2vjWEeojgyMogs+XryUoGXxwZQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l5wpRZcC/bBuKKI3m8QoQG1ou18KW3iuMx9I79LKJ9ZHZIBoirN1Cifn8FfURXpsu
 7zN59L7hoZMm+wGqWkQsqjkHWyTxe6zhLQ81KRSWaeRO4+UOq1c2462aXDO3nnuQlt
 xcujcDvrjK1+3RCnheKskxncbwCs5VomK7oYB4URRAKUTb0JXVO+qAL9DArVYkRKjZ
 Jso6bCQX9R4adowHQdFQcAI99Wg8I9S6mS4jcny3FbHrYyF+wFni5r6DIwJIu9GkwV
 dNBvzbukCCf6OrKGg8I/5/XP9BCgkEWc9A+hr9hFI1UOn0bouI1xJlKyCwMITpF9Op
 r7rPl9/g+swCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l5wpRZcC
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynq_*: move to external
 Bootlin stable toolchain
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/06/2025 17:09, Neal Frager via buildroot wrote:
> This moves the zynq defconfigs to the Bootlin glibc stable external 
> toolchain
> as per[1].
> 
> [1]: 
> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> 
> This patch has been run-tested on the zc702 evaluation board.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
