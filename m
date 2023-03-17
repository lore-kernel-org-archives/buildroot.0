Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CA5C6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 15:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59B5F61AC0;
	Fri, 17 Mar 2023 15:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59B5F61AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LBGwcF9g9VZg; Fri, 17 Mar 2023 15:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B2A861AD4;
	Fri, 17 Mar 2023 15:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B2A861AD4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CD5F1BF38E
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 15:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 160BA822A5
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 15:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 160BA822A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 51sMqFbY05yD for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 15:23:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 239DC82296
 for <buildroot@uclibc.org>; Fri, 17 Mar 2023 15:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 239DC82296
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 10F64870D0; Fri, 17 Mar 2023 15:23:18 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 17 Mar 2023 15:23:17 +0000
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
Message-ID: <bug-15406-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15406] New: beaglebone_qt5_defconfig: ERROR:
 file(am335x-bonegreen-wireless.dtb): No such file or directory
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

https://bugs.busybox.net/show_bug.cgi?id=15406

            Bug ID: 15406
           Summary: beaglebone_qt5_defconfig: ERROR:
                    file(am335x-bonegreen-wireless.dtb): No such file or
                    directory
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

Hi!

Building the beaglebone_qt5_defconfig breaks for me (full build log at
http://toolchain.lug-owl.de/laminar/log/buildroot-beaglebone_qt5_defconfig/1):


[build 2023-03-14 06:41:53] echo "find
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/buildroot-fs/tar/target/run/
-mindepth 1 -prune -print0 | xargs -0r rm -rf --" >>
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/buildroot-fs/tar/fakeroot
[build 2023-03-14 06:41:53] echo "find
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/buildroot-fs/tar/target/tmp/
-mindepth 1 -prune -print0 | xargs -0r rm -rf --" >>
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/buildroot-fs/tar/fakeroot
[build 2023-03-14 06:41:53] printf '   \n' >>
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/buildroot-fs/tar/fakeroot
[build 2023-03-14 06:41:53] printf '   \n' >>
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/buildroot-fs/tar/fakeroot
[build 2023-03-14 06:41:53] printf '    (cd
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/buildroot-fs/tar/target;
find -print0 | LC_ALL=C sort -z | tar 
--pax-option=exthdr.name=%%d/PaxHeaders/%%f,atime:=0,ctime:=0 -cf
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/images/rootfs.tar
--null --xattrs-include='\''*'\'' --no-recursion -T - --numeric-owner)\n' >>
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/buildroot-fs/tar/fakeroot
[build 2023-03-14 06:41:53] chmod a+x
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/buildroot-fs/tar/fakeroot
[build 2023-03-14 06:41:53]
PATH="/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/host/bin:/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/var/lib/laminar/cfg/scripts"
FAKEROOTDONTTRYCHOWN=1
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/host/bin/fakeroot
--
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/buildroot-fs/tar/fakeroot
[build 2023-03-14 06:41:54]
rootdir=/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/buildroot-fs/tar/target
[build 2023-03-14 06:41:54]
table='/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/buildroot-fs/full_devices_table.txt'
[build 2023-03-14 06:41:55] rm -rf
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/buildroot-fs/tar/target
[build 2023-03-14 06:41:55] ln -snf
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/staging
[build 2023-03-14 06:41:55] mkdir -p
/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/images
[build 2023-03-14 06:41:55] >>>   Executing post-image script
support/scripts/genimage.sh
[build 2023-03-14 06:41:55] INFO: cmd: "mkdir -p
"/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/genimage.tmp""
(stderr):
[build 2023-03-14 06:41:55] INFO: cmd: "rm -rf
"/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/genimage.tmp"/*"
(stderr):
[build 2023-03-14 06:41:55] INFO: cmd: "mkdir -p
"/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/genimage.tmp""
(stderr):
[build 2023-03-14 06:41:55] INFO: cmd: "cp -a "/tmp/tmp.ToxLwil8tG"
"/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/build/genimage.tmp/root""
(stderr):
[build 2023-03-14 06:41:55] ERROR: file(am335x-bonegreen-wireless.dtb):
stat(/var/lib/laminar/run/buildroot-beaglebone_qt5_defconfig/1/buildroot/output/images/am335x-bonegreen-wireless.dtb)
failed: No such file or directory
[build 2023-03-14 06:41:55] ERROR: vfat(boot.vfat): could not setup
am335x-bonegreen-wireless.dtb
[build 2023-03-14 06:41:55] make: *** [Makefile:815: target-post-image] Error 1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
