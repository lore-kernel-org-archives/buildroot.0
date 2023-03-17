Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9635C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 17:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6068561AF3;
	Fri, 17 Mar 2023 17:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6068561AF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PeM2OgFEw_H0; Fri, 17 Mar 2023 17:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2FF661AF0;
	Fri, 17 Mar 2023 17:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2FF661AF0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C70A91BF33E
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 17:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1EBD400F6
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 17:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1EBD400F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AeDwo7etnWR4 for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 17:02:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D949F40025
 for <buildroot@uclibc.org>; Fri, 17 Mar 2023 17:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D949F40025
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id C537F8747A; Fri, 17 Mar 2023 17:02:24 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 17 Mar 2023 17:02:24 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jbglaw@lug-owl.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15436-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15436] New: qemu_s390x_defconfig: FS image too
 small
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

https://bugs.busybox.net/show_bug.cgi?id=15436

            Bug ID: 15436
           Summary: qemu_s390x_defconfig: FS image too small
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: jbglaw@lug-owl.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

The qemu_s390x_defconfig configuration suffers from a too small FS image:

[build 2023-03-16 06:10:06] mke2fs 1.46.5 (30-Dec-2021)
[build 2023-03-16 06:10:06] Creating regular file
/var/lib/laminar/run/buildroot-qemu_s390x_defconfig/1/buildroot/output/images/rootfs.ext2
[build 2023-03-16 06:10:06] Creating filesystem with 61440 1k blocks and 15360
inodes
[build 2023-03-16 06:10:06] Filesystem UUID:
ec8acc08-401f-448b-a2eb-b95481434d6a
[build 2023-03-16 06:10:06] Superblock backups stored on blocks: 
[build 2023-03-16 06:10:06]     8193, 24577, 40961, 57345
[build 2023-03-16 06:10:06] 
[build 2023-03-16 06:10:06] Allocating group tables: done                       
[build 2023-03-16 06:10:06] Writing inode tables: done                          
[build 2023-03-16 06:10:06] Copying files into the device: __populate_fs: Could
not allocate block in ext2 filesystem while writing file "ata_id"
[build 2023-03-16 06:10:06] mkfs.ext2: Could not allocate block in ext2
filesystem while populating file system
[build 2023-03-16 06:10:06] *** Maybe you need to increase the filesystem size
(BR2_TARGET_ROOTFS_EXT2_SIZE)
[build 2023-03-16 06:10:06] make: *** [fs/ext2/ext2.mk:66:
/var/lib/laminar/run/buildroot-qemu_s390x_defconfig/1/buildroot/output/images/rootfs.ext2]
Error 1


Full build log at
http://toolchain.lug-owl.de/laminar/log/buildroot-qemu_s390x_defconfig/1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
