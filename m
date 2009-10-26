From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 26 Oct 2009 10:43:25 +0100
Subject: [Buildroot] Autoconf still not building (M4 ) results getting
	weird
In-Reply-To: <874opnzahs.fsf@macbook.be.48ers.dk>
Message-ID: <DDD07AB0502A41359466B334077C87CC@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi All

I modified the configure script to try to see what is going on (i run
buildroot make)
As soon as it found the M4 i run a few m4 --version checks and then i force
an exit 

It seems to execute m4 but i find no file conftest.m4f created !!!???
The --version is executed as seen from he output so the m4 path variable is
correct.

If i execute it from the command line, or from a small script then the
conftest.m4f is created.

So for an unknown reason m4 -F is not working .

Noel, what are your findings ?


Snip
do
  IFS=$as_save_IFS
  test -z "$as_dir" && as_dir=.
    for ac_prog in m4 gm4 gnum4; do
    for ac_exec_ext in '' $ac_executable_extensions; do
      ac_path_M4="$as_dir/$ac_prog$ac_exec_ext"
      sleep 1
      { test -f "$ac_path_M4" && $as_test_x "$ac_path_M4"; } || continue
      # Root out GNU M4 1.4.5, as well as non-GNU m4 that ignore -t, -F.
      echo "Found M4 HERE :ac_path_M4=[$ac_path_M4]"
      echo "now executing to get version info"
      $ac_path_M4 --version
      echo "doing conftest"
      $ac_path_M4 --freeze-state=conftest.m4f </dev/null
      m4 --freeze-state=conftest.m4f </dev/null
      echo "now executing again to get version info" 
      $ac_path_M4 --version
      #force exit here
      exit 124
      ac_snippet=change'quote(<,>)in''dir(<if''def>,mac,bug)d'nl
      test -z "`$ac_path_M4 -F conftest.m4f </dev/null 2>&1`" \
      && test -z "`echo $ac_snippet | $ac_path_M4 --trace=mac 2>&1`" \
      && test -f conftest.m4f \
      && ac_cv_path_M4=$ac_path_M4 ac_path_M4_found=:
      echo "NOT EXECUTING rm -f conftest.m4f"
      $ac_path_M4_found && break 3
    done
  done
  done
snip
 
This is the result from running make :


Checking build system dependencies:
Overriding $(DL_DIR) in '.config'.		Ok
External download directory:			Ok (/home/johan/dl)
CC clean:					Ok
CXX clean:					Ok
CPP clean:					Ok
CFLAGS clean:					Ok
INCLUDES clean:					Ok
CXXFLAGS clean:					Ok
which installed:				Ok
sed works:					Ok (/bin/sed)
GNU make version '3.81':			Ok
C compiler '/usr/bin/gcc'
C compiler version '4.3.2':			Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.3.2':			Ok
awk installed:					Ok
bash installed:					Ok
bison installed:				Ok
flex installed:					Ok
gettext installed:				Ok
makeinfo installed:				Ok
patch installed:				Ok
Build system dependencies:			Ok

rm -rf /home/johan/buildroot/output/build/buildroot-config
mkdir -p /home/johan/buildroot/output/build
cp -dpRf package/config/buildroot-config
/home/johan/buildroot/output/build/buildroot-config
cp -dpf /home/johan/buildroot/output/build/u-boot-2009.06/tools/mkimage
/home/johan/buildroot/output/build/staging_dir/usr/bin/
(cd /home/johan/buildroot/output/build/autoconf-2.64-host; rm -rf
config.cache; \
	
PATH=/home/johan/buildroot/output/host/bin:/home/johan/buildroot/output/host
/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/g
ames:/home/johan/buildroot/build_arm/staging_dir/usr/bin AR="/usr/bin/ar"
AS="/usr/bin/as" LD="/usr/bin/ld -L/home/johan/buildroot/output/host/lib
-L/home/johan/buildroot/output/host/usr/lib" NM="/usr/bin/nm"
CC="/usr/bin/gcc -I/home/johan/buildroot/output/host/include
-I/home/johan/buildroot/output/host/usr/include" GCC="/usr/bin/gcc
-I/home/johan/buildroot/output/host/include
-I/home/johan/buildroot/output/host/usr/include" CXX="/usr/bin/g++
-I/home/johan/buildroot/output/host/include
-I/home/johan/buildroot/output/host/usr/include" CPP="/usr/bin/cpp
-I/home/johan/buildroot/output/host/include
-I/home/johan/buildroot/output/host/usr/include" AR_FOR_BUILD="/usr/bin/ar"
AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc"
GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++"
LD_FOR_BUILD="/usr/bin/ld" FC_FOR_BUILD="/usr/bin/ld"
CFLAGS_FOR_BUILD="-I/home/johan/buildroot/output/host/include
-I/home/johan/buildroot/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-I/home/johan/buildroot/output/host/include
-I/home/johan/buildroot/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/johan/buildroot/output/host/lib
-L/home/johan/buildroot/output/host/usr/lib" FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-li
nux-uclibc-ar"
AS_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-li
nux-uclibc-as"
CC_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-li
nux-uclibc-gcc"
LD_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-li
nux-uclibc-ld"
NM_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-li
nux-uclibc-nm"
RANLIB_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/bin/ar
m-linux-uclibc-ranlib"
STRIP_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm
-linux-uclibc-strip"
OBJCOPY_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/bin/a
rm-linux-uclibc-objcopy"
OBJDUMP_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/bin/a
rm-linux-uclibc-objdump"
DEFAULT_ASSEMBLER="/home/johan/buildroot/output/build/staging_dir/usr/bin/ar
m-linux-uclibc-as"
DEFAULT_LINKER="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-l
inux-uclibc-ld"
ORIGINAL_AS_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/b
in/arm-linux-uclibc-as"
ORIGINAL_LD_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/b
in/arm-linux-uclibc-ld"
ORIGINAL_NM_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/b
in/arm-linux-uclibc-nm"
ORIGINAL_OBJDUMP_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/
usr/bin/arm-linux-uclibc-objdump"
PKG_CONFIG="/home/johan/buildroot/output/host/usr/bin/pkg-config"
PKG_CONFIG_LIBDIR="/home/johan/buildroot/output/host/usr/lib/pkgconfig" \
		CFLAGS="-I/home/johan/buildroot/output/host/include
-I/home/johan/buildroot/output/host/usr/include" \
		LDFLAGS="-L/home/johan/buildroot/output/host/lib
-L/home/johan/buildroot/output/host/usr/lib"; \
		echo "installing in
/home/johan/buildroot/output/host/usr/bin"; \
		export M_4=/home/johan/buildroot/output/host/usr/bin/m4 ; \
		./configure
--prefix="/home/johan/buildroot/output/host/usr"
--sysconfdir="/home/johan/buildroot/output/host/etc" ;\
		)
installing in /home/johan/buildroot/output/host/usr/bin
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking whether /bin/sh -n is known to work... no
checking for characters that cannot appear in file names... none
checking whether directories can have trailing spaces... yes
checking for expr... /usr/bin/expr
checking for GNU M4 that supports accurate traces... 

******* TESTING BEGINS HERE *****************
Found M4 HERE :ac_path_M4=[/home/johan/buildroot/output/host/usr/bin/m4]
now executing to get version info
m4 (GNU M4) 1.4.13
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Rene' Seindal.
doing conftest
now executing again to get version info
m4 (GNU M4) 1.4.13
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Rene' Seindal.
make: *** [/home/johan/buildroot/output/stamps/host_autoconf_configured]
Error 124



-----Oorspronkelijk bericht-----
Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
Verzonden: zondag 25 oktober 2009 17:47
Aan: Sagaert Johan
CC: 'Peter Korsgaard'; buildroot at uclibc.org; llandwerlin at gmail.com; Noel
Vellemans
Onderwerp: Re: [Buildroot] Autoconf still not building (M4 ) results

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi 

 Sagaert> There seems to be a problem somewhere in the configure script
Sagaert> of autoconf 2.64

Exactly.

 Sagaert> I found a way to solve it by setting the M4 variable in the
Sagaert> makefile (line 42) so the configure script does not have to
Sagaert> parse and find the m4 path.

Ok, that's atleast a workaround, but I would like to understand what the
problem is exactly.

 Sagaert> Something seems to go wrong in the tests done around line 2378 in
the  Sagaert> configure script (compare with configure script of v2.63 )

 Sagaert> Snip
 Sagaert>    { test -f "$ac_path_M4" && $as_test_x "$ac_path_M4"; } ||
continue
 Sagaert>       # Root out GNU M4 1.4.5, as well as non-GNU m4 that ignore
-t, -F.
 Sagaert>       ac_snippet=change'quote(<,>)in''dir(<if''def>,mac,bug)'
 Sagaert>       ac_snippet=${ac_snippet}pat'subst(a,\(b\)\|\(a\),\1)d'nl
 Sagaert>       echo "ac_snippet2=$ac_snippet"
 Sagaert>       test -z "`$ac_path_M4 -F conftest.m4f </dev/null 2>&1`" \
 Sagaert>       && test -z "`echo $ac_snippet | $ac_path_M4 --trace=mac
2>&1`" \
 Sagaert> snip

Indeed. Could you try sticking in a few debug echo lines, to figure out
what's going on?

 Sagaert> Meanwhile it might be a good idea to update the m4 package in
buildroot to  Sagaert> 1.4.13 instead of the current 1.4.9

Indeed. But you wrote something earlier about that not having any effect on
the above problem, right?

--
Bye, Peter Korsgaard
