Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18657C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 13:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E07560BA8;
	Thu, 10 Feb 2022 13:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1eMnb0WBkXRG; Thu, 10 Feb 2022 13:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBEE760B68;
	Thu, 10 Feb 2022 13:47:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0961E1BF356
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 13:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04B9560B68
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 13:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0VHssYuiDoOI for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 13:46:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E75F60AA4
 for <buildroot@uclibc.org>; Thu, 10 Feb 2022 13:46:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id A38AA82518; Thu, 10 Feb 2022 13:39:32 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 10 Feb 2022 13:46:58 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wbx@openadk.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14581-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14581] New: qemu-system-ppc -M mac99 does not boot
 for glibc system
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

https://bugs.busybox.net/show_bug.cgi?id=14581

            Bug ID: 14581
           Summary: qemu-system-ppc -M mac99 does not boot for glibc
                    system
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: wbx@openadk.org
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hi,

you get following error when trying to boot a glibc system in qemu-system-ppc:
Run /sbin/init as init process
init[1]: segfault (11) at 7369693e nip 7eb024 lr 7ead8c code 1 in
libc.so.6[772000+1fa000]
init[1]: code: 7d5d5378 815efd38 39200000 913f0000 814a0000 813f000c 75291fbf
2c0a0000 
init[1]: code: 913f000c 41e2fe94 893d0000 5529103a <7d2a482e> 2c090000 41c2fe80
7fe4fb78 
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
CPU: 0 PID: 1 Comm: init Not tainted 5.15.0 #1
Call Trace:
[f1019d80] [c004c054] panic+0x124/0x308 (unreliable)
[f1019de0] [c004eadc] do_exit+0x910/0x918
[f1019e30] [c004fb38] do_group_exit+0x34/0xa8
[f1019e50] [c005e550] get_signal+0x1ec/0x86c
[f1019eb0] [c000cdcc] do_notify_resume+0x78/0x304
[f1019f10] [c00128a0] interrupt_exit_user_prepare_main+0xf8/0x130
[f1019f30] [c0019224] interrupt_return+0x14/0x144
--- interrupt: 300 at 0x7eb024
NIP:  007eb024 LR: 007ead8c CTR: 007ff680
REGS: f1019f40 TRAP: 0300   Not tainted  (5.15.0)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 48002424  XER: 20000000
DAR: 7369693e DSISR: 40000000 
GPR00: 007e16a0 af9058c0 a7b8a430 00ab1879 00000000 af905d20 af906138 af906630 
GPR08: 00000030 000001cc 73696772 00000000 48002424 00acfa54 00000000 af905d20 
GPR16: 00000000 00ab1879 af905d20 00000000 00000000 4ec40000 af906630 00000000 
GPR24: af906138 af9066f8 af906138 00000000 00000000 00ab187a 00981fb8 af905d20 
NIP [007eb024] 0x7eb024
LR [007ead8c] 0x7ead8c
--- interrupt: 300
Rebooting in 180 seconds..

best regards
 Waldemar

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
