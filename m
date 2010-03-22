From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Mar 2010 17:28:42 +0000 (UTC)
Subject: [Buildroot] [Bug 1393] New: neon config fails libxml/parser.h:
 libxml2 requires, but not dependent on, libiconv
Message-ID: <bug-1393-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1393

           Summary: neon config fails libxml/parser.h: libxml2 requires, but
                    not dependent on, libiconv
           Product: buildroot
           Version: 2010.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mjhammel at graphics-muse.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Running configure for neon:

configure:30827: checking libxml/parser.h usability
configure:30844:
/home/mjhammel/src/cei/ustar/src/../bld/buildroot-2010.02.xcc.bld/staging/usr/bin/powerpc-linux-gcc
-Os -pipe -Os  --sysroot
/home/mjhammel/src/cei/ustar/src/../bld/buildroot-2010.02.bld/staging// -c -Os
-pipe -Os  --sysroot
/home/mjhammel/src/cei/ustar/src/../bld/buildroot-2010.02.bld/staging// 
-D_LARGEFILE64_SOURCE -DNE_LFS -I/usr/include/libxml2 conftest.c >&5
In file included from /usr/include/libxml2/libxml/parser.h:801,
                 from conftest.c:131:
/usr/include/libxml2/libxml/encoding.h:28:19: error: iconv.h: No such file or
directory
In file included from /usr/include/libxml2/libxml/parser.h:801,
                 from conftest.c:131:
/usr/include/libxml2/libxml/encoding.h:136: error: expected
specifier-qualifier-list before 'iconv_t'

Checking encoding.h, iconv.h is included only if LIBXML_ICONV_ENABLED is set:

#ifdef LIBXML_ICONV_ENABLED
#include <iconv.h>
#endif

There are no buildroot options to set this so it must be on by default in the
libxml2 build which means that libxml2 should be dependent on libiconv, but it
currently is not.  

Test run: 2010-03-22
Buildroot version: buildroot-2010.02 on Fedora11


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
