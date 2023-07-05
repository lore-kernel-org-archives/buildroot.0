Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BBCEB64DA
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 18:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54B486108C;
	Wed,  5 Jul 2023 18:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54B486108C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iHZvubpf9K27; Wed,  5 Jul 2023 18:10:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A14BF61089;
	Wed,  5 Jul 2023 18:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A14BF61089
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF6E11BF5A8
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 18:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95B9882165
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 18:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95B9882165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7p-Iz0zOb8Md for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 18:10:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69A8F8211A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69A8F8211A
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 18:10:40 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68E8B240005
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 18:10:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qH6xY-002piX-Fn
 for buildroot@buildroot.org; Wed, 05 Jul 2023 20:10:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230705164616.671351-1-peter@korsgaard.com>
 <20230705164616.671351-3-peter@korsgaard.com>
Date: Wed, 05 Jul 2023 20:10:36 +0200
In-Reply-To: <20230705164616.671351-3-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 5 Jul 2023 18:46:16 +0200")
Message-ID: <87cz166xgj.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] board/raspberrypi: drop
 variant-specific genimage files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Now that we have a template generating an equivalent genimage configuration.
 > The generated genimage is identical to these +/- file ordering and a
 > trailing comma / newline that is ignored by genimage, E.G. for rpi3-64:

 > @@ -8,9 +8,10 @@
 >                         "rpi-firmware/cmdline.txt",
 >                         "rpi-firmware/config.txt",
 >                         "rpi-firmware/fixup.dat",
 > -                       "rpi-firmware/start.elf",
 >                         "rpi-firmware/overlays",
 > -                       "Image"
 > +                       "rpi-firmware/start.elf",
 > +                       "Image",
 > +
 >                 }

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  board/raspberrypi/genimage-raspberrypi.cfg    | 33 ------------------
 >  board/raspberrypi/genimage-raspberrypi0.cfg   | 32 -----------------
 >  board/raspberrypi/genimage-raspberrypi0w.cfg  | 32 -----------------
 >  board/raspberrypi/genimage-raspberrypi2.cfg   | 32 -----------------
 >  .../raspberrypi/genimage-raspberrypi3-64.cfg  | 34 -------------------
 >  board/raspberrypi/genimage-raspberrypi3.cfg   | 34 -------------------
 >  .../raspberrypi/genimage-raspberrypi4-64.cfg  | 31 -----------------
 >  board/raspberrypi/genimage-raspberrypi4.cfg   | 31 -----------------
 >  .../genimage-raspberrypicm4io-64.cfg          | 31 -----------------
 >  .../raspberrypi/genimage-raspberrypicm4io.cfg | 31 -----------------
 >  .../genimage-raspberrypizero2w.cfg            | 32 -----------------
 >  11 files changed, 353 deletions(-)
 >  delete mode 100644 board/raspberrypi/genimage-raspberrypi.cfg
 >  delete mode 100644 board/raspberrypi/genimage-raspberrypi0.cfg
 >  delete mode 100644 board/raspberrypi/genimage-raspberrypi0w.cfg
 >  delete mode 100644 board/raspberrypi/genimage-raspberrypi2.cfg
 >  delete mode 100644 board/raspberrypi/genimage-raspberrypi3-64.cfg
 >  delete mode 100644 board/raspberrypi/genimage-raspberrypi3.cfg
 >  delete mode 100644 board/raspberrypi/genimage-raspberrypi4-64.cfg
 >  delete mode 100644 board/raspberrypi/genimage-raspberrypi4.cfg
 >  delete mode 100644 board/raspberrypi/genimage-raspberrypicm4io-64.cfg
 >  delete mode 100644 board/raspberrypi/genimage-raspberrypicm4io.cfg
 >  delete mode 100644 board/raspberrypi/genimage-raspberrypizero2w.cfg

Ups, forgot to drop the now unused mkdir in post-build.sh from patch
1. Can be fixed while applying.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
