Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FB3C6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 16:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5773C61AF0;
	Fri, 17 Mar 2023 16:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5773C61AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1MJpcmBMoXU; Fri, 17 Mar 2023 16:57:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0A3861AEC;
	Fri, 17 Mar 2023 16:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0A3861AEC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27E901BF33E
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 16:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01818822E6
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 16:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01818822E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 56Op-bbr9y2p for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 16:57:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0082822CB
 for <buildroot@uclibc.org>; Fri, 17 Mar 2023 16:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0082822CB
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id BB7B287501; Fri, 17 Mar 2023 16:57:47 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 17 Mar 2023 16:57:47 +0000
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
Message-ID: <bug-15431-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15431] New: orangepi_one_plus_defconfig: Error:
 arch/arm/dts/.sun50i-h6-orangepi-one-plus.dtb.pre.tmp:151.1-10 syntax error
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

https://bugs.busybox.net/show_bug.cgi?id=15431

            Bug ID: 15431
           Summary: orangepi_one_plus_defconfig: Error:
                    arch/arm/dts/.sun50i-h6-orangepi-one-plus.dtb.pre.tmp:
                    151.1-10 syntax error
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

The orangepi_one_plus_defconfig sample configuration has issues with a DT file:

[build 2023-03-15 12:04:48] /usr/bin/make -f ./scripts/Makefile.build obj=dts
dtbs
[build 2023-03-15 12:04:48] /usr/bin/make -f ./scripts/Makefile.build
obj=arch/arm/dts dtbs
[build 2023-03-15 12:04:48]   mkdir -p arch/arm/dts/ ; (cat
arch/arm/dts/sun50i-h6-orangepi-one-plus.dts; echo '\#include
"sunxi-u-boot.dtsi"') > arch/arm/dts/.sun50i-h6-orangepi-one-plus.dtb.pre.tmp;
/var/lib/laminar/run/buildroot-orangepi_one_plus_defconfig/1/buildroot/output/host/bin/aarch64-buildroot-linux-gnu-gcc
-E -Wp,-MD,arch/arm/dts/.sun50i-h6-orangepi-one-plus.dtb.d.pre.tmp -nostdinc
-I./arch/arm/dts -I./arch/arm/dts/include -Iinclude -I./include
-I./arch/arm/include -include ./include/linux/kconfig.h -D__ASSEMBLY__ -undef
-D__DTS__ -x assembler-with-cpp -o
arch/arm/dts/.sun50i-h6-orangepi-one-plus.dtb.dts.tmp
arch/arm/dts/.sun50i-h6-orangepi-one-plus.dtb.pre.tmp ; ./scripts/dtc/dtc -O
dtb -o arch/arm/dts/sun50i-h6-orangepi-one-plus.dtb -b 0 -i arch/arm/dts/
-Wno-unit_address_vs_reg -Wno-simple_bus_reg -Wno-unit_address_format
-Wno-pci_bridge -Wno-pci_device_bus_num -Wno-pci_device_reg -d
arch/arm/dts/.sun50i-h6-orangepi-one-plus.dtb.d.dtc.tmp
arch/arm/dts/.sun50i-h6-orangepi-one-plus.dtb.dts.tmp ; cat
arch/arm/dts/.sun50i-h6-orangepi-one-plus.dtb.d.pre.tmp
arch/arm/dts/.sun50i-h6-orangepi-one-plus.dtb.d.dtc.tmp >
arch/arm/dts/.sun50i-h6-orangepi-one-plus.dtb.d
[build 2023-03-15 12:04:48] Error:
arch/arm/dts/.sun50i-h6-orangepi-one-plus.dtb.pre.tmp:151.1-10 syntax error
[build 2023-03-15 12:04:48] FATAL ERROR: Unable to parse input tree
[build 2023-03-15 12:04:48] make[3]: *** [scripts/Makefile.lib:310:
arch/arm/dts/sun50i-h6-orangepi-one-plus.dtb] Error 1
[build 2023-03-15 12:04:48] make[2]: *** [dts/Makefile:44: arch-dtbs] Error 2
[build 2023-03-15 12:04:48] make[1]: *** [Makefile:926: dts/dt.dtb] Error 2
[build 2023-03-15 12:04:48] make[1]: Leaving directory
'/var/lib/laminar/run/buildroot-orangepi_one_plus_defconfig/1/buildroot/output/build/uboot-2018.09'
[build 2023-03-15 12:04:48] make: *** [package/pkg-generic.mk:293:
/var/lib/laminar/run/buildroot-orangepi_one_plus_defconfig/1/buildroot/output/build/uboot-2018.09/.stamp_built]
Error 2


Full build log at
http://toolchain.lug-owl.de/laminar/log/buildroot-orangepi_one_plus_defconfig/1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
