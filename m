Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A18C433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 22:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14ACC4127D;
	Thu, 26 May 2022 22:50:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agz9k0VNJg5T; Thu, 26 May 2022 22:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36231404D7;
	Thu, 26 May 2022 22:50:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A06771BF33D
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 22:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E72761565
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 22:50:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UqCYb1ps7C69 for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 22:50:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F29FE61563
 for <buildroot@uclibc.org>; Thu, 26 May 2022 22:50:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 05F1285DA8; Thu, 26 May 2022 22:38:56 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 26 May 2022 22:50:20 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: buildroot@apitman.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14821-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14821] New: Samba server is failing to compile
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

https://bugs.busybox.net/show_bug.cgi?id=14821

            Bug ID: 14821
           Summary: Samba server is failing to compile
           Product: buildroot
           Version: 2022.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: buildroot@apitman.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hi,

I'm trying to get samba server up and running in my buildroot image.

First I enabled wchar support for uClibc, then enabled samba4. It's failing
with the following:

[2113/3474] Compiling source3/rpc_server/mdssvc/dalloc.c
[2114/3474] Compiling lib/afs/afs_funcs.c
[2115/3474] Compiling librpc/rpc/dcerpc_helper.c
[2116/3474] Compiling source3/registry/reg_parse_prs.c
../../source3/lib/netapi/examples/common.c:13:10: fatal error: iconv.h: No such
file or directory
   13 | #include <iconv.h>
      |          ^~~~~~~~~
compilation terminated.

Waf: Leaving directory
`/home/user/buildroot/output/build/samba4-4.15.6/bin/default'
Build failed
 -> task in 'LIBNETAPI_EXAMPLES_COMMON' failed with exit status 1 (run with -v
to display more information)
make[1]: *** [Makefile:7: all] Error 1
make[1]: Leaving directory '/home/user/buildroot/output/build/samba4-4.15.6'
make: *** [package/pkg-generic.mk:292:
/home/user/buildroot/output/build/samba4-4.15.6/.stamp_built] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
