Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509FCC433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFDAA6164D;
	Fri, 27 May 2022 09:31:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dpUDLP0zmklE; Fri, 27 May 2022 09:31:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 035CC61644;
	Fri, 27 May 2022 09:31:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 837C21BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71E6A40573
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VkrR1r1LEFu3 for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:31:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 700454056C
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:31:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8E75CC0008;
 Fri, 27 May 2022 09:31:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuWJG-001laj-6I; Fri, 27 May 2022 11:31:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220426203036.2446167-1-fontaine.fabrice@gmail.com>
Date: Fri, 27 May 2022 11:31:06 +0200
In-Reply-To: <20220426203036.2446167-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 26 Apr 2022 22:30:36 +0200")
Message-ID: <878rqnl3tx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openobex: fix static with
 libusb and libatomic
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Force LibUSB_VERSION_1.0 to ON to fix the following static build failure
 > with libusb and libatomic:

 > -- Looking for libusb_get_device_list in /nvmedata/autobuild/instance-4/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.a
 > -- Looking for libusb_get_device_list in /nvmedata/autobuild/instance-4/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.a - not found

 > [...]

 > /nvmedata/autobuild/instance-4/output-1/build/openobex-1.7.2/lib/transport/usbobex.h:30:10: fatal error: usb.h: No such file or directory
 >    30 | #include <usb.h>
 >       |          ^~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/52b0edc4278f65fb4a9671b65c655cc4544a3103

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
