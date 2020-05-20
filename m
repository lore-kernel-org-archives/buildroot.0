From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 20 May 2020 10:03:22 +0000
Subject: [Buildroot] [Bug 12921] New: nodejs-12.16.1: error: overriding
 'virtual icu_65::DateFormat* icu_65::DateFormat::clone() const'
Message-ID: <bug-12921-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12921

            Bug ID: 12921
           Summary: nodejs-12.16.1: error:   overriding 'virtual
                    icu_65::DateFormat* icu_65::DateFormat::clone() const'
           Product: buildroot
           Version: 2020.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: seems.deviant at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

This happens on:

aa13c9667c (HEAD -> master, origin/master, origin/HEAD) DEVELOPERS: drop
Stephan Hoffmann

With config:

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_NODEJS=y
BR2_PACKAGE_ICU=y

When both nodejs and icu packages are selected, "make all" results in
compilation error:

 /usr/bin/g++ -o
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/plurrule.o
../deps/icu-small/source/i18n/plurrule.cpp '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DU_I18N_IMPLEMENTATION=1' '-DU_ATTRIBUTE_DEPRECATED='
'-D_CRT_SECURE_NO_DEPRECATE=' '-DU_STATIC_IMPLEMENTATION=1'
'-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0' '-DU_HAVE_STD_STRING=1'
'-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/plurrule.o.d.raw
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -O2
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -c
  /usr/bin/g++ -o
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/zonemeta.o
../deps/icu-small/source/i18n/zonemeta.cpp '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DU_I18N_IMPLEMENTATION=1' '-DU_ATTRIBUTE_DEPRECATED='
'-D_CRT_SECURE_NO_DEPRECATE=' '-DU_STATIC_IMPLEMENTATION=1'
'-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0' '-DU_HAVE_STD_STRING=1'
'-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/zonemeta.o.d.raw
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -O2
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -c
In file included from ../deps/icu-small/source/common/umutex.h:31:0,
                 from ../deps/icu-small/source/common/mutex.h:27,
                 from ../deps/icu-small/source/common/normalizer2impl.h:32,
                 from ../deps/icu-small/source/i18n/collationdata.h:24,
                 from ../deps/icu-small/source/i18n/collationbuilder.cpp:37:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/i18n/decContext.h:33:0,
                 from ../deps/icu-small/source/i18n/decNumber.h:40,
                 from ../deps/icu-small/source/i18n/number_asformat.h:18,
                 from ../deps/icu-small/source/i18n/number_asformat.cpp:14:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/common/uresdata.h:24:0,
                 from ../deps/icu-small/source/common/uresimp.h:16,
                 from ../deps/icu-small/source/i18n/measfmt.cpp:27:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/common/umutex.h:31:0,
                 from ../deps/icu-small/source/i18n/udat.cpp:30:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/common/utrie2.h:24:0,
                 from ../deps/icu-small/source/i18n/uspoof_impl.cpp:15:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/common/umutex.h:31:0,
                 from ../deps/icu-small/source/i18n/coptccal.cpp:14:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/common/umutex.h:31:0,
                 from ../deps/icu-small/source/common/mutex.h:27,
                 from ../deps/icu-small/source/common/normalizer2impl.h:32,
                 from ../deps/icu-small/source/i18n/collationdata.h:24,
                 from ../deps/icu-small/source/i18n/collationtailoring.cpp:24:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/common/umutex.h:31:0,
                 from ../deps/icu-small/source/common/mutex.h:27,
                 from ../deps/icu-small/source/i18n/dtitvfmt.cpp:29:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/i18n/decContext.h:33:0,
                 from ../deps/icu-small/source/i18n/decNumber.h:40,
                 from ../deps/icu-small/source/i18n/number_utils.h:18,
                 from ../deps/icu-small/source/i18n/number_formatimpl.h:13,
                 from ../deps/icu-small/source/i18n/numrange_impl.h:15,
                 from ../deps/icu-small/source/i18n/numrange_impl.cpp:13:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/common/umutex.h:31:0,
                 from ../deps/icu-small/source/common/mutex.h:27,
                 from ../deps/icu-small/source/common/normalizer2impl.h:32,
                 from ../deps/icu-small/source/i18n/collationdata.h:24,
                 from ../deps/icu-small/source/i18n/collationiterator.h:23,
                 from ../deps/icu-small/source/i18n/collationkeys.cpp:20:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/i18n/decContext.h:33:0,
                 from ../deps/icu-small/source/i18n/decNumber.h:40,
                 from ../deps/icu-small/source/i18n/number_utils.h:18,
                 from ../deps/icu-small/source/i18n/number_formatimpl.h:13,
                 from ../deps/icu-small/source/i18n/numrange_impl.h:15,
                 from ../deps/icu-small/source/i18n/numrange_fluent.cpp:12:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/i18n/gregoimp.h:21:0,
                 from ../deps/icu-small/source/i18n/erarules.cpp:18:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
  /usr/bin/g++ -o
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/csrutf8.o
../deps/icu-small/source/i18n/csrutf8.cpp '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DU_I18N_IMPLEMENTATION=1' '-DU_ATTRIBUTE_DEPRECATED='
'-D_CRT_SECURE_NO_DEPRECATE=' '-DU_STATIC_IMPLEMENTATION=1'
'-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0' '-DU_HAVE_STD_STRING=1'
'-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/csrutf8.o.d.raw
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -O2
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -c
In file included from ../deps/icu-small/source/common/umutex.h:31:0,
                 from ../deps/icu-small/source/common/mutex.h:27,
                 from ../deps/icu-small/source/i18n/uspoof.cpp:25:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/common/umutex.h:31:0,
                 from ../deps/icu-small/source/common/mutex.h:27,
                 from ../deps/icu-small/source/i18n/plurrule.cpp:27:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/common/umutex.h:31:0,
                 from ../deps/icu-small/source/i18n/zonemeta.cpp:21:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
  /usr/bin/g++ -o
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/currpinf.o
../deps/icu-small/source/i18n/currpinf.cpp '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DU_I18N_IMPLEMENTATION=1' '-DU_ATTRIBUTE_DEPRECATED='
'-D_CRT_SECURE_NO_DEPRECATE=' '-DU_STATIC_IMPLEMENTATION=1'
'-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0' '-DU_HAVE_STD_STRING=1'
'-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/currpinf.o.d.raw
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -O2
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -c
  /usr/bin/g++ -o
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/islamcal.o
../deps/icu-small/source/i18n/islamcal.cpp '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DU_I18N_IMPLEMENTATION=1' '-DU_ATTRIBUTE_DEPRECATED='
'-D_CRT_SECURE_NO_DEPRECATE=' '-DU_STATIC_IMPLEMENTATION=1'
'-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0' '-DU_HAVE_STD_STRING=1'
'-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/islamcal.o.d.raw
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -O2
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -c
  /usr/bin/g++ -o
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/utf8collationiterator.o
../deps/icu-small/source/i18n/utf8collationiterator.cpp
'-DV8_DEPRECATION_WARNINGS' '-DV8_IMMINENT_DEPRECATION_WARNINGS'
'-D__STDC_FORMAT_MACROS' '-DU_I18N_IMPLEMENTATION=1'
'-DU_ATTRIBUTE_DEPRECATED=' '-D_CRT_SECURE_NO_DEPRECATE='
'-DU_STATIC_IMPLEMENTATION=1' '-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0'
'-DU_HAVE_STD_STRING=1' '-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/utf8collationiterator.o.d.raw
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -O2
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -c
  /usr/bin/g++ -o
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/csr2022.o
../deps/icu-small/source/i18n/csr2022.cpp '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DU_I18N_IMPLEMENTATION=1' '-DU_ATTRIBUTE_DEPRECATED='
'-D_CRT_SECURE_NO_DEPRECATE=' '-DU_STATIC_IMPLEMENTATION=1'
'-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0' '-DU_HAVE_STD_STRING=1'
'-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/csr2022.o.d.raw
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -O2
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -c
  /usr/bin/g++ -o
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/casetrn.o
../deps/icu-small/source/i18n/casetrn.cpp '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DU_I18N_IMPLEMENTATION=1' '-DU_ATTRIBUTE_DEPRECATED='
'-D_CRT_SECURE_NO_DEPRECATE=' '-DU_STATIC_IMPLEMENTATION=1'
'-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0' '-DU_HAVE_STD_STRING=1'
'-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/casetrn.o.d.raw
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -O2
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -c
In file included from ../deps/icu-small/source/common/uresdata.h:24:0,
                 from ../deps/icu-small/source/common/uresimp.h:16,
                 from ../deps/icu-small/source/i18n/currpinf.cpp:27:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/common/umutex.h:31:0,
                 from ../deps/icu-small/source/i18n/islamcal.cpp:22:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/common/umutex.h:31:0,
                 from ../deps/icu-small/source/common/mutex.h:27,
                 from ../deps/icu-small/source/common/normalizer2impl.h:32,
                 from ../deps/icu-small/source/i18n/collationdata.h:24,
                 from
../deps/icu-small/source/i18n/utf8collationiterator.cpp:22:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
  /usr/bin/g++ -o
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/unesctrn.o
../deps/icu-small/source/i18n/unesctrn.cpp '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DU_I18N_IMPLEMENTATION=1' '-DU_ATTRIBUTE_DEPRECATED='
'-D_CRT_SECURE_NO_DEPRECATE=' '-DU_STATIC_IMPLEMENTATION=1'
'-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0' '-DU_HAVE_STD_STRING=1'
'-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/unesctrn.o.d.raw
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -O2
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -c
  /usr/bin/g++ -o
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/listformatter.o
../deps/icu-small/source/i18n/listformatter.cpp '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DU_I18N_IMPLEMENTATION=1' '-DU_ATTRIBUTE_DEPRECATED='
'-D_CRT_SECURE_NO_DEPRECATE=' '-DU_STATIC_IMPLEMENTATION=1'
'-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0' '-DU_HAVE_STD_STRING=1'
'-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/listformatter.o.d.raw
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -O2
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -c
In file included from ../deps/icu-small/source/common/ucase.h:26:0,
                 from ../deps/icu-small/source/i18n/casetrn.h:29,
                 from ../deps/icu-small/source/i18n/tolowtrn.h:20,
                 from ../deps/icu-small/source/i18n/casetrn.cpp:29:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
  /usr/bin/g++ -o
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/dtfmtsym.o
../deps/icu-small/source/i18n/dtfmtsym.cpp '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DU_I18N_IMPLEMENTATION=1' '-DU_ATTRIBUTE_DEPRECATED='
'-D_CRT_SECURE_NO_DEPRECATE=' '-DU_STATIC_IMPLEMENTATION=1'
'-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0' '-DU_HAVE_STD_STRING=1'
'-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-In
file included from ../deps/icu-small/source/common/umutex.h:31:0,
                 from ../deps/icu-small/source/common/mutex.h:27,
                 from ../deps/icu-small/source/i18n/listformatter.cpp:25:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/dtfmtsym.o.d.raw
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -O2
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -c
In file included from ../deps/icu-small/source/i18n/ucal.cpp:21:0:
../deps/icu-small/source/i18n/unicode/simpletz.h:706:23: error: invalid
covariant return type for 'virtual icu_65::TimeZone*
icu_65::SimpleTimeZone::clone() const'
     virtual TimeZone* clone(void) const;
                       ^~~~~
In file included from ../deps/icu-small/source/i18n/unicode/simpletz.h:38:0,
                 from ../deps/icu-small/source/i18n/ucal.cpp:21:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/basictz.h:52:28:
error:   overriding 'virtual icu_65::BasicTimeZone*
icu_65::BasicTimeZone::clone() const'
     virtual BasicTimeZone* clone() const = 0;
                            ^~~~~
In file included from ../deps/icu-small/source/i18n/number_types.h:11:0,
                 from ../deps/icu-small/source/i18n/numparse_impl.cpp:14:
../deps/icu-small/source/i18n/unicode/decimfmt.h:899:13: error: invalid
covariant return type for 'virtual icu_65::Format*
icu_65::DecimalFormat::clone() const'
     Format* clone(void) const U_OVERRIDE;
             ^~~~~
In file included from ../deps/icu-small/source/i18n/unicode/decimfmt.h:39:0,
                 from ../deps/icu-small/source/i18n/number_types.h:11,
                 from ../deps/icu-small/source/i18n/numparse_impl.cpp:14:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/numfmt.h:271:27:
error:   overriding 'virtual icu_65::NumberFormat*
icu_65::NumberFormat::clone() const'
     virtual NumberFormat* clone() const = 0;
                           ^~~~~
  /usr/bin/g++ -o
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/numparse_stringsegment.o
../deps/icu-small/source/i18n/numparse_stringsegment.cpp
'-DV8_DEPRECATION_WARNINGS' '-DV8_IMMINENT_DEPRECATION_WARNINGS'
'-D__STDC_FORMAT_MACROS' '-DU_I18N_IMPLEMENTATION=1'
'-DU_ATTRIBUTE_DEPRECATED=' '-D_CRT_SECURE_NO_DEPRECATE='
'-DU_STATIC_IMPLEMENTATION=1' '-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0'
'-DU_HAVE_STD_STRING=1' '-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/numparse_stringsegment.o.d.raw
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -O2
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -c
  /usr/bin/g++ -o
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/tmutfmt.o
../deps/icu-small/source/i18n/tmutfmt.cpp '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS'
'-DU_I18N_IMPLEMENTATION=1' '-DU_ATTRIBUTE_DEPRECATED='
'-D_CRT_SECURE_NO_DEPRECATE=' '-DU_STATIC_IMPLEMENTATION=1'
'-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0' '-DU_HAVE_STD_STRING=1'
'-DUCONFIG_NO_BREAK_ITERATION=0'
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/openssl
-I../deps/icu-small/source/i18n -I../deps/icu-small/source/common  -pthread
-Wall -Wextra -Wno-unused-parameter -m64 -Wno-deprecated-declarations
-Wno-strict-aliasing -O3 -fno-omit-frame-pointer -fno-exceptions -std=gnu++1y
-frtti -MMD -MF
/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/.deps//home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/tmutfmt.o.d.raw
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -O2
-I/home/oleksandr/buildroot-git/output/nodejs-icu/host/include -c
In file included from ../deps/icu-small/source/i18n/number_types.h:11:0,
                 from
../deps/icu-small/source/i18n/number_decimalquantity.h:14,
                 from ../deps/icu-small/source/i18n/numparse_types.h:11,
                 from
../deps/icu-small/source/i18n/number_currencysymbols.cpp:12:
../deps/icu-small/source/i18n/unicode/decimfmt.h:899:13: error: invalid
covariant return type for 'virtual icu_65::Format*
icu_65::DecimalFormat::clone() const'
     Format* clone(void) const U_OVERRIDE;
             ^~~~~
In file included from ../deps/icu-small/source/i18n/unicode/decimfmt.h:39:0,
                 from ../deps/icu-small/source/i18n/number_types.h:11,
                 from
../deps/icu-small/source/i18n/number_decimalquantity.h:14,
                 from ../deps/icu-small/source/i18n/numparse_types.h:11,
                 from
../deps/icu-small/source/i18n/number_currencysymbols.cpp:12:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/numfmt.h:271:27:
error:   overriding 'virtual icu_65::NumberFormat*
icu_65::NumberFormat::clone() const'
     virtual NumberFormat* clone() const = 0;
                           ^~~~~
In file included from ../deps/icu-small/source/i18n/zonemeta.cpp:19:0:
../deps/icu-small/source/i18n/unicode/simpletz.h:706:23: error: invalid
covariant return type for 'virtual icu_65::TimeZone*
icu_65::SimpleTimeZone::clone() const'
     virtual TimeZone* clone(void) const;
                       ^~~~~
In file included from ../deps/icu-small/source/i18n/unicode/simpletz.h:38:0,
                 from ../deps/icu-small/source/i18n/zonemeta.cpp:19:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/basictz.h:52:28:
error:   overriding 'virtual icu_65::BasicTimeZone*
icu_65::BasicTimeZone::clone() const'
     virtual BasicTimeZone* clone() const = 0;
                            ^~~~~
In file included from ../deps/icu-small/source/common/umutex.h:31:0,
                 from ../deps/icu-small/source/i18n/dtfmtsym.cpp:38:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/i18n/number_types.h:11:0,
                 from ../deps/icu-small/source/i18n/number_asformat.h:11,
                 from ../deps/icu-small/source/i18n/number_asformat.cpp:14:
../deps/icu-small/source/i18n/unicode/decimfmt.h:899:13: error: invalid
covariant return type for 'virtual icu_65::Format*
icu_65::DecimalFormat::clone() const'
     Format* clone(void) const U_OVERRIDE;
             ^~~~~
In file included from
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/plurrule.h:35:0,
                 from
../deps/icu-small/source/i18n/unicode/numberformatter.h:19,
                 from ../deps/icu-small/source/i18n/number_asformat.h:10,
                 from ../deps/icu-small/source/i18n/number_asformat.cpp:14:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/numfmt.h:271:27:
error:   overriding 'virtual icu_65::NumberFormat*
icu_65::NumberFormat::clone() const'
     virtual NumberFormat* clone() const = 0;
                           ^~~~~
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/erarules.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/erarules.o]
Error 1
make[3]: *** Waiting for unfinished jobs....
In file included from ../deps/icu-small/source/common/uresdata.h:24:0,
                 from ../deps/icu-small/source/common/uresimp.h:16,
                 from ../deps/icu-small/source/i18n/tmutfmt.cpp:22:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from
../deps/icu-small/source/i18n/numparse_stringsegment.cpp:14:0:
../deps/icu-small/source/common/putilimp.h:226:20: error: missing binary
operator before token "("
 #elif __has_builtin(__c11_atomic_load) && \
                    ^
In file included from ../deps/icu-small/source/i18n/number_types.h:11:0,
                 from ../deps/icu-small/source/i18n/numrange_impl.h:13,
                 from ../deps/icu-small/source/i18n/numrange_fluent.cpp:12:
../deps/icu-small/source/i18n/unicode/decimfmt.h:899:13: error: invalid
covariant return type for 'virtual icu_65::Format*
icu_65::DecimalFormat::clone() const'
     Format* clone(void) const U_OVERRIDE;
             ^~~~~
In file included from
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/plurrule.h:35:0,
                 from
../deps/icu-small/source/i18n/unicode/numberformatter.h:19,
                 from ../deps/icu-small/source/i18n/numrange_impl.h:10,
                 from ../deps/icu-small/source/i18n/numrange_fluent.cpp:12:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/numfmt.h:271:27:
error:   overriding 'virtual icu_65::NumberFormat*
icu_65::NumberFormat::clone() const'
     virtual NumberFormat* clone() const = 0;
                           ^~~~~
In file included from ../deps/icu-small/source/i18n/number_types.h:11:0,
                 from ../deps/icu-small/source/i18n/numrange_impl.h:13,
                 from ../deps/icu-small/source/i18n/numrange_impl.cpp:13:
../deps/icu-small/source/i18n/unicode/decimfmt.h:899:13: error: invalid
covariant return type for 'virtual icu_65::Format*
icu_65::DecimalFormat::clone() const'
     Format* clone(void) const U_OVERRIDE;
             ^~~~~
In file included from
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/plurrule.h:35:0,
                 from
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/numberformatter.h:23,
                 from
../deps/icu-small/source/i18n/unicode/numberrangeformatter.h:13,
                 from ../deps/icu-small/source/i18n/numrange_impl.cpp:12:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/numfmt.h:271:27:
error:   overriding 'virtual icu_65::NumberFormat*
icu_65::NumberFormat::clone() const'
     virtual NumberFormat* clone() const = 0;
                           ^~~~~
In file included from ../deps/icu-small/source/i18n/plurrule.cpp:21:0:
../deps/icu-small/source/i18n/unicode/decimfmt.h:899:13: error: invalid
covariant return type for 'virtual icu_65::Format*
icu_65::DecimalFormat::clone() const'
     Format* clone(void) const U_OVERRIDE;
             ^~~~~
In file included from ../deps/icu-small/source/i18n/unicode/plurrule.h:33:0,
                 from ../deps/icu-small/source/i18n/plurrule.cpp:17:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/numfmt.h:271:27:
error:   overriding 'virtual icu_65::NumberFormat*
icu_65::NumberFormat::clone() const'
     virtual NumberFormat* clone() const = 0;
                           ^~~~~
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/ucal.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/ucal.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/coptccal.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/coptccal.o]
Error 1
In file included from ../deps/icu-small/source/i18n/zonemeta.cpp:30:0:
../deps/icu-small/source/i18n/olsontz.h:154:23: error: invalid covariant return
type for 'virtual icu_65::TimeZone* icu_65::OlsonTimeZone::clone() const'
     virtual TimeZone* clone() const;
                       ^~~~~
In file included from ../deps/icu-small/source/i18n/unicode/simpletz.h:38:0,
                 from ../deps/icu-small/source/i18n/zonemeta.cpp:19:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/basictz.h:52:28:
error:   overriding 'virtual icu_65::BasicTimeZone*
icu_65::BasicTimeZone::clone() const'
     virtual BasicTimeZone* clone() const = 0;
                            ^~~~~
In file included from
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/uenum.h:23:0,
                 from
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/ucal.h:14,
                 from ../deps/icu-small/source/i18n/unicode/dtitvfmt.h:26,
                 from ../deps/icu-small/source/i18n/dtitvfmt.cpp:15:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/localpointer.h:592:28:
error: conflicting declaration of C function 'void
icu_65::swap(icu_65::LocalUDataMemoryPointer&,
icu_65::LocalUDataMemoryPointer&)'
         friend inline void swap(LocalPointerClassName &p1,
LocalPointerClassName &p2) U_NOEXCEPT { \
                            ^
../deps/icu-small/source/common/unicode/udata.h:280:1: note: in expansion of
macro 'U_DEFINE_LOCAL_OPEN_POINTER'
 U_DEFINE_LOCAL_OPEN_POINTER(LocalUDataMemoryPointer, UDataMemory,
udata_close);
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/localpointer.h:592:28:
note: previous declaration 'void icu_65::swap(icu_65::LocalUTextPointer&,
icu_65::LocalUTextPointer&)'
         friend inline void swap(LocalPointerClassName &p1,
LocalPointerClassName &p2) U_NOEXCEPT { \
                            ^
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/utext.h:199:1:
note: in expansion of macro 'U_DEFINE_LOCAL_OPEN_POINTER'
 U_DEFINE_LOCAL_OPEN_POINTER(LocalUTextPointer, UText, utext_close);
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/uformattable.h:37:0,
                 from
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/fmtable.h:33,
                 from
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/format.h:39,
                 from ../deps/icu-small/source/i18n/unicode/measfmt.h:20,
                 from ../deps/icu-small/source/i18n/measfmt.cpp:18:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/localpointer.h:592:28:
error: conflicting declaration of C function 'void
icu_65::swap(icu_65::LocalUTextPointer&, icu_65::LocalUTextPointer&)'
         friend inline void swap(LocalPointerClassName &p1,
LocalPointerClassName &p2) U_NOEXCEPT { \
                            ^
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/utext.h:199:1:
note: in expansion of macro 'U_DEFINE_LOCAL_OPEN_POINTER'
 U_DEFINE_LOCAL_OPEN_POINTER(LocalUTextPointer, UText, utext_close);
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/localpointer.h:592:28:
note: previous declaration 'void icu_65::swap(icu_65::LocalUDataMemoryPointer&,
icu_65::LocalUDataMemoryPointer&)'
         friend inline void swap(LocalPointerClassName &p1,
LocalPointerClassName &p2) U_NOEXCEPT { \
                            ^
../deps/icu-small/source/common/unicode/udata.h:280:1: note: in expansion of
macro 'U_DEFINE_LOCAL_OPEN_POINTER'
 U_DEFINE_LOCAL_OPEN_POINTER(LocalUDataMemoryPointer, UDataMemory,
udata_close);
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../deps/icu-small/source/i18n/measfmt.cpp:37:0:
../deps/icu-small/source/i18n/unicode/smpdtfmt.h:868:21: error: invalid
covariant return type for 'virtual icu_65::Format*
icu_65::SimpleDateFormat::clone() const'
     virtual Format* clone(void) const;
                     ^~~~~
In file included from ../deps/icu-small/source/i18n/unicode/smpdtfmt.h:38:0,
                 from ../deps/icu-small/source/i18n/measfmt.cpp:37:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/datefmt.h:232:25:
error:   overriding 'virtual icu_65::DateFormat* icu_65::DateFormat::clone()
const'
     virtual DateFormat* clone() const = 0;
                         ^~~~~
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/uspoof_impl.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/uspoof_impl.o]
Error 1
In file included from ../deps/icu-small/source/i18n/number_types.h:11:0,
                 from ../deps/icu-small/source/i18n/number_stringbuilder.h:16,
                 from ../deps/icu-small/source/i18n/formattedval_impl.h:21,
                 from ../deps/icu-small/source/i18n/dtitvfmt.cpp:31:
../deps/icu-small/source/i18n/unicode/decimfmt.h:899:13: error: invalid
covariant return type for 'virtual icu_65::Format*
icu_65::DecimalFormat::clone() const'
     Format* clone(void) const U_OVERRIDE;
             ^~~~~
In file included from
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/datefmt.h:32:0,
                 from
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/smpdtfmt.h:40,
                 from ../deps/icu-small/source/i18n/unicode/dtitvfmt.h:27,
                 from ../deps/icu-small/source/i18n/dtitvfmt.cpp:15:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/numfmt.h:271:27:
error:   overriding 'virtual icu_65::NumberFormat*
icu_65::NumberFormat::clone() const'
     virtual NumberFormat* clone() const = 0;
                           ^~~~~
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/collationkeys.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/collationkeys.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/number_currencysymbols.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/number_currencysymbols.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/uspoof.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/uspoof.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/udat.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/udat.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/number_asformat.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/number_asformat.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/zonemeta.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/zonemeta.o]
Error 1
In file included from ../deps/icu-small/source/i18n/tmutfmt.cpp:10:0:
../deps/icu-small/source/i18n/unicode/tmutfmt.h:127:21: error: invalid
covariant return type for 'virtual icu_65::Format*
icu_65::TimeUnitFormat::clone() const'
     virtual Format* clone(void) const;
                     ^~~~~
In file included from ../deps/icu-small/source/i18n/unicode/tmutfmt.h:27:0,
                 from ../deps/icu-small/source/i18n/tmutfmt.cpp:10:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/measfmt.h:156:28:
error:   overriding 'virtual icu_65::MeasureFormat*
icu_65::MeasureFormat::clone() const'
     virtual MeasureFormat *clone() const;
                            ^~~~~
In file included from ../deps/icu-small/source/i18n/tmutfmt.cpp:14:0:
../deps/icu-small/source/i18n/unicode/decimfmt.h:899:13: error: invalid
covariant return type for 'virtual icu_65::Format*
icu_65::DecimalFormat::clone() const'
     Format* clone(void) const U_OVERRIDE;
             ^~~~~
In file included from ../deps/icu-small/source/i18n/unicode/tmutfmt.h:28:0,
                 from ../deps/icu-small/source/i18n/tmutfmt.cpp:10:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/numfmt.h:271:27:
error:   overriding 'virtual icu_65::NumberFormat*
icu_65::NumberFormat::clone() const'
     virtual NumberFormat* clone() const = 0;
                           ^~~~~
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/currpinf.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/currpinf.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/collationtailoring.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/collationtailoring.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/collationbuilder.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/collationbuilder.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/islamcal.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/islamcal.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/utf8collationiterator.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/utf8collationiterator.o]
Error 1
In file included from ../deps/icu-small/source/i18n/number_types.h:11:0,
                 from
../deps/icu-small/source/i18n/number_decimalquantity.h:14,
                 from ../deps/icu-small/source/i18n/numparse_types.h:11,
                 from
../deps/icu-small/source/i18n/numparse_stringsegment.cpp:12:
../deps/icu-small/source/i18n/unicode/decimfmt.h:899:13: error: invalid
covariant return type for 'virtual icu_65::Format*
icu_65::DecimalFormat::clone() const'
     Format* clone(void) const U_OVERRIDE;
             ^~~~~
In file included from ../deps/icu-small/source/i18n/unicode/decimfmt.h:39:0,
                 from ../deps/icu-small/source/i18n/number_types.h:11,
                 from
../deps/icu-small/source/i18n/number_decimalquantity.h:14,
                 from ../deps/icu-small/source/i18n/numparse_types.h:11,
                 from
../deps/icu-small/source/i18n/numparse_stringsegment.cpp:12:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/numfmt.h:271:27:
error:   overriding 'virtual icu_65::NumberFormat*
icu_65::NumberFormat::clone() const'
     virtual NumberFormat* clone() const = 0;
                           ^~~~~
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/numparse_impl.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/numparse_impl.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/numrange_impl.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/numrange_impl.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/casetrn.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/casetrn.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/numrange_fluent.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/numrange_fluent.o]
Error 1
In file included from ../deps/icu-small/source/i18n/dtfmtsym.cpp:33:0:
../deps/icu-small/source/i18n/unicode/smpdtfmt.h:868:21: error: invalid
covariant return type for 'virtual icu_65::Format*
icu_65::SimpleDateFormat::clone() const'
     virtual Format* clone(void) const;
                     ^~~~~
In file included from ../deps/icu-small/source/i18n/unicode/smpdtfmt.h:38:0,
                 from ../deps/icu-small/source/i18n/dtfmtsym.cpp:33:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/datefmt.h:232:25:
error:   overriding 'virtual icu_65::DateFormat* icu_65::DateFormat::clone()
const'
     virtual DateFormat* clone() const = 0;
                         ^~~~~
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/dtitvfmt.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/dtitvfmt.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/tmutfmt.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/tmutfmt.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/plurrule.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/plurrule.o]
Error 1
In file included from ../deps/icu-small/source/i18n/dtfmtsym.cpp:31:0:
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/localpointer.h:592:28:
error: conflicting declaration of C function 'void
icu_65::swap(icu_65::LocalUDataMemoryPointer&,
icu_65::LocalUDataMemoryPointer&)'
         friend inline void swap(LocalPointerClassName &p1,
LocalPointerClassName &p2) U_NOEXCEPT { \
                            ^
../deps/icu-small/source/common/unicode/udata.h:280:1: note: in expansion of
macro 'U_DEFINE_LOCAL_OPEN_POINTER'
 U_DEFINE_LOCAL_OPEN_POINTER(LocalUDataMemoryPointer, UDataMemory,
udata_close);
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/localpointer.h:592:28:
note: previous declaration 'void icu_65::swap(icu_65::LocalUTextPointer&,
icu_65::LocalUTextPointer&)'
         friend inline void swap(LocalPointerClassName &p1,
LocalPointerClassName &p2) U_NOEXCEPT { \
                            ^
/home/oleksandr/buildroot-git/output/nodejs-icu/host/include/unicode/utext.h:199:1:
note: in expansion of macro 'U_DEFINE_LOCAL_OPEN_POINTER'
 U_DEFINE_LOCAL_OPEN_POINTER(LocalUTextPointer, UText, utext_close);
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/measfmt.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/measfmt.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/numparse_stringsegment.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/numparse_stringsegment.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/listformatter.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/listformatter.o]
Error 1
tools/icu/icui18n.target.mk:337: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/dtfmtsym.o'
failed
make[3]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/dtfmtsym.o]
Error 1
rm 660333c2b88b527b7da7cf77c8e2752cf01ad964.intermediate
Makefile:101: recipe for target 'node' failed
make[2]: *** [node] Error 2
package/pkg-generic.mk:266: recipe for target
'/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/.stamp_built'
failed
make[1]: ***
[/home/oleksandr/buildroot-git/output/nodejs-icu/build/host-nodejs-12.16.1/.stamp_built]
Error 2
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
