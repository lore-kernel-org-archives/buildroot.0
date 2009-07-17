From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Jul 2009 15:56:29 +0000 (UTC)
Subject: [Buildroot] [Bug 469] New: build of libgtk2 for host incorrectly
 assumes that X.org development files are installed
Message-ID: <bug-469-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=469

           Summary: build of libgtk2 for host incorrectly assumes that X.org
                    development files are installed
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: jacmet at uclibc.org
        ReportedBy: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When building libgtk2 for the host, I get a failure :

 /usr/bin/gcc -I/home/thomas/local/buildroot-test/build_arm/host_dir/include
-I/home/thomas/local/buildroot-test/build_arm/host_dir/usr/include
-DHAVE_CONFIG_H -I. -I. -I../.. -DG_LOG_DOMAIN=\"Gdk\" -DGDK_COMPILATION
-I../.. -I../../gdk -I../../gdk -DGDK_PIXBUF_DISABLE_DEPRECATED
-DG_DISABLE_ASSERT -DG_DISABLE_CHECKS -DG_DISABLE_CAST_CHECKS -pthread
-I/home/thomas/local/buildroot-test/build_arm/host_dir/usr/include/glib-2.0
-I/home/thomas/local/buildroot-test/build_arm/host_dir/usr/lib/glib-2.0/include
-I/home/thomas/local/buildroot-test/build_arm/host_dir/usr/include/pango-1.0
-I/home/thomas/local/buildroot-test/build_arm/host_dir/usr/include/cairo
-I/home/thomas/local/buildroot-test/build_arm/host_dir/usr/include/freetype2
-I/home/thomas/local/buildroot-test/build_arm/host_dir/usr/include
-I/home/thomas/local/buildroot-test/build_arm/host_dir/usr/include/pixman-1
-I/home/thomas/local/buildroot-test/build_arm/host_dir/include
-I/home/thomas/local/buildroot-test/build_arm/host_dir/usr/include -Wall -MT
gdkasync.lo -MD -MP -MF .deps/gdkasync.Tpo -c gdkasync.c  -fPIC -DPIC -o
.libs/gdkasync.o
In file included from gdkprivate-x11.h:36,
                 from gdkx.h:81,
                 from gdkasync.c:52:
../../gdk/x11/gdkwindow-x11.h:33:36: error: X11/extensions/Xdamage.h: No such
file or directory
make[5]: *** [gdkasync.lo] Error 1

This is because libxdamage-dev is not installed on my system. The rest of the
compilation works because some other X.org development files are installed on
my system. But that's just pure coincidence.

With this build of libgtk2 for the host, the X.org development files basically
became a requirement for Buildroot to work properly, which is a shame.

Also, building gtk2 twice (once for the host, once for the target) takes a lot
of time. And the build for the host is done only for a few command line tools.

Isn't it possible to improve all this ?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
