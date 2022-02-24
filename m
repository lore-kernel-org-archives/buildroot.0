Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529EDC433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 09:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF20C81326;
	Thu, 24 Feb 2022 09:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wiBC7ylVZWu3; Thu, 24 Feb 2022 09:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F3C3812F1;
	Thu, 24 Feb 2022 09:28:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10C4B1BF5AE
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 09:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F289D4013B
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 09:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OiVMhTJO3v8r for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 09:28:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2699640117
 for <buildroot@uclibc.org>; Thu, 24 Feb 2022 09:28:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 6852C826B4; Thu, 24 Feb 2022 09:20:55 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 24 Feb 2022 09:28:52 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: f.rogall@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14611-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14611] New: 2022.02-rc2: Build of BR2_x86_64 with
 BR2_LINUX_KERNEL_LATEST_VERSION=y broken
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

https://bugs.busybox.net/show_bug.cgi?id=14611

            Bug ID: 14611
           Summary: 2022.02-rc2: Build of BR2_x86_64 with
                    BR2_LINUX_KERNEL_LATEST_VERSION=y broken
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: f.rogall@gmx.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

The building of BR2_x86_64 with BR2_LINUX_KERNEL_LATEST_VERSION=y
on Buildroot 2022.02-rc2 does not work.

>>> linux-headers 5.15.13 Building
>>> linux-headers 5.15.13 Installing to staging directory
(cd /home/fr/work/egate/x/egate/build/linux-headers-5.15.13;
PATH="/home/fr/work/egate/x/egate/host/bin:/home/fr/work/egate/x/egate/host/sbin:/home/fr/bin:/home/fr/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
/usr/bin/make -j9 ARCH=x86_64 HOSTCC="/usr/bin/gcc" HOSTCFLAGS=""
HOSTCXX="/usr/bin/g++"
INSTALL_HDR_PATH=/home/fr/work/egate/x/egate/host/x86_64-buildroot-linux-gnu/sysroot/usr
headers_install)
  INSTALL
/home/fr/work/egate/x/egate/host/x86_64-buildroot-linux-gnu/sysroot/usr/include
if ! support/scripts/check-kernel-headers.sh  /home/fr/work/egate/x/egate/build
 /home/fr/work/egate/x/egate/host/x86_64-buildroot-linux-gnu/sysroot  5.16 
loose; then exit 1; fi
Incorrect selection of kernel headers: expected 5.16.x, got 5.15.x
make[1]: *** [package/pkg-generic.mk:332:
/home/fr/work/egate/x/egate/build/linux-headers-5.15.13/.stamp_staging_installed]
Error 1
make: *** [Makefile:84: _all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
