Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929C3CFC531
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 12:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AF0081238;
	Sat, 22 Nov 2025 12:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Z0zqvN985nb; Sat, 22 Nov 2025 12:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8270084E3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8270084E3B;
	Sat, 22 Nov 2025 12:31:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EA9C34E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FD1D6079F
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uiYa0TRQxLIn for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 12:31:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 11E8960657
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11E8960657
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11E8960657
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:31:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7454A78035B;
 Sat, 22 Nov 2025 13:31:16 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Nov 2025 13:31:16 +0100
MIME-Version: 1.0
Date: Sat, 22 Nov 2025 13:31:16 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251121163453.499648-1-yann.morin.1998@free.fr>
References: <20251121163453.499648-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <39ef03bdb39016ebb1a74bd7c767eb65@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763814678;
 bh=zKOUO6KjbvwBHBoF93Newtnkk8n/0JI/+aMzwnsQq6k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WwF0jEXWQ6IvPf5o4BIFgHVfY4ZbaCCWCptQogc8Z6UEESuarqZZ39mZEDoWiuQhv
 FHdFepWKOBFxJVPeFOWq8f3pWAq/BAf8ZJVK1PyNZSqCLhgP7PtOTSnu5WN4PwgA79
 sWTl3IeWyJuHkTziHLpVryKFRk+pPX3cQ+Ez8ypTNshohKSGfVXTJ4v0vjjyagqAJb
 2xsukfcSNIau8Ps3pexJV4KJzwDEEXa+3Ob38aTf87g23Gjnv8zS9JaEmEK2eJHoxB
 Ebs6vcnLzl4VCVY6BSl13d700UCDboWnDS0W8q+m5KRTI2TpxHUKTCmXsCsO+/LdIM
 BKKlJQZoq3zeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WwF0jEXW
Subject: Re: [Buildroot] [PATCH v2] support/scripts/check-merged: use
 getopts instead of getopt
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

On 21/11/2025 17:34, Yann E. MORIN via buildroot wrote:
> Commit 1187c34d88e1 (support/scripts: move merged-usr errors message
> into check-merged-usr.sh) introduced the use of getopt to parse its
> options; doing so allowed to use long option (with two leading dashes),
> which is more descriptive than the usual one-character options.
> 
> However, getopt is part of util-linux; it is not a shell built-in.
> util-linux is not a prerequisite of Buildroot, so we may end up running
> on a system where it is missing.
> 
> We could add host-util-linux as a dependency when the system does not
> provide getopt, but that's not very nice; even though host-skeleton 
> does
> not need to check for merged-bin for now, it does not need getopt, and
> thus we could add host-util-linux (which depends on host-skeleton) as a
> dependency of skeleton-custom. But that will not be tenable over the
> long run, especially if/when we do a merged-bin in host dir.
> 
> Requiring that util-linux be installed system-wide is not nice either;
> it's an additional requirement on the host.
> 
> We can do like we do in the oter scripts, though: use the shell 
> built-in
> getopts. Its usage is slightly different, and does not support long
> options. As it's just for use in an intenral script, we can live with
> the less descriptive options, though.
> 
> Switch to using getopts, it removes the need for a new host dependency.
> 
> Fixes: 1187c34d88e16191753bfd0c3b4cd2f914813f31
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
