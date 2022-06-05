Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC12C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 14:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6743540AFD;
	Sun,  5 Jun 2022 14:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tc22O1NQ20hg; Sun,  5 Jun 2022 14:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45483405F6;
	Sun,  5 Jun 2022 14:07:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B911C1BF47F
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 14:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1808843ED
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 14:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zwf-tAIIkbsA for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 14:07:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C152E8436B
 for <buildroot@uclibc.org>; Sun,  5 Jun 2022 14:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id BA2A686AC7; Sun,  5 Jun 2022 13:55:30 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 05 Jun 2022 14:07:17 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@blob.dev
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14836-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14836] New: aufs-util build not working
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

https://bugs.busybox.net/show_bug.cgi?id=14836

            Bug ID: 14836
           Summary: aufs-util build not working
           Product: buildroot
           Version: 2022.02.2
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: me@blob.dev
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hello

We have observed a build failure related to aufs-util (version aufs5.8) on
buildroot 2022.02.2 and 2022.05-rc2. Attempts at fixing the problem ourselves
were unsuccessful, since the errors just kept on coming. You fix one, another
pops up. The first error:

```
In file included from
/root/test2/buildroot-2022.02.2/output/build/linux-5.15.18/include/uapi/linux/posix_types.h:5,
                 from
/root/test2/buildroot-2022.02.2/output/build/linux-5.15.18/include/uapi/linux/types.h:14,
                 from
/root/test2/buildroot-2022.02.2/output/build/linux-5.15.18/include/uapi/linux/stat.h:5,
                 from /usr/include/x86_64-linux-gnu/bits/statx.h:31,
                 from /usr/include/x86_64-linux-gnu/sys/stat.h:446,
                 from /usr/include/ftw.h:28,
                 from au_util.h:23,
                 from ver.c:25:
/root/test2/buildroot-2022.02.2/output/build/linux-5.15.18/include/uapi/linux/stddef.h:2:10:
fatal error: linux/compiler_types.h: No such file or directory
    2 | #include <linux/compiler_types.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
```

We fixed this by modifying the include paths, but then the second error came:

```
gcc: error: pre: No such file or directory
make[1]: *** [<builtin>: c2sh] Error 1
```

This was fixed by creating an empty file called pre in the aufs-util build
directory, but then, we got this error instead:

```
make[2]: *** No rule to make target '../extlib/glibc/error_at_line.h', needed
by 'libau.o'.  Stop.
make[2]: Leaving directory
'/root/test/buildroot-2022.05-rc2/output/build/aufs-util-aufs5.8/libau'
make[1]: *** [Makefile:106: all] Error 2
```

At this point we gave up trying to fix this ourselves.

Regards

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
