From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 25 Sep 2012 05:37:41 +0000 (UTC)
Subject: [Buildroot] [Bug 5582] New: libiconv 1.14 failed to build
Message-ID: <bug-5582-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5582

           Summary: libiconv 1.14 failed to build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: nCdy at live.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


>>make                                                                                                                                                                             /home/nen/contrib/buildroot/ :)
>>> libiconv 1.14 Building
PATH="/home/nen/contrib/buildroot/output/host/bin:/home/nen/contrib/buildroot/output/host/usr/bin:/home/nen/contrib/buildroot/output/host/usr/sbin/:/root/bin:/sbin:/bin:/usr/sbin:/usr/bin"
PERLLIB="/home/nen/contrib/buildroot/output/host/usr/lib/perl"  /usr/bin/make
-j2  -C /home/nen/contrib/buildroot/output/build/libiconv-1.14/
make[1]: Entering directory
`/home/nen/contrib/buildroot/output/build/libiconv-1.14'
cd lib && /usr/bin/make all
make[2]: Entering directory
`/home/nen/contrib/buildroot/output/build/libiconv-1.14/lib'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory
`/home/nen/contrib/buildroot/output/build/libiconv-1.14/lib'
cd preload && /usr/bin/make all
make[2]: Entering directory
`/home/nen/contrib/buildroot/output/build/libiconv-1.14/preload'
rm -f -r objects
mkdir objects && \
for f in ./../lib/iconv.c ./../libcharset/lib/localcharset.c
./../lib/relocatable.c; do \
  /bin/sh ./libtool --mode=compile
/home/nen/contrib/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-I../lib -I./../lib -I../include -I./../include -I.. -I./..  -pipe -Os 
-fvisibility=hidden -DLIBDIR=\"/usr/lib\" -DBUILDING_LIBICONV -DBUILDING_DLL
-DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"/usr/lib\" -DNO_XMALLOC
-Dset_relocation_prefix=libiconv_set_relocation_prefix
-Drelocate=libiconv_relocate -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
-DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
-DPACKAGE_URL=\"\" -DINSTALLPREFIX=\"/usr\" -DSTDC_HEADERS=1
-DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1
-DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1
-DHAVE_UNISTD_H=1 -D__EXTENSIONS__=1 -D_ALL_SOURCE=1 -D_GNU_SOURCE=1
-D_POSIX_PTHREAD_SEMANTICS=1 -D_TANDEM_SOURCE=1 -DHAVE_DLFCN_H=1
-DLT_OBJDIR=\".libs/\" -DHAVE_VISIBILITY=1 -DLIBICONV_PLUG -c $f -o
objects/`basename $f | sed -e 's,\.c$,.o,'` || exit 1; \
done && \
/bin/sh ./libtool --mode=link
/home/nen/contrib/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-static -pipe -Os  -fvisibility=hidden -o libiconv.la -rpath /usr/lib
-no-undefined objects/*.lo && \
rm -f -r objects
libtool: compile: 
/home/nen/contrib/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-I../lib -I./../lib -I../include -I./../include -I.. -I./.. -pipe -Os
-fvisibility=hidden -DLIBDIR=\"/usr/lib\" -DBUILDING_LIBICONV -DBUILDING_DLL
-DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"/usr/lib\" -DNO_XMALLOC
-Dset_relocation_prefix=libiconv_set_relocation_prefix
-Drelocate=libiconv_relocate -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
-DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
-DPACKAGE_URL=\"\" -DINSTALLPREFIX=\"/usr\" -DSTDC_HEADERS=1
-DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1
-DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1
-DHAVE_UNISTD_H=1 -D__EXTENSIONS__=1 -D_ALL_SOURCE=1 -D_GNU_SOURCE=1
-D_POSIX_PTHREAD_SEMANTICS=1 -D_TANDEM_SOURCE=1 -DHAVE_DLFCN_H=1
-DLT_OBJDIR=\".libs/\" -DHAVE_VISIBILITY=1 -DLIBICONV_PLUG -c ./../lib/iconv.c 
-fPIC -DPIC -o objects/.libs/iconv.o
libtool: compile: 
/home/nen/contrib/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-I../lib -I./../lib -I../include -I./../include -I.. -I./.. -pipe -Os
-fvisibility=hidden -DLIBDIR=\"/usr/lib\" -DBUILDING_LIBICONV -DBUILDING_DLL
-DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"/usr/lib\" -DNO_XMALLOC
-Dset_relocation_prefix=libiconv_set_relocation_prefix
-Drelocate=libiconv_relocate -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
-DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
-DPACKAGE_URL=\"\" -DINSTALLPREFIX=\"/usr\" -DSTDC_HEADERS=1
-DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1
-DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1
-DHAVE_UNISTD_H=1 -D__EXTENSIONS__=1 -D_ALL_SOURCE=1 -D_GNU_SOURCE=1
-D_POSIX_PTHREAD_SEMANTICS=1 -D_TANDEM_SOURCE=1 -DHAVE_DLFCN_H=1
-DLT_OBJDIR=\".libs/\" -DHAVE_VISIBILITY=1 -DLIBICONV_PLUG -c
./../libcharset/lib/localcharset.c  -fPIC -DPIC -o objects/.libs/localcharset.o
libtool: compile: 
/home/nen/contrib/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-I../lib -I./../lib -I../include -I./../include -I.. -I./.. -pipe -Os
-fvisibility=hidden -DLIBDIR=\"/usr/lib\" -DBUILDING_LIBICONV -DBUILDING_DLL
-DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"/usr/lib\" -DNO_XMALLOC
-Dset_relocation_prefix=libiconv_set_relocation_prefix
-Drelocate=libiconv_relocate -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
-DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
-DPACKAGE_URL=\"\" -DINSTALLPREFIX=\"/usr\" -DSTDC_HEADERS=1
-DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1
-DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1
-DHAVE_UNISTD_H=1 -D__EXTENSIONS__=1 -D_ALL_SOURCE=1 -D_GNU_SOURCE=1
-D_POSIX_PTHREAD_SEMANTICS=1 -D_TANDEM_SOURCE=1 -DHAVE_DLFCN_H=1
-DLT_OBJDIR=\".libs/\" -DHAVE_VISIBILITY=1 -DLIBICONV_PLUG -c
./../lib/relocatable.c  -fPIC -DPIC -o objects/.libs/relocatable.o
libtool: link: rm -fr  .libs/libiconv.a .libs/libiconv.la .libs/libiconv.lai
libtool: link: ar cru .libs/libiconv.a  objects/.libs/iconv.o
objects/.libs/localcharset.o objects/.libs/relocatable.o
libtool: link:
/home/nen/contrib/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib
.libs/libiconv.a
libtool: link: ( cd ".libs" && rm -f "libiconv.la" && ln -s "../libiconv.la"
"libiconv.la" )
cp .libs/libiconv.so preloadable_libiconv.so
cp: cannot stat '.libs/libiconv.so': No such file or directory
make[2]: *** [preloadable_libiconv.so] Error 1
make[2]: Leaving directory
`/home/nen/contrib/buildroot/output/build/libiconv-1.14/preload'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/nen/contrib/buildroot/output/build/libiconv-1.14'
make: *** [/home/nen/contrib/buildroot/output/build/libiconv-1.14/.stamp_built]
Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
