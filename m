Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC872C25B4E
	for <buildroot@archiver.kernel.org>; Sun, 22 Jan 2023 13:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7820A403C2;
	Sun, 22 Jan 2023 13:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7820A403C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zN-O_BbUaGvN; Sun, 22 Jan 2023 13:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEDA9402A7;
	Sun, 22 Jan 2023 13:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEDA9402A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFA581BF2FE
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 13:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C45BD408F3
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 13:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C45BD408F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YIyVN_2Dp7tk for <buildroot@lists.busybox.net>;
 Sun, 22 Jan 2023 13:54:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B37AD408EE
 for <buildroot@uclibc.org>; Sun, 22 Jan 2023 13:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B37AD408EE
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 9DCC1870A4; Sun, 22 Jan 2023 13:54:33 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 22 Jan 2023 13:54:33 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.11
X-Bugzilla-Keywords: FIXME
X-Bugzilla-Severity: normal
X-Bugzilla-Who: glscene2010@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id cf_host cf_build short_desc product version
 rep_platform op_sys bug_status keywords
 bug_severity priority component
 assigned_to reporter cc target_milestone attachments.created
Message-ID: <bug-15271-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15271] New: no start-qemu.sh
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

https://bugs.busybox.net/show_bug.cgi?id=15271

            Bug ID: 15271
              Host: Qemu
             Build: Ubuntu 22 X86_64
           Summary: no start-qemu.sh
           Product: buildroot
           Version: 2022.11
          Hardware: All
                OS: Linux
            Status: NEW
          Keywords: FIXME
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: glscene2010@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Created attachment 9481
  --> https://bugs.busybox.net/attachment.cgi?id=9481&action=edit
usage: make BR2_EXTERNAL=/mnt/ramdisk/my_external_tree -C buildroot
my_qemu_x86_defconfig

Buildroot can't produce start-qemu.sh with my my_qemu_x86_defconfig. Why?

git clone https://github.com/buildroot/buildroot
make qemu_x86_defconfig -C buildroot
make -C buildroot

There is buildroot/output/images/start-qemu.sh (and also rootfs.ext2 bzImage).
Ok. Next:

make clean -C buildroot
#copy linux.config with new name
cp /mnt/ramdisk/buildroot/board/qemu/x86/linux.config
/mnt/ramdisk/my_external_tree/board/my_company/my_board/my_linux.config

#copy qemu_x86_defconfig with new name
cp /mnt/ramdisk/buildroot/configs/qemu_x86_defconfig
/mnt/ramdisk/my_external_tree/configs/my_qemu_x86_defconfig

nano /mnt/ramdisk/my_external_tree/configs/my_qemu_x86_defconfig
# and change BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE like this
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/mnt/ramdisk/my_external_tree/board/my_company/my_board/my_linux.config",
save

make BR2_EXTERNAL=/mnt/ramdisk/my_external_tree -C buildroot
my_qemu_x86_defconfig
make -C buildroot

There is no buildroot/output/images/start-qemu.sh ("No Qemu cmd line found,
can't test"). There are buildroot/output/images/bzImage and
buildroot/output/images/rootfs.ext2 only. Why?

And also I see another thing like a bug:
--make clean doesn't remove .br2-external files--

After my success building
make clean -C buildroot
make BR2_EXTERNAL=/mnt/ramdisk/my_external_tree -C buildroot
my_qemu_x86_defconfig
make -C buildroot

I try
make clean -C buildroot

But in /mnt/ramdisk/buildroot/output/ there are 9 .br2-external... files. Why 
make clean -C buildroot
doesn't remove this files?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
