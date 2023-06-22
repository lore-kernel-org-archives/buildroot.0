Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F10EEB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 16:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8460242108;
	Thu, 22 Jun 2023 16:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8460242108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jI4P5Ri9jJij; Thu, 22 Jun 2023 16:32:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1776A42112;
	Thu, 22 Jun 2023 16:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1776A42112
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9821BF484
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3683960B90
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3683960B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajdOy4H16e3I for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 16:32:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C2BD60B2F
 for <buildroot@uclibc.org>; Thu, 22 Jun 2023 16:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C2BD60B2F
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 17FC783ACF; Thu, 22 Jun 2023 16:32:42 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 22 Jun 2023 16:32:41 +0000
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
Message-ID: <bug-15658-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15658] New: hifive_unleashed_defconfig: Linker
 errors in opensbi-0.9
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

https://bugs.busybox.net/show_bug.cgi?id=15658

            Bug ID: 15658
           Summary: hifive_unleashed_defconfig: Linker errors in
                    opensbi-0.9
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

As of c765ac9c02dbddd53cf6813cf59c8f265b043caf, I see this build error:

[build 2023-06-20 03:57:13]  ELF       platform/generic/firmware/fw_dynamic.elf
[build 2023-06-20 03:57:13]
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/host/lib/gcc/riscv64-buildroot-linux-gnu/11.3.0/../../../../riscv64-buildroot-linux-gnu/bin/ld:
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/build/platform/generic/lib/libplatsbi.a(sbi_init.o):
in function `sbi_init':
[build 2023-06-20 03:57:13]
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/lib/sbi/sbi_init.c:385:
undefined reference to `__stack_chk_guard'
[build 2023-06-20 03:57:13]
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/host/lib/gcc/riscv64-buildroot-linux-gnu/11.3.0/../../../../riscv64-buildroot-linux-gnu/bin/ld:
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/build/platform/generic/lib/libplatsbi.a(sbi_ipi.o):
in function `sbi_ipi_send_many':
[build 2023-06-20 03:57:13]
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/lib/sbi/sbi_ipi.c:78:
undefined reference to `__stack_chk_guard'
[build 2023-06-20 03:57:13]
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/host/lib/gcc/riscv64-buildroot-linux-gnu/11.3.0/../../../../riscv64-buildroot-linux-gnu/bin/ld:
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/lib/sbi/sbi_ipi.c:92:
undefined reference to `__stack_chk_fail'
[build 2023-06-20 03:57:13]
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/host/lib/gcc/riscv64-buildroot-linux-gnu/11.3.0/../../../../riscv64-buildroot-linux-gnu/bin/ld:
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/build/platform/generic/lib/libplatsbi.a(sbi_tlb.o):
in function `sbi_tlb_process':
[build 2023-06-20 03:57:13]
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/lib/sbi/sbi_tlb.c:213:
undefined reference to `__stack_chk_guard'
[build 2023-06-20 03:57:13]
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/host/lib/gcc/riscv64-buildroot-linux-gnu/11.3.0/../../../../riscv64-buildroot-linux-gnu/bin/ld:
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/lib/sbi/sbi_tlb.c:220:
undefined reference to `__stack_chk_fail'
[build 2023-06-20 03:57:13]
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/host/lib/gcc/riscv64-buildroot-linux-gnu/11.3.0/../../../../riscv64-buildroot-linux-gnu/bin/ld:
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/build/platform/generic/lib/libplatsbi.a(sbi_tlb.o):
in function `sbi_tlb_update':
[build 2023-06-20 03:57:13]
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/lib/sbi/sbi_tlb.c:308:
undefined reference to `__stack_chk_guard'
[build 2023-06-20 03:57:13]
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/host/lib/gcc/riscv64-buildroot-linux-gnu/11.3.0/../../../../riscv64-buildroot-linux-gnu/bin/ld:
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/build/platform/generic/lib/libplatsbi.a(sbi_tlb.o):
in function `sbi_tlb_process_count':


[...]

[build 2023-06-20 03:57:13]
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/host/lib/gcc/riscv64-buildroot-linux-gnu/11.3.0/../../../../riscv64-buildroot-linux-gnu/bin/ld:
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/lib/utils/libfdt/fdt_wip.c:81:
undefined reference to `__stack_chk_guard'
[build 2023-06-20 03:57:13]
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/host/lib/gcc/riscv64-buildroot-linux-gnu/11.3.0/../../../../riscv64-buildroot-linux-gnu/bin/ld:
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/build/platform/generic/lib/libplatsbi.a(fdt_wip.o):
in function `fdt_nop_region_':
[build 2023-06-20 03:57:13]
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/lib/utils/libfdt/fdt_wip.c:55:
undefined reference to `__stack_chk_fail'
[build 2023-06-20 03:57:13] collect2: error: ld returned 1 exit status
[build 2023-06-20 03:57:13] make[1]: *** [Makefile:351:
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/build/platform/generic/firmware/fw_dynamic.elf]
Error 1
[build 2023-06-20 03:57:13] make[1]: Leaving directory
'/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9'
[build 2023-06-20 03:57:13] make: *** [package/pkg-generic.mk:293:
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/5/buildroot/output/build/opensbi-0.9/.stamp_built]
Error 2


(Build log at
http://toolchain.lug-owl.de/laminar/jobs/buildroot-hifive_unleashed_defconfig/5
)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
