Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63FECE7A8B
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 22:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5345981FC4;
	Sat, 23 Sep 2023 22:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5345981FC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZaFr8TQSz-Dt; Sat, 23 Sep 2023 22:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93B4C81F78;
	Sat, 23 Sep 2023 22:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93B4C81F78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E22EA1BF86C
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 22:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB8BF60D80
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 22:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB8BF60D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lR0fqbb3KCbx for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 22:36:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0C2C606F5
 for <buildroot@uclibc.org>; Sat, 23 Sep 2023 22:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0C2C606F5
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 97631872F6; Sat, 23 Sep 2023 22:36:34 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 23 Sep 2023 22:36:34 +0000
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
Message-ID: <bug-15793-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15793] New: beaglev_defconfig: Cross binutils/gcc
 configuration problem?
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

https://bugs.busybox.net/show_bug.cgi?id=15793

            Bug ID: 15793
           Summary: beaglev_defconfig: Cross binutils/gcc configuration
                    problem?
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

Building the beaglev_defconfig (as of ab4f3fafaa839593b3efd9ea12c8ee5d9340cdeb)
produces this error:

[build 2023-09-23 10:34:44] mkdir -p `dirname
/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/build/opensbi-custom/build/lib/sbi/sbi_tlb.o`;
echo " CC        lib/sbi/sbi_tlb.o";
/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/host/bin/riscv64-buildroot-linux-gnu-gcc
-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector
-fno-strict-aliasing -O2 -fno-omit-frame-pointer -fno-optimize-sibling-calls
-mno-save-restore -mstrict-align -mabi=lp64 -march=rv64imafdc -mcmodel=medany
-I/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/build/opensbi-custom/platform/generic/include
-I/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/build/opensbi-custom/include
-I/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/build/opensbi-custom/lib/utils/libfdt/
 -DFW_PIC -DFW_TEXT_START=0x80000000
-DFW_FDT_PATH=\"/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/images/u-boot.dtb\"
-DFW_JUMP_ADDR=0x80200000 -DFW_JUMP_FDT_ADDR=0x82200000
-DFW_PAYLOAD_PATH=\"/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/images/u-boot.bin\"
-DFW_PAYLOAD_OFFSET=0x200000 -DFW_PAYLOAD_FDT_ADDR=0x82200000  -fno-pie -no-pie
-fPIE -pie
-I/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/build/opensbi-custom/lib/sbi
-D__OBJNAME__=sbi_tlb -c
/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/build/opensbi-custom/lib/sbi/sbi_tlb.c
-o
/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/build/opensbi-custom/build/lib/sbi/sbi_tlb.o
[build 2023-09-23 10:34:44]  CC        lib/sbi/sbi_tlb.o
[build 2023-09-23 10:34:45]
/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/build/opensbi-custom/lib/sbi/sbi_tlb.c:
Assembler messages:
[build 2023-09-23 10:34:45]
/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/build/opensbi-custom/lib/sbi/sbi_tlb.c:175:
Error: unrecognized opcode `fence.i', extension `zifencei' required
[build 2023-09-23 10:34:45] make[1]: *** [Makefile:339:
/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/build/opensbi-custom/build/lib/sbi/sbi_tlb.o]
Error 1
[build 2023-09-23 10:34:45] make[1]: Leaving directory
'/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/build/opensbi-custom'
[build 2023-09-23 10:34:45] make: *** [package/pkg-generic.mk:293:
/var/lib/laminar/run/buildroot-beaglev_defconfig/6/buildroot/output/build/opensbi-custom/.stamp_built]
Error 2

So I guess it's a slight configuration error for Binutils or GCC not matching
the target, or proper GCC flags missing? Full build log available at
http://toolchain.lug-owl.de/laminar/jobs/buildroot-beaglev_defconfig/6

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
