Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3B9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 12:09:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F16660EFF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 12:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F16660EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB20880EFE;
	Mon, 18 Oct 2021 12:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egEPyM9r-6ZB; Mon, 18 Oct 2021 12:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3939C823E0;
	Mon, 18 Oct 2021 12:09:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 025E71BF27C
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 12:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2F3D606E5
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 12:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cuzfOscARDnp for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 12:08:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5F49606C9
 for <buildroot@uclibc.org>; Mon, 18 Oct 2021 12:08:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 4B1FC868AA; Mon, 18 Oct 2021 12:05:55 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 18 Oct 2021 12:08:58 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.02.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefan.walter@iml.fraunhofer.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14281-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14281] New: Boot process stuck at "GRUB loading.."
 since 2021.02.1
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

https://bugs.busybox.net/show_bug.cgi?id=14281

            Bug ID: 14281
           Summary: Boot process stuck at "GRUB loading.." since 2021.02.1
           Product: buildroot
           Version: 2021.02.5
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: stefan.walter@iml.fraunhofer.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

The following used to work until including Buildroot 2021.02, i.e. the
resulting image used to boot normally. Ever since Buildroot 2021.02.1, the
resulting image does not boot any more - the boot process either gets stuck
right after displaying "GRUB loading..", or it reboots at that point, leading
to an infinite boot loop. More specifically, this problem exists since the
following commit:

e840f2d469 boot/grub2: Backport 2021/03/02 securify fixes

Here's what I'm doing:

1. Run Buildroot to create a root partition image (my_defconfig attached).
2. Create a GRUB image like this (grub_early.cfg attached):

/path/to/buildroot-sdk/host/bin/grub-mkimage --config=grub_early.cfg
--directory=/path/to/buildroot-sdk/host/lib/grub/i386-pc -o
./genimage_input_tmp/grub_core.img --format=i386-pc --prefix==/boot/grub
biosdisk part_msdos ext2 normal linux configfile

3. Create a home partition image like this:

MKE2FS_CONFIG=/path/to/buildroot-sdk/host/etc/mke2fs.conf
/path/to/buildroot-sdk/host/sbin/mke2fs -d home_partition_prep/home -j -L home
-t ext3 -U random -b 4096 ./genimage_input_tmp/home.ext3 25M

4. Create a disk image like this (genimage.cfg attached):

/path/to/buildroot-sdk/host/bin/genimage --loglevel=1 --config=genimage.cfg
--inputpath=./genimage_input_tmp --outputpath=images
--rootpath=home_partition_prep --tmppath=./genimage_tmp
--tune2fs=/path/to/buildroot-sdk/host/usr/sbin/tune2fs
--e2fsck=/path/to/buildroot-sdk/host/usr/sbin/e2fsck

(Note that I had also previously raised this issue on the Buildroot mailing
list - see
http://lists.busybox.net/pipermail/buildroot/2021-October/625323.html.)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
