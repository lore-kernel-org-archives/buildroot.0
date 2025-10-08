Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC4ACAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 19:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F29CE81A92;
	Wed,  8 Oct 2025 19:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-2-zBR2t_iB; Wed,  8 Oct 2025 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1857E81AA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1857E81AA7;
	Wed,  8 Oct 2025 19:40:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F431226
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5087C409EC
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBiLM18_smVK for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 19:40:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 787B440990
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 787B440990
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 787B440990
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:40:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id ACEF3B0056A;
 Wed,  8 Oct 2025 21:40:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Oct 2025 21:40:25 +0200
MIME-Version: 1.0
Date: Wed, 08 Oct 2025 21:40:25 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20251008191346.2159282-1-dario.binacchi@amarulasolutions.com>
References: <20251008191346.2159282-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <9c2ad023518b01a2b64c3ff7028da8f5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759952427;
 bh=cx3+qVvkF4jFxVfk0G4rQSaBJU1iIq3vtHSFtaVNebs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ohV5V60Yl/LhsxHWO3Msfg+asM1q4JaHA8axip/OJrqT0lIG+B0oyFzSNgX5dXrLa
 RumoKj8qGFZZ48X0ca6TQbtZqbFc0Rla+9qjB0xtOXbTpp4jiyM0NQ6EMNNDt6YT7w
 EvVsLa7/nKUGSnyY76izTYfeihUwLOcmdS6cJD/VsiedqKRkjSNhPysomT3GcnAiRa
 8GJeQ5DOpPLx8UgPktHUfeTQeufgeVqzYBpNnZRMqz9RZNytAzXCAzdVTnzRatHEUr
 50meVk3aOIFk9Rrlml7+PqA9u/s9taefyojmHwVPW5s7+QXHUe5+xcC4ZUpJJpSksK
 AZtCJn2yLL67Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ohV5V60Y
Subject: Re: [Buildroot] [PATCH 1/1] package/gawk: bump to version 5.3.2
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

On 08/10/2025 21:13, Dario Binacchi wrote:
> Release notes:
> https://cgit.git.savannah.gnu.org/cgit/gawk.git/tree/ChangeLog?h=gawk-5.3.2
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
