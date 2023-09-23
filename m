Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBCFCE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 22:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B011781FCB;
	Sat, 23 Sep 2023 22:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B011781FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ItCqKyzx4R6F; Sat, 23 Sep 2023 22:39:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1B9881FC0;
	Sat, 23 Sep 2023 22:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1B9881FC0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B07551BF86C
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 22:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8328C414D6
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 22:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8328C414D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xag_HOipHVu8 for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 22:39:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C08D740164
 for <buildroot@uclibc.org>; Sat, 23 Sep 2023 22:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C08D740164
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id ADF40872F6; Sat, 23 Sep 2023 22:39:18 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 23 Sep 2023 22:39:18 +0000
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
Message-ID: <bug-15796-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15796] New: freescale_imx8dxlevk_defconfig:
 Missing dependency on OpenSSL
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

https://bugs.busybox.net/show_bug.cgi?id=15796

            Bug ID: 15796
           Summary: freescale_imx8dxlevk_defconfig: Missing dependency on
                    OpenSSL
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

Seems the new freescale_imx8dxlevk_defconfig (as of
ab4f3fafaa839593b3efd9ea12c8ee5d9340cdeb) is missing a (host) OpenSSL
dependency:


[build 2023-09-23 17:35:35]   /usr/bin/gcc -O2 -isystem
/var/lib/laminar/run/buildroot-freescale_imx8dxlevk_defconfig/1/buildroot/output/host/include
-Wp,-MD,tools/.aisimage.o.d -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer 
 -std=gnu11   -DCONFIG_FIT_SIGNATURE -DCONFIG_FIT_SIGNATURE_MAX_SIZE=0xffffffff
-DCONFIG_FIT_CIPHER -include ./include/compiler.h -idirafterinclude
-idirafter./arch/arm/include -I./scripts/dtc/libfdt -I./tools -DUSE_HOSTCC
-D__KERNEL_STRICT_NAMES -D_GNU_SOURCE  -c -o tools/aisimage.o tools/aisimage.c
[build 2023-09-23 17:35:35] In file included from tools/imagetool.h:24,
[build 2023-09-23 17:35:35]                  from tools/aisimage.c:7:
[build 2023-09-23 17:35:35] include/image.h:1394:12: fatal error:
openssl/evp.h: No such file or directory
[build 2023-09-23 17:35:35]  1394 | #  include <openssl/evp.h>
[build 2023-09-23 17:35:35]       |            ^~~~~~~~~~~~~~~
[build 2023-09-23 17:35:35] compilation terminated.
[build 2023-09-23 17:35:35] make[2]: *** [scripts/Makefile.host:112:
tools/aisimage.o] Error 1
[build 2023-09-23 17:35:35] make[1]: *** [Makefile:1848: tools] Error 2
[build 2023-09-23 17:35:35] make[1]: Leaving directory
'/var/lib/laminar/run/buildroot-freescale_imx8dxlevk_defconfig/1/buildroot/output/build/uboot-custom'
[build 2023-09-23 17:35:35] make: *** [package/pkg-generic.mk:293:
/var/lib/laminar/run/buildroot-freescale_imx8dxlevk_defconfig/1/buildroot/output/build/uboot-custom/.stamp_built]
Error 2


(Build log at
http://toolchain.lug-owl.de/laminar/jobs/buildroot-freescale_imx8dxlevk_defconfig/1)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
