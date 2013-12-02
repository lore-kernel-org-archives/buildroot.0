From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Dec 2013 11:54:13 +0100
Subject: [Buildroot] [PATCH] tar: bump to version 1.27.1
In-Reply-To: <1385980868-2000-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 2 Dec 2013 07:41:08 -0300")
References: <1385980868-2000-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ob4zr0a2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Doesn't seem to work here:

make host-tar
..
>>> host-tar 1.27.1 Building
PATH=/home/peko/source/buildroot/output/host/bin:/home/peko/source/buildroot/output/host/usr/bin:/home/peko/bin:/home/peko/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games LD_LIBRARY_PATH="/home/peko/source/buildroot/output/host/usr/lib:" PKG_CONFIG="/home/peko/source/buildroot/output/host/usr/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_LIBDIR="/home/peko/source/buildroot/output/host/usr/lib/pkgconfig" PERLLIB="/home/peko/source/buildroot/output/host/usr/lib/perl"  /usr/bin/make -j5  -C /home/peko/source/buildroot/output/build/host-tar-1.27.1/
make[1]: Entering directory `/home/peko/source/buildroot/output/build/host-tar-1.27.1'
 cd . && /bin/sh /home/peko/source/buildroot/output/build/host-tar-1.27.1/build-aux/missing automake-1.14 --gnits
/home/peko/source/buildroot/output/build/host-tar-1.27.1/build-aux/missing: line 81: automake-1.14: command not found
WARNING: 'automake-1.14' is missing on your system.
         You should only need it if you modified 'Makefile.am' or
         'configure.ac' or m4 files included by 'configure.ac'.
         The 'automake' program is part of the GNU Automake package:
         <http://www.gnu.org/software/automake>
         It also requires GNU Autoconf, GNU m4 and Perl in order to run:
         <http://www.gnu.org/software/autoconf>
         <http://www.gnu.org/software/m4/>
         <http://www.perl.org/>
make[1]: *** [Makefile.in] Error 1
make[1]: Leaving directory `/home/peko/source/buildroot/output/build/host-tar-1.27.1'
make: *** [/home/peko/source/buildroot/output/build/host-tar-1.27.1/.stamp_built] Error 2

I'm not sure why it thinks it needs automake as we don't patch anything.

Any ideas?

-- 
Bye, Peter Korsgaard
