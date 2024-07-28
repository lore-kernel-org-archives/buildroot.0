Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B883C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 10:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 635B18123E;
	Sun, 28 Jul 2024 10:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3pKQieTu_FZ; Sun, 28 Jul 2024 10:16:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C81481240
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C81481240;
	Sun, 28 Jul 2024 10:16:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3593C1BF5F5
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FF1140136
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFXIjcAj1-mw for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 10:16:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2CB94011A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2CB94011A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2CB94011A
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 10:16:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E5ABE0002;
 Sun, 28 Jul 2024 10:16:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sY0wt-0028G9-1i;
 Sun, 28 Jul 2024 12:16:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240611165539.658551-1-jarkko@kernel.org>
 <20240712002813.1a9e7f2a@windsurf>
Date: Sun, 28 Jul 2024 12:16:19 +0200
In-Reply-To: <20240712002813.1a9e7f2a@windsurf> (Thomas Petazzoni via
 buildroot's message of "Fri, 12 Jul 2024 00:28:13 +0200")
Message-ID: <878qxlx1n0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/systemd: Add BCACHEFS superblock
 magic
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Jarkko Sakkinen <jarkko@kernel.org>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Jarkko,
 > On Tue, 11 Jun 2024 19:55:39 +0300
 > Jarkko Sakkinen <jarkko@kernel.org> wrote:

 >> Add the magic number for the bcachefs superblock. Otherwise, systemd
 >> 254.13 fails to compile with the latest kernel versions.
 >> 
 >> Upstream commit ID:  201148b08de6 ("basic: Add BCACHEFS magic")
 >> 
 >> Cc: Norbert Lange <nolange79@gmail.com>
 >> Cc: Sen Hastings <sen@hastings.org>
 >> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 >> Link: https://social.kernel.org/notice/Aie4Z8s4zYztoFTWUq
 >> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

 > Thanks for the patch, which I have applied, after fixing a few things,
 > see below.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
