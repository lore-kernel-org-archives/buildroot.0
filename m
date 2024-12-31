Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451A6E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 17:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D2680BF2;
	Tue, 31 Dec 2024 17:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xb5K2x2RatWZ; Tue, 31 Dec 2024 17:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22C6080DAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22C6080DAB;
	Tue, 31 Dec 2024 17:20:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28FA2E0F
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17B08400EF
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lIOLUvtFaVoN for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 17:20:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C9E84023A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C9E84023A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C9E84023A
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:20:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 05B9D2003DD;
 Tue, 31 Dec 2024 18:20:30 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50686])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 31 Dec 2024 18:20:30 +0100
MIME-Version: 1.0
Date: Tue, 31 Dec 2024 18:20:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Jannik Becher <becher.jannik@gmail.com>
In-Reply-To: <20241231095315.1672693-1-thomas.petazzoni@bootlin.com>
References: <20241231095315.1672693-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <78ce614a660f0e417d56e4f140ef8c32@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735665633;
 bh=6FqAGdJMB+KbO9srRRBDkIZDTWGYenPZG88ltQYdtBo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lS3BVV0lAJy3E8XrMHVAu2ALzjCriHeTdrZsIbpqlja2PVqeOnCiJDjWbCBcXhqMe
 X8Kdy3QLxlasDe7wQpsy47n8eoBabY7viufdP/U+z+WqKfdYg9QWTKK47l4l+ABQkf
 gLEwoN/H0SKv30PV5qpmnBMHrgUAH9g/+aeErBrhCi0rs0m3JXf81gh/cf8kNGIEd4
 V2Vz3Lob0vjimKD5yWBzI19HezZ1IbeJEAUAKXjuYzVbTYG65E88F5EoopQXswabUB
 8RgVgcpPx69E0CGSTW7Al0wwfB8azu9iqpCEMG3VYu63nszDcZyqlsN+1F/t+dl3r5
 rUuAyY3KvWyEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lS3BVV0l
Subject: Re: [Buildroot] [PATCH] package/igh-ethercat: fix build of tty
 module with recent kernels
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

On 31/12/2024 10:53, Thomas Petazzoni via buildroot wrote:
> Since commit
> eec3a1108a65ab8de4a313a7f34205c5d5ad8f2b ("package/igh-ethercat: add
> configuration options"), we are building more components of
> igh-ethercat, including the tty module, which fails to build with
> Linux kernels >= 6.6.
> 
> This commit adds 3 patches, submitted upstream, that fix those build
> failures.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/1bb799f4ae6140b67c4eb28c04aa45ccbd296b31/
> 
> Cc: Jannik Becher <becher.jannik@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
