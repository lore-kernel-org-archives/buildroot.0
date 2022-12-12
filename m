Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74730C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 07:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DA4260C05;
	Mon, 12 Dec 2022 07:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DA4260C05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgIMgH9w1CtP; Mon, 12 Dec 2022 07:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4736B6080A;
	Mon, 12 Dec 2022 07:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4736B6080A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 644231BF288
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 07:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FE546080A
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 07:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FE546080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XxRgybm4tCC for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 07:30:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F3186059F
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F3186059F
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 07:30:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 307AF100004;
 Mon, 12 Dec 2022 07:30:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p4dGt-00Bsuz-CK; Mon, 12 Dec 2022 08:30:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Indrek Kruusa <indrek.kruusa@gmail.com>
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
 <20221211201704.25858-3-indrek.kruusa@gmail.com>
Date: Mon, 12 Dec 2022 08:30:43 +0100
In-Reply-To: <20221211201704.25858-3-indrek.kruusa@gmail.com> (Indrek Kruusa's
 message of "Sun, 11 Dec 2022 22:17:02 +0200")
Message-ID: <87tu21xen0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5]
 board/nezha/overlay/boot/extlinux/extlinux.conf: activate framebuffer
 console on HDMI
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Indrek" == Indrek Kruusa <indrek.kruusa@gmail.com> writes:

 > Replace serial console with the framebuffer console on HDMI.
 > Limit resolution to 1280x800 as the framebuffer is really slow.

 > Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>
 > ---
 >  board/nezha/overlay/boot/extlinux/extlinux.conf | 3 +--
 >  1 file changed, 1 insertion(+), 2 deletions(-)

 > diff --git a/board/nezha/overlay/boot/extlinux/extlinux.conf b/board/nezha/overlay/boot/extlinux/extlinux.conf
 > index 91b2298628..4bf66ee8c4 100644
 > --- a/board/nezha/overlay/boot/extlinux/extlinux.conf
 > +++ b/board/nezha/overlay/boot/extlinux/extlinux.conf
 > @@ -1,4 +1,3 @@
 >  label linux
 >    kernel /boot/Image
 > -  # use devicetree from u-boot
 > -  append console=ttyS0,115200 root=/dev/mmcblk0p1 ro rootwait
 > +  append console=tty0 video=HDMI-A-1:1280x800 root=/dev/mmcblk0p1 ro rootwait

Why? We generally use serial console in the defconfigs, or at least run
the console and a getty on both the serial port and the video output
like on raspberrypi.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
