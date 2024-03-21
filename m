Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACE4C54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 08:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9698881EE5;
	Thu, 21 Mar 2024 08:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTyr5AuH42Ga; Thu, 21 Mar 2024 08:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 984FA82079
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 984FA82079;
	Thu, 21 Mar 2024 08:21:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 431EA1BF344
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 08:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 307C040378
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 08:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xMaCtdxL56SO for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 08:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53A76400D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53A76400D9
 for <buildroot@uclibc.org>; Thu, 21 Mar 2024 08:21:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 4B38382821; Thu, 21 Mar 2024 08:21:22 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 21 Mar 2024 08:21:21 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: niziak@spox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-16006-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16006] New: package/opencv4: Debian12 + ccache:
 fatal error: stdlib.h: No such file or directory
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

https://bugs.busybox.net/show_bug.cgi?id=16006

            Bug ID: 16006
           Summary: package/opencv4: Debian12 + ccache: fatal error:
                    stdlib.h: No such file or directory
           Product: buildroot
           Version: 2024.02
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: niziak@spox.org
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hi.
I cannot build opencv4 package under Debian 12 (on older Debian it works). I've
prepared minimum scenario to reproduce:

Download and unpack: `buildroot-2024.02.tar.gz`

Go to BR dir.

make freescale_imx8mmevk_defconfig
./utils/config --enable CCACHE
./utils/config --enable TOOLCHAIN_EXTERNAL
./utils/config --enable PACKAGE_OPENCV4
./utils/config --enable PACKAGE_OPENCV4_WITH_TBB
make olddefconfig
make opencv4

...

[ 29%] Building CXX object
modules/core/CMakeFiles/opencv_core.dir/src/directx.cpp.o
In file included from
/home/runner/buildroot-2024.02/output/host/opt/ext-toolchain/aarch64-none-linux-gnu/include/c++/13.2.1/bits/stl_algo.h:71,
                 from
/home/runner/buildroot-2024.02/output/host/opt/ext-toolchain/aarch64-none-linux-gnu/include/c++/13.2.1/algorithm:61,
                 from
/home/runner/buildroot-2024.02/output/build/opencv4-4.9.0/modules/core/include/opencv2/core/base.hpp:55,
                 from
/home/runner/buildroot-2024.02/output/build/opencv4-4.9.0/modules/core/include/opencv2/core/utils/buffer_area.private.hpp:7,
                 from
/home/runner/buildroot-2024.02/output/build/opencv4-4.9.0/modules/core/src/buffer_area.cpp:5:
/home/grunner/buildroot-2024.02/output/host/opt/ext-toolchain/aarch64-none-linux-gnu/include/c++/13.2.1/cstdlib:79:15:
fatal error: stdlib.h: No such file or directory
   79 | #include_next <stdlib.h>
      |               ^~~~~~~~~~
compilation terminated.
...

It looks like sth is messed in opencv4 cmake files.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
