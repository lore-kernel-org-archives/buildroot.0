Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADC2C6FA8E
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 10:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D59F60FA4;
	Sun,  5 Mar 2023 10:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D59F60FA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnCft71Y6wf5; Sun,  5 Mar 2023 10:26:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A60760C30;
	Sun,  5 Mar 2023 10:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A60760C30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 550F81BF35F
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 10:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DE5960C30
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 10:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DE5960C30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zUZxNwUE7Wwg for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 10:26:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFE1660BEB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFE1660BEB
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 10:26:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6838D1BF208;
 Sun,  5 Mar 2023 10:26:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYlZ8-001OGw-9o; Sun, 05 Mar 2023 11:26:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230220100309.116832-1-fontaine.fabrice@gmail.com>
Date: Sun, 05 Mar 2023 11:26:06 +0100
In-Reply-To: <20230220100309.116832-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 20 Feb 2023 11:03:09 +0100")
Message-ID: <871qm3bikh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
 require FileHandle perl package for syslinux
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > syslinux needs FileHandle module:
 > Can't locate FileHandle.pm in @INC (you may need to install the
 > FileHandle module) (@INC contains:
 > /home/buildroot/autobuild/instance-0/output-1/host/lib/perl
 > /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36
 > /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl
 > /usr/lib64/perl5 /usr/share/perl5) at
 > /home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/makeerrlist.pl
 > line 8.
 > BEGIN failed--compilation aborted at
 > /home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/makeerrlist.pl
 > line 8.
 > /home/buildroot/autobuild/instance-0/output-1/host/bin/i586-buildroot-linux-gnu-gcc
 > -Wp,-MT,errlist.o,-MD,./.errlist.o.d -Os -march=i386
 > -falign-functions=0 -falign-jumps=0 -falign-labels=0 -ffast-math
 > -fomit-frame-pointer -std=gnu99 -m32 -mpreferred-stack-boundary=2
 > -fno-stack-protector -fwrapv -freg-struct-return -fPIC -fno-exceptions
 > -fno-asynchronous-unwind-tables -fno-strict-aliasing
 > -falign-functions=0 -falign-jumps=0 -falign-labels=0 -falign-loops=0
 > -g -D__COM32__ -D__FIRMWARE_BIOS__ -nostdinc -iwithprefix include
 > -I. -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/sys
 > -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/../include
 > -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/include/sys
 > -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/core/include
 > -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/
 > -I/home/buildroot/autobuild/instance-0/output-1/bu
 >  ild/syslinux-6.03/com32/lib/sys/module
 > -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/bios/com32/lib//../.. -W
 > -Wall -Wstrict-prototypes -Wpointer-arith -Wwrite-strings
 > -Wstrict-prototypes -Winline -DDYNAMIC_CRC_TABLE -DPNG_NO_CONSOLE_IO
 > -DPNG_NO_WRITE_SUPPORTED -DPNG_NO_MNG_FEATURES -DPNG_NO_READ_tIME
 > -DPNG_NO_WRITE_tIME -mregparm=3 -DREGPARM=3 -c -o errlist.o errlist.c
 > cc1: fatal error: errlist.c: No such file or directory

 > Fixes:
 >  - http://autobuild.buildroot.org/results/de88089888b2ca354b28af3550abf846560da7d5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
