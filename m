Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232E5C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B576B81E11;
	Sun,  5 Mar 2023 17:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B576B81E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aIte7j-5RsZz; Sun,  5 Mar 2023 17:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 231D381E03;
	Sun,  5 Mar 2023 17:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 231D381E03
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 476301BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 213F760DFE
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 213F760DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXcZqBOD_cU2 for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:22:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0080560BE0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0080560BE0
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:22:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3976E100002;
 Sun,  5 Mar 2023 17:22:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYs3m-001csB-Bi; Sun, 05 Mar 2023 18:22:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230222103242.755918-1-fontaine.fabrice@gmail.com>
Date: Sun, 05 Mar 2023 18:22:10 +0100
In-Reply-To: <20230222103242.755918-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 22 Feb 2023 11:32:42 +0100")
Message-ID: <87wn3v8665.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] boot/at91dataflashboot: disable
 stack-protector
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

 > Disable stack-protector to avoid the following build failure:
 > /home/buildroot/autobuild/instance-1/output-1/host/bin/arm-buildroot-linux-gnueabi-ld
 > -T elf32-littlearm.lds -Ttext 0 -n -o DataflashBoot-1.05.out
 > objs/cstartup_ram.o objs/at45.o objs/com.o objs/dataflash.o
 > objs/div0.o objs/init.o objs/main.o objs/stdio.o objs/asm_isr.o
 > objs/jump.o objs/_udivsi3.o objs/_umodsi3.o objs/led.o
 > /home/buildroot/autobuild/instance-1/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: objs/main.o: in function `main':
 > main.c:(.text.startup+0x834): undefined reference to `__stack_chk_guard'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/502c54be4978e628724d72ee2a75d4c5e0a6ace8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
