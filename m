From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  2 Aug 2009 16:09:44 +0000 (UTC)
Subject: [Buildroot] [Bug 533] New: Update gamin to 0.1.10 to fix compilation
Message-ID: <bug-533-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=533

              Host: Ubuntu 9.0.4 Server 32 Bit
            Target: i686
             Build: i686
           Summary: Update gamin to 0.1.10 to fix compilation
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: d.albano at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=565)
 --> (https://bugs.busybox.net/attachment.cgi?id=565)
Update gamin to 0.1.10 to fix compilation

Hi,

gamin fails to compile complaining about unknown cr variable and its size

Here there is the tail of make output:
/home/daniele/Development/OPBXA/buildroot-git/../targets/i686-opbxa-linux-gnu//bin/i686-opbxa-linux-gnu-gcc
-O3 -pipe -O3 --sysroot
/home/daniele/Development/OPBXA/buildroot-git/build_i686/staging_dir/
-DHAVE_CONFIG_H -I. -I. -I.. -I.. -I../lib -DBINDIR=\"/usr/libexec\"
-DBUILDDIR=\"..\" -Wall -Wchar-subscripts -Wmissing-declarations
-Wmissing-prototypes -Wnested-externs -Wsign-compare -Wno-sign-compare -O2 -MT
gam_api.lo -MD -MP -MF .deps/gam_api.Tpo -c gam_api.c  -fPIC -DPIC -o
.libs/gam_api.o
gam_api.c: In function 'gamin_check_cred':
gam_api.c:715: error: storage size of 'cr' isn't known
gam_api.c:715: warning: unused variable 'cr'
gam_api.c: In function 'FAMOpen':
gam_api.c:962: warning: implicit declaration of function 'gam_error_init'
gam_api.c:962: warning: nested extern declaration of 'gam_error_init'
make[3]: *** [gam_api.lo] Error 1

Googling about this error i've seen that gamin 0.1.10 fix this, so i bumped up
the version and remake the configure patch to skip checks for abstract socket
namespace.

Attached the patch!


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
