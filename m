From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 26 May 2020 06:17:35 +0000
Subject: [Buildroot] [Bug 12946] Grub: Decompressor is too big.
In-Reply-To: <bug-12946-163@https.bugs.busybox.net/>
References: <bug-12946-163@https.bugs.busybox.net/>
Message-ID: <bug-12946-163-X7wONUw6BY@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12946

--- Comment #2 from Stefan Walter <stefan.walter@iml.fraunhofer.de> ---
Hi,

thanks for the patch! Unfortunately, the build of host-grub2 of the patched
Buildroot fails with an automake version mismatch:

mv Makefile.util.am.new Makefile.util.am
 cd . && /bin/bash
/home/vagrant/src/myproject/build/buildroot-src/buildroot-2020.02.2/output/build/host-grub2-2.04/build-aux/missing
automake-1.15 --gnu Makefile
configure.ac:48: error: version mismatch.  This is Automake 1.15.1,
configure.ac:48: but the definition used by this AM_INIT_AUTOMAKE
configure.ac:48: comes from Automake 1.15.  You should recreate
configure.ac:48: aclocal.m4 with aclocal and run automake again.
WARNING: 'automake-1.15' is probably too old.
         You should only need it if you modified 'Makefile.am' or
         'configure.ac' or m4 files included by 'configure.ac'.
         The 'automake' program is part of the GNU Automake package:
         <http://www.gnu.org/software/automake>
         It also requires GNU Autoconf, GNU m4 and Perl in order to run:
         <http://www.gnu.org/software/autoconf>
         <http://www.gnu.org/software/m4/>
         <http://www.perl.org/>
make[1]: *** [Makefile:3350: Makefile.in] Error 63

Best regards,
Stefan

-- 
You are receiving this mail because:
You are on the CC list for the bug.
