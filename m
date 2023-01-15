Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD73C3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 20:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B134408EE;
	Sun, 15 Jan 2023 20:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B134408EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HpTumL_O13Vc; Sun, 15 Jan 2023 20:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E2DD408E3;
	Sun, 15 Jan 2023 20:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E2DD408E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B8AC1BF25F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 20:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 534AE40917
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 20:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 534AE40917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUVn_D2-PfOx for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 20:10:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 694E8400EF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 694E8400EF
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 20:10:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 212E820004;
 Sun, 15 Jan 2023 20:10:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pH9KL-005iYa-Dl; Sun, 15 Jan 2023 21:10:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20221222063710.4324-1-neal.frager@amd.com>
Date: Sun, 15 Jan 2023 21:10:01 +0100
In-Reply-To: <20221222063710.4324-1-neal.frager@amd.com> (Neal Frager's
 message of "Thu, 22 Dec 2022 06:37:10 +0000")
Message-ID: <87tu0r5zl2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynqmp_kria_kv260_defconfig:
 use CONFIG_MULTI_DTB_FIT
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
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > When using the buildroot compiler, it builds the u-boot.itb immediately
 > after building the fit-dtb.blob.  This causes a build failure when using
 > the CONFIG_MULTI_DTB_FIT build configuration.  This patch adds the necessary
 > dependency to guarantee that the fit-dtb.blob has finished building before
 > trying to build the u-boot.itb.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281

 > This patch has been submitted to u-boot mainline:
 > https://lore.kernel.org/all/20221221075446.47141-1-neal.frager@amd.com/

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
