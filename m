Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5325C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 17:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA5F481E7C;
	Sun, 20 Jul 2025 17:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SIIFpuShEsw; Sun, 20 Jul 2025 17:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA92781E6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA92781E6F;
	Sun, 20 Jul 2025 17:04:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 515D87AB
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 17:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 380C841285
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 17:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjEfeGxkopmj for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 17:04:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 673C64128A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 673C64128A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 673C64128A
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 17:04:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F0AFB5FFAA;
 Sun, 20 Jul 2025 19:04:24 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 19:04:24 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 19:04:24 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Giulio
 Benetti <giulio.benetti@benettiengineering.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250518124949.4159568-1-peter@korsgaard.com>
References: <20250518124949.4159568-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <b4e723ba36cf64f483c48297c3578908@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753031069;
 bh=F+33wiH5qdmtd0PRbZT1HLthMfbkDugGNm35t6dHHZU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MwcPSNPGJ6F9vV6RvNRufSl7ttEjjyrnv4JL6Ax/ioVt+cDPyFpRGCbptqA5HhrOS
 6Kft+XuhHhReFgxaT3S3aPeeh7E9h8HVEyauYeUnVcVT2PrYFB74cqF63+LbDI2t+/
 QJPB6ku4dYIUAJLM3m9PJ5SxZF/H1CKP8PsEZ39kTu7eR7bCfSC8to+x2RtWQTa3Dr
 r5HkGcYnd2eV2RAM4wkkcWv7mCDY2zmP4e86KGhRMyj+WwuTKJ6bigkJevfE8paG5m
 EgmAHm1iMENVi6aK73HjqhazLbnkaknsp4x/Iolv0rLcwbXr/uUgXdzE3+FTVSEzQs
 V7F88sEiVHzsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MwcPSNPG
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/toolchain-wrapper.c: slightly
 simplify cmdline copying
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

On 18/05/2025 14:49, Peter Korsgaard wrote:
> C99 section 5.1.2.2.1p2 mandates that:
> 
> - argv[argc] shall be a null pointer.
> 
> https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf
> 
> So we might as well copy the null pointer along in the memcpy() rather 
> than
> copy everything up to the null pointer and then add one afterwards for
> simplicity.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
