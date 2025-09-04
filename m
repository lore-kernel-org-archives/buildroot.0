Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE18CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B34D8405E8;
	Thu,  4 Sep 2025 16:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABgUlwHAZ1qR; Thu,  4 Sep 2025 16:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14F4F405CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14F4F405CA;
	Thu,  4 Sep 2025 16:45:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E33C106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B4BA4005E
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bsApTHIPesAX for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:45:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 21F0A40051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21F0A40051
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21F0A40051
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:45:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0AB8B6013F;
 Thu,  4 Sep 2025 18:44:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Sep 2025 18:44:58 +0200
MIME-Version: 1.0
Date: Thu, 04 Sep 2025 18:44:58 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250831213843.1310171-1-romain.naour@smile.fr>
References: <20250831213843.1310171-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <3fb488e07b05713a2f700b9ccc097da0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757004300;
 bh=duXQ0a3ULHKoSFvfyxdGzhKPKRpFNnpbNxB6ckH47T8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FBm/9X69osVjM97k14kJWOPyGjxpWKcnCD9oocRK55G/UBcmlHktubVseyHJ9h2Ab
 T/8vZZp7iA2Srt7uKICnU96DM4ddP3jwIhBYwA0WbwI8ap70ahA6F41cv7Y1D/8euS
 NLK1/fayUr4TbbGcJTSkYhh7TIwSziwdiwM3BAzSc7jhYmlMWk2a5VigS1mLHsDUzN
 NuJP26/MrpqUt9bD04xZ1zVlOE5Z6cH0T6oCCjS+DckQaOFRCCCc+7dCEVEvchkDvc
 +0Zab/6qkoLCcBy+HuekT6xGXaSkGUqSYd8t5HDFvwCdmAYdBHGRDY5v9gss85tgCg
 5MVqZtTU3N4jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FBm/9X69
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: TestSWIPL: increase
 timeout value
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

On 31/08/2025 23:38, Romain Naour via buildroot wrote:
> The swipl runtime test is unreliable, depending on the execution speed
> of its runner or local host.
> 
> Running on a build server, the last test resolve the sudoku in
> 30sec while the timeout is 10sec.
> 
>   # time swipl -g top -t halt /root/sudoku.pl
>   Sudoku solution:
>   [9, 8, 7, 6, 5, 4, 3, 2, 1].
>   [2, 4, 6, 1, 7, 3, 9, 8, 5].
>   [3, 5, 1, 9, 2, 8, 7, 4, 6].
>   [1, 2, 8, 5, 3, 7, 6, 9, 4].
>   [6, 3, 4, 8, 9, 2, 1, 5, 7].
>   [7, 9, 5, 4, 6, 1, 8, 3, 2].
>   [5, 1, 9, 2, 8, 6, 4, 7, 3].
>   [4, 7, 2, 3, 1, 9, 5, 6, 8].
>   [8, 6, 3, 7, 4, 5, 2, 1, 9].
>   real	0m 28.53s
>   user	0m 27.99s
>   sys	0m 0.51s
> 
> Increase the timout to 120sec.
> 
> Note: On Gitlab-CI, every emulator timeout are increased by a factor 10
> to avoid sporadic failures in elastic runners.
> 
> https://gitlab.com/buildroot.org/buildroot/-/blame/2025.08-rc3/support/misc/gitlab-ci.yml.in?ref_type=tags#L101
> 
> Cc: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
