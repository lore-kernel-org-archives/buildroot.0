Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1525C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 14:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B33F983083;
	Sat, 15 Jun 2024 14:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6LMFPluBm_t; Sat, 15 Jun 2024 14:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C46282F19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C46282F19;
	Sat, 15 Jun 2024 14:59:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 152481BF2C3
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8EE880C67
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDSjO9JwchCv for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 14:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8DFF82F19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8DFF82F19
 for <buildroot@uclibc.org>; Sat, 15 Jun 2024 14:59:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id AB13B87BF7; Sat, 15 Jun 2024 14:59:12 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 15 Jun 2024 14:59:12 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.05
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: yann.morin.1998@free.fr
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone resolution attachments.created
Message-ID: <bug-14006-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14006] New: op-tee not start on imx8mm_evk
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

https://bugs.busybox.net/show_bug.cgi?id=14006

            Bug ID: 14006
           Summary: op-tee not start on imx8mm_evk
           Product: buildroot
           Version: 2021.05
          Hardware: Other
                OS: Other
            Status: RESOLVED
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: v9sd@yandex.ru
                CC: buildroot@uclibc.org, yann.morin.1998@free.fr
  Target Milestone: ---
                CC: yann.morin.1998@free.fr
        Resolution: MOVED
            Status: RESOLVED

Hello!
I have a problem with op-tee start on imx8mm_evk
(https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/evaluation-kit-for-the-i-mx-8m-mini-applications-processor:8MMINILPD4-EVK).

My .config file is attached.


I write output/images/sdcard.img on sdcadr, connect terminal emultaion with
serial port and start imx8.

After below output imx8mm_evk is output nothing.
U-Boot SPL 2020.04 (Jul 12 2021 - 16:19:50 +0300)
Can't find PMIC:PCA9450
DDRINFO: start DRAM init
DDRINFO: DRAM rate 3000MTS
DDRINFO:ddrphy calibration done
DDRINFO: ddrmix config done
Normal Boot
Trying to boot from MMC1
NOTICE:  BL31: v2.4(release):2021.05-393-gb928074e2d
NOTICE:  BL31: Built : 16:16:43, Jul 12 2021


Problem arises after jump execution on op-tee entry point address (0xbe000000)


After reaching the above address breakpoint, we have content in memory: 

(gdb) x/10i $pc
=> [34m0xbe000000[m <[33m_start[m>:     .inst   0x00150000 ; undefined
   [34m0xbe000004[m <[33m_start[m+4>:   .inst   0x00000000 ; undefined
   [34m0xbe000008[m <[33m_start[m+8>:   .inst   0x00000000 ; undefined
   [34m0xbe00000c[m <[33m_start[m+12>:  .inst   0x00000000 ; undefined
   [34m0xbe000010[m <[33m_start[m+16>:  .inst   0x00000000 ; undefined
   [34m0xbe000014[m <[33m_start[m+20>:  .inst   0x00000000 ; undefined
   [34m0xbe000018[m <[33m_start[m+24>:  .inst   0x00000000 ; undefined
   [34m0xbe00001c[m <[33m_start[m+28>:  .inst   0x00000000 ; undefined
   [34m0xbe000020[m <[33m_start[m+32>:  .inst   0x00000000 ; undefined
   [34m0xbe000024[m <[33m_start[m+36>:  .inst   0x00400000 ; undefined

As we look, it is not valid instructions opcode.

After continue execution, imx8 freezes.

Guess that the op-tee was not load in memory in uboot-spl.

--- Comment #1 from v9sd@yandex.ru ---
Created attachment 9061
  --> https://bugs.busybox.net/attachment.cgi?id=9061&action=edit
My config (without comments and empty lines)

--- Comment #2 from v9sd@yandex.ru ---
*** Bug 14001 has been marked as a duplicate of this bug. ***

--- Comment #3 from v9sd@yandex.ru ---
*** Bug 14011 has been marked as a duplicate of this bug. ***

--- Comment #4 from v9sd@yandex.ru ---
*** Bug 14016 has been marked as a duplicate of this bug. ***

--- Comment #5 from v9sd@yandex.ru ---
*** Bug 14021 has been marked as a duplicate of this bug. ***

--- Comment #6 from v9sd@yandex.ru ---
Data from  op-tee entry point address without service info:
(gdb) x/10i $pc
=> 0xbe000000 <_start>:     .inst   0x00150000 ; undefined
   0xbe000004 <_start+4>:   .inst   0x00000000 ; undefined
   0xbe000008 <_start+8>:   .inst   0x00000000 ; undefined
   0xbe00000c <_start+12>:  .inst   0x00000000 ; undefined
   0xbe000010 <_start+16>:  .inst   0x00000000 ; undefined
   0xbe000014 <_start+20>:  .inst   0x00000000 ; undefined
   0xbe000018 <_start+24>:  .inst   0x00000000 ; undefined
   0xbe00001c <_start+28>:  .inst   0x00000000 ; undefined
   0xbe000020 <_start+32>:  .inst   0x00000000 ; undefined
   0xbe000024 <_start+36>:  .inst   0x00400000 ; undefined

--- Comment #7 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Thank you for your report.

The issue tracker for the Buildroot project has been moved to
the Gitlab.com issue tracker:
    https://gitlab.com/buildroot.org/buildroot/-/issues

We are taking this opportunity to close old issues in this old
tracker. If you believe your issue is still relevant, please
open one in the new issue tracker.

Thank you!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
