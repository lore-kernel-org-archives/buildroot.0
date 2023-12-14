Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A426DC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 19:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23B2C40168;
	Thu, 14 Dec 2023 19:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23B2C40168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYFnEQnpuiLn; Thu, 14 Dec 2023 19:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB3CC4026A;
	Thu, 14 Dec 2023 19:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB3CC4026A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 911421BF3EA
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73B4F4026A
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73B4F4026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0zCjVhw5RtCZ for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 19:56:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12A6C40168
 for <buildroot@uclibc.org>; Thu, 14 Dec 2023 19:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12A6C40168
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id EFDEF87501; Thu, 14 Dec 2023 19:56:25 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 14 Dec 2023 19:56:25 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marc@rupy.se
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15892-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15892] New: libfakeroot fails to compile
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

https://bugs.busybox.net/show_bug.cgi?id=15892

            Bug ID: 15892
           Summary: libfakeroot fails to compile
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: marc@rupy.se
                CC: buildroot@uclibc.org
  Target Milestone: ---

In file included from libfakeroot.c:271:
wrapped.h:231:40: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'LSTAT64_TIME64_ARG'
  231 | extern int (*NEXT_LSTAT64_TIME64_NOARG)LSTAT64_TIME64_ARG(int ver,
const char *file_name, struct stat64 *buf);
      |                                        ^~~~~~~~~~~~~~~~~~
wrapped.h:232:39: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'STAT64_TIME64_ARG'
  232 | extern int (*NEXT_STAT64_TIME64_NOARG)STAT64_TIME64_ARG(int ver, const
char *file_name, struct stat64 *buf);
      |                                       ^~~~~~~~~~~~~~~~~
wrapped.h:233:40: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'FSTAT64_TIME64_ARG'
  233 | extern int (*NEXT_FSTAT64_TIME64_NOARG)FSTAT64_TIME64_ARG(int ver, int
fd, struct stat64 *buf);
      |                                        ^~~~~~~~~~~~~~~~~~
wrapped.h:234:42: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'FSTATAT64_TIME64_ARG'
  234 | extern int (*NEXT_FSTATAT64_TIME64_NOARG)FSTATAT64_TIME64_ARG(int ver,
int dir_fd, const char *path, struct stat64 *buf, int flags);
      |                                          ^~~~~~~~~~~~~~~~~~~~
In file included from libfakeroot.c:272:
wraptmpf.h:627:24: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'LSTAT64_TIME64_ARG'
  627 | int TMP_LSTAT64_TIME64 LSTAT64_TIME64_ARG(int ver, const char
*file_name, struct stat64 *buf){
      |                        ^~~~~~~~~~~~~~~~~~
wraptmpf.h:632:23: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'STAT64_TIME64_ARG'
  632 | int TMP_STAT64_TIME64 STAT64_TIME64_ARG(int ver, const char *file_name,
struct stat64 *buf){
      |                       ^~~~~~~~~~~~~~~~~
wraptmpf.h:637:24: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'FSTAT64_TIME64_ARG'
  637 | int TMP_FSTAT64_TIME64 FSTAT64_TIME64_ARG(int ver, int fd, struct
stat64 *buf){
      |                        ^~~~~~~~~~~~~~~~~~
wraptmpf.h:642:26: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'FSTATAT64_TIME64_ARG'
  642 | int TMP_FSTATAT64_TIME64 FSTATAT64_TIME64_ARG(int ver, int dir_fd,
const char *path, struct stat64 *buf, int flags){
      |                          ^~~~~~~~~~~~~~~~~~~~
In file included from libfakeroot.c:273:
wrapdef.h:231:33: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'LSTAT64_TIME64_ARG'
  231 | int (*NEXT_LSTAT64_TIME64_NOARG)LSTAT64_TIME64_ARG(int ver, const char
*file_name, struct stat64 *buf)=TMP_LSTAT64_TIME64;
      |                                 ^~~~~~~~~~~~~~~~~~
wrapdef.h:232:32: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'STAT64_TIME64_ARG'
  232 | int (*NEXT_STAT64_TIME64_NOARG)STAT64_TIME64_ARG(int ver, const char
*file_name, struct stat64 *buf)=TMP_STAT64_TIME64;
      |                                ^~~~~~~~~~~~~~~~~
wrapdef.h:233:33: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'FSTAT64_TIME64_ARG'
  233 | int (*NEXT_FSTAT64_TIME64_NOARG)FSTAT64_TIME64_ARG(int ver, int fd,
struct stat64 *buf)=TMP_FSTAT64_TIME64;
      |                                 ^~~~~~~~~~~~~~~~~~
wrapdef.h:234:35: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'FSTATAT64_TIME64_ARG'
  234 | int (*NEXT_FSTATAT64_TIME64_NOARG)FSTATAT64_TIME64_ARG(int ver, int
dir_fd, const char *path, struct stat64 *buf, int flags)=TMP_FSTATAT64_TIME64;
      |                                   ^~~~~~~~~~~~~~~~~~~~
In file included from communicate.h:19,
                 from libfakeroot.c:65:
config.h:367:36: error: 'next___astat64_time64' undeclared here (not in a
function)
  367 | #define NEXT_LSTAT64_TIME64_NOARG  next___astat64_time64
      |                                    ^~~~~~~~~~~~~~~~~~~~~
wrapstruct.h:232:14: note: in expansion of macro 'NEXT_LSTAT64_TIME64_NOARG'
  232 |   {(void(*))&NEXT_LSTAT64_TIME64_NOARG, WRAP_LSTAT64_TIME64_QUOTE},
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~
config.h:363:36: error: '__astat64_time64' undeclared here (not in a function)
  363 | #define WRAP_LSTAT64_TIME64_QUOTE  __astat64_time64
      |                                    ^~~~~~~~~~~~~~~~
wrapstruct.h:232:41: note: in expansion of macro 'WRAP_LSTAT64_TIME64_QUOTE'
  232 |   {(void(*))&NEXT_LSTAT64_TIME64_NOARG, WRAP_LSTAT64_TIME64_QUOTE},
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
config.h:375:38: error: '__astatat64_time64' undeclared here (not in a
function)
  375 | #define WRAP_FSTATAT64_TIME64_QUOTE  __astatat64_time64
      |                                      ^~~~~~~~~~~~~~~~~~
wrapstruct.h:235:43: note: in expansion of macro 'WRAP_FSTATAT64_TIME64_QUOTE'
  235 |   {(void(*))&NEXT_FSTATAT64_TIME64_NOARG, WRAP_FSTATAT64_TIME64_QUOTE},
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
libtool: link: /usr/bin/gcc -O2
-I/home/pi/buildroot/buildroot-2023.02.8/output/host/include -Wl,-rpath
-Wl,/home/pi/buildroot/buildroot-2023.02.8/output/host/lib -o faked faked.o 
-L/home/pi/buildroot/buildroot-2023.02.8/output/host/lib
./.libs/libcommunicate.a -ldl
libfakeroot.c:2610:25: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'LSTAT64_TIME64_ARG'
 2610 | int WRAP_LSTAT64_TIME64 LSTAT64_TIME64_ARG(int ver,
      |                         ^~~~~~~~~~~~~~~~~~
libfakeroot.c:2629:24: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'STAT64_TIME64_ARG'
 2629 | int WRAP_STAT64_TIME64 STAT64_TIME64_ARG(int ver,
      |                        ^~~~~~~~~~~~~~~~~
libfakeroot.c:2647:25: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'FSTAT64_TIME64_ARG'
 2647 | int WRAP_FSTAT64_TIME64 FSTAT64_TIME64_ARG(int ver,
      |                         ^~~~~~~~~~~~~~~~~~
libfakeroot.c:2665:27: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'FSTATAT64_TIME64_ARG'
 2665 | int WRAP_FSTATAT64_TIME64 FSTATAT64_TIME64_ARG(int ver,
      |                           ^~~~~~~~~~~~~~~~~~~~
make[3]: *** [Makefile:673: libfakeroot.lo] Error 1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
