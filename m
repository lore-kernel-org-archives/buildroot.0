Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DD8C6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 16:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E53E61AEF;
	Fri, 17 Mar 2023 16:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E53E61AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4HjmKCa1tOSO; Fri, 17 Mar 2023 16:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CEBE61AEB;
	Fri, 17 Mar 2023 16:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CEBE61AEB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BEAB1BF33E
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 16:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04DFA61AEB
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 16:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04DFA61AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dc7VBoY0kZAC for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 16:52:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 221B261320
 for <buildroot@uclibc.org>; Fri, 17 Mar 2023 16:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 221B261320
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 0EC3387076; Fri, 17 Mar 2023 16:52:18 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 17 Mar 2023 16:52:17 +0000
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
Message-ID: <bug-15426-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15426] New: socrates_cyclone5_defconfig: bison:
 missing operand
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

https://bugs.busybox.net/show_bug.cgi?id=15426

            Bug ID: 15426
           Summary: socrates_cyclone5_defconfig: bison: missing operand
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

For the socrates_cyclone5_defconfig configuration, it seems a bison call gets
an empty argument passed and is unhappy:

[build 2023-03-16 16:31:17]   cat scripts/dtc/dtc-lexer.lex.c_shipped >
scripts/dtc/dtc-lexer.lex.c
[build 2023-03-16 16:31:17]   bison -o/dev/null
--defines=scripts/dtc/dtc-parser.tab.h_shipped -t -l -p 
scripts/dtc/dtc-parser.y
[build 2023-03-16 16:31:17] bison: missing operand
[build 2023-03-16 16:31:17] Try 'bison --help' for more information.
[build 2023-03-16 16:31:17] make[3]: *** [scripts/Makefile.lib:225:
scripts/dtc/dtc-parser.tab.h_shipped] Error 1
[build 2023-03-16 16:31:17] make[2]: *** [scripts/Makefile.build:583:
scripts/dtc] Error 2
[build 2023-03-16 16:31:17] make[1]: *** [Makefile:566: scripts] Error 2
[build 2023-03-16 16:31:17] make[1]: Leaving directory
'/var/lib/laminar/run/buildroot-socrates_cyclone5_defconfig/1/buildroot/output/build/linux-4.16.7'
[build 2023-03-16 16:31:17] make: *** [package/pkg-generic.mk:293:
/var/lib/laminar/run/buildroot-socrates_cyclone5_defconfig/1/buildroot/output/build/linux-4.16.7/.stamp_built]
Error 2

Full build log at
http://toolchain.lug-owl.de/laminar/log/buildroot-socrates_cyclone5_defconfig/1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
