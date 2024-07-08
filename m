Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3E5C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 10:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93BA7606CF;
	Mon,  8 Jul 2024 10:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRvoMK5VVaog; Mon,  8 Jul 2024 10:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFD9260707
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFD9260707;
	Mon,  8 Jul 2024 10:04:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E4921BF239
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 10:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C52E80AA5
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 10:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuZ6IDkSjQnn for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 10:04:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CEAE80A9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CEAE80A9A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CEAE80A9A
 for <buildroot@busybox.net>; Mon,  8 Jul 2024 10:04:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C470AFF802;
 Mon,  8 Jul 2024 10:04:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sQlE8-001S6e-2i;
 Mon, 08 Jul 2024 12:04:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20240612135727.11811-1-ps.report@gmx.net>
 <3c9f622a-18c8-4331-a594-4a8b39639d93@mind.be>
Date: Mon, 08 Jul 2024 12:04:08 +0200
In-Reply-To: <3c9f622a-18c8-4331-a594-4a8b39639d93@mind.be> (Arnout
 Vandecappelle's message of "Mon, 24 Jun 2024 15:41:53 +0200")
Message-ID: <87ikxgqjxj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/5] package/xz: bump version to 5.4.7
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 12/06/2024 15:57, Peter Seiderer via buildroot wrote:
 >> - add key hint for download signature check
 >> - update COPYING hash due to [1] (change of home page URL)
 >> For details see [2].

 >  I've added a statement here to make clear this is not affected by the backdoor.

 >  Peter, this is for 2024.02.x and 2024.05.x.

OK. Looking at https://github.com/tukaani-project/xz/releases/tag/v5.4.7
I see a mention about a shared library regression on mips64, but I am
not sure where the mentioned patch can be found?

The 5.4.7 bugfixes do not look very critical, so we could alternatively
also just not bump the version on 2024.02.x / 2024.05.x.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
