From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 10 May 2020 14:51:11 +0000
Subject: [Buildroot] [Bug 12876] New: putilimp.h **error**: missing binary
 operator before token "(" #elif __has_builtin(__c11_atomic_load) && \
Message-ID: <bug-12876-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12876

            Bug ID: 12876
           Summary: putilimp.h **error**: missing binary operator before
                    token "(" #elif __has_builtin(__c11_atomic_load) && \
           Product: buildroot
           Version: 2020.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: yogesh2760781 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

while make on buildroot following Error is coming. here is log

  /home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/host/bin/ccache
/usr/bin/g++ -o
/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/tzgnames.o
../deps/icu-small/source/i18n/tzgnames.cpp '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DU_I18N_IMPLEMENTATION=1' '-DU_ATTRIBUTE_DEPRECATED='
'-D_CRT_SECURE_NO_DEPRECATE=' '-DU_STATIC_IMPLEMENTATION=1'
'-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0' '-DU_HAVE_STD_STRING=1'
'-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/host/include
-I/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/build/host-nodejs-12.16.1/out/Release/.deps//home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/tzgnames.o.d.raw
-I/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/host/include -O2
-I/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/host/include -c
  /home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/host/bin/ccache
/usr/bin/g++ -o
/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/rbt_pars.o
../deps/icu-small/source/i18n/rbt_pars.cpp '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DU_I18N_IMPLEMENTATION=1' '-DU_ATTRIBUTE_DEPRECATED='
'-D_CRT_SECURE_NO_DEPRECATE=' '-DU_STATIC_IMPLEMENTATION=1'
'-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0' '-DU_HAVE_STD_STRING=1'
'-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/host/include
-I/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/build/host-nodejs-12.16.1/out/Release/.deps//home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/rbt_pars.o.d.raw
-I/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/host/include -O2
-I/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/host/include -c
In file included from ../deps/icu-small/source/i18n/rbt_pars.cpp:43:0:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/common/umutex.h:31:0,
                 from ../deps/icu-small/source/common/mutex.h:27,
                 from ../deps/icu-small/source/i18n/tzgnames.cpp:26:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
tools/icu/icui18n.target.mk:337: recipe for target
'/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/rbt_pars.o'
failed
make[2]: ***
[/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/rbt_pars.o]
Error 1
make[2]: *** Waiting for unfinished jobs....
tools/icu/icui18n.target.mk:337: recipe for target
'/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/tzgnames.o'
failed
make[2]: ***
[/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/tzgnames.o]
Error 1
Makefile:101: recipe for target 'node' failed
make[1]: *** [node] Error 2
make[1]: Leaving directory
'/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/build/host-nodejs-12.16.1'
package/pkg-generic.mk:266: recipe for target
'/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/build/host-nodejs-12.16.1/.stamp_built'
failed
make: ***
[/home/linuxguru/Desktop/buildroot/buildroot-2020.02/output/build/host-nodejs-12.16.1/.stamp_built]
Error 2


uname -a
Linux ptinstitute 5.3.0-51-generic #44~18.04.2-Ubuntu SMP Thu Apr 23 14:27:18
UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

-- 
You are receiving this mail because:
You are on the CC list for the bug.
