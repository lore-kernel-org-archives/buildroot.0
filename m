Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F9DC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 21:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48532402F2;
	Sun,  4 Feb 2024 21:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48532402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-R3Wn0IANUS; Sun,  4 Feb 2024 21:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48C5140420;
	Sun,  4 Feb 2024 21:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48C5140420
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BD101BF407
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04FDA60B51
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04FDA60B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRx9SYtGA3kv for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 21:25:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0922B60AD8
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 21:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0922B60AD8
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF6DDFF804;
 Sun,  4 Feb 2024 21:25:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWjzF-00A4UJ-2i;
 Sun, 04 Feb 2024 22:25:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230921164809.102741-1-fontaine.fabrice@gmail.com>
 <Za_jnMEzxoboGoJA@landeda>
Date: Sun, 04 Feb 2024 22:25:13 +0100
In-Reply-To: <Za_jnMEzxoboGoJA@landeda> (Yann E. MORIN's message of "Tue, 23
 Jan 2024 17:04:44 +0100")
Message-ID: <87a5ofx6py.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/vulkan-loader: fix x11 handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fabrice, All,
 > On 2023-09-21 18:48 +0200, Fabrice Fontaine spake thusly:
 >> Fix the following build failure raised since the addition of the package
 >> in commit 6aa1bc31678ff9f8013084fda34b9f941cc63fc3:
 >> 
 >> In file included from /home/buildroot/autobuild/run/instance-3/output-1/build/vulkan-loader-1.3.262/loader/extension_manual.h:24,
 >> from /home/buildroot/autobuild/run/instance-3/output-1/build/vulkan-loader-1.3.262/loader/extension_manual.c:23:
 >> /home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/vulkan/vulkan.h:71:10: fatal error: X11/extensions/Xrandr.h: No such file or directory
 >> 71 | #include <X11/extensions/Xrandr.h>
 >> |          ^~~~~~~~~~~~~~~~~~~~~~~~~
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/55ddfd44393e3bcc2f25bad2f9ecb7e1b142a985
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Applied to master, thanks.

 > Your commits always contain the description of the failure (which is
 > mildly interesting), but often lacks the actual reason for the change.

 > In this case, it would have been interesting to state that xcb and xlib
 > support are orthogonal, but that for xlib, xrandr is also required, as
 > Adam noticed in his commit log [0].

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
