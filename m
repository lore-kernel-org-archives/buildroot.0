Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBDBCD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C42AD40A02;
	Tue,  3 Sep 2024 19:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qma5sh3pQJ9K; Tue,  3 Sep 2024 19:10:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C916404C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C916404C8;
	Tue,  3 Sep 2024 19:10:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A2D11BF267
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45CE780BEE
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Po_gAFnAJWtc for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:10:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF93380B14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF93380B14
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF93380B14
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:10:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67D47C0003;
 Tue,  3 Sep 2024 19:10:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1slYux-005BeW-1i;
 Tue, 03 Sep 2024 21:10:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240806044826.980205-1-neal.frager@amd.com>
 <20240806132234.416ec38e@windsurf>
Date: Tue, 03 Sep 2024 21:10:19 +0200
In-Reply-To: <20240806132234.416ec38e@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 6 Aug 2024 13:22:34 +0200")
Message-ID: <87le08lfj8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: bump to gcc
 14.2.0
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Tue, 6 Aug 2024 05:48:26 +0100
 > Neal Frager via buildroot <buildroot@buildroot.org> wrote:

 >> This patch bumps gcc-bare-metal to gcc 14.2.0.
 >> 
 >> Signed-off-by: Neal Frager <neal.frager@amd.com>
 >> ---
 >> package/gcc-bare-metal/14.1.0            | 1 -
 >> package/gcc-bare-metal/14.2.0            | 1 +
 >> package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
 >> 3 files changed, 2 insertions(+), 2 deletions(-)
 >> delete mode 120000 package/gcc-bare-metal/14.1.0
 >> create mode 120000 package/gcc-bare-metal/14.2.0

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
