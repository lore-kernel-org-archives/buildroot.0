From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 05 Jan 2020 02:01:09 +0000
Subject: [Buildroot] [Bug 12446] New: Buildroot fails to finish installing
 packages
Message-ID: <bug-12446-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12446

            Bug ID: 12446
           Summary: Buildroot fails to finish installing packages
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: spaceboyross at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm using a forked version of Buildroot for my OS called ExpidusOS
(https://github.com/ExpidusOS). After SDDM is installed, Make fails to create
the `.stamp_target_installed` file. Then it works at xfont_font-misc-misc
package but fails when installing Linux. This is the output:

>>> xapp_xkbcomp 1.4.2 Installing to target
PATH="/home/ross/ExpidusOS/buildroot/output/host/bin:/home/ross/ExpidusOS/buildroot/output/host/sbin:/home/ross/Applications/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/emscripten:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/ross/.gem/ruby/2.6.0/bin:/opt/toolchains/dc/sh-elf/bin:/opt/toolchains/dc/bin:/opt/toolchains/dc/kos/utils/gnu_wrappers:/home/ross/.gem/ruby/2.6.0/bin:/opt/toolchains/dc/sh-elf/bin:/opt/toolchains/dc/bin:/opt/toolchains/dc/kos/utils/gnu_wrappers"
 /usr/bin/make -j5 DESTDIR=/home/ross/ExpidusOS/buildroot/output/target install
-C /home/ross/ExpidusOS/buildroot/output/build/xapp_xkbcomp-1.4.2/
make[1]: Entering directory
'/home/ross/ExpidusOS/buildroot/output/build/xapp_xkbcomp-1.4.2'
Making install in man
make[2]: Entering directory
'/home/ross/ExpidusOS/buildroot/output/build/xapp_xkbcomp-1.4.2/man'
make[3]: Entering directory
'/home/ross/ExpidusOS/buildroot/output/build/xapp_xkbcomp-1.4.2/man'
make[3]: Nothing to be done for 'install-exec-am'.
 /usr/bin/mkdir -p
'/home/ross/ExpidusOS/buildroot/output/target/usr/share/man/man1'
 /usr/bin/install -c -m 644 xkbcomp.1
'/home/ross/ExpidusOS/buildroot/output/target/usr/share/man/man1'
make[3]: Leaving directory
'/home/ross/ExpidusOS/buildroot/output/build/xapp_xkbcomp-1.4.2/man'
make[2]: Leaving directory
'/home/ross/ExpidusOS/buildroot/output/build/xapp_xkbcomp-1.4.2/man'
make[2]: Entering directory
'/home/ross/ExpidusOS/buildroot/output/build/xapp_xkbcomp-1.4.2'
make[3]: Entering directory
'/home/ross/ExpidusOS/buildroot/output/build/xapp_xkbcomp-1.4.2'
 /usr/bin/mkdir -p '/home/ross/ExpidusOS/buildroot/output/target/usr/bin'
 /usr/bin/mkdir -p
'/home/ross/ExpidusOS/buildroot/output/target/usr/lib/pkgconfig'
 /usr/bin/install -c -m 644 xkbcomp.pc
'/home/ross/ExpidusOS/buildroot/output/target/usr/lib/pkgconfig'
  /usr/bin/install -c xkbcomp
'/home/ross/ExpidusOS/buildroot/output/target/usr/bin'
make[3]: Leaving directory
'/home/ross/ExpidusOS/buildroot/output/build/xapp_xkbcomp-1.4.2'
make[2]: Leaving directory
'/home/ross/ExpidusOS/buildroot/output/build/xapp_xkbcomp-1.4.2'
make[1]: Leaving directory
'/home/ross/ExpidusOS/buildroot/output/build/xapp_xkbcomp-1.4.2'
xapp_xkbcomp: installs files in
/home/ross/ExpidusOS/buildroot/output/target//home/ross/ExpidusOS/buildroot/output
make: *** [package/pkg-generic.mk:360:
/home/ross/ExpidusOS/buildroot/output/build/xapp_xkbcomp-1.4.2/.stamp_target_installed]
Error 1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
