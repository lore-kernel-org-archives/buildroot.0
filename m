Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F63C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 21:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61D026061D;
	Wed,  7 Aug 2024 21:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZndZ-iqo8m1; Wed,  7 Aug 2024 21:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D924606E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D924606E8;
	Wed,  7 Aug 2024 21:14:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC8CA1BF2CA
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA11A40338
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AViWpAimFNem for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 21:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77EC3400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77EC3400D1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77EC3400D1
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 21:14:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96F6E60004;
 Wed,  7 Aug 2024 21:14:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbnz9-003NqI-33;
 Wed, 07 Aug 2024 23:14:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240703193329.6627-1-christian@aperture.us>
 <20240712231000.4da034a8@windsurf>
Date: Wed, 07 Aug 2024 23:14:19 +0200
In-Reply-To: <20240712231000.4da034a8@windsurf> (Thomas Petazzoni via
 buildroot's message of "Fri, 12 Jul 2024 23:10:00 +0200")
Message-ID: <87mslom3x0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump version to
 go1.22.5
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
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Wed,  3 Jul 2024 12:33:29 -0700
 > Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

 >> Fixes CVE:
 >> 
 >> CVE-2024-24791: net/http: denial of service due to improper 100-continue handling
 >> 
 >> https://go.dev/doc/devel/release#go1.22.5
 >> 
 >> Signed-off-by: Christian Stewart <christian@aperture.us>
 >> ---
 >> package/go/go-src/go-src.hash | 2 +-
 >> package/go/go.mk              | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)

 > Applied to master, thanks.

Committed to 2024.05.x, thanks. For 204.02.x I will instead bump to
1.21.12.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
