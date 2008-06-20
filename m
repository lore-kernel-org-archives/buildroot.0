From: Simone Calamai <simone.calamai@gmail.com>
Date: Fri, 20 Jun 2008 17:38:19 +0200
Subject: [Buildroot] Error building qt-embedded in buildroot-20080618
	snapshot
Message-ID: <c8f4d3940806200838t2eba672dm3b2560c845cf1428@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I am trying to build buildroot with the qt-embedded in the
buildroot-20080618 snapshot on a Ubuntu 8.04 system
for a i386 target (Vortex86SX board).
In the configuration step, I enabled the support for Qtopia4 in Package
Selection/Graphics Libraries
section, then modified uClibc-0.9.29.config to set
# UCLIBC_HAS_STDIO_GETC_MACRO is not set
# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
to avoid an 'undefined reference to '__fgetc_unlocked'" error just at the
beginning of qt-embedded build.

The qt build goes on but it is finally stopped with this error:

g++ -fno-exceptions -o ../../../bin/uic3
.obj/release-shared-emb-x86/customwidgetsinfo.o
.obj/release-shared-emb-x86/databaseinfo.o
.obj/release-shared-emb-x86/driver.o
.obj/release-shared-emb-x86/treewalker.o .obj/release-shared-emb-x86/ui4.o
.obj/release-shared-emb-x86/uic.o .obj/release-shared-emb-x86/validator.o
.obj/release-shared-emb-x86/cppextractimages.o
.obj/release-shared-emb-x86/cppwritedeclaration.o
.obj/release-shared-emb-x86/cppwriteicondata.o
.obj/release-shared-emb-x86/cppwriteicondeclaration.o
.obj/release-shared-emb-x86/cppwriteiconinitialization.o
.obj/release-shared-emb-x86/cppwriteincludes.o
.obj/release-shared-emb-x86/cppwriteinitialization.o
.obj/release-shared-emb-x86/main.o .obj/release-shared-emb-x86/ui3reader.o
.obj/release-shared-emb-x86/parser.o .obj/release-shared-emb-x86/domtool.o
.obj/release-shared-emb-x86/object.o
.obj/release-shared-emb-x86/subclassing.o .obj/release-shared-emb-x86/form.o
.obj/release-shared-emb-x86/converter.o
.obj/release-shared-emb-x86/widgetinfo.o .obj/release-shared-emb-x86/embed.o
.obj/release-shared-emb-x86/qt3to4.o .obj/release-shared-emb-x86/deps.o
-L/media/CLFS/build/buildroot-20080619/build_i386/qt-embedded-linux-opensource-src-4.4.0/lib
-lQt3Support
-L/media/CLFS/build/buildroot-20080619/build_i386/qt-embedded-linux-opensource-src-4.4.0/lib
-lQtSql -lQtXml -lQtGui -lQtNetwork -lQtCore -lm -lrt -ldl -lpthread

/media/CLFS/build/buildroot-20080619/build_i386/qt-embedded-linux-opensource-src-4.4.0/lib/libQt3Support.so:
undefined reference to `_res'
/media/CLFS/build/buildroot-20080619/build_i386/qt-embedded-linux-opensource-src-4.4.0/lib/libQtCore.so:
undefined reference to `__glibc_strerror_r'
collect2: ld returned 1 exit status
make[2]: *** [../../../bin/uic3] Error 1
make[2]: Leaving directory
`/media/CLFS/build/buildroot-20080619/build_i386/qt-embedded-linux-opensource-src-4.4.0/src/tools/uic3'
make[1]: *** [sub-uic3-make_default-ordered] Error 2
make[1]: Leaving directory
`/media/CLFS/build/buildroot-20080619/build_i386/qt-embedded-linux-opensource-src-4.4.0'
make: ***
[/media/CLFS/build/buildroot-20080619/build_i386/qt-embedded-linux-opensource-src-4.4.0/.compiled]
Error 2

Is there anybody that has successfully built the buildroot system with the
above described features ?
If so, please tell me which is the correct procedure

Thank you all

Simone
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080620/6518c158/attachment.htm 
