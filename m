From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Sep 2009 09:18:43 +0000 (UTC)
Subject: [Buildroot] [Bug 635] New: util-linux fails to build in 2009.08
Message-ID: <bug-635-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=635

           Summary: util-linux fails to build in 2009.08
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: igor47 at moomers.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=677)
 --> (https://bugs.busybox.net/attachment.cgi?id=677)
all my .config files from 'make saveconfig'

this is absolutely a showstopper for me. i seem to have continuous problems
building util-linux with several of the past buildroot releases - if nobody
else is having these problems, maybe it's something about my build environment?

a google search shows that these errors might result from large file support
not being turned on, but it definitely is.

/provisioning/buildroot/buildroot-2009.08/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
 -g -O2   -o pivot_root  pivot_root.o  
swapon.c:86: error: expected declaration specifiers or '...' before 'swapon'
swapon.c:86: error: expected declaration specifiers or '...' before 'path'
swapon.c:86: error: expected declaration specifiers or '...' before 'flags'
swapon.c:88: error: expected declaration specifiers or '...' before 'swapoff'
swapon.c:88: error: expected declaration specifiers or '...' before 'path'
swapon.c: In function 'swapon_all':
swapon.c:328: error: 'R_OK' undeclared (first use in this function)
swapon.c:328: error: (Each undeclared identifier is reported only once
swapon.c:328: error: for each function it appears in.)
make[3]: *** [swapon.o] Error 1
make[3]: Leaving directory
`/provisioning/buildroot/buildroot-2009.08/build_i686/util-linux-2.13-pre7/mount'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/provisioning/buildroot/buildroot-2009.08/build_i686/util-linux-2.13-pre7'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/provisioning/buildroot/buildroot-2009.08/build_i686/util-linux-2.13-pre7'
make: ***
[/provisioning/buildroot/buildroot-2009.08/build_i686/util-linux-2.13-pre7/misc-utils/chkdupexe]
Error 2

please let me know if there's anything else i can supply to help troubleshoot
this


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
