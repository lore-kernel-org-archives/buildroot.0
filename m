Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1611C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 00:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F75D41973;
	Sat, 28 Jan 2023 00:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F75D41973
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bNhdYkbvvoGf; Sat, 28 Jan 2023 00:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5F7D41881;
	Sat, 28 Jan 2023 00:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5F7D41881
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87E151BF977
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 00:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E92641881
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 00:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E92641881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E6iTtLSZIk7l for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 00:14:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65642417D2
 for <buildroot@uclibc.org>; Sat, 28 Jan 2023 00:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65642417D2
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 4EFBE87EE5; Sat, 28 Jan 2023 00:14:26 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 28 Jan 2023 00:14:25 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.11.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: mintcreeksoftware@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15301-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15301] New: Selecting NAND Flash boot media
 (NAND_BOOT) breaks the uboot build
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

https://bugs.busybox.net/show_bug.cgi?id=15301

            Bug ID: 15301
           Summary: Selecting NAND Flash boot media (NAND_BOOT) breaks the
                    uboot build
           Product: buildroot
           Version: 2022.11.1
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: mintcreeksoftware@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Using "make uboot-menuconfig" and selecting Boot Media -> Support for booting
from NAND flash (NAND_BOOT) causes the build to fail with the following.

/buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld.bfd:
common/spl/built-in.o: in function `spl_nand_fit_read':

/buildroot/output/build/uboot-lf-5.10.y-1.0.0/common/spl/spl_nand.c:44:
undefined reference to `nand_spl_load_image'

/buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld.bfd:
common/spl/built-in.o: in function `spl_nand_load_element':

/buildroot/output/build/uboot-lf-5.10.y-1.0.0/common/spl/spl_nand.c:56:
undefined reference to `nand_spl_load_image'

/buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld.bfd:
/buildroot/output/build/uboot-lf-5.10.y-1.0.0/common/spl/spl_nand.c:84:
undefined reference to `nand_spl_load_image'

/buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld.bfd:
common/spl/built-in.o: in function `spl_nand_load_image':

/buildroot/output/build/uboot-lf-5.10.y-1.0.0/common/spl/spl_nand.c:102:
undefined reference to `nand_init'

/buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld.bfd:
/buildroot/output/build/uboot-lf-5.10.y-1.0.0/common/spl/spl_nand.c:166:
undefined reference to `nand_deselect'

make[3]: *** [scripts/Makefile.spl:420: spl/u-boot-spl] Error 1

make[2]: *** [Makefile:1864: spl/u-boot-spl] Error 2

make[1]: *** [package/pkg-generic.mk:293:
/buildroot/output/build/uboot-lf-5.10.y-1.0.0/.stamp_built] Error 2

make: *** [Makefile:82: _all] Error 2


Target is freescale_imx8mnevk.
Commands issued:
make uboot-menuconfig
Select Boot Media -> Support for booting from NAND flash, exit and save.
make uboot-rebuild all

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
