From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Dec 2009 07:21:53 +0000 (UTC)
Subject: [Buildroot] [Bug 777] New: Microperl doesn't build - Unterminated
 quoted string in makedepend.SH
Message-ID: <bug-777-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=777

              Host: Ubuntu 9.10
            Target: i686-pc-linux-uclibc
             Build: i686-pc-linux-uclibc
           Summary: Microperl doesn't build - Unterminated quoted string in
                    makedepend.SH
           Product: buildroot
           Version: 2009.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thomas.brandstetter at me.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I've choosen the generic development system option in Buildroot and Microperl
doesn't build. Here is the output from my system:

echo  av.c scope.c op.c doop.c doio.c dump.c hv.c mg.c reentr.c perl.c perly.c
pp.c pp_hot.c pp_ctl.c pp_sys.c regcomp.c regexec.c utf8.c gv.c sv.c taint.c
toke.c util.c deb.c run.c universal.c xsutils.c pad.c globals.c perlio.c
perlapi.c numeric.c locale.c pp_pack.c pp_sort.c miniperlmain.c perlmain.c
opmini.c | tr ' ' '\n' >.clist
make[2]: Leaving directory `/buildroot/build_sdk/output/build/perl-5.8.8'
./makedepend: 1: Syntax error: Unterminated quoted string
make[1]: *** [depend] Error 2

It's an old error from perl 5.8.8, please see at:
http://rt.perl.org/rt3//Public/Bug/Display.html?id=44581

There is also a patch to fix this problem. It also doesn't build/copy the
Makefile in the x2p subdirectory. I tried to copy the makefile (attention key
sensitive) to Makefile and it worked.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
