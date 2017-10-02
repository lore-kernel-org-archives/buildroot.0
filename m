From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 02 Oct 2017 15:06:10 +0000
Subject: [Buildroot] [Bug 10356] New: nfs-utils missing header
Message-ID: <bug-10356-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10356

            Bug ID: 10356
           Summary: nfs-utils missing header
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: matthew.weber at rockwellcollins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7251
  --> https://bugs.busybox.net/attachment.cgi?id=7251&action=edit
proposed fix.  this has not been sent upstream yet.

Glibc bump to 2.26 exposed this missing header when building
with the following combination using a internal toolchain.
Arch: i686
gcc5.4.0
glibc2.26
bin2.28.1
linux4.1.43

Logfile snippet:

2017-10-02T00:08:11 ^
2017-10-02T00:08:12 rpc.c: In function ?nsm_recv_getport?:
2017-10-02T00:08:12 rpc.c:469:13: error: ?UINT16_MAX? undeclared (first use in
this function)
2017-10-02T00:08:12 if (port > UINT16_MAX) {
2017-10-02T00:08:12 ^
2017-10-02T00:08:12 rpc.c:469:13: note: each undeclared identifier is reported
only once for each function it appears in
2017-10-02T00:08:12 rpc.c: In function ?nsm_recv_getaddr?:
2017-10-02T00:08:12 rpc.c:506:25: error: ?UINT16_MAX? undeclared (first use in
this function)
2017-10-02T00:08:12 if (port < 0 || port > UINT16_MAX) {
2017-10-02T00:08:12 ^
2017-10-02T00:08:12 Makefile:452: recipe for target 'rpc.o' failed
2017-10-02T00:08:12 make[5]: *** [rpc.o] Error 1
2017-10-02T00:08:12 make[5]: *** Waiting for unfinished jobs....
2017-10-02T00:08:12 Makefile:393: recipe for target 'all' failed
2017-10-02T00:08:12 make[4]: *** [all] Error 2
2017-10-02T00:08:12 Makefile:426: recipe for target 'all-recursive' failed
2017-10-02T00:08:12 make[3]: *** [all-recursive] Error 1
2017-10-02T00:08:12 Makefile:468: recipe for target 'all-recursive' failed
2017-10-02T00:08:12 make[2]: *** [all-recursive] Error 1
2017-10-02T00:08:12 package/pkg-generic.mk:234: recipe for target
'/home/gitlab-runner/builds/9d7dc3b9/2/rclinux/rc-bsp/target_build/build/nfs-utils-1.3.3/.stamp_built'
failed

-- 
You are receiving this mail because:
You are on the CC list for the bug.
