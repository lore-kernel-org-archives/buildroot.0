Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A977D116EA
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 18:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8197984725;
	Fri, 28 Nov 2025 18:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8UM7V9shLJB; Fri, 28 Nov 2025 18:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A886846F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A886846F3;
	Fri, 28 Nov 2025 18:24:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3E94273
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB195400B0
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yP7mB35Anrxe for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 18:24:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B5B38402C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5B38402C5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5B38402C5
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:24:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 236682003E8;
 Fri, 28 Nov 2025 19:24:04 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 19:24:04 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 19:24:04 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251128105524.1743108-1-giulio.benetti@benettiengineering.com>
References: <20251128105524.1743108-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <68f5e1fc28c30baa0e4eb8e64a8d4319@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764354245;
 bh=GMDcjKYE5x9dXRijlqJ+Y6hRaGnaqrFk22hTtXoPUy4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nsXKo00MbirbFuWflMUd4QPo+JebS1N0VLnViDPkgpC9Ehz+hluz1QX0yt8w94qxK
 DpAu5ebmDCKwh96DvlqLTxnB9hB+MnleNq/q4oY/5mhn0nehpeQvWip5U95Uz4sFrj
 2NBnY9vGH472YpJB6CdBSU7CZ7xqIrihL6JTU/c0dffll6Uf9HirrIJa493V0qusI6
 5QtSrvLX5hj9st4I7mysWGg0naf0S+haCj5vJZalAsaGvyQ0b5NBRm94NAoK5YZh0Y
 FGc28/YLwP3zUlDRT9QxXf5QbcqNErlx/xqYgWuA4XEMkfDV+x3bEDSKLwCy59Y2Lv
 rUgR+v3r+mNog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nsXKo00M
Subject: Re: [Buildroot] [PATCH] package/tmux: fix build failure due to type
 mismatch
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

On 28/11/2025 11:55, Giulio Benetti wrote:
> Package tmux fails to build with:
> compat/utf8proc.c: In function 'utf8proc_mbtowc':
> compat/utf8proc.c:51:39: error: passing argument 3 of 
> 'utf8proc_iterate' from incompatible pointer type 
> [-Wincompatible-pointer-types]
>    51 |         slen = utf8proc_iterate(s, n, pwc);
>       |                                       ^~~
>       |                                       |
>       |                                       wchar_t * {aka long int 
> *}
> 
> Add local patch already committed upstream to fix it.
> 
> Fixes:
> https://autobuild.buildroot.net/results/651/6510cfb16d0c3f3772918cd3bde0542d0b59a230/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
