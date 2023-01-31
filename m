Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07714C636CC
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 22:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7356B40351;
	Tue, 31 Jan 2023 22:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7356B40351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZJxiIO2Qa73; Tue, 31 Jan 2023 22:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21A7940353;
	Tue, 31 Jan 2023 22:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21A7940353
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A18151BF380
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 22:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AD6C812F5
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 22:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AD6C812F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kx1zbxZKXNgz for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 22:41:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8108A812F1
 for <buildroot@uclibc.org>; Tue, 31 Jan 2023 22:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8108A812F1
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 6D92E81DCA; Tue, 31 Jan 2023 22:41:33 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 31 Jan 2023 22:41:33 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: russelljbrennan@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15306-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15306] New: glibc build fails
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

https://bugs.busybox.net/show_bug.cgi?id=15306

            Bug ID: 15306
           Summary: glibc build fails
           Product: buildroot
           Version: unspecified
          Hardware: Macintosh
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: russelljbrennan@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

I'm trying to build glibc in a [Docker
Container](https://github.com/batocera-linux/batocera.linux/blob/master/Dockerfile)
and I'm getting two error.

The first happens on a clean build, and it *looks like* a path is being munged.
The file `tdgppitrmssgwsgadebug/backtrace.os` is specified and doesn't exist,
although `debug/backtrace.os` does exist:

```
...
/bcm2837/host/lib/gcc/aarch64-buildroot-linux-gnu/12.2.0/../../../../aarch64-buildroot-linux-gnu/bin/ar:
tdgppitrmssgwsgadebug/backtrace.os: No such file or directory
make[3]: *** [../o-iterator.mk:9:
/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/libc_nonshared.a]
Error 1
make[3]: *** Waiting for unfinished jobs....
sed -e 's@
/bcm2837/build/glibc-2\.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/@
$(common-objpfx)@g' -e
's@^/bcm2837/build/glibc-2\.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/@$(common-objpfx)@g'
-e 's@  *\.\.\/\([^     \]*\)@ $(..)\1@g' -e 's@^\.\.\/\([^    
\]*\)@$(..)\1@g' \
   
/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/dl-link.h.dT
>
/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/dl-link.h.dT2
rm -f
/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/dl-link.h.dT
mv -f
/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/dl-link.h.dT2
/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/dl-link.h.d
mv -f
/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/dl-link.hT
/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/dl-link.h
make[3]: Leaving directory
'/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/elf'
make[2]: *** [Makefile:484: elf/subdir_lib] Error 2
make[2]: Leaving directory
'/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca'
make[1]: *** [Makefile:9: all] Error 2
make[1]: Leaving directory
'/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build'
make: *** [package/pkg-generic.mk:293:
/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/.stamp_built]
Error 2
make: Leaving directory '/build/buildroot'
make: *** [bcm2837-build] Error 2
```

If I resume the build after that error, building progresses but I get a second
error which I guess might be caused by the first:

```
builder@92c3583543fb:/bcm2837/build$
/bcm2837/host/bin/aarch64-buildroot-linux-gnu-gcc   -nostdlib -nostartfiles
-shared -o
/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/elf/ld.so.new
-Wl,-z,relro -Wl,-z,defs
/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/elf/librtld.os
-Wl,--version-script=/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/ld.map
-Wl,-soname=ld-linux-aarch64.so.1
/bcm2837/host/lib/gcc/aarch64-buildroot-linux-gnu/12.2.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/elf/librtld.os:
in function `_dl_make_stacks_executable':
(.text+0x24b0): undefined reference to `__lll_lock_wake_private'
/bcm2837/host/lib/gcc/aarch64-buildroot-linux-gnu/12.2.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
(.text+0x24c0): undefined reference to `__lll_lock_wait_private'
/bcm2837/host/lib/gcc/aarch64-buildroot-linux-gnu/12.2.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/elf/librtld.os:
in function `__thread_gscope_wait':
(.text+0xe500): undefined reference to `__lll_lock_wake_private'
/bcm2837/host/lib/gcc/aarch64-buildroot-linux-gnu/12.2.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
(.text+0xe508): undefined reference to `__lll_lock_wait_private'
/bcm2837/host/lib/gcc/aarch64-buildroot-linux-gnu/12.2.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
/bcm2837/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/elf/librtld.os:
in function `_dl_init_static_tls':
(.text+0xf594): undefined reference to `__lll_lock_wait_private'
/bcm2837/host/lib/gcc/aarch64-buildroot-linux-gnu/12.2.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
(.text+0xf5b0): undefined reference to `__lll_lock_wake_private'
```


I have tried (with the same result):
- An older version of glibc
- An older version of ubuntu (20.04)

I also see the exact same symptom reported here
https://homematic-forum.de/forum/viewtopic.php?f=65&t=71547

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
