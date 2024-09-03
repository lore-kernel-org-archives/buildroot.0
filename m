Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243E1CD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C94DF404C8;
	Tue,  3 Sep 2024 19:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7XgmEYWJX8TU; Tue,  3 Sep 2024 19:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A699340A02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A699340A02;
	Tue,  3 Sep 2024 19:13:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85ED31BF267
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7293440A1F
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtnPcQtmiIjL for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:13:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17FD8404C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17FD8404C8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17FD8404C8
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:13:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 186B4240004;
 Tue,  3 Sep 2024 19:13:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1slYxp-005C3I-1W;
 Tue, 03 Sep 2024 21:13:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240212002128.3002289-1-buildroot@bubu1.eu>
 <20240806171014.65cea8b0@windsurf>
Date: Tue, 03 Sep 2024 21:13:17 +0200
In-Reply-To: <20240806171014.65cea8b0@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 6 Aug 2024 17:10:14 +0200")
Message-ID: <87h6awlfea.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] Revert "docs/website/support.html: document
 irc channel permission changes"
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Mon, 12 Feb 2024 01:21:26 +0100
 > Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

 >> This didn't work out as planned, neither the restriction of muting
 >> unregistered users, nor the exception for matrix users worked as planned.
 >> 
 >> The channel mode has been reverted to +R (meaning only registered users
 >> are allowed to join) and an exception for *that* has been introduced for
 >> matrix users via +e. The channel modes are documented in [1].
 >> 
 >> [1] https://www.oftc.net/ChannelModes/
 >> 
 >> This reverts commit d1e6d7845b0f3b450709b84a6e4fc4527f12b196.
 >> 
 >> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
 >> ---
 >> docs/website/support.html | 4 ++--
 >> 1 file changed, 2 insertions(+), 2 deletions(-)

 > Applied to master, thanks.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
