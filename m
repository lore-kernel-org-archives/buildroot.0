From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Dec 2019 15:08:52 +0000
Subject: [Buildroot] [Bug 12441] New: qt5webengine build error: asm/errno.h:
 No such file or directory
Message-ID: <bug-12441-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12441

            Bug ID: 12441
           Summary: qt5webengine build error: asm/errno.h: No such file or
                    directory
           Product: buildroot
           Version: 2019.11
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

I'm building the buildroot's latest qt5webengine-5.12.5 with the internal
toolchain. The following build error occurs repeatedly:

[8869/14573] CXX v8_snapshot/obj/third_party/icu/bundled_icuuc/listformatter.o
FAILED: v8_snapshot/obj/third_party/icu/bundled_icuuc/listformatter.o 
/usr/bin/g++ -MMD -MF
v8_snapshot/obj/third_party/icu/bundled_icuuc/listformatter.o.d
-DU_COMMON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DV8_DEPRECATION_WARNINGS
-DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DOFFICIAL_BUILD -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG
-DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DHAVE_DLOPEN=0
-DUCONFIG_ONLY_HTML_CONVERSION=1 -DU_CHARSET_IS_UTF8=1
-DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DU_STATIC_IMPLEMENTATION
-DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE -DUCHAR_TYPE=uint16_t -Iv8_snapshot/gen
-I../../3rdparty/chromium
-I../../3rdparty/chromium/third_party/icu/source/common
-I../../3rdparty/chromium/third_party/icu/source/i18n -fno-strict-aliasing
--param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC -pipe
-pthread -m32 -msse2 -mfpmath=sse -mmmx -O2 -fno-ident -fdata-sections
-ffunction-sections -fno-omit-frame-pointer -g0 -fvisibility=hidden
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
-Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers
-Wno-unused-parameter -Wno-unused-function -Wno-deprecated-declarations
-std=gnu++14 -fno-exceptions -fvisibility-inlines-hidden -frtti -Wno-narrowing
-Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -c
../../3rdparty/chromium/third_party/icu/source/common/listformatter.cpp -o
v8_snapshot/obj/third_party/icu/bundled_icuuc/listformatter.o
In file included from /usr/include/bits/errno.h:24:0,
                 from /usr/include/errno.h:35,
                 from /usr/include/c++/5/cerrno:41,
                 from /usr/include/c++/5/ext/string_conversions.h:44,
                 from /usr/include/c++/5/bits/basic_string.h:5249,
                 from /usr/include/c++/5/string:52,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/std_string.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/unistr.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/listformatter.h:24,
                 from
../../3rdparty/chromium/third_party/icu/source/common/listformatter.cpp:19:
/usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such file or
directory
compilation terminated.
[8870/14573] CXX
v8_snapshot/obj/third_party/icu/bundled_icuuc/loadednormalizer2impl.o
FAILED: v8_snapshot/obj/third_party/icu/bundled_icuuc/loadednormalizer2impl.o 
/usr/bin/g++ -MMD -MF
v8_snapshot/obj/third_party/icu/bundled_icuuc/loadednormalizer2impl.o.d
-DU_COMMON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DV8_DEPRECATION_WARNINGS
-DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DOFFICIAL_BUILD -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG
-DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DHAVE_DLOPEN=0
-DUCONFIG_ONLY_HTML_CONVERSION=1 -DU_CHARSET_IS_UTF8=1
-DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DU_STATIC_IMPLEMENTATION
-DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE -DUCHAR_TYPE=uint16_t -Iv8_snapshot/gen
-I../../3rdparty/chromium
-I../../3rdparty/chromium/third_party/icu/source/common
-I../../3rdparty/chromium/third_party/icu/source/i18n -fno-strict-aliasing
--param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC -pipe
-pthread -m32 -msse2 -mfpmath=sse -mmmx -O2 -fno-ident -fdata-sections
-ffunction-sections -fno-omit-frame-pointer -g0 -fvisibility=hidden
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
-Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers
-Wno-unused-parameter -Wno-unused-function -Wno-deprecated-declarations
-std=gnu++14 -fno-exceptions -fvisibility-inlines-hidden -frtti -Wno-narrowing
-Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -c
../../3rdparty/chromium/third_party/icu/source/common/loadednormalizer2impl.cpp
-o v8_snapshot/obj/third_party/icu/bundled_icuuc/loadednormalizer2impl.o
In file included from /usr/include/bits/errno.h:24:0,
                 from /usr/include/errno.h:35,
                 from /usr/include/c++/5/cerrno:41,
                 from /usr/include/c++/5/ext/string_conversions.h:44,
                 from /usr/include/c++/5/bits/basic_string.h:5249,
                 from /usr/include/c++/5/string:52,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/std_string.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/stringpiece.h:32,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/normalizer2.h:31,
                 from
../../3rdparty/chromium/third_party/icu/source/common/loadednormalizer2impl.cpp:20:
/usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such file or
directory
compilation terminated.
[8871/14573] CXX v8_snapshot/obj/third_party/icu/bundled_icui18n/dtptngen.o
FAILED: v8_snapshot/obj/third_party/icu/bundled_icui18n/dtptngen.o 
/usr/bin/g++ -MMD -MF
v8_snapshot/obj/third_party/icu/bundled_icui18n/dtptngen.o.d
-DU_I18N_IMPLEMENTATION -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=1
-DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC -DFULL_SAFE_BROWSING
-DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD
-DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG -DNVALGRIND
-DDYNAMIC_ANNOTATIONS_ENABLED=0 -DHAVE_DLOPEN=0
-DUCONFIG_ONLY_HTML_CONVERSION=1 -DU_CHARSET_IS_UTF8=1
-DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DU_STATIC_IMPLEMENTATION
-DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE -DUCHAR_TYPE=uint16_t -Iv8_snapshot/gen
-I../../3rdparty/chromium
-I../../3rdparty/chromium/third_party/icu/source/common
-I../../3rdparty/chromium/third_party/icu/source/i18n -fno-strict-aliasing
--param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC -pipe
-pthread -m32 -msse2 -mfpmath=sse -mmmx -O2 -fno-ident -fdata-sections
-ffunction-sections -fno-omit-frame-pointer -g0 -fvisibility=hidden
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
-Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers
-Wno-unused-parameter -Wno-unused-function -Wno-deprecated-declarations
-std=gnu++14 -fno-exceptions -fvisibility-inlines-hidden -frtti -Wno-narrowing
-Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -c
../../3rdparty/chromium/third_party/icu/source/i18n/dtptngen.cpp -o
v8_snapshot/obj/third_party/icu/bundled_icui18n/dtptngen.o
In file included from /usr/include/bits/errno.h:24:0,
                 from /usr/include/errno.h:35,
                 from /usr/include/c++/5/cerrno:41,
                 from /usr/include/c++/5/ext/string_conversions.h:44,
                 from /usr/include/c++/5/bits/basic_string.h:5249,
                 from /usr/include/c++/5/string:52,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/std_string.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/unistr.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/i18n/unicode/timezone.h:42,
                 from
../../3rdparty/chromium/third_party/icu/source/i18n/unicode/calendar.h:40,
                 from
../../3rdparty/chromium/third_party/icu/source/i18n/unicode/datefmt.h:29,
                 from
../../3rdparty/chromium/third_party/icu/source/i18n/dtptngen.cpp:17:
/usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such file or
directory
compilation terminated.
[8872/14573] CXX v8_snapshot/obj/third_party/icu/bundled_icuuc/locavailable.o
FAILED: v8_snapshot/obj/third_party/icu/bundled_icuuc/locavailable.o 
/usr/bin/g++ -MMD -MF
v8_snapshot/obj/third_party/icu/bundled_icuuc/locavailable.o.d
-DU_COMMON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DV8_DEPRECATION_WARNINGS
-DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DOFFICIAL_BUILD -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG
-DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DHAVE_DLOPEN=0
-DUCONFIG_ONLY_HTML_CONVERSION=1 -DU_CHARSET_IS_UTF8=1
-DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DU_STATIC_IMPLEMENTATION
-DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE -DUCHAR_TYPE=uint16_t -Iv8_snapshot/gen
-I../../3rdparty/chromium
-I../../3rdparty/chromium/third_party/icu/source/common
-I../../3rdparty/chromium/third_party/icu/source/i18n -fno-strict-aliasing
--param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC -pipe
-pthread -m32 -msse2 -mfpmath=sse -mmmx -O2 -fno-ident -fdata-sections
-ffunction-sections -fno-omit-frame-pointer -g0 -fvisibility=hidden
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
-Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers
-Wno-unused-parameter -Wno-unused-function -Wno-deprecated-declarations
-std=gnu++14 -fno-exceptions -fvisibility-inlines-hidden -frtti -Wno-narrowing
-Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -c
../../3rdparty/chromium/third_party/icu/source/common/locavailable.cpp -o
v8_snapshot/obj/third_party/icu/bundled_icuuc/locavailable.o
In file included from /usr/include/bits/errno.h:24:0,
                 from /usr/include/errno.h:35,
                 from /usr/include/c++/5/cerrno:41,
                 from /usr/include/c++/5/ext/string_conversions.h:44,
                 from /usr/include/c++/5/bits/basic_string.h:5249,
                 from /usr/include/c++/5/string:52,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/std_string.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/unistr.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/ures.h:794,
                 from
../../3rdparty/chromium/third_party/icu/source/common/locavailable.cpp:25:
/usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such file or
directory
compilation terminated.
[8873/14573] CXX v8_snapshot/obj/third_party/icu/bundled_icuuc/locdspnm.o
FAILED: v8_snapshot/obj/third_party/icu/bundled_icuuc/locdspnm.o 
/usr/bin/g++ -MMD -MF
v8_snapshot/obj/third_party/icu/bundled_icuuc/locdspnm.o.d
-DU_COMMON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DV8_DEPRECATION_WARNINGS
-DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DOFFICIAL_BUILD -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG
-DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DHAVE_DLOPEN=0
-DUCONFIG_ONLY_HTML_CONVERSION=1 -DU_CHARSET_IS_UTF8=1
-DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DU_STATIC_IMPLEMENTATION
-DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE -DUCHAR_TYPE=uint16_t -Iv8_snapshot/gen
-I../../3rdparty/chromium
-I../../3rdparty/chromium/third_party/icu/source/common
-I../../3rdparty/chromium/third_party/icu/source/i18n -fno-strict-aliasing
--param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC -pipe
-pthread -m32 -msse2 -mfpmath=sse -mmmx -O2 -fno-ident -fdata-sections
-ffunction-sections -fno-omit-frame-pointer -g0 -fvisibility=hidden
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
-Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers
-Wno-unused-parameter -Wno-unused-function -Wno-deprecated-declarations
-std=gnu++14 -fno-exceptions -fvisibility-inlines-hidden -frtti -Wno-narrowing
-Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -c
../../3rdparty/chromium/third_party/icu/source/common/locdspnm.cpp -o
v8_snapshot/obj/third_party/icu/bundled_icuuc/locdspnm.o
In file included from /usr/include/bits/errno.h:24:0,
                 from /usr/include/errno.h:35,
                 from /usr/include/c++/5/cerrno:41,
                 from /usr/include/c++/5/ext/string_conversions.h:44,
                 from /usr/include/c++/5/bits/basic_string.h:5249,
                 from /usr/include/c++/5/string:52,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/std_string.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/unistr.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/strenum.h:16,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/locdspnm.h:23,
                 from
../../3rdparty/chromium/third_party/icu/source/common/locdspnm.cpp:14:
/usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such file or
directory
compilation terminated.
[8874/14573] CXX v8_snapshot/obj/third_party/icu/bundled_icuuc/locdispnames.o
FAILED: v8_snapshot/obj/third_party/icu/bundled_icuuc/locdispnames.o 
/usr/bin/g++ -MMD -MF
v8_snapshot/obj/third_party/icu/bundled_icuuc/locdispnames.o.d
-DU_COMMON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DV8_DEPRECATION_WARNINGS
-DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DOFFICIAL_BUILD -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG
-DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DHAVE_DLOPEN=0
-DUCONFIG_ONLY_HTML_CONVERSION=1 -DU_CHARSET_IS_UTF8=1
-DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DU_STATIC_IMPLEMENTATION
-DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE -DUCHAR_TYPE=uint16_t -Iv8_snapshot/gen
-I../../3rdparty/chromium
-I../../3rdparty/chromium/third_party/icu/source/common
-I../../3rdparty/chromium/third_party/icu/source/i18n -fno-strict-aliasing
--param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC -pipe
-pthread -m32 -msse2 -mfpmath=sse -mmmx -O2 -fno-ident -fdata-sections
-ffunction-sections -fno-omit-frame-pointer -g0 -fvisibility=hidden
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
-Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers
-Wno-unused-parameter -Wno-unused-function -Wno-deprecated-declarations
-std=gnu++14 -fno-exceptions -fvisibility-inlines-hidden -frtti -Wno-narrowing
-Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -c
../../3rdparty/chromium/third_party/icu/source/common/locdispnames.cpp -o
v8_snapshot/obj/third_party/icu/bundled_icuuc/locdispnames.o
In file included from /usr/include/bits/errno.h:24:0,
                 from /usr/include/errno.h:35,
                 from /usr/include/c++/5/cerrno:41,
                 from /usr/include/c++/5/ext/string_conversions.h:44,
                 from /usr/include/c++/5/bits/basic_string.h:5249,
                 from /usr/include/c++/5/string:52,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/std_string.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/unistr.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/brkiter.h:47,
                 from
../../3rdparty/chromium/third_party/icu/source/common/locdispnames.cpp:23:
/usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such file or
directory
compilation terminated.
[8875/14573] CXX v8_snapshot/obj/third_party/icu/bundled_icuuc/locid.o
FAILED: v8_snapshot/obj/third_party/icu/bundled_icuuc/locid.o 
/usr/bin/g++ -MMD -MF v8_snapshot/obj/third_party/icu/bundled_icuuc/locid.o.d
-DU_COMMON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DV8_DEPRECATION_WARNINGS
-DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DOFFICIAL_BUILD -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG
-DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DHAVE_DLOPEN=0
-DUCONFIG_ONLY_HTML_CONVERSION=1 -DU_CHARSET_IS_UTF8=1
-DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DU_STATIC_IMPLEMENTATION
-DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE -DUCHAR_TYPE=uint16_t -Iv8_snapshot/gen
-I../../3rdparty/chromium
-I../../3rdparty/chromium/third_party/icu/source/common
-I../../3rdparty/chromium/third_party/icu/source/i18n -fno-strict-aliasing
--param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC -pipe
-pthread -m32 -msse2 -mfpmath=sse -mmmx -O2 -fno-ident -fdata-sections
-ffunction-sections -fno-omit-frame-pointer -g0 -fvisibility=hidden
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
-Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers
-Wno-unused-parameter -Wno-unused-function -Wno-deprecated-declarations
-std=gnu++14 -fno-exceptions -fvisibility-inlines-hidden -frtti -Wno-narrowing
-Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -c
../../3rdparty/chromium/third_party/icu/source/common/locid.cpp -o
v8_snapshot/obj/third_party/icu/bundled_icuuc/locid.o
In file included from /usr/include/bits/errno.h:24:0,
                 from /usr/include/errno.h:35,
                 from /usr/include/c++/5/cerrno:41,
                 from /usr/include/c++/5/ext/string_conversions.h:44,
                 from /usr/include/c++/5/bits/basic_string.h:5249,
                 from /usr/include/c++/5/string:52,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/std_string.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/unistr.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/strenum.h:16,
                 from
../../3rdparty/chromium/third_party/icu/source/common/locid.cpp:36:
/usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such file or
directory
compilation terminated.
[8881/14573] CXX v8_snapshot/obj/third_party/icu/bundled_icuuc/loclikely.o
FAILED: v8_snapshot/obj/third_party/icu/bundled_icuuc/loclikely.o 
/usr/bin/g++ -MMD -MF
v8_snapshot/obj/third_party/icu/bundled_icuuc/loclikely.o.d
-DU_COMMON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DV8_DEPRECATION_WARNINGS
-DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DOFFICIAL_BUILD -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG
-DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DHAVE_DLOPEN=0
-DUCONFIG_ONLY_HTML_CONVERSION=1 -DU_CHARSET_IS_UTF8=1
-DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DU_STATIC_IMPLEMENTATION
-DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE -DUCHAR_TYPE=uint16_t -Iv8_snapshot/gen
-I../../3rdparty/chromium
-I../../3rdparty/chromium/third_party/icu/source/common
-I../../3rdparty/chromium/third_party/icu/source/i18n -fno-strict-aliasing
--param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC -pipe
-pthread -m32 -msse2 -mfpmath=sse -mmmx -O2 -fno-ident -fdata-sections
-ffunction-sections -fno-omit-frame-pointer -g0 -fvisibility=hidden
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
-Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers
-Wno-unused-parameter -Wno-unused-function -Wno-deprecated-declarations
-std=gnu++14 -fno-exceptions -fvisibility-inlines-hidden -frtti -Wno-narrowing
-Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -c
../../3rdparty/chromium/third_party/icu/source/common/loclikely.cpp -o
v8_snapshot/obj/third_party/icu/bundled_icuuc/loclikely.o
In file included from /usr/include/bits/errno.h:24:0,
                 from /usr/include/errno.h:35,
                 from /usr/include/c++/5/cerrno:41,
                 from /usr/include/c++/5/ext/string_conversions.h:44,
                 from /usr/include/c++/5/bits/basic_string.h:5249,
                 from /usr/include/c++/5/string:52,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/std_string.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/unistr.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/ures.h:794,
                 from
../../3rdparty/chromium/third_party/icu/source/common/loclikely.cpp:27:
/usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such file or
directory
compilation terminated.
[8882/14573] CXX v8_snapshot/obj/third_party/icu/bundled_icuuc/normlzr.o
FAILED: v8_snapshot/obj/third_party/icu/bundled_icuuc/normlzr.o 
/usr/bin/g++ -MMD -MF v8_snapshot/obj/third_party/icu/bundled_icuuc/normlzr.o.d
-DU_COMMON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DV8_DEPRECATION_WARNINGS
-DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DOFFICIAL_BUILD -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG
-DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DHAVE_DLOPEN=0
-DUCONFIG_ONLY_HTML_CONVERSION=1 -DU_CHARSET_IS_UTF8=1
-DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DU_STATIC_IMPLEMENTATION
-DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE -DUCHAR_TYPE=uint16_t -Iv8_snapshot/gen
-I../../3rdparty/chromium
-I../../3rdparty/chromium/third_party/icu/source/common
-I../../3rdparty/chromium/third_party/icu/source/i18n -fno-strict-aliasing
--param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC -pipe
-pthread -m32 -msse2 -mfpmath=sse -mmmx -O2 -fno-ident -fdata-sections
-ffunction-sections -fno-omit-frame-pointer -g0 -fvisibility=hidden
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
-Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers
-Wno-unused-parameter -Wno-unused-function -Wno-deprecated-declarations
-std=gnu++14 -fno-exceptions -fvisibility-inlines-hidden -frtti -Wno-narrowing
-Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -c
../../3rdparty/chromium/third_party/icu/source/common/normlzr.cpp -o
v8_snapshot/obj/third_party/icu/bundled_icuuc/normlzr.o
In file included from /usr/include/bits/errno.h:24:0,
                 from /usr/include/errno.h:35,
                 from /usr/include/c++/5/cerrno:41,
                 from /usr/include/c++/5/ext/string_conversions.h:44,
                 from /usr/include/c++/5/bits/basic_string.h:5249,
                 from /usr/include/c++/5/string:52,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/std_string.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/unistr.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/uniset.h:17,
                 from
../../3rdparty/chromium/third_party/icu/source/common/normlzr.cpp:15:
/usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such file or
directory
compilation terminated.
[8883/14573] CXX v8_snapshot/obj/third_party/icu/bundled_icuuc/pluralmap.o
FAILED: v8_snapshot/obj/third_party/icu/bundled_icuuc/pluralmap.o 
/usr/bin/g++ -MMD -MF
v8_snapshot/obj/third_party/icu/bundled_icuuc/pluralmap.o.d
-DU_COMMON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DV8_DEPRECATION_WARNINGS
-DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DOFFICIAL_BUILD -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG
-DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DHAVE_DLOPEN=0
-DUCONFIG_ONLY_HTML_CONVERSION=1 -DU_CHARSET_IS_UTF8=1
-DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DU_STATIC_IMPLEMENTATION
-DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE -DUCHAR_TYPE=uint16_t -Iv8_snapshot/gen
-I../../3rdparty/chromium
-I../../3rdparty/chromium/third_party/icu/source/common
-I../../3rdparty/chromium/third_party/icu/source/i18n -fno-strict-aliasing
--param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC -pipe
-pthread -m32 -msse2 -mfpmath=sse -mmmx -O2 -fno-ident -fdata-sections
-ffunction-sections -fno-omit-frame-pointer -g0 -fvisibility=hidden
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
-Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers
-Wno-unused-parameter -Wno-unused-function -Wno-deprecated-declarations
-std=gnu++14 -fno-exceptions -fvisibility-inlines-hidden -frtti -Wno-narrowing
-Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -c
../../3rdparty/chromium/third_party/icu/source/common/pluralmap.cpp -o
v8_snapshot/obj/third_party/icu/bundled_icuuc/pluralmap.o
In file included from /usr/include/bits/errno.h:24:0,
                 from /usr/include/errno.h:35,
                 from /usr/include/c++/5/cerrno:41,
                 from /usr/include/c++/5/ext/string_conversions.h:44,
                 from /usr/include/c++/5/bits/basic_string.h:5249,
                 from /usr/include/c++/5/string:52,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/std_string.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/unicode/unistr.h:35,
                 from
../../3rdparty/chromium/third_party/icu/source/common/pluralmap.cpp:8:
/usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such file or
directory
compilation terminated.
[8917/14573] CXX obj/v8/src/inspector/inspector/inspector_jumbo_1.o
ninja: build stopped: subcommand failed.
Makefile.gn_run:342: recipe for target 'run_ninja' failed
make[5]: *** [run_ninja] Error 1
Makefile:82: recipe for target 'sub-gn_run-pro-make_first' failed
make[4]: *** [sub-gn_run-pro-make_first] Error 2
Makefile:79: recipe for target 'sub-core-make_first' failed
make[3]: *** [sub-core-make_first] Error 2
Makefile:48: recipe for target 'sub-src-make_first' failed
make[2]: *** [sub-src-make_first] Error 2
package/pkg-generic.mk:257: recipe for target
'/home/oleksandr/Downloads/buildroot-git/output/x86_64/build/qt5webengine-5.12.5/.stamp_built'
failed
make[1]: ***
[/home/oleksandr/Downloads/buildroot-git/output/x86_64/build/qt5webengine-5.12.5/.stamp_built]
Error 2
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
