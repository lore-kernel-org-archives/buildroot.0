Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE36C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 18:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7615F60EE8;
	Mon, 31 Jan 2022 18:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UwhqCeE7yM6d; Mon, 31 Jan 2022 18:11:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6FAB60EB0;
	Mon, 31 Jan 2022 18:11:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B44D71BF2B7
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 18:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1D9B60EDA
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 18:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hUcijZ86CqE for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 18:10:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9CBC60EA4
 for <buildroot@uclibc.org>; Mon, 31 Jan 2022 18:10:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id A0193801A2; Mon, 31 Jan 2022 18:03:55 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 31 Jan 2022 18:10:58 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.11
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: colin.foster@in-advantage.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14561-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14561] New: OpenJDK does not compile when building
 in WSL
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

https://bugs.busybox.net/show_bug.cgi?id=14561

            Bug ID: 14561
           Summary: OpenJDK does not compile when building in WSL
           Product: buildroot
           Version: 2021.11
          Hardware: All
                OS: Windows
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: colin.foster@in-advantage.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Tested in 2021.11. As the summary suggests, when building in WSLv2, OpenJDK
fails. If I were to wager a guess, OpenJDK is trying to be too smart about the
fact that it is building on a Windows OS. Jumping to a Linux machine and
compiling with the same config works as expected.

checking for egrep... /usr/bin/grep -E
checking for fgrep... /usr/bin/grep -F
checking for a sed that does not truncate output... /usr/bin/sed
checking for df... /usr/bin/df
checking for nice... /usr/bin/nice
checking for greadlink... [not found]
checking for readlink... /usr/bin/readlink
checking for cygpath... [not found]
checking for wslpath... /usr/bin/wslpath
checking for lsb_release... /usr/bin/lsb_release
checking for cmd.exe... /mnt/c/Windows/system32/cmd.exe
checking for cmp... /usr/bin/cmp
checking for uniq... /usr/bin/uniq
checking build system type... x86_64-pc-wsl
checking host system type... arm-buildroot-linux-gnueabihf
checking target system type... arm-buildroot-linux-gnueabihf
checking openjdk-build os-cpu... windows-x86_64
checking openjdk-target os-cpu... linux-arm
checking openjdk-target C library... default
checking compilation type... cross
/home/colin/src/buildroot/output/build/openjdk-17.0.1+12/build/.configure-support/generated-configure.sh:
line 34833: import: command not found
/home/colin/src/buildroot/output/build/openjdk-17.0.1+12/build/.configure-support/generated-configure.sh:
line 34834: verify: command not found
configure: error: The path of TOPDIR, which resolves as
"/home/colin/src/buildroot/output/build/openjdk-17.0.1+12", could not be
imported.
configure exiting with result code 1
make: *** [package/pkg-generic.mk:285:
/home/colin/src/buildroot/output/build/openjdk-17.0.1+12/.stamp_configured]
Error 1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
