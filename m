Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431F9C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:38:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02FFD60720
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02FFD60720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C056F40525;
	Thu, 19 Aug 2021 20:38:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjjQgIq_VoU4; Thu, 19 Aug 2021 20:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51F1D40503;
	Thu, 19 Aug 2021 20:38:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51DC31BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F67B40001
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:37:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4NkzljPktmDG for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:37:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C54ED404D8
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:37:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9A629C0006;
 Thu, 19 Aug 2021 20:37:45 +0000 (UTC)
Date: Thu, 19 Aug 2021 22:37:44 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <20210819223744.719358df@windsurf>
In-Reply-To: <20210814190818.24308-1-texier.pj2@gmail.com>
References: <20210814190818.24308-1-texier.pj2@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next] package/ipset: bump to version 7.15
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sat, 14 Aug 2021 21:08:18 +0200
Pierre-Jean Texier <texier.pj2@gmail.com> wrote:

> This includes the following changes:
> 
> 7.15
>     - Kernel part changes
>         - netfilter: ipset: Fix maximal range check in hash_ipportnet4_uadt() (Nathan Chancellor)
> 
> 7.14
>     - Userspace changes
>         - Add missing function to libipset.map and bump library version (reported by Jan Engelhardt)
>     - Kernel part changes
>         - 64bit division isn't allowed on 32bit, replace it with shift
> 
> 7.13
>     - Userspace changes
>         - When parsing protocols by number, do not check it in /etc/protocols.
>         - Add missing hunk to patch "Allow specifying protocols by number"
>     - Kernel part changes
>         - Limit the maximal range of consecutive elements to add/delete fix
> 
> 7.12
>     - Userspace changes
>         - Allow specifying protocols by number (Haw Loeung)
>         - Fix example in ipset.8 manpage discovered by Pablo Neira Ayuso.
>         - tests: add tests ipset to nftables (Pablo Neira Ayuso)
>         - add ipset to nftables translation infrastructure (Pablo Neira Ayuso)
>         - lib: Detach restore routine from parser (Pablo Neira Ayuso)
>         - lib: split parser from command execution (Pablo Neira Ayuso)
>         - Fix patch "Parse port before trying by service name"
>     - Kernel part changes
>         - Limit the maximal range of consecutive elements to add/delete (reported by Brad Spengler)
>         - Backport "netfilter: use nfnetlink_unicast()"
>         - Backport "netfilter: nfnetlink: consolidate callback type"
>         - Backport "netfilter: nfnetlink: add struct nfnl_info and pass it to callbacks"
>         - Backport "netfilter: add helper function to set up the nfnetlink header and use it"
> 
> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
> ---
>  package/ipset/ipset.hash | 4 ++--
>  package/ipset/ipset.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
