From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 14 Nov 2010 21:20:56 +0000 (UTC)
Subject: [Buildroot] [Bug 2809] New: failed to compile libglib2
Message-ID: <bug-2809-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2809

           Summary: failed to compile libglib2
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: oilehus at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I turned on libglib2, I got the following comipler error

libtool: compile: 
/local/home/src/buildroot-2010.11-rc1/output/staging/usr/bin/i386-unknown-linux-uclibc-gcc
--sysroot=/local/home/src/buildroot-2010.11-rc1/output/staging -DHAVE_CONFIG_H
-I. -I.. -I.. -I../glib -I../glib -I.. -DG_LOG_DOMAIN=\"GLib\"
-DG_DISABLE_CAST_CHECKS -DG_DISABLE_DEPRECATED -DGLIB_COMPILATION -DPCRE_STATIC
-DG_DISABLE_SINGLE_INCLUDES -pthread -pipe -Os -mtune=i386 -march=i386
-I/local/home/src/buildroot-2010.11-rc1/output/staging/usr/include
-I/local/home/src/buildroot-2010.11-rc1/output/staging/include -Wall -MT
gatomic.lo -MD -MP -MF .deps/gatomic.Tpo -c gatomic.c  -fPIC -DPIC -o
.libs/gatomic.o
gatomic.c:885: error: expected '=', ',', ';', 'asm' or '__attribute__' before
'*' token
gatomic.c: In function 'g_atomic_int_exchange_and_add':
gatomic.c:906: warning: implicit declaration of function 'g_mutex_lock'
gatomic.c:906: error: 'g_atomic_mutex' undeclared (first use in this function)
gatomic.c:906: error: (Each undeclared identifier is reported only once
gatomic.c:906: error: for each function it appears in.)
gatomic.c:909: warning: implicit declaration of function 'g_mutex_unlock'
gatomic.c: In function 'g_atomic_int_add':
gatomic.c:928: error: 'g_atomic_mutex' undeclared (first use in this function)
gatomic.c: In function 'g_atomic_int_compare_and_exchange':
gatomic.c:954: error: 'g_atomic_mutex' undeclared (first use in this function)
gatomic.c: In function 'g_atomic_pointer_compare_and_exchange':
gatomic.c:988: error: 'g_atomic_mutex' undeclared (first use in this function)
gatomic.c: In function '_g_atomic_thread_init':
gatomic.c:1155: error: 'g_atomic_mutex' undeclared (first use in this function)
gatomic.c:1155: warning: implicit declaration of function 'g_mutex_new'
make[5]: *** [gatomic.lo] Error 1
make[5]: *** Waiting for unfinished jobs....
mv -f .deps/garray.Tpo .deps/garray.Plo
make[5]: Leaving directory
`/local/home/src/buildroot-2010.11-rc1/output/build/libglib2-2.26.0/glib'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/local/home/src/buildroot-2010.11-rc1/output/build/libglib2-2.26.0/glib'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/local/home/src/buildroot-2010.11-rc1/output/build/libglib2-2.26.0/glib'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/local/home/src/buildroot-2010.11-rc1/output/build/libglib2-2.26.0'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/local/home/src/buildroot-2010.11-rc1/output/build/libglib2-2.26.0'

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
