Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC12CC54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 21:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68F7C41781;
	Fri, 15 Mar 2024 21:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ujFwjuGvyUgt; Fri, 15 Mar 2024 21:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C80AC417E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C80AC417E0;
	Fri, 15 Mar 2024 21:11:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32A861BF389
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 21:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EB7640487
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 21:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dHyzZeb3YKi6 for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 21:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E90C740025
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E90C740025
 for <buildroot@uclibc.org>; Fri, 15 Mar 2024 21:11:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id E01BE87ED5; Fri, 15 Mar 2024 21:11:25 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 15 Mar 2024 21:11:25 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fli4l@franke-prem.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15997-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15997] New: Build Squid with GCC12.3 in Buildroot
 2024.02 will fail
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

https://bugs.busybox.net/show_bug.cgi?id=15997

            Bug ID: 15997
           Summary: Build Squid with GCC12.3 in Buildroot 2024.02 will
                    fail
           Product: buildroot
           Version: 2024.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: fli4l@franke-prem.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hello,
i try to build Squid V6.6 with buildroot 2024.02 and GCC12.3.
But this will fail with the following faults:
/usr/bin/g++ -O2
-I/home/roland/.fbr/fbr-4.0-test_1_2024-x86_64/buildroot/output/per-package/squid/host/include
-o cf_gen ./cf_gen.cc -I. -I../include/ -I../src
./cf_gen.cc: In function 'int main(int, char**)':
./cf_gen.cc:268:63: error: forming reference to void
  268 |                     auto &newEntry = entries.emplace_back(name);
      |                                                               ^
./cf_gen.cc:277:68: error: forming reference to void
  277 |                     auto &newEntry = entries.emplace_back("comment");
      |                                                                    ^
make[2]: *** [Makefile:7264: cf_gen] Error 1

I have also try to add the old patch 
0004-libgcc-Exclude-UCLIBC-from-GLIBC-thread-check.patch
to GCC (As this patch is looks missing), but the build by me will still fail.

Are there any posibilty at your side for checking if the fail by you is also
or if this is depended on my system here.
Best regards,
Roland Franke
(Germany)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
