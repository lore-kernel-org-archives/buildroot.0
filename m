Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2E8C71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 19:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 247C6406F3;
	Mon,  7 Jul 2025 19:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAdUUSXSJF3z; Mon,  7 Jul 2025 19:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F3A640730
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F3A640730;
	Mon,  7 Jul 2025 19:52:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF28E15F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 19:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D58918402F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 19:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-YHqi5OEXdv for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 19:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACB2384017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACB2384017
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACB2384017
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 19:52:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 797552003D6;
 Mon,  7 Jul 2025 21:52:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Jul 2025 21:52:18 +0200
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 21:52:18 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
In-Reply-To: <20250707101837.4032434-1-yegorslists@googlemail.com>
References: <20250707101837.4032434-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5f9a3fb3a772251288f42addcde1c2f0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751917939;
 bh=rTlTX/Vp5TOTMA7HwrpRVoGi1Y7AN+21ZQapvJLCdh4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=efugql3gcXU04uZMtg9ATqOtHUrl1/rNNJs4lJ+Lp+5L2YaD6Vq1jUu/LkrwG5xXU
 6WI4ykZU7GikJuniyyzBmC99/RNWiFR8h0iGKYkFz8sLIsRMvZ/b5LqYsUBaolT9xB
 UYaw3DT4bT2JTV80dDLNmZQVB2Al7OMtx8qWkN7NBUUSuHJani5qj+MQQSgGCM532q
 98U/9kxEbtRLFc96huxuWW6KtapGNV0swQUYwj9zrZO8twyT9lSIoAkHSPlYXNZ65C
 wvDy2ple01KYafCKmp2qAp6FUKyUQXJojugoWABfLdPqIUcc1OvSbvfmItNUj9L6mr
 MuknaFpPlGh7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=efugql3g
Subject: Re: [Buildroot] [PATCH] package/parted: fix do_version declaration
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

On 07/07/2025 12:18, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> With gcc 15-20241117 compile fails with the below error, update the
> do_version declaration to match the header in command.h
> 
> ../../parted/parted.c: In function '_init_commands':
> ../../parted/parted.c:2469:9: error: passing argument 2 of 
> 'command_create' from incompatible pointer type 
> [-Wincompatible-pointer-types]
>  2469 |         do_version,
>       |         ^~~~~~~~~~
>       |         |
>       |         int (*)(void)
> In file included from ../../parted/parted.c:28:
> ../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, 
> PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} 
> but argument is of type 'int (*)(void)'
>    35 |                                 int (*method) (PedDevice** dev, 
> PedDisk** diskp),
>       |                                 
> ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Upstream: 
> https://cgit.git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271
> 
> Fixes:
> https://autobuild.buildroot.org/results/283f52d50ffef91d82a1bdc1f4dde1d54c5ffc23/build-end.log
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.

For info, I reworded the commit title. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/14b5a19486f80d06a4057092625309587737bebb

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
