Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8D2C77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 09:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22FEC4175F;
	Sun, 23 Apr 2023 09:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22FEC4175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nVyLdvpkqaqo; Sun, 23 Apr 2023 09:38:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C053741765;
	Sun, 23 Apr 2023 09:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C053741765
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C30F1BF369
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE90B40443
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE90B40443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8RL5fpcEPoPc for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 09:38:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74061400D9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74061400D9
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 09:38:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6ABDB1C0002;
 Sun, 23 Apr 2023 09:38:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pqWB5-002ZLk-Df; Sun, 23 Apr 2023 11:38:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20230411203930.2455301-1-dario.binacchi@amarulasolutions.com>
Date: Sun, 23 Apr 2023 11:38:39 +0200
In-Reply-To: <20230411203930.2455301-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Tue, 11 Apr 2023 22:39:30 +0200")
Message-ID: <87fs8r6iqo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/openocd: bump to 0.12.0
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

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > As reported by [1], version 0.12.0 fixes these errors:
 > Error executing event examine-end on target stm32f7x.cpu:
 > buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl:37: Error: wrong # args: should be "expr expression"
 > in procedure 'mmw' called at file "buildroot/output/host/bin/../share/openocd/scripts/target/stm32f7x.cfg", line 103
 > at file "buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl", line 37
 > Info : starting gdb server for stm32f7x.cpu on 3333
 > Info : Listening on port 3333 for gdb connections
 > Info : Unable to match requested speed 2000 kHz, using 1800 kHz
 > Info : Unable to match requested speed 2000 kHz, using 1800 kHz
 > Error executing event examine-end on target stm32f7x.cpu:
 > buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl:37: Error: wrong # args: should be "expr expression"
 > in procedure 'ocd_process_reset'
 > in procedure 'ocd_process_reset_inner' called at file "embedded:startup.tcl", line 288
 > in procedure 'mmw' called at file "buildroot/output/host/bin/../share/openocd/scripts/target/stm32f7x.cfg", line 103
 > at file "buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl", line 37
 > target halted due to debug-request, current mode: Thread
 > xPSR: 0x01000000 pc: 0x080003fc msp: 0x20050000
 > Error executing event reset-init on target stm32f7x.cpu:
 > buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl:37: Error: wrong # args: should be "expr expression"
 > in procedure 'ocd_process_reset'
 > in procedure 'ocd_process_reset_inner' called at file "embedded:startup.tcl", line 288
 > in procedure 'mmw' called at file "buildroot/output/host/bin/../share/openocd/scripts/board/stm32f769i-disco.cfg", line 71
 > at file "buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl", line 37

 > Remove upstream patches.

 > The new version moves the GPL-2.0 license from COPYING to the subfolder
 > "preferred", adding the header required by spdxcheck.py. A minimalist
 > COPYING is added in the top directory, as required by automake, pointing
 > to the files in LICENSES.

 > [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1014849
 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 > ---

 > Changes in v2:
 > - Explain in the commit message why the license hash changed.
 > - Add all license files and updates their tags and hashes accordingly.


Committed to 2023.02.x given the fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
