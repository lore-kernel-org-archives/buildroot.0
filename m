Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71280C001DB
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 22:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1BB041E5E;
	Fri, 11 Aug 2023 22:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1BB041E5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2p2DsaY-jrTT; Fri, 11 Aug 2023 22:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C257E41E5F;
	Fri, 11 Aug 2023 22:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C257E41E5F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5F801BF5F6
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D22E402D4
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D22E402D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UfuiTyaUjSzl for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 22:11:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA37740169
 for <buildroot@uclibc.org>; Fri, 11 Aug 2023 22:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA37740169
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id A49248498A; Fri, 11 Aug 2023 22:11:23 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 11 Aug 2023 22:11:23 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: abrodkin@synopsys.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15721-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15721] New: fakeroot 1.32.1 fails to build on
 CentOS 7.x machines
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

https://bugs.busybox.net/show_bug.cgi?id=15721

            Bug ID: 15721
           Summary: fakeroot 1.32.1 fails to build on CentOS 7.x machines
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: abrodkin@synopsys.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Starting from commit f1350977634f ("package/fakeroot: bump to version 1.32.1"),
see [1], Buildroot fails to compile early that way:
----------------------->8-----------------------
libtool: compile:  /usr/bin/gcc -std=gnu11 -DHAVE_CONFIG_H -I.
-D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64
-I.../buildroot/fakeroot/output/host/include -O2
-I.../buildroot/fakeroot/output/host/include -c libfakeroot_time64.c  -fPIC
-DPIC -o .libs/libfakeroot_time64_la-libfakeroot_time64.o
In file included from libfakeroot_time64.c:13:0:
/usr/include/fts.h:41:3: error: #error "<fts.h> cannot be used with
-D_FILE_OFFSET_BITS==64"
 # error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
   ^
make[3]: *** [libfakeroot_time64_la-libfakeroot_time64.lo] Error 1
make[3]: Leaving directory
`.../buildroot/fakeroot/output/build/host-fakeroot-1.32.1'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`.../buildroot/fakeroot/output/build/host-fakeroot-1.32.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`.../buildroot/fakeroot/output/build/host-fakeroot-1.32.1'
----------------------->8-----------------------

That happens due to a change in the fakeroot, see [2].
It boils down to use of "fts.h" on 64-bit system with old glibc.
I.e. support of "fts.h" was added in glibc 2.23, see [3]. And in its turn
CentOS 7.x uses glibc 2.17, thus we see this (shamelessly copied from [4]):
----------------------->8-----------------------
> cat test.c
#include <fts.h>

int main() {
}

> cc -D_FILE_OFFSET_BITS=64 test.c
In file included from test.c:1:0:
/usr/include/fts.h:41:3: error: #error "<fts.h> cannot be used with
-D_FILE_OFFSET_BITS==64"
 # error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
#include <fts.h>

int main() {
}
----------------------->8-----------------------

Note, with older fakeroot, i.e. reverted [1] my simple build gets to the end
successfully.

[1]
https://git.buildroot.net/buildroot/commit/?h=f1350977634f96f0404b9801e6f79cb7200cf26d
[2]
https://salsa.debian.org/clint/fakeroot/-/commit/c465f716856cd561dba3522a4f5c714ea8bedfbd
[3]
https://sourceware.org/git/?p=glibc.git;a=commit;h=8b7b7f75d91f7bac323dd6a370aeb3e9c5c4a7d5
[4] https://github.com/mesonbuild/meson/issues/3519#issuecomment-386281558

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
