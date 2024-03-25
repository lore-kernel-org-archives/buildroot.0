Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3D3C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 18:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CC6E406D4;
	Mon, 25 Mar 2024 18:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3U3rdqJymZQ; Mon, 25 Mar 2024 18:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04EE5406DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04EE5406DB;
	Mon, 25 Mar 2024 18:14:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CB4B1BF263
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A8D940BCA
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_1r7I6k0SAf for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 18:14:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6297740476
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6297740476
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6297740476
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 18:14:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71042C0002;
 Mon, 25 Mar 2024 18:14:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1roopp-0090YO-26;
 Mon, 25 Mar 2024 19:14:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240312183836.411083-1-ju.o@free.fr>
 <0420dfb2-951d-4cae-bc25-39065d5cc287@mind.be>
Date: Mon, 25 Mar 2024 19:14:13 +0100
In-Reply-To: <0420dfb2-951d-4cae-bc25-39065d5cc287@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sun, 24 Mar 2024 17:57:00
 +0100")
Message-ID: <87il1ab2mi.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/bitcoin: add the wallet support
 option
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
Cc: Fabio Urquiza <fabiorush@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 12/03/2024 19:38, Julien Olivain wrote:
 >> The bitcoin Buildroot package has always disabled the wallet support.
 >> This commit adds a config option to enable this support. This allows
 >> the
 >> bitcoin-cli command to create wallets, generate addresses and send an
 >> amount to a given address.
 >> Signed-off-by: Julien Olivain <ju.o@free.fr>

 >  Applied to master, thanks.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
