From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 24 Jan 2009 14:49:32 +0000 (UTC)
Subject: [Buildroot] [Bug 69] New: tar refuses to build
Message-ID: <bug-69-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=69

            Target: i386
             Build: Current SVN
           Summary: tar refuses to build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: kretschi at online.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The following error is produced by tar-1.18:

../lib/libtar.a(argp-fmtstream.o): In function `argp_fmtstream_putc':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/argp-fmtstream.h:233:
multiple definition of `argp_fmtstream_putc'
tar.o:/usr/src/svn/buildroot-test/build_i386/tar-1.18/src/../lib/argp-fmtstream.h:233:
first defined here
../lib/libtar.a(argp-fmtstream.o): In function `argp_fmtstream_point':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/argp-fmtstream.h:279:
multiple definition of `argp_fmtstream_point'
tar.o:/usr/src/svn/buildroot-test/build_i386/tar-1.18/src/../lib/argp-fmtstream.h:279:
first defined here
../lib/libtar.a(argp-fmtstream.o): In function `argp_fmtstream_set_wmargin':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/argp-fmtstream.h:267:
multiple definition of `argp_fmtstream_set_wmargin'
tar.o:/usr/src/svn/buildroot-test/build_i386/tar-1.18/src/../lib/argp-fmtstream.h:267:
first defined here
../lib/libtar.a(argp-fmtstream.o): In function `argp_fmtstream_set_rmargin':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/argp-fmtstream.h:255:
multiple definition of `argp_fmtstream_set_rmargin'
tar.o:/usr/src/svn/buildroot-test/build_i386/tar-1.18/src/../lib/argp-fmtstream.h:255:
first defined here
../lib/libtar.a(argp-fmtstream.o): In function `argp_fmtstream_set_lmargin':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/argp-fmtstream.h:243:
multiple definition of `argp_fmtstream_set_lmargin'
tar.o:/usr/src/svn/buildroot-test/build_i386/tar-1.18/src/../lib/argp-fmtstream.h:243:
first defined here
../lib/libtar.a(argp-fmtstream.o): In function `argp_fmtstream_write':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/argp-fmtstream.h:207:
multiple definition of `argp_fmtstream_write'
tar.o:/usr/src/svn/buildroot-test/build_i386/tar-1.18/src/../lib/argp-fmtstream.h:207:
first defined here
../lib/libtar.a(argp-fmtstream.o): In function `argp_fmtstream_puts':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/argp-fmtstream.h:220:
multiple definition of `argp_fmtstream_puts'
tar.o:/usr/src/svn/buildroot-test/build_i386/tar-1.18/src/../lib/argp-fmtstream.h:220:
first defined here
../lib/libtar.a(argp-help.o): In function `argp_fmtstream_point':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/argp-fmtstream.h:279:
multiple definition of `argp_fmtstream_point'
tar.o:/usr/src/svn/buildroot-test/build_i386/tar-1.18/src/../lib/argp-fmtstream.h:279:
first defined here
../lib/libtar.a(argp-help.o): In function `argp_fmtstream_set_wmargin':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/argp-fmtstream.h:267:
multiple definition of `argp_fmtstream_set_wmargin'
tar.o:/usr/src/svn/buildroot-test/build_i386/tar-1.18/src/../lib/argp-fmtstream.h:267:
first defined here
../lib/libtar.a(argp-help.o): In function `argp_fmtstream_set_rmargin':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/argp-fmtstream.h:255:
multiple definition of `argp_fmtstream_set_rmargin'
tar.o:/usr/src/svn/buildroot-test/build_i386/tar-1.18/src/../lib/argp-fmtstream.h:255:
first defined here
../lib/libtar.a(argp-help.o): In function `argp_fmtstream_set_lmargin':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/argp-fmtstream.h:243:
multiple definition of `argp_fmtstream_set_lmargin'
tar.o:/usr/src/svn/buildroot-test/build_i386/tar-1.18/src/../lib/argp-fmtstream.h:243:
first defined here
../lib/libtar.a(argp-help.o): In function `argp_fmtstream_putc':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/argp-fmtstream.h:233:
multiple definition of `argp_fmtstream_putc'
tar.o:/usr/src/svn/buildroot-test/build_i386/tar-1.18/src/../lib/argp-fmtstream.h:233:
first defined here
../lib/libtar.a(argp-help.o): In function `argp_fmtstream_write':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/argp-fmtstream.h:207:
multiple definition of `argp_fmtstream_write'
tar.o:/usr/src/svn/buildroot-test/build_i386/tar-1.18/src/../lib/argp-fmtstream.h:207:
first defined here
../lib/libtar.a(argp-help.o): In function `argp_fmtstream_puts':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/argp-fmtstream.h:220:
multiple definition of `argp_fmtstream_puts'
tar.o:/usr/src/svn/buildroot-test/build_i386/tar-1.18/src/../lib/argp-fmtstream.h:220:
first defined here
../lib/libtar.a(close-stream.o): In function `close_stream':
/usr/src/svn/buildroot-test/build_i386/tar-1.18/lib/close-stream.c:56: warning:
This version of __fpending returns bytes remaining in buffer for both narrow
and wide streams.  glibc's version returns wide chars in buffer for the wide
stream case.

Perhaps we need a newer Version of tar or a patch to agree with the newest gcc?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
