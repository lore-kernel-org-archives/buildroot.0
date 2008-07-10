From: Joseph G. Boike <joe.boike@acsatlanta.com>
Date: Thu, 10 Jul 2008 13:49:19 -0500
Subject: [Buildroot] build failure mbstate_t not declared
Message-ID: <487659AF.8090904@acsatlanta.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I checked out the latest buildroot and tried to build it but keep 
getting errors regarding mbstate_t not being declared.
Here's a section of the output (there are many more lines with the same 
error, but I wanted to keep the post short.)
Any suggestions?
Regards,
Joe

/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/./gcc/xgcc 
-B/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/./gcc/ 
-B/usr/arm-linux-uclibc/bin/ -B/usr/arm-linux-uclibc/lib/ -isystem 
/usr/arm-linux-uclibc/include -isystem /usr/arm-linux-uclibc/sys-include 
-DHAVE_CONFIG_H -I. 
-I/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1/libssp -I. -Wall 
-g -Os -MT sprintf-chk.lo -MD -MP -MF .deps/sprintf-chk.Tpo -c 
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1/libssp/sprintf-chk.c 
-o sprintf-chk.o >/dev/null 2>&1
if /bin/sh ./libtool --mode=compile 
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/./gcc/xgcc 
-B/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/./gcc/ 
-B/usr/arm-linux-uclibc/bin/ -B/usr/arm-linux-uclibc/lib/ -isystem 
/usr/arm-linux-uclibc/include -isystem /usr/arm-linux-uclibc/sys-include 
-DHAVE_CONFIG_H -I. 
-I/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1/libssp -I.    
-Wall -g -Os -MT stpcpy-chk.lo -MD -MP -MF ".deps/stpcpy-chk.Tpo" -c -o 
stpcpy-chk.lo 
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1/libssp/stpcpy-chk.c; \
    then mv -f ".deps/stpcpy-chk.Tpo" ".deps/stpcpy-chk.Plo"; else rm -f 
".deps/stpcpy-chk.Tpo"; exit 1; fi
if /bin/sh ./libtool --mode=compile 
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/./gcc/xgcc 
-B/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/./gcc/ 
-B/usr/arm-linux-uclibc/bin/ -B/usr/arm-linux-uclibc/lib/ -isystem 
/usr/arm-linux-uclibc/include -isystem /usr/arm-linux-uclibc/sys-include 
-DHAVE_CONFIG_H -I. 
-I/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1/libssp -I.    
-Wall -g -Os -MT strcat-chk.lo -MD -MP -MF ".deps/strcat-chk.Tpo" -c -o 
strcat-chk.lo 
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1/libssp/strcat-chk.c; \
    then mv -f ".deps/strcat-chk.Tpo" ".deps/strcat-chk.Plo"; else rm -f 
".deps/strcat-chk.Tpo"; exit 1; fi
In file included from 
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libstdc++-v3/include/bits/postypes.h:46,
                 from 
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libstdc++-v3/include/iosfwd:49,
                 from 
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libstdc++-v3/include/bits/stl_algobase.h:70,
                 from 
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libstdc++-v3/include/algorithm:65,
                 from 
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1/libstdc++-v3/include/precompiled/stdc++.h:55:
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libstdc++-v3/include/cwchar:72: 
error: '::mbstate_t' has not been declared
In file included from 
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libstdc++-v3/include/iosfwd:49,
                 from 
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libstdc++-v3/include/bits/stl_algobase.h:70,
                 from 
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libstdc++-v3/include/algorithm:65,
                 from 
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1/libstdc++-v3/include/precompiled/stdc++.h:55:
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libstdc++-v3/include/bits/postypes.h:211: 
error: 'mbstate_t' was not declared in this scope
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libstdc++-v3/include/bits/postypes.h:211: 
error: template argument 1 is invalid
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libstdc++-v3/include/bits/postypes.h:211: 
error: invalid type in declaration before ';' token
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libstdc++-v3/include/bits/postypes.h:213: 
error: 'mbstate_t' was not declared in this scope
/home/lorenzo/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libstdc++-v3/include/bits/postypes.h:213: 
error: template argument 1 is invalid
