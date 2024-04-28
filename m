Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805A5C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 15:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E6C1400D7;
	Sun, 28 Apr 2024 15:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WkQg40Zftx4H; Sun, 28 Apr 2024 15:08:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3731740147
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3731740147;
	Sun, 28 Apr 2024 15:08:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD31A1BF57F
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 15:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA161605C9
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 15:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yGxhS7pfUS00 for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 15:08:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EB25605C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EB25605C2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EB25605C2
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 15:08:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B77240005;
 Sun, 28 Apr 2024 15:08:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s168p-004l3L-1N;
 Sun, 28 Apr 2024 17:08:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240331074614.17359-1-christian@aperture.us>
 <ZgqmyhHKY0_FZYlA@landeda>
Date: Sun, 28 Apr 2024 17:08:35 +0200
In-Reply-To: <ZgqmyhHKY0_FZYlA@landeda> (Yann E. MORIN's message of "Mon, 1
 Apr 2024 14:21:30 +0200")
Message-ID: <87jzkhcyoc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/2] package/docker-engine: security bump
 to version v26.0.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Stefan Agner <stefan@agner.ch>, Christian Stewart <christian@aperture.us>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Christian, All,
 > On 2024-03-31 00:46 -0700, Christian Stewart via buildroot spake thusly:
 >> Update to the latest major release of docker-engine.
 >> 
 >> Fixes CVE-2024-29018: potential data exfiltration from 'internal' networks via authoritative DNS servers.
 >> Do not forward requests to external DNS servers for a container that is only connected to an 'internal' network.

 > Please wrap your commit logs to the "standard" ~72 chars width.

 >> https://github.com/moby/moby/releases/tag/v26.0.0
 >> 
 >> Signed-off-by: Christian Stewart <christian@aperture.us>

 > Applied to master, thanks.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
