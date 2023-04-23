Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14246C77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 09:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D1C84043D;
	Sun, 23 Apr 2023 09:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D1C84043D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QtppIha-r9Tw; Sun, 23 Apr 2023 09:59:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DD8E40448;
	Sun, 23 Apr 2023 09:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DD8E40448
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77EC41BF369
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A82581F6B
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A82581F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bO5NwkgNLVI3 for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 09:59:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DA0981F68
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DA0981F68
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 09:58:58 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id A05F1440069;
 Sun, 23 Apr 2023 12:53:26 +0300 (IDT)
References: <20230411203930.2455301-1-dario.binacchi@amarulasolutions.com>
 <87fs8r6iqo.fsf@dell.be.48ers.dk>
User-agent: mu4e 1.9.21; emacs 28.2
To: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Apr 2023 12:57:17 +0300
In-reply-to: <87fs8r6iqo.fsf@dell.be.48ers.dk>
Message-ID: <87ildmdin4.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1682243606;
 bh=5YT38ibHPtJn4ShVRbnVbxaWKBmtbZ74aVCF17kLEaw=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=JmglGH/LPyC2xq0wGkFP1iTT3vly6N0WhqHH8es4h087wDiCs0VQ0K98cjefeMB55
 bYrG7ty6iwJaxnie6XYnDZZevgnZfnV5SxUovKUiBH8KDLql+/0QObKCYcyOsJpX0N
 4lFXpeZ8VPckwHQXD2K9scIIoKEZrbSLvZ/cPx3omMBFT0XEtTLMAmnf+BR2Ae+A4y
 9/WzoWetMUDzTPa4i5x7KB+Chkm3nWW9pJ3i8xW1A1BOQ2C+Bc3kDfjcqsbRn/N+mD
 KL/T207IpcJbDqfPZ4NmZlOFFIDra7a7xZ0htw4XaXMuFGRb9Lk2LbNiYqM0cAQshl
 DbTmibFI3ozYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=JmglGH/L
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Sun, Apr 23 2023, Peter Korsgaard wrote:
>>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:
>
>  > As reported by [1], version 0.12.0 fixes these errors:
>  > Error executing event examine-end on target stm32f7x.cpu:
>  > buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl:37: Error: wrong # args: should be "expr expression"
>  > in procedure 'mmw' called at file "buildroot/output/host/bin/../share/openocd/scripts/target/stm32f7x.cfg", line 103
>  > at file "buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl", line 37
>  > Info : starting gdb server for stm32f7x.cpu on 3333
>  > Info : Listening on port 3333 for gdb connections
>  > Info : Unable to match requested speed 2000 kHz, using 1800 kHz
>  > Info : Unable to match requested speed 2000 kHz, using 1800 kHz
>  > Error executing event examine-end on target stm32f7x.cpu:
>  > buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl:37: Error: wrong # args: should be "expr expression"
>  > in procedure 'ocd_process_reset'
>  > in procedure 'ocd_process_reset_inner' called at file "embedded:startup.tcl", line 288
>  > in procedure 'mmw' called at file "buildroot/output/host/bin/../share/openocd/scripts/target/stm32f7x.cfg", line 103
>  > at file "buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl", line 37
>  > target halted due to debug-request, current mode: Thread
>  > xPSR: 0x01000000 pc: 0x080003fc msp: 0x20050000
>  > Error executing event reset-init on target stm32f7x.cpu:
>  > buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl:37: Error: wrong # args: should be "expr expression"
>  > in procedure 'ocd_process_reset'
>  > in procedure 'ocd_process_reset_inner' called at file "embedded:startup.tcl", line 288
>  > in procedure 'mmw' called at file
>  > "buildroot/output/host/bin/../share/openocd/scripts/board/stm32f769i-disco.cfg",
>  > line 71
>  > at file "buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl", line 37
>
>  > Remove upstream patches.
>
>  > The new version moves the GPL-2.0 license from COPYING to the subfolder
>  > "preferred", adding the header required by spdxcheck.py. A minimalist
>  > COPYING is added in the top directory, as required by automake, pointing
>  > to the files in LICENSES.
>
>  > [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1014849
>  > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
>  > ---
>
>  > Changes in v2:
>  > - Explain in the commit message why the license hash changed.
>  > - Add all license files and updates their tags and hashes accordingly.
>
>
> Committed to 2023.02.x given the fixes, thanks.

Not in current 2023.02.x branch as of commit cec14f3328bd7
("package/mali-driver: bump to version 2023-04-04").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
