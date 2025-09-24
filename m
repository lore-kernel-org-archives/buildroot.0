Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA97ACAC5AE
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 20:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A54C414B4;
	Wed, 24 Sep 2025 20:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78nGxsTN4nS9; Wed, 24 Sep 2025 20:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A893641348
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A893641348;
	Wed, 24 Sep 2025 20:53:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B293712D
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9917183863
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9esBUoXyLFj for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 20:53:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8177837C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8177837C9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8177837C9
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:53:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 03D67780372;
 Wed, 24 Sep 2025 22:53:45 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 24 Sep 2025 22:53:45 +0200
MIME-Version: 1.0
Date: Wed, 24 Sep 2025 22:53:45 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, romain.naour@gmail.com, ibai.erkiaga-elorza@amd.com
In-Reply-To: <20250818044755.3155924-1-neal.frager@amd.com>
References: <20250818044755.3155924-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e5679f7f728970d4ffb3291be7936277@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758747231;
 bh=aawqiiJae29yALD7WdnhbludEJ9uU4XukjoMWZury2o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qUytjo/wMugYkXZFmNWcmYWPAaOZGYHCIJO+feemaZpJETTn756rVgNVhPROa9Rdb
 wuGHV10DSrZ9xpePoTWno+SR1iDS8jTGCjPCSkx+cQfaagtYPUi3adZD4JcLgZgDOc
 DKMklGRqcrNwm2ZqDsy/ErFbI73sUzuXohZGOng0iz4KE/mpYWi0mU36cUE7Kvy1TJ
 Yx5AvidPEsFOUe79MmCtrDRgJ25XNS6QmJuTmj+ziuMAz3pY+RoRG6D0KfK7MPHmqB
 6MBBQmlaXh8EeKRtA/SjaXWU/KJs96J3uzdp5MmzK87vbBzHBAZl7TZu4nng3JRzBq
 qApM/KX/xZ6ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qUytjo/w
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gcc-bare-metal: decouple
 from gcc package
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

On 18/08/2025 06:47, Neal Frager via buildroot wrote:
> This patch decouples the gcc-bare-metal package from the gcc package to 
> avoid
> potential build issues when bumping the version of one package before 
> the
> other.
> 
> Such as the build issue example here:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11026775160
> 
> Since the gcc-bare-metal package does not currently require the gcc 
> 15.2.0
> downstream patches, this patch simply deletes the link for patching
> gcc-bare-metal 15.2.0 with patches that are not needed for bare-metal 
> apps.
> 
> As for the hash link, this patch creates a new file called 
> gcc-bare-metal.hash
> which has the same hashes in the gcc.hash file.  But by having its own 
> hash
> file, hashes from the gcc package can be removed when version bumping 
> without
> causing build errors for the gcc-bare-metal package.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
