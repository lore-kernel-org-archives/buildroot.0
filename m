Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040AEC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 05:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F2D96069A;
	Mon,  8 Jul 2024 05:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKUyz3vMwBv5; Mon,  8 Jul 2024 05:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0AA06069C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0AA06069C;
	Mon,  8 Jul 2024 05:34:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4501C1BF48D
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 05:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3208D80E93
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 05:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulyhNpQeY_3r for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 05:34:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 202D680E1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 202D680E1E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 202D680E1E
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 05:34:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A89711C0004;
 Mon,  8 Jul 2024 05:34:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sQh0u-0015AD-1N;
 Mon, 08 Jul 2024 07:34:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240617075538.938635-1-titouanchristophe@gmail.com>
 <20240622194222.234c5296@windsurf>
Date: Mon, 08 Jul 2024 07:34:12 +0200
In-Reply-To: <20240622194222.234c5296@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 22 Jun 2024 19:42:22 +0200")
Message-ID: <87frsksazv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: bump to v7.2.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Mon, 17 Jun 2024 09:55:38 +0200
 > Titouan Christophe <titouanchristophe@gmail.com> wrote:

 >> From the release notes:
 >> ================================================================================
 >> Redis 7.2.5    Released Thu 16 May 2024 12:00:00 IST
 >> ================================================================================
 >> 
 >> Upgrade urgency MODERATE: Program an upgrade of the server, but it's not urgent.
 >> 
 >> Bug fixes
 >> =========
 >> 
 >> * A single shard cluster leaves failed replicas in CLUSTER SLOTS
 >> instead of removing them (#12824)
 >> * Crash in LSET command when replacing small items and exceeding 4GB (#12955)
 >> * Blocking commands timeout is reset due to re-processing command (#13004)
 >> * Conversion of numbers in Lua args to redis args can fail. Bug introduced in 7.2.0 (#13115)
 >> 
 >> Bug fixes in CLI tools
 >> ======================
 >> 
 >> * redis-cli: --count (for --scan, --bigkeys, etc) was ignored unless
 >> --pattern was also used (#13092)
 >> * redis-check-aof: incorrectly considering data in manifest format as MP-AOF (#12958)
 >> 
 >> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
 >> ---
 >> package/redis/redis.hash | 2 +-
 >> package/redis/redis.mk   | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)

 > Applied to master, thanks.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
