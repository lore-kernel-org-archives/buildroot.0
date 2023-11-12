Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8A3C4332F
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 13:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4D9841552;
	Sun, 12 Nov 2023 13:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4D9841552
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oAZeJTi2TW9k; Sun, 12 Nov 2023 13:10:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1A5C414FA;
	Sun, 12 Nov 2023 13:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1A5C414FA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A5FC1BF377
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7147B40512
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 13:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7147B40512
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0KEFa8vHXYY for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 13:09:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D97A40236
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 13:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D97A40236
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CC64FF811;
 Sun, 12 Nov 2023 13:09:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r2ADr-0094RM-2I;
 Sun, 12 Nov 2023 14:09:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231030002748.280144-1-dlemoal@kernel.org>
 <5761b87d-4843-4669-bc65-f6e1351e12b7@kernel.org>
 <20231106084314.2458b0c3@windsurf>
 <0f681e5b-2522-462e-9f09-f86694a2d3dc@mind.be>
 <20231106214907.679b703d@windsurf>
Date: Sun, 12 Nov 2023 14:09:55 +0100
In-Reply-To: <20231106214907.679b703d@windsurf> (Thomas Petazzoni via
 buildroot's message of "Mon, 6 Nov 2023 21:49:07 +0100")
Message-ID: <878r73glss.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gcc: Fix gcc finale library
 installation
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
Cc: Romain Naour <romain.naour@gmail.com>, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Mon, 6 Nov 2023 21:18:04 +0100
 > Arnout Vandecappelle <arnout@mind.be> wrote:

 >> Even so, we could apply this already as a first step that fixes many 
 >> configurations, and improve the fix later? Currently there are quite a lot of 
 >> configurations for which we simply can't build a toolchain...

 > Oh, yes, absolutely. This patch is better than doing nothing, that's
 > for sure.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
