Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C54C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 07:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 456F7405A8;
	Mon, 21 Mar 2022 07:23:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBoXLlvnbwXP; Mon, 21 Mar 2022 07:23:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 393C440133;
	Mon, 21 Mar 2022 07:23:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4C11BF316
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AA6D401E7
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:23:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sdtcTI1iwbEG for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 07:23:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4031A401CC
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 07:23:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A40C2FF804;
 Mon, 21 Mar 2022 07:23:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nWCNi-00FWsi-P9; Mon, 21 Mar 2022 08:23:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220316213614.16878-1-ps.report@gmx.net>
 <20220316221046.GD283544@scaer>
Date: Mon, 21 Mar 2022 08:23:10 +0100
In-Reply-To: <20220316221046.GD283544@scaer> (Yann E. MORIN's message of "Wed, 
 16 Mar 2022 23:10:46 +0100")
Message-ID: <87tubrkbvl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 00/12] package/gstreamer1/*: bump version
 to 1.20.1
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2022-03-16 22:36 +0100, Peter Seiderer spake thusly:
 >> For details see [1] and [2].
 >> 
 >> [1] https://lists.freedesktop.org/archives/gstreamer-devel/2022-March/079724.html
 >> [2] https://gstreamer.freedesktop.org/releases/1.20/#1.20.1
 >> 
 >> Peter Seiderer (12):
 >> package/gstreamer1: bump version to 1.20.1
 >> package/gst1-plugins-base: bump version to 1.20.1
 >> package/gst1-plugins-good: bump version to 1.20.1
 >> package/gst1-plugins-bad: bump version to 1.20.1
 >> package/gst1-plugins-ugly: bump version to 1.20.1
 >> package/gst1-devtools: bump version to 1.20.1
 >> package/gst1-libav: bump version to 1.20.1
 >> package/gst1-vaapi: bump version to 1.20.1
 >> package/gst1-rtsp-server: bump version to 1.20.1
 >> package/gstreamer1-editing-services: bump version to 1.20.1
 >> package/gst-omx: bump version to 1.20.1
 >> package/gst1-python: bump version to 1.20.1

 > Whole series applied to master, thanks.

And to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
