Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E964C433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 19:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4BF382951;
	Fri,  6 May 2022 19:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igV0smKg18Ep; Fri,  6 May 2022 19:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7EFB82923;
	Fri,  6 May 2022 19:12:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 318D41BF3A9
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 19:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 201DE82923
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 19:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkFiZw0h_6K7 for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 19:12:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8F1E826C8
 for <buildroot@buildroot.org>; Fri,  6 May 2022 19:12:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BBABC1C0007;
 Fri,  6 May 2022 19:12:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nn3N7-00HK14-Or; Fri, 06 May 2022 21:12:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20220505125443.1365892-1-neal.frager@amd.com>
Date: Fri, 06 May 2022 21:12:13 +0200
In-Reply-To: <20220505125443.1365892-1-neal.frager@amd.com> (Neal Frager's
 message of "Thu, 5 May 2022 06:54:43 -0600")
Message-ID: <87y1zezd9u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynqmp_zcu106_defconfig:
 uboot dp pll patch
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch fixes the DP audio and video PLL configurations for the
 > zynqmp-zcu106-revA evaluation board.

 > The Linux DP driver expects the DP to be using the following PLL config:
 >   - DP video PLL should use the VPLL (0x0)
 >   - DP audio PLL should use the RPLL (0x3)

 > Register 0xFD1A0070 configures the DP video PLL.
 > Register 0xFD1A0074 configures the DP audio PLL.

 > This patch was build and run tested on a zynqmp-zcu106-revA target board.

 > Upstream-Status: submitted (https://lore.kernel.org/all/62538b4a04dee28a6fc8ac5b85f8c845a5a76aa4.1651740988.git.michal.simek@amd.com/)
 > This patch will be removed from buildroot in a future release when no longer necessary.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 > V1-> V2:
 >   - added uboot upstream status and tracking link

Committed, thanks. What about the zcu102?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
