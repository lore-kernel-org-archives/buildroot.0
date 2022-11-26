Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D09C4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37F2781422;
	Sat, 26 Nov 2022 18:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37F2781422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJ0sCQpEcTcH; Sat, 26 Nov 2022 18:19:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B2EB8141B;
	Sat, 26 Nov 2022 18:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B2EB8141B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5E4C1BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A864140919
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A864140919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1l38BIECDMHY for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:19:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FA3D408ED
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FA3D408ED
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:19:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 11BBBE0003;
 Sat, 26 Nov 2022 18:19:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oyzlh-0001pY-11; Sat, 26 Nov 2022 19:19:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221116212105.702408-1-thomas.petazzoni@bootlin.com>
 <20221116212105.702408-2-thomas.petazzoni@bootlin.com>
Date: Sat, 26 Nov 2022 19:19:13 +0100
In-Reply-To: <20221116212105.702408-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Wed, 16 Nov 2022 22:21:05
 +0100")
Message-ID: <87lenxfuji.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] utils/genrandconfig: don't build
 igh-ethercat drivers
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > igh-ethercat comes with a small number of patched Linux kernel network
 > drivers, which aim at replacing the ones available in upstream Linux
 > kernel. All those drivers are provided only for specific kernel
 > releases. For example:

 > r8169-2.6.24-ethercat.c
 > r8169-2.6.24-orig.c
 > r8169-2.6.27-ethercat.c
 > r8169-2.6.27-orig.c
 > r8169-2.6.28-ethercat.c
 > r8169-2.6.28-orig.c
 > r8169-2.6.29-ethercat.c
 > r8169-2.6.29-orig.c
 > r8169-2.6.31-ethercat.c
 > r8169-2.6.31-orig.c
 > r8169-2.6.32-ethercat.c
 > r8169-2.6.32-orig.c
 > r8169-2.6.33-ethercat.c
 > r8169-2.6.33-orig.c
 > r8169-2.6.35-ethercat.c
 > r8169-2.6.35-orig.c
 > r8169-2.6.36-ethercat.c
 > r8169-2.6.36-orig.c
 > r8169-2.6.37-ethercat.c
 > r8169-2.6.37-orig.c
 > r8169-3.10-ethercat.c
 > r8169-3.10-orig.c
 > r8169-3.12-ethercat.c
 > r8169-3.12-orig.c
 > r8169-3.14-ethercat.c
 > r8169-3.14-orig.c
 > r8169-3.16-ethercat.c
 > r8169-3.16-orig.c
 > r8169-3.2-ethercat.c
 > r8169-3.2-orig.c
 > r8169-3.4-ethercat.c
 > r8169-3.4-orig.c
 > r8169-3.6-ethercat.c
 > r8169-3.6-orig.c
 > r8169-3.8-ethercat.c
 > r8169-3.8-orig.c
 > r8169-4.4-ethercat.c
 > r8169-4.4-orig.c

 > Obviously, this doesn't play well with the random configuration
 > testing done by utils/genrandconfig. This commit avoids this issue by
 > making sure we never build any of those drivers as part of the
 > genrandconfig generated configurations.

 > Fixes:

 >   http://autobuild.buildroot.net/results/07b7475d780c067d99ee5618a5fd2bb024a5b4e7/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
