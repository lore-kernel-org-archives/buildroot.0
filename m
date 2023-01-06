Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E28C4708E
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 03:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A52C41B90;
	Fri,  6 Jan 2023 03:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A52C41B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0i4UPVIULqG; Fri,  6 Jan 2023 03:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40F2041B93;
	Fri,  6 Jan 2023 03:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40F2041B93
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F6451BF27C
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 03:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5546082010
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 03:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5546082010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PQ7wm-z1uQiU for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 03:25:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7823182004
 for <buildroot@uclibc.org>; Fri,  6 Jan 2023 03:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7823182004
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 646EF8718C; Fri,  6 Jan 2023 03:25:24 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 06 Jan 2023 03:25:24 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.11
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: glscene2010@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id cf_host cf_build short_desc product version
 rep_platform op_sys bug_status bug_severity
 priority component assigned_to
 reporter cc target_milestone
Message-ID: <bug-15226-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15226] New: lsblk: not found
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

https://bugs.busybox.net/show_bug.cgi?id=15226

            Bug ID: 15226
              Host: qemu_x86
             Build: Ubuntu 22 X86_64
           Summary: lsblk: not found
           Product: buildroot
           Version: 2022.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: glscene2010@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Why I can't use lsblk?

_________

Steps to Reproduce. I build Buildroot from git
git clone git://git.buildroot.net/buildroot
make clean -C buildroot
make -C buildroot qemu_x86_defconfig
make -C buildroot

I run
buildroot/output/images/start-qemu.sh

0) Actual Results. I try to use lsblk command via console
# lsblk
-sh: lsblk: not found

Expected Results. lsblk should be found in my system!

1)
lsusb works (return nothing)

2)
# fdisk -l
Disk /dev/vda: 60 MB, 62914560 bytes, 122880 sectors
121 cylinders, 16 heads, 63 sectors/track
Units: sectors of 1 * 512 = 512 bytes

Disk /dev/vda doesn't contain a valid partition table

3)
file
buildroot/output/build/linux-5.15.18/.config
contains
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_SYSFS_SYSCALL=y
CONFIG_SYSFS=y

4) 
# uname -a
Linux buildroot 5.15.18 #1 SMP Fri Jan 6 19:29:11 KST 2023 i686 GNU/Linux

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
