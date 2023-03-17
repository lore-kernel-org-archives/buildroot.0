Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6B7C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 17:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A82261AF0;
	Fri, 17 Mar 2023 17:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A82261AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNdYUqIr92r3; Fri, 17 Mar 2023 17:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FEF661AEC;
	Fri, 17 Mar 2023 17:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FEF661AEC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DA151BF3F0
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 17:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2753A822E6
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 17:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2753A822E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYl18hFbg058 for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 17:05:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47A5782291
 for <buildroot@uclibc.org>; Fri, 17 Mar 2023 17:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47A5782291
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id C8FAC8747A; Fri, 17 Mar 2023 17:05:09 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 17 Mar 2023 17:05:09 +0000
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
Message-ID: <bug-15441-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15441] New: raspberrypi3_qt5we_defconfig: "Your
 Buildroot configuration needs a compiler capable of building 32 bits
 binaries."
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

https://bugs.busybox.net/show_bug.cgi?id=15441

            Bug ID: 15441
           Summary: raspberrypi3_qt5we_defconfig: "Your Buildroot
                    configuration needs a compiler capable of building 32
                    bits binaries."
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

I don't really understand this error message, as my expectation was that the
compiler is targeted at some 32bit ARM target already?

+ log_execute build make V=1 BR2_JLEVEL=1
[build 2023-03-16 04:13:05] /usr/bin/make -j1
O=/var/lib/laminar/run/buildroot-raspberrypi3_qt5we_defconfig/1/buildroot/output
HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++" syncconfig
[build 2023-03-16 04:13:05] make[1]: Entering directory
'/var/lib/laminar/run/buildroot-raspberrypi3_qt5we_defconfig/1/buildroot'
[build 2023-03-16 04:13:06] make[1]: Leaving directory
'/var/lib/laminar/run/buildroot-raspberrypi3_qt5we_defconfig/1/buildroot'
[build 2023-03-16 04:13:06] 
[build 2023-03-16 04:13:06] Your Buildroot configuration needs a compiler
capable of building 32 bits binaries.
[build 2023-03-16 04:13:06] If you're running a Debian/Ubuntu distribution,
install the g++-multilib package.
[build 2023-03-16 04:13:06] For other distributions, refer to their
documentation.
[build 2023-03-16 04:13:06] make: *** [support/dependencies/dependencies.mk:27:
dependencies] Error 1


Full build log at
http://toolchain.lug-owl.de/laminar/log/buildroot-raspberrypi3_qt5we_defconfig/1
(though there isn't much more to read.)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
