Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C94C636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 16:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95C5840498;
	Mon,  6 Feb 2023 16:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95C5840498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F5s_gs00452v; Mon,  6 Feb 2023 16:09:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6BF440491;
	Mon,  6 Feb 2023 16:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6BF440491
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 809EC1BF33A
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F78741511
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F78741511
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XZCS5UDxRTKK for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 16:09:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27B1B4150F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27B1B4150F
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 16:09:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7438840010;
 Mon,  6 Feb 2023 16:09:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pP43P-00DyXe-Dw; Mon, 06 Feb 2023 17:09:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <VI1P190MB0493F15E5CA3D6BC8CCD52029FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <20230114230028.46833cae@windsurf> <87sffi97wo.fsf@dell.be.48ers.dk>
 <20230206155650.79bafe2c@windsurf>
Date: Mon, 06 Feb 2023 17:09:15 +0100
In-Reply-To: <20230206155650.79bafe2c@windsurf> (Thomas Petazzoni's message of
 "Mon, 6 Feb 2023 15:56:50 +0100")
Message-ID: <87bkm693o4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/freescale-imx/imx-gpu-viv: drop
 X11 output
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
Cc: Lang Daniel <d.lang@abatec.at>, Gary Bisson <bisson.gary@gmail.com>,
 "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Mon, 06 Feb 2023 15:37:43 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> I see we still have xf86-video-imx-viv which depends on the now removed
 >> BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 symbol, so I guess we should remove
 >> that package as well.

 > Gah, I did not notice that: indeed it should be removed as well.

 > Daniel, will you cook some patch doing that?

I've already pushed a commit dropping the package.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
