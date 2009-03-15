From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Mar 2009 13:31:16 +0000 (UTC)
Subject: [Buildroot] [Bug 187] New: ntfs-3g: could not build cross
Message-ID: <bug-187-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=187

              Host: Linux version 2.6.23 (gentoo 2008 , gcc version 4.1.1)
            Target: linux i686
             Build: buildroot 2009.2.1
           Summary: ntfs-3g: could not build cross
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Keywords: assemble-failure
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: zhouqm27 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=151)
 --> (https://bugs.busybox.net/attachment.cgi?id=151)
config files , and error message when build ntfs-3g

Hi,erery one.

When I select ntfs-3g in buildroot's  menuconfig and build the softwares, it
will show some error messages about ntfs-3g.

following messages are the errors:
---------------------------------------
unistr.c: In function 'ntfs_ucstombs':
unistr.c:752: error: 'MB_CUR_MAX' undeclared (first use in this function)
unistr.c:752: error: (Each undeclared identifier is reported only once
unistr.c:752: error: for each function it appears in.)
unistr.c:760: warning: implicit declaration of function 'wctomb'
unistr.c: In function 'ntfs_mbstoucs':
unistr.c:874: warning: implicit declaration of function 'mbstowcs'
unistr.c:898: warning: implicit declaration of function 'mbtowc'
make[2]: *** [libntfs_3g_la-unistr.lo] error 1
make[2]: Leaving directory
`/mnt/sda3/buildroot-20090315/build_i686/ntfs-3g-1.5130/libntfs-3g'
make[1]: *** [all-recursive] error 1
make[1]: Leaving directory
`/mnt/sda3/buildroot-20090315/build_i686/ntfs-3g-1.5130'
make: *** [all] error 2
---------------------------------------
This report's attachment file is a bar file include buildroot's config files
and the error message file. [buildroot 2009.05 ; gcc 4.3.3 ; uclibc 0.9.30.1; ]

This error alse exist in past version's buildroot.

And I wish you can add partimage to buildroot's package.

Thank you.


zhouqimin
2009-03-15
zhouqm27 at gmail.com


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
