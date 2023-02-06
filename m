Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7037C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 14:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C29360B00;
	Mon,  6 Feb 2023 14:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C29360B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prJlm4sjMBOm; Mon,  6 Feb 2023 14:37:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64ECD60B01;
	Mon,  6 Feb 2023 14:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64ECD60B01
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7231BF343
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 14:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 641FD60B01
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 14:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 641FD60B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7-edelS-Jya for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 14:37:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FC9960AFB
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FC9960AFB
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 14:37:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 89A87100006;
 Mon,  6 Feb 2023 14:37:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pP2cp-00Dw4a-Ds; Mon, 06 Feb 2023 15:37:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <VI1P190MB0493F15E5CA3D6BC8CCD52029FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <20230114230028.46833cae@windsurf>
Date: Mon, 06 Feb 2023 15:37:43 +0100
In-Reply-To: <20230114230028.46833cae@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 14 Jan 2023 23:00:28 +0100")
Message-ID: <87sffi97wo.fsf@dell.be.48ers.dk>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

Hi,

 >> It contains libraries and headers for GLES, OpenCL, and
 >> -	  OpenVG. It also contains a DRI plugin for X11. It also
 >> -	  contains a plugin for DirectFB-1.4.0, but that doesn't work
 >> +	  OpenVG. It also contains a plugin for DirectFB-1.4.0,
 >> +	  but that doesn't work
 >> together with buildroot's DirectFB version.

 > This paragraph should have been rewrapped after your change.

 > Other than that, looks good so I've applied. Of course, it might be
 > surprising for people who might be using X11 with OpenGL support on
 > i.MX platforms... but we're simply following the choice made by
 > upstream.

I see we still have xf86-video-imx-viv which depends on the now removed
BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 symbol, so I guess we should remove
that package as well.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
