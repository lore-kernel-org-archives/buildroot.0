From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Feb 2017 08:27:26 +0100
Subject: [Buildroot] [PATCH 08/38] package/kodi: bump to version 17.0-Krypton
In-Reply-To: <20170202072756.6624-1-bernd.kuhls@t-online.de>
References: <20170202072756.6624-1-bernd.kuhls@t-online.de>
Message-ID: <20170202072756.6624-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed unneeded patches
- 0001-Fixup-include-path.patch (lib/libdvd needs another fix now)
- 0005-native-TexturePacker-fix-compilation-with-gcc-4.6.patch
  (applied upstream)
- 0006-ffmpeg30.patch (was backported from 17.0-Krypton to 16.0-Jarvis)
- 0007-exif-Fix-for-out-of-memory-errors-with-large-numbers.patch
  (was backported from 17.0-Krypton to 16.0-Jarvis)
- 0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch
  (was backported from 17.0-Krypton to 16.0-Jarvis)
- 0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch
  (cximage was removed in bump from 16.x to 17.0)
- 0010-curl-support-version-7.5.0-and-upwards.patch
  (applied upstream)
- 0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch
  (applied upstream)
- 0012-Fix_includes_in_amcodec.patch
  (was backported from 17.0-Krypton to 16.0-Jarvis)

Add new patches
- 0001-lib-libdvd-Fix-Makefile.in.patch

Rebased patches
- 0001-lib-libdvd-Fix-Makefile.in.patch
- 0004-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch

Removed dependencies not needed anymore:
- boost
  https://github.com/xbmc/xbmc/commit/41ae93f0913f7ba72087a48370f8d66a3eac9fcc
- giflib
  https://github.com/xbmc/xbmc/commit/d44338baf1f6d1e6b76cd7dbab6453d76cc2ac31
- jasper/tiff
  https://github.com/xbmc/xbmc/commit/00724eb109a702f0098089d849f7c02ea173a4a9
- jpeg
  https://github.com/xbmc/xbmc/commit/7d5bdfb9a09348bde92b323ef6077b5e75edaca7
- libdcadec
  https://github.com/xbmc/xbmc/commit/378eb2687c1da5f97ef47c78431033b52f0d4417
- libglew
  https://github.com/xbmc/xbmc/commit/03ff0d5ea02963b1283fe8bc7c1bad18f2dd97b6
- libmpeg2
  https://github.com/xbmc/xbmc/commit/d22c829d67937e8d03fdac8f8b0bf2d1fa8fbf70
- libogg/libvorbis
  https://github.com/xbmc/xbmc/commit/4c609691776ab845d83153e19d191b7fd445edb9
- libpng
  https://github.com/xbmc/xbmc/commit/be6b50c6c3f91809a9045c199d054cbc1d637d5d
- libsquish
  https://github.com/xbmc/xbmc/commit/ed03f828be3615d294eb4a4cfccc5cdccec22997
- xlib_libXmu
- xlib_libXt

Added hard-dependency for libegl, needed after
https://github.com/xbmc/xbmc/commit/0ac305f7cf82e98021b6e0d70c3d4c51fc1cf18a

Removed dvdcss configure option:
https://github.com/xbmc/xbmc/commit/5138926fd8009f27613f2b08a8f0423be4a7779f

Removed joystick configure option:
https://github.com/xbmc/xbmc/commit/bbbc903eeb47d2ad70f2d23eccf88d7ee6930eee

Removed vtbdecoder configure option:
https://github.com/xbmc/xbmc/commit/ebefcd0c62689579b6c013e5d1b32f58cea23b37

Updated clean-up hook and added host-xmlstarlet as dependency to
manipulate the list of default system addons in addon-manifest.xml.

Kodi now uses external libdvdcss/read/nav using a patch ported from
LibreELEC.tv.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/0001-Fixup-include-path.patch         |   33 -
 package/kodi/0001-lib-libdvd-Fix-Makefile.in.patch |  143 ++
 ....cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch |   48 +-
 ...exturePacker-fix-compilation-with-gcc-4.6.patch |   53 -
 package/kodi/0006-ffmpeg30.patch                   |  646 ---------
 ...r-out-of-memory-errors-with-large-numbers.patch |   45 -
 ...ding-issue-when-reading-certain-id3v1-tag.patch |   82 --
 ...lib-cximage-6.0-fix-compilation-with-gcc6.patch | 1438 --------------------
 ...10-curl-support-version-7.5.0-and-upwards.patch |   34 -
 ...bmc_pvr_types.h-Fix-compilation-with-gcc6.patch |   30 -
 package/kodi/0012-Fix_includes_in_amcodec.patch    |   38 -
 package/kodi/Config.in                             |   31 +-
 package/kodi/kodi.hash                             |    2 +-
 package/kodi/kodi.mk                               |   46 +-
 14 files changed, 200 insertions(+), 2469 deletions(-)
 delete mode 100644 package/kodi/0001-Fixup-include-path.patch
 create mode 100644 package/kodi/0001-lib-libdvd-Fix-Makefile.in.patch
 delete mode 100644 package/kodi/0005-native-TexturePacker-fix-compilation-with-gcc-4.6.patch
 delete mode 100644 package/kodi/0006-ffmpeg30.patch
 delete mode 100644 package/kodi/0007-exif-Fix-for-out-of-memory-errors-with-large-numbers.patch
 delete mode 100644 package/kodi/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch
 delete mode 100644 package/kodi/0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch
 delete mode 100644 package/kodi/0010-curl-support-version-7.5.0-and-upwards.patch
 delete mode 100644 package/kodi/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch
 delete mode 100644 package/kodi/0012-Fix_includes_in_amcodec.patch

diff --git a/package/kodi/0001-Fixup-include-path.patch b/package/kodi/0001-Fixup-include-path.patch
deleted file mode 100644
index 9298981c4..000000000
--- a/package/kodi/0001-Fixup-include-path.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 63c255f1f5d68363f49193aceed343e602dc8bdf Mon Sep 17 00:00:00 2001
-From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
-Date: Thu, 26 Dec 2013 21:17:10 +0100
-Subject: [PATCH] Fixup include path
-
-Patch originally taken from :
-http://repository.timesys.com/buildsources/x/xbmc/xbmc-11.0/xbmc-11.0-fixups.patch
-
-Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
----
- lib/enca/configure                           | 3 ---
- lib/enca/configure.ac                        | 3 ---
- lib/libdvd/libdvdread/misc/dvdread-config.sh | 6 +++---
- lib/timidity/configure.in                    | 6 +++---
- 4 files changed, 6 insertions(+), 12 deletions(-)
-
-diff --git a/lib/libdvd/libdvdread/misc/dvdread-config.sh b/lib/libdvd/libdvdread/misc/dvdread-config.sh
-index e170c7e..25ee893 100644
---- a/lib/libdvd/libdvdread/misc/dvdread-config.sh
-+++ b/lib/libdvd/libdvdread/misc/dvdread-config.sh
-@@ -48,9 +48,9 @@ if test "$echo_prefix" = "yes"; then
- fi
- 
- if test "$echo_cflags" = "yes"; then
--      echo -I$prefix/include $extracflags
-+      echo $extracflags
- fi
- 
- if test "$echo_libs" = "yes"; then
--      echo -L$libdir $dvdreadlib
--fi      
-+      echo $dvdreadlib
-+fi
diff --git a/package/kodi/0001-lib-libdvd-Fix-Makefile.in.patch b/package/kodi/0001-lib-libdvd-Fix-Makefile.in.patch
new file mode 100644
index 000000000..9e051f36a
--- /dev/null
+++ b/package/kodi/0001-lib-libdvd-Fix-Makefile.in.patch
@@ -0,0 +1,143 @@
+From 60f98e25c565fd868970b9b4ba115d5779c4999c Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 19 Jun 2016 16:12:49 +0200
+Subject: [PATCH 1/1] lib/libdvd: Fix Makefile.in
+
+Downloaded updated Makefile.in from
+https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/mediacenter/kodi/libdvd/libdvd-makefile.in
+
+LibreELEC.tv copies this new Makefile into the Kodi source code before
+compilation:
+https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/mediacenter/kodi/package.mk#L328
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ lib/libdvd/Makefile.in | 96 +++++++-------------------------------------------
+ 1 file changed, 13 insertions(+), 83 deletions(-)
+
+diff --git a/lib/libdvd/Makefile.in b/lib/libdvd/Makefile.in
+index 00827cf..e99b746 100644
+--- a/lib/libdvd/Makefile.in
++++ b/lib/libdvd/Makefile.in
+@@ -1,105 +1,35 @@
+-
+ AR=@AR@
+ ARCH=@ARCH@
+ CC=@CC@
+ CXX=@CXX@
+ 
+-ifeq (@CROSS_COMPILING@,yes)
+-  DEPENDS_DIR = $(shell grep "^PREFIX=/" @abs_top_srcdir@/tools/depends/Makefile.include | sed 's/PREFIX=//g')
+-  DVDNAV_A = $(DEPENDS_DIR)/lib/libdvdnav.a
+-  DVDREAD_A = $(DEPENDS_DIR)/lib/libdvdread.a
+-  DVDCSS_A = $(DEPENDS_DIR)/lib/libdvdcss.a
+-else
+-  DVDNAV_A = @abs_top_srcdir@/tools/depends/target/libdvdnav/dvdnav-install/lib/libdvdnav.a
+-  DVDREAD_A = @abs_top_srcdir@/tools/depends/target/libdvdread/dvdread-install/lib/libdvdread.a
+-  DVDCSS_A = @abs_top_srcdir@/tools/depends/target/libdvdcss/dvdcss-install/lib/libdvdcss.a
+-endif
+-
+-SYSDIR = @abs_top_srcdir@/system/players/VideoPlayer
+-SOS = libdvdnav-$(ARCH).so
++DVDNAV_A = $(DVD_PREFIX)/usr/lib/libdvdnav.a
++DVDREAD_A = $(DVD_PREFIX)/usr/lib/libdvdread.a
++DVDCSS_A = $(DVD_PREFIX)/usr/lib/libdvdcss.a
+ 
+ WRAPPER = @abs_top_srcdir@/xbmc/cores/DllLoader/exports/wrapper.o
+ WRAPPER_DEF = @abs_top_srcdir@/xbmc/cores/DllLoader/exports/wrapper.def
+-WRAPPER_MACH_ALIAS = @abs_top_srcdir@/xbmc/cores/DllLoader/exports/wrapper_mach_alias
+-
+-ifeq ($(findstring osx,$(ARCH)),osx)
+-  SO_LDFLAGS = $(LDFLAGS) -bundle -undefined dynamic_lookup -read_only_relocs suppress
+-else
+-  SO_LDFLAGS = $(LDFLAGS) -shared -fPIC -rdynamic
+-endif
+-
+-ifeq ($(ARCH), powerpc-osx)
+-  # Add -lbundle1.o for powerpc-osx
+-  BUNDLE1_O = -lbundle1.o
+-endif
+-
+-ifeq ($(ARCH),arm-osx)
+-  BUILD_DVDCSS = 0
+-else
+-  BUILD_DVDCSS = 1
+-endif
+-ifeq ($(BUILD_DVDCSS),1)
+-  SOS += libdvdcss-$(ARCH).so
+-  DVDREAD_DEPS = $(DVDCSS_A)
+-  DVDCSS_OBJS = libdvdcss/*.o
+-endif
+ 
++SO_LDFLAGS = $(LDFLAGS) -shared -fPIC -rdynamic
+ 
++SYSDIR = @abs_top_srcdir@/system/players/VideoPlayer
++SOS = libdvdcss-$(ARCH).so libdvdnav-$(ARCH).so
+ SLIB = $(addprefix $(SYSDIR)/, $(SOS))
+ 
+-DISTCLEAN_FILES=libdvdcss/* libdvdnav/* libdvdread/*
+-
+ all: $(SLIB)
+ 
+-ifeq ($(findstring osx,$(ARCH)), osx)
+-
+-$(SYSDIR)/libdvdcss-$(ARCH).so:  $(WRAPPER) $(DVDREAD_DEPS)
+-	[ -d libdvdcss ] || mkdir libdvdcss
+-	cd libdvdcss; $(AR) x $(DVDCSS_A)
+-	$(CC) $(SO_LDFLAGS) -Wl,-alias_list,$(WRAPPER_MACH_ALIAS) -o $@ \
+-                $(WRAPPER) $(DVDCSS_OBJS) $(BUNDLE1_O)
+-
+-$(SYSDIR)/libdvdnav-$(ARCH).so: $(WRAPPER) $(DVDNAV_A) $(DVDREAD_A) $(DVDREAD_DEPS)
+-	[ -d libdvdread ] || mkdir libdvdread
+-	[ -d libdvdnav ] || mkdir libdvdnav
+-	[ $(BUILD_DVDCSS) -eq 1 ] && { [ -d libdvdcss ] || mkdir libdvdcss; } || :
+-	[ $(BUILD_DVDCSS) -eq 1 ] && { cd libdvdcss && $(AR) x $(DVDCSS_A); } || :
+-	cd libdvdnav; $(AR) x $(DVDNAV_A)
+-	cd libdvdread; $(AR) x $(DVDREAD_A)
+-	$(CC) $(SO_LDFLAGS) -Wl,-alias_list,$(WRAPPER_MACH_ALIAS) -o $@ \
+-                $(WRAPPER) libdvdread/*.o libdvdnav/*.o $(DVDCSS_OBJS) $(BUNDLE1_O)
+-
+-else
+ $(SYSDIR)/libdvdcss-$(ARCH).so: $(WRAPPER) $(WRAPPER_DEF) $(DVDCSS_A)
+-	[ -d libdvdcss ] || mkdir libdvdcss
+-	cd libdvdcss; $(AR) x $(DVDCSS_A)
+-	$(CC) -o $@ $(SO_LDFLAGS) -Wl,--soname,$@ $(DVDCSS_OBJS) -Wl,--unresolved-symbols=ignore-all -lm \
+-        `cat $(WRAPPER_DEF)` $(WRAPPER)
++	mkdir -p libdvdcss; cd libdvdcss; $(AR) x $(DVDCSS_A)
++	$(CC) -o $@ $(SO_LDFLAGS) -Wl,--soname,$@ libdvdcss/*.o -Wl,--unresolved-symbols=ignore-all -lm \
++                `cat $(WRAPPER_DEF)` $(WRAPPER)
+ 
+ $(SYSDIR)/libdvdnav-$(ARCH).so: $(WRAPPER) $(WRAPPER_DEF) $(DVDNAV_A) $(DVDREAD_A) $(DVDCSS_A)
+-	[ -d libdvdread ] || mkdir libdvdread
+-	[ -d libdvdnav ] || mkdir libdvdnav
+-	[ $(BUILD_DVDCSS) -eq 1 ] && { [ -d libdvdcss ] || mkdir libdvdcss; } || :
+-	[ $(BUILD_DVDCSS) -eq 1 ] && { cd libdvdcss && $(AR) x $(DVDCSS_A); } || :
+-	cd libdvdnav; $(AR) x $(DVDNAV_A)
+-	cd libdvdread; $(AR) x $(DVDREAD_A)
+-	$(CC) -o $@ $(SO_LDFLAGS) -Wl,--soname,$@ libdvdread/*.o libdvdnav/*.o $(DVDCSS_OBJS) -lm -Wl,--unresolved-symbols=ignore-all \
++	mkdir -p libdvdread; cd libdvdread; $(AR) x $(DVDREAD_A)
++	mkdir -p libdvdnav; cd libdvdnav; $(AR) x $(DVDNAV_A)
++	mkdir -p libdvdcss; cd libdvdcss; $(AR) x $(DVDCSS_A)
++	$(CC) -o $@ $(SO_LDFLAGS) -Wl,--soname,$@ libdvdread/*.o libdvdnav/*.o libdvdcss/*.o -lm -Wl,--unresolved-symbols=ignore-all \
+                 `cat  $(WRAPPER_DEF)` $(WRAPPER)
+-endif
+ 
+ $(WRAPPER_DEF):
+ 	$(MAKE) -C @abs_top_srcdir@/xbmc/cores/DllLoader/exports wrapper.def
+ 
+-$(DVDNAV_A): $(DVDREAD_A)
+-	$(MAKE) -C @abs_top_srcdir@/tools/depends/target/libdvdnav
+-
+-$(DVDREAD_A): $(DVDREAD_DEPS)
+-	$(MAKE) -C @abs_top_srcdir@/tools/depends/target/libdvdread
+-
+-ifeq ($(BUILD_DVDCSS),1)
+-$(DVDCSS_A):
+-	$(MAKE) -C @abs_top_srcdir@/tools/depends/target/libdvdcss
+-endif
+-
+-include @abs_top_srcdir@/Makefile.include
+-
+-- 
+2.8.1
+
diff --git a/package/kodi/0004-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch b/package/kodi/0004-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
index 2678a7839..f9bb0be30 100644
--- a/package/kodi/0004-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
+++ b/package/kodi/0004-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
@@ -9,33 +9,39 @@ not the same as the one at run-time. The CMAKE_FIND_ROOT_PATH variable
 is here to handle this difference, so use it in kodi-config.cmake.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+(rebased against Kodi 17.0-Krypton)
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- project/cmake/kodi-config.cmake.in | 6 +++---
+ project/cmake/KodiConfig.cmake.in | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/project/cmake/kodi-config.cmake.in b/project/cmake/kodi-config.cmake.in
 index 76626ec..ffb8e1d 100644
---- a/project/cmake/kodi-config.cmake.in
-+++ b/project/cmake/kodi-config.cmake.in
-@@ -7,15 +7,15 @@
-   SET(@APP_NAME_UC at _PREFIX @APP_PREFIX@)
- ENDIF()
- IF(NOT @APP_NAME_UC at _INCLUDE_DIR)
--  SET(@APP_NAME_UC at _INCLUDE_DIR @APP_INCLUDE_DIR@)
-+  SET(@APP_NAME_UC at _INCLUDE_DIR ${CMAKE_FIND_ROOT_PATH}/@APP_INCLUDE_DIR@)
- ENDIF()
- IF(NOT @APP_NAME_UC at _LIB_DIR)
--  SET(@APP_NAME_UC at _LIB_DIR @APP_LIB_DIR@)
-+  SET(@APP_NAME_UC at _LIB_DIR ${CMAKE_FIND_ROOT_PATH}/@APP_LIB_DIR@)
- ENDIF()
- IF(NOT WIN32)
-   SET(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} @CXX11_SWITCH@")
- ENDIF()
--LIST(APPEND CMAKE_MODULE_PATH @APP_LIB_DIR@)
-+LIST(APPEND CMAKE_MODULE_PATH ${CMAKE_FIND_ROOT_PATH}/@APP_LIB_DIR@)
- ADD_DEFINITIONS(@ARCH_DEFINES@ -DBUILD_KODI_ADDON)
+--- a/project/cmake/KodiConfig.cmake.in
++++ b/project/cmake/KodiConfig.cmake.in
+@@ -7,18 +7,18 @@ if(NOT @APP_NAME_UC at _PREFIX)
+   set(@APP_NAME_UC at _PREFIX @APP_PREFIX@)
+ endif()
+ if(NOT @APP_NAME_UC at _INCLUDE_DIR)
+-  set(@APP_NAME_UC at _INCLUDE_DIR @APP_INCLUDE_DIR@)
++  set(@APP_NAME_UC at _INCLUDE_DIR ${CMAKE_FIND_ROOT_PATH}/@APP_INCLUDE_DIR@)
+ endif()
+ if(NOT @APP_NAME_UC at _LIB_DIR)
+-  set(@APP_NAME_UC at _LIB_DIR @APP_LIB_DIR@)
++  set(@APP_NAME_UC at _LIB_DIR ${CMAKE_FIND_ROOT_PATH}/@APP_LIB_DIR@)
+ endif()
+ if(NOT @APP_NAME_UC at _DATA_DIR)
+-  set(@APP_NAME_UC at _DATA_DIR @APP_DATA_DIR@)
++  set(@APP_NAME_UC at _DATA_DIR ${CMAKE_FIND_ROOT_PATH}/@APP_DATA_DIR@)
+ endif()
+ if(NOT WIN32)
+   set(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} @CXX11_SWITCH@")
+ endif()
+-list(APPEND CMAKE_MODULE_PATH @APP_LIB_DIR@ @APP_DATA_DIR@/cmake)
++list(APPEND CMAKE_MODULE_PATH ${CMAKE_FIND_ROOT_PATH}/@APP_LIB_DIR@ @APP_DATA_DIR@/cmake)
  
- if(NOT CORE_SYSTEM_NAME)
+ string(REPLACE ";" " " ARCH_DEFINES "@ARCH_DEFINES@")
+ add_definitions(${ARCH_DEFINES} -DBUILD_KODI_ADDON)
 -- 
 2.5.0
 
diff --git a/package/kodi/0005-native-TexturePacker-fix-compilation-with-gcc-4.6.patch b/package/kodi/0005-native-TexturePacker-fix-compilation-with-gcc-4.6.patch
deleted file mode 100644
index 3d9370ff0..000000000
--- a/package/kodi/0005-native-TexturePacker-fix-compilation-with-gcc-4.6.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 2b395fb3f07551ae1ce2e484c14ac59f36e192b0 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Thu, 17 Mar 2016 21:47:53 +0100
-Subject: [PATCH] native/TexturePacker: fix compilation with gcc 4.6
-
-Kodi itself depends on gcc >= 4.7 due to its use of the C++11 standard.
-When cross-compiling the host gcc currently also needs to be >= 4.7 due
-to the texturepacker tool being needed as native binary to compile
-Textures.xbt for the target system.
-
-Cross-compiling on a system where host gcc is at version 4.6 fails atm
-with this error:
-
-cc1plus: error: unrecognized command line option '-std=c++11'
-make[4]: *** [md5.o] Error 1
-make[4]: *** Waiting for unfinished jobs....
-cc1plus: error: unrecognized command line option '-std=c++11'
-cc1plus: error: unrecognized command line option '-std=c++11'
-
-make[4]: *** [DecoderManager.o] Error 1
-make[4]: *** [XBTFWriter.o] Error 1
-cc1plus: error: unrecognized command line option '-std=c++11'
-make[4]: *** [TexturePacker.o] Error 1
-cc1plus: error: unrecognized command line option '-std=c++11'
-make[4]: *** [decoder/PNGDecoder.o] Error 1
-make[3]: *** [all] Error 2
-make[2]: *** [native/TexturePacker] Error 2
-
-Using this patch the problem is fixed and a working TexturePacker host
-binary is created.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Patch sent upstream: https://github.com/xbmc/xbmc/pull/9378
----
- tools/depends/native/TexturePacker/src/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/depends/native/TexturePacker/src/Makefile.am b/tools/depends/native/TexturePacker/src/Makefile.am
-index c1fc8be..d075290 100644
---- a/tools/depends/native/TexturePacker/src/Makefile.am
-+++ b/tools/depends/native/TexturePacker/src/Makefile.am
-@@ -2,7 +2,7 @@ AUTOMAKE_OPTIONS = subdir-objects
- 
- AM_CFLAGS = -DTARGET_POSIX -DUSE_LZO_PACKING
- AM_CFLAGS += @EXTRA_DEFINES@
--AM_CXXFLAGS = $(AM_CFLAGS) -std=c++11
-+AM_CXXFLAGS = $(AM_CFLAGS) -std=c++0x
- 
- AM_CPPFLAGS = \
-   -I. \
--- 
-2.7.0
-
diff --git a/package/kodi/0006-ffmpeg30.patch b/package/kodi/0006-ffmpeg30.patch
deleted file mode 100644
index 9164d48ad..000000000
--- a/package/kodi/0006-ffmpeg30.patch
+++ /dev/null
@@ -1,646 +0,0 @@
-Add support for ffmpeg 3.0
-
-Changes from original commit are only in file paths & quilt refresh.
-
-commit c31b7d374062f87c7512d9872cbceac920465913
-Author: Philip Langdale <philipl@overt.org>
-Date:   Mon Sep 21 19:49:36 2015 -0700
-
-    ffmpeg: Update AVPixelFormat and AV_PIX_FMT_* to compile with master
-    
-    The deprecated PixelFormat and PIX_FMT_* names have been removed in
-    ffmpeg master.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Downloaded from
-https://gitweb.gentoo.org/repo/gentoo.git/tree/media-tv/kodi/files/kodi-16-ffmpeg3.patch]
-
-Index: xbmc-16.0-Jarvis/xbmc/cores/FFmpeg.h
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/FFmpeg.h
-+++ xbmc-16.0-Jarvis/xbmc/cores/FFmpeg.h
-@@ -24,7 +24,6 @@
- #include "utils/CPUInfo.h"
- 
- extern "C" {
--#include "libswscale/swscale.h"
- #include "libavcodec/avcodec.h"
- #include "libavformat/avformat.h"
- #include "libavutil/avutil.h"
-@@ -33,23 +32,6 @@ extern "C" {
- #include "libpostproc/postprocess.h"
- }
- 
--inline int SwScaleCPUFlags()
--{
--  unsigned int cpuFeatures = g_cpuInfo.GetCPUFeatures();
--  int flags = 0;
--
--  if (cpuFeatures & CPU_FEATURE_MMX)
--    flags |= SWS_CPU_CAPS_MMX;
--  if (cpuFeatures & CPU_FEATURE_MMX2)
--    flags |= SWS_CPU_CAPS_MMX2;
--  if (cpuFeatures & CPU_FEATURE_3DNOW)
--    flags |= SWS_CPU_CAPS_3DNOW;
--  if (cpuFeatures & CPU_FEATURE_ALTIVEC)
--    flags |= SWS_CPU_CAPS_ALTIVEC;
--
--  return flags;
--}
--
- inline int PPCPUFlags()
- {
-   unsigned int cpuFeatures = g_cpuInfo.GetCPUFeatures();
-Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/DVDCodecUtils.cpp
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/DVDCodecUtils.cpp
-+++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/DVDCodecUtils.cpp
-@@ -39,7 +39,7 @@ extern "C" {
- #include "libswscale/swscale.h"
- }
- 
--// allocate a new picture (PIX_FMT_YUV420P)
-+// allocate a new picture (AV_PIX_FMT_YUV420P)
- DVDVideoPicture* CDVDCodecUtils::AllocatePicture(int iWidth, int iHeight)
- {
-   DVDVideoPicture* pPicture = new DVDVideoPicture;
-@@ -264,13 +264,13 @@ DVDVideoPicture* CDVDCodecUtils::Convert
- 
-         int dstformat;
-         if (format == RENDER_FMT_UYVY422)
--          dstformat = PIX_FMT_UYVY422;
-+          dstformat = AV_PIX_FMT_UYVY422;
-         else
--          dstformat = PIX_FMT_YUYV422;
-+          dstformat = AV_PIX_FMT_YUYV422;
- 
--        struct SwsContext *ctx = sws_getContext(pSrc->iWidth, pSrc->iHeight, PIX_FMT_YUV420P,
-+        struct SwsContext *ctx = sws_getContext(pSrc->iWidth, pSrc->iHeight, AV_PIX_FMT_YUV420P,
-                                                            pPicture->iWidth, pPicture->iHeight, (AVPixelFormat)dstformat,
--                                                           SWS_BILINEAR | SwScaleCPUFlags(), NULL, NULL, NULL);
-+                                                           SWS_BILINEAR, NULL, NULL, NULL);
-         sws_scale(ctx, src, srcStride, 0, pSrc->iHeight, dst, dstStride);
-         sws_freeContext(ctx);
-       }
-@@ -403,25 +403,25 @@ double CDVDCodecUtils::NormalizeFramedur
- }
- 
- struct EFormatMap {
--  PixelFormat   pix_fmt;
-+  AVPixelFormat   pix_fmt;
-   ERenderFormat format;
- };
- 
- static const EFormatMap g_format_map[] = {
--   { PIX_FMT_YUV420P,     RENDER_FMT_YUV420P    }
--,  { PIX_FMT_YUVJ420P,    RENDER_FMT_YUV420P    }
--,  { PIX_FMT_YUV420P10,   RENDER_FMT_YUV420P10  }
--,  { PIX_FMT_YUV420P16,   RENDER_FMT_YUV420P16  }
--,  { PIX_FMT_UYVY422,     RENDER_FMT_UYVY422    }
--,  { PIX_FMT_YUYV422,     RENDER_FMT_YUYV422    }
--,  { PIX_FMT_VAAPI_VLD,   RENDER_FMT_VAAPI      }
--,  { PIX_FMT_DXVA2_VLD,   RENDER_FMT_DXVA       }
--,  { PIX_FMT_NONE     ,   RENDER_FMT_NONE       }
-+   { AV_PIX_FMT_YUV420P,     RENDER_FMT_YUV420P    }
-+,  { AV_PIX_FMT_YUVJ420P,    RENDER_FMT_YUV420P    }
-+,  { AV_PIX_FMT_YUV420P10,   RENDER_FMT_YUV420P10  }
-+,  { AV_PIX_FMT_YUV420P16,   RENDER_FMT_YUV420P16  }
-+,  { AV_PIX_FMT_UYVY422,     RENDER_FMT_UYVY422    }
-+,  { AV_PIX_FMT_YUYV422,     RENDER_FMT_YUYV422    }
-+,  { AV_PIX_FMT_VAAPI_VLD,   RENDER_FMT_VAAPI      }
-+,  { AV_PIX_FMT_DXVA2_VLD,   RENDER_FMT_DXVA       }
-+,  { AV_PIX_FMT_NONE     ,   RENDER_FMT_NONE       }
- };
- 
- ERenderFormat CDVDCodecUtils::EFormatFromPixfmt(int fmt)
- {
--  for(const EFormatMap *p = g_format_map; p->pix_fmt != PIX_FMT_NONE; ++p)
-+  for(const EFormatMap *p = g_format_map; p->pix_fmt != AV_PIX_FMT_NONE; ++p)
-   {
-     if(p->pix_fmt == fmt)
-       return p->format;
-@@ -431,10 +431,10 @@ ERenderFormat CDVDCodecUtils::EFormatFro
- 
- int CDVDCodecUtils::PixfmtFromEFormat(ERenderFormat fmt)
- {
--  for(const EFormatMap *p = g_format_map; p->pix_fmt != PIX_FMT_NONE; ++p)
-+  for(const EFormatMap *p = g_format_map; p->pix_fmt != AV_PIX_FMT_NONE; ++p)
-   {
-     if(p->format == fmt)
-       return p->pix_fmt;
-   }
--  return PIX_FMT_NONE;
-+  return AV_PIX_FMT_NONE;
- }
-Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecFFmpeg.cpp
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecFFmpeg.cpp
-+++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecFFmpeg.cpp
-@@ -77,8 +77,8 @@ enum DecoderState
-   STATE_SW_MULTI
- };
- 
--enum PixelFormat CDVDVideoCodecFFmpeg::GetFormat( struct AVCodecContext * avctx
--                                                , const PixelFormat * fmt )
-+enum AVPixelFormat CDVDVideoCodecFFmpeg::GetFormat( struct AVCodecContext * avctx
-+                                                , const AVPixelFormat * fmt )
- {
-   CDVDVideoCodecFFmpeg* ctx  = (CDVDVideoCodecFFmpeg*)avctx->opaque;
- 
-@@ -104,8 +104,8 @@ enum PixelFormat CDVDVideoCodecFFmpeg::G
-     avctx->hwaccel_context = 0;
-   }
- 
--  const PixelFormat * cur = fmt;
--  while(*cur != PIX_FMT_NONE)
-+  const AVPixelFormat * cur = fmt;
-+  while(*cur != AV_PIX_FMT_NONE)
-   {
- #ifdef HAVE_LIBVDPAU
-     if(VDPAU::CDecoder::IsVDPAUFormat(*cur) && CSettings::GetInstance().GetBool(CSettings::SETTING_VIDEOPLAYER_USEVDPAU))
-@@ -137,7 +137,7 @@ enum PixelFormat CDVDVideoCodecFFmpeg::G
- #endif
- #ifdef HAVE_LIBVA
-     // mpeg4 vaapi decoding is disabled
--    if(*cur == PIX_FMT_VAAPI_VLD && CSettings::GetInstance().GetBool(CSettings::SETTING_VIDEOPLAYER_USEVAAPI))
-+    if(*cur == AV_PIX_FMT_VAAPI_VLD && CSettings::GetInstance().GetBool(CSettings::SETTING_VIDEOPLAYER_USEVAAPI))
-     {
-       VAAPI::CDecoder* dec = new VAAPI::CDecoder();
-       if(dec->Open(avctx, ctx->m_pCodecContext, *cur, ctx->m_uSurfacesCount) == true)
-@@ -214,11 +214,11 @@ bool CDVDVideoCodecFFmpeg::Open(CDVDStre
- 
-   for(std::vector<ERenderFormat>::iterator it = options.m_formats.begin(); it != options.m_formats.end(); ++it)
-   {
--    m_formats.push_back((PixelFormat)CDVDCodecUtils::PixfmtFromEFormat(*it));
-+    m_formats.push_back((AVPixelFormat)CDVDCodecUtils::PixfmtFromEFormat(*it));
-     if(*it == RENDER_FMT_YUV420P)
--      m_formats.push_back(PIX_FMT_YUVJ420P);
-+      m_formats.push_back(AV_PIX_FMT_YUVJ420P);
-   }
--  m_formats.push_back(PIX_FMT_NONE); /* always add none to get a terminated list in ffmpeg world */
-+  m_formats.push_back(AV_PIX_FMT_NONE); /* always add none to get a terminated list in ffmpeg world */
- 
-   pCodec = avcodec_find_decoder(hints.codec);
- 
-@@ -655,7 +655,7 @@ bool CDVDVideoCodecFFmpeg::GetPictureCom
-   pDvdVideoPicture->color_transfer = m_pCodecContext->color_trc;
-   pDvdVideoPicture->color_matrix = m_pCodecContext->colorspace;
-   if(m_pCodecContext->color_range == AVCOL_RANGE_JPEG
--  || m_pCodecContext->pix_fmt     == PIX_FMT_YUVJ420P)
-+  || m_pCodecContext->pix_fmt     == AV_PIX_FMT_YUVJ420P)
-     pDvdVideoPicture->color_range = 1;
-   else
-     pDvdVideoPicture->color_range = 0;
-@@ -738,8 +738,8 @@ bool CDVDVideoCodecFFmpeg::GetPicture(DV
-   pDvdVideoPicture->iFlags |= pDvdVideoPicture->data[0] ? 0 : DVP_FLAG_DROPPED;
-   pDvdVideoPicture->extended_format = 0;
- 
--  PixelFormat pix_fmt;
--  pix_fmt = (PixelFormat)m_pFrame->format;
-+  AVPixelFormat pix_fmt;
-+  pix_fmt = (AVPixelFormat)m_pFrame->format;
- 
-   pDvdVideoPicture->format = CDVDCodecUtils::EFormatFromPixfmt(pix_fmt);
-   return true;
-Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecFFmpeg.h
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecFFmpeg.h
-+++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecFFmpeg.h
-@@ -46,7 +46,7 @@ public:
-     public:
-              IHardwareDecoder() {}
-     virtual ~IHardwareDecoder() {};
--    virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum PixelFormat, unsigned int surfaces) = 0;
-+    virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum AVPixelFormat, unsigned int surfaces) = 0;
-     virtual int  Decode    (AVCodecContext* avctx, AVFrame* frame) = 0;
-     virtual bool GetPicture(AVCodecContext* avctx, AVFrame* frame, DVDVideoPicture* picture) = 0;
-     virtual int  Check     (AVCodecContext* avctx) = 0;
-@@ -77,7 +77,7 @@ public:
-   void               SetHardware(IHardwareDecoder* hardware);
- 
- protected:
--  static enum PixelFormat GetFormat(struct AVCodecContext * avctx, const PixelFormat * fmt);
-+  static enum AVPixelFormat GetFormat(struct AVCodecContext * avctx, const AVPixelFormat * fmt);
- 
-   int  FilterOpen(const std::string& filters, bool scale);
-   void FilterClose();
-@@ -119,7 +119,7 @@ protected:
-   int m_iLastKeyframe;
-   double m_dts;
-   bool   m_started;
--  std::vector<PixelFormat> m_formats;
-+  std::vector<AVPixelFormat> m_formats;
-   double m_decoderPts;
-   int    m_skippedDeint;
-   bool   m_requestSkipDeint;
-Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecVDA.cpp
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecVDA.cpp
-+++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecVDA.cpp
-@@ -554,11 +554,11 @@ void CDVDVideoCodecVDA::DisplayQueuePop(
- 
- void CDVDVideoCodecVDA::UYVY422_to_YUV420P(uint8_t *yuv422_ptr, int yuv422_stride, DVDVideoPicture *picture)
- {
--  // convert PIX_FMT_UYVY422 to PIX_FMT_YUV420P.
-+  // convert AV_PIX_FMT_UYVY422 to AV_PIX_FMT_YUV420P.
-   struct SwsContext *swcontext = sws_getContext(
--    m_videobuffer.iWidth, m_videobuffer.iHeight, PIX_FMT_UYVY422, 
--    m_videobuffer.iWidth, m_videobuffer.iHeight, PIX_FMT_YUV420P, 
--    SWS_FAST_BILINEAR | SwScaleCPUFlags(), NULL, NULL, NULL);
-+    m_videobuffer.iWidth, m_videobuffer.iHeight, AV_PIX_FMT_UYVY422,
-+    m_videobuffer.iWidth, m_videobuffer.iHeight, AV_PIX_FMT_YUV420P,
-+    SWS_FAST_BILINEAR, NULL, NULL, NULL);
-   if (swcontext)
-   {
-     uint8_t  *src[] = { yuv422_ptr, 0, 0, 0 };
-@@ -574,11 +574,11 @@ void CDVDVideoCodecVDA::UYVY422_to_YUV42
- 
- void CDVDVideoCodecVDA::BGRA_to_YUV420P(uint8_t *bgra_ptr, int bgra_stride, DVDVideoPicture *picture)
- {
--  // convert PIX_FMT_BGRA to PIX_FMT_YUV420P.
-+  // convert AV_PIX_FMT_BGRA to AV_PIX_FMT_YUV420P.
-   struct SwsContext *swcontext = sws_getContext(
--    m_videobuffer.iWidth, m_videobuffer.iHeight, PIX_FMT_BGRA, 
--    m_videobuffer.iWidth, m_videobuffer.iHeight, PIX_FMT_YUV420P, 
--    SWS_FAST_BILINEAR | SwScaleCPUFlags(), NULL, NULL, NULL);
-+    m_videobuffer.iWidth, m_videobuffer.iHeight, AV_PIX_FMT_BGRA,
-+    m_videobuffer.iWidth, m_videobuffer.iHeight, AV_PIX_FMT_YUV420P,
-+    SWS_FAST_BILINEAR, NULL, NULL, NULL);
-   if (swcontext)
-   {
-     uint8_t  *src[] = { bgra_ptr, 0, 0, 0 };
-Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DXVA.cpp
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/DXVA.cpp
-+++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DXVA.cpp
-@@ -886,7 +886,7 @@ static bool CheckCompatibility(AVCodecCo
-   return true;
- }
- 
--bool CDecoder::Open(AVCodecContext *avctx, AVCodecContext* mainctx, enum PixelFormat fmt, unsigned int surfaces)
-+bool CDecoder::Open(AVCodecContext *avctx, AVCodecContext* mainctx, enum AVPixelFormat fmt, unsigned int surfaces)
- {
-   if (!CheckCompatibility(avctx))
-     return false;
-@@ -1135,9 +1135,9 @@ bool CDecoder::OpenDecoder()
-   return true;
- }
- 
--bool CDecoder::Supports(enum PixelFormat fmt)
-+bool CDecoder::Supports(enum AVPixelFormat fmt)
- {
--  if(fmt == PIX_FMT_DXVA2_VLD)
-+  if(fmt == AV_PIX_FMT_DXVA2_VLD)
-     return true;
-   return false;
- }
-Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DXVA.h
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/DXVA.h
-+++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DXVA.h
-@@ -141,7 +141,7 @@ class CDecoder
- public:
-   CDecoder();
-  ~CDecoder();
--  virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum PixelFormat, unsigned int surfaces);
-+  virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum AVPixelFormat, unsigned int surfaces);
-   virtual int  Decode    (AVCodecContext* avctx, AVFrame* frame);
-   virtual bool GetPicture(AVCodecContext* avctx, AVFrame* frame, DVDVideoPicture* picture);
-   virtual int  Check     (AVCodecContext* avctx);
-@@ -154,7 +154,7 @@ public:
-   int   GetBuffer(AVCodecContext *avctx, AVFrame *pic, int flags);
-   void  RelBuffer(uint8_t *data);
- 
--  static bool      Supports(enum PixelFormat fmt);
-+  static bool      Supports(enum AVPixelFormat fmt);
- 
-   void CloseDXVADecoder();
- 
-Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.cpp
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.cpp
-+++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.cpp
-@@ -479,7 +479,7 @@ CDecoder::~CDecoder()
-   Close();
- }
- 
--bool CDecoder::Open(AVCodecContext* avctx, AVCodecContext* mainctx, const enum PixelFormat fmt, unsigned int surfaces)
-+bool CDecoder::Open(AVCodecContext* avctx, AVCodecContext* mainctx, const enum AVPixelFormat fmt, unsigned int surfaces)
- {
-   // don't support broken wrappers by default
-   // nvidia cards with a vaapi to vdpau wrapper
-Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.h
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.h
-+++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.h
-@@ -406,7 +406,7 @@ public:
-   CDecoder();
-   virtual ~CDecoder();
- 
--  virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum PixelFormat, unsigned int surfaces = 0);
-+  virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum AVPixelFormat, unsigned int surfaces = 0);
-   virtual int  Decode    (AVCodecContext* avctx, AVFrame* frame);
-   virtual bool GetPicture(AVCodecContext* avctx, AVFrame* frame, DVDVideoPicture* picture);
-   virtual void Reset();
-Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDA.cpp
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/VDA.cpp
-+++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDA.cpp
-@@ -186,7 +186,7 @@ void CDecoder::Close()
-   m_bitstream = NULL;
- }
- 
--bool CDecoder::Open(AVCodecContext *avctx, AVCodecContext* mainctx, enum PixelFormat fmt, unsigned int surfaces)
-+bool CDecoder::Open(AVCodecContext *avctx, AVCodecContext* mainctx, enum AVPixelFormat fmt, unsigned int surfaces)
- {
-   Close();
- 
-Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDA.h
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/VDA.h
-+++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDA.h
-@@ -35,7 +35,7 @@ class CDecoder
- public:
-   CDecoder();
-  ~CDecoder();
--  virtual bool Open(AVCodecContext* avctx, AVCodecContext* mainctx, const enum PixelFormat, unsigned int surfaces = 0);
-+  virtual bool Open(AVCodecContext* avctx, AVCodecContext* mainctx, const enum AVPixelFormat, unsigned int surfaces = 0);
-   virtual int Decode(AVCodecContext* avctx, AVFrame* frame);
-   virtual bool GetPicture(AVCodecContext* avctx, AVFrame* frame, DVDVideoPicture* picture);
-   virtual int Check(AVCodecContext* avctx);
-Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.cpp
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.cpp
-+++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.cpp
-@@ -486,7 +486,7 @@ CDecoder::CDecoder() : m_vdpauOutput(&m_
-   m_vdpauConfig.context = 0;
- }
- 
--bool CDecoder::Open(AVCodecContext* avctx, AVCodecContext* mainctx, const enum PixelFormat fmt, unsigned int surfaces)
-+bool CDecoder::Open(AVCodecContext* avctx, AVCodecContext* mainctx, const enum AVPixelFormat fmt, unsigned int surfaces)
- {
-   // check if user wants to decode this format with VDPAU
-   std::string gpuvendor = g_Windowing.GetRenderVendor();
-@@ -760,7 +760,7 @@ int CDecoder::Check(AVCodecContext* avct
-   return 0;
- }
- 
--bool CDecoder::IsVDPAUFormat(PixelFormat format)
-+bool CDecoder::IsVDPAUFormat(AVPixelFormat format)
- {
-   if (format == AV_PIX_FMT_VDPAU)
-     return true;
-Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.h
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.h
-+++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.h
-@@ -556,7 +556,7 @@ public:
-   CDecoder();
-   virtual ~CDecoder();
- 
--  virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum PixelFormat, unsigned int surfaces = 0);
-+  virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum AVPixelFormat, unsigned int surfaces = 0);
-   virtual int  Decode    (AVCodecContext* avctx, AVFrame* frame);
-   virtual bool GetPicture(AVCodecContext* avctx, AVFrame* frame, DVDVideoPicture* picture);
-   virtual void Reset();
-@@ -571,7 +571,7 @@ public:
-   bool Supports(VdpVideoMixerFeature feature);
-   bool Supports(EINTERLACEMETHOD method);
-   EINTERLACEMETHOD AutoInterlaceMethod();
--  static bool IsVDPAUFormat(PixelFormat fmt);
-+  static bool IsVDPAUFormat(AVPixelFormat fmt);
- 
-   static void FFReleaseBuffer(void *opaque, uint8_t *data);
-   static int FFGetBuffer(AVCodecContext *avctx, AVFrame *pic, int flags);
-Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDDemuxers/DVDDemuxFFmpeg.cpp
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDDemuxers/DVDDemuxFFmpeg.cpp
-+++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDDemuxers/DVDDemuxFFmpeg.cpp
-@@ -1638,7 +1638,7 @@ void CDVDDemuxFFmpeg::ParsePacket(AVPack
- 
-   // for video we need a decoder to get desired information into codec context
-   if (st->codec->codec_type == AVMEDIA_TYPE_VIDEO && st->codec->extradata &&
--      (!st->codec->width || st->codec->pix_fmt == PIX_FMT_NONE))
-+      (!st->codec->width || st->codec->pix_fmt == AV_PIX_FMT_NONE))
-   {
-     // open a decoder, it will be cleared down by ffmpeg on closing the stream
-     if (!st->codec->codec)
-@@ -1695,7 +1695,7 @@ bool CDVDDemuxFFmpeg::IsVideoReady()
-       st = m_pFormatContext->streams[idx];
-       if (st->codec->codec_type == AVMEDIA_TYPE_VIDEO)
-       {
--        if (st->codec->width && st->codec->pix_fmt != PIX_FMT_NONE)
-+        if (st->codec->width && st->codec->pix_fmt != AV_PIX_FMT_NONE)
-           return true;
-         hasVideo = true;
-       }
-@@ -1708,7 +1708,7 @@ bool CDVDDemuxFFmpeg::IsVideoReady()
-       st = m_pFormatContext->streams[i];
-       if (st->codec->codec_type == AVMEDIA_TYPE_VIDEO)
-       {
--        if (st->codec->width && st->codec->pix_fmt != PIX_FMT_NONE)
-+        if (st->codec->width && st->codec->pix_fmt != AV_PIX_FMT_NONE)
-           return true;
-         hasVideo = true;
-       }
-Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDFileInfo.cpp
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDFileInfo.cpp
-+++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDFileInfo.cpp
-@@ -275,7 +275,7 @@ bool CDVDFileInfo::ExtractThumb(const st
- 
-             uint8_t *pOutBuf = new uint8_t[nWidth * nHeight * 4];
-             struct SwsContext *context = sws_getContext(picture.iWidth, picture.iHeight,
--                  PIX_FMT_YUV420P, nWidth, nHeight, PIX_FMT_BGRA, SWS_FAST_BILINEAR | SwScaleCPUFlags(), NULL, NULL, NULL);
-+                  AV_PIX_FMT_YUV420P, nWidth, nHeight, AV_PIX_FMT_BGRA, SWS_FAST_BILINEAR, NULL, NULL, NULL);
- 
-             if (context)
-             {
-Index: xbmc-16.0-Jarvis/xbmc/cores/VideoRenderers/LinuxRendererGL.cpp
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/VideoRenderers/LinuxRendererGL.cpp
-+++ xbmc-16.0-Jarvis/xbmc/cores/VideoRenderers/LinuxRendererGL.cpp
-@@ -2932,7 +2932,7 @@ void CLinuxRendererGL::ToRGBFrame(YV12Im
-   }
-   else if (m_format == RENDER_FMT_NV12)
-   {
--    srcFormat = PIX_FMT_NV12;
-+    srcFormat = AV_PIX_FMT_NV12;
-     for (int i = 0; i < 2; i++)
-     {
-       src[i]       = im->plane[i];
-@@ -2941,13 +2941,13 @@ void CLinuxRendererGL::ToRGBFrame(YV12Im
-   }
-   else if (m_format == RENDER_FMT_YUYV422)
-   {
--    srcFormat    = PIX_FMT_YUYV422;
-+    srcFormat    = AV_PIX_FMT_YUYV422;
-     src[0]       = im->plane[0];
-     srcStride[0] = im->stride[0];
-   }
-   else if (m_format == RENDER_FMT_UYVY422)
-   {
--    srcFormat    = PIX_FMT_UYVY422;
-+    srcFormat    = AV_PIX_FMT_UYVY422;
-     src[0]       = im->plane[0];
-     srcStride[0] = im->stride[0];
-   }
-@@ -2965,8 +2965,8 @@ void CLinuxRendererGL::ToRGBFrame(YV12Im
- 
-   m_context = sws_getCachedContext(m_context,
-                                                  im->width, im->height, (AVPixelFormat)srcFormat,
--                                                 im->width, im->height, (AVPixelFormat)PIX_FMT_BGRA,
--                                                 SWS_FAST_BILINEAR | SwScaleCPUFlags(), NULL, NULL, NULL);
-+                                                 im->width, im->height, (AVPixelFormat)AV_PIX_FMT_BGRA,
-+                                                 SWS_FAST_BILINEAR, NULL, NULL, NULL);
- 
-   uint8_t *dst[]       = { m_rgbBuffer, 0, 0, 0 };
-   int      dstStride[] = { (int)m_sourceWidth * 4, 0, 0, 0 };
-@@ -2995,7 +2995,7 @@ void CLinuxRendererGL::ToRGBFields(YV12I
- 
-   if (m_format == RENDER_FMT_YUV420P)
-   {
--    srcFormat = PIX_FMT_YUV420P;
-+    srcFormat = AV_PIX_FMT_YUV420P;
-     for (int i = 0; i < 3; i++)
-     {
-       srcTop[i]       = im->plane[i];
-@@ -3006,7 +3006,7 @@ void CLinuxRendererGL::ToRGBFields(YV12I
-   }
-   else if (m_format == RENDER_FMT_NV12)
-   {
--    srcFormat = PIX_FMT_NV12;
-+    srcFormat = AV_PIX_FMT_NV12;
-     for (int i = 0; i < 2; i++)
-     {
-       srcTop[i]       = im->plane[i];
-@@ -3017,7 +3017,7 @@ void CLinuxRendererGL::ToRGBFields(YV12I
-   }
-   else if (m_format == RENDER_FMT_YUYV422)
-   {
--    srcFormat       = PIX_FMT_YUYV422;
-+    srcFormat       = AV_PIX_FMT_YUYV422;
-     srcTop[0]       = im->plane[0];
-     srcStrideTop[0] = im->stride[0] * 2;
-     srcBot[0]       = im->plane[0] + im->stride[0];
-@@ -3025,7 +3025,7 @@ void CLinuxRendererGL::ToRGBFields(YV12I
-   }
-   else if (m_format == RENDER_FMT_UYVY422)
-   {
--    srcFormat       = PIX_FMT_UYVY422;
-+    srcFormat       = AV_PIX_FMT_UYVY422;
-     srcTop[0]       = im->plane[0];
-     srcStrideTop[0] = im->stride[0] * 2;
-     srcBot[0]       = im->plane[0] + im->stride[0];
-@@ -3045,8 +3045,8 @@ void CLinuxRendererGL::ToRGBFields(YV12I
- 
-   m_context = sws_getCachedContext(m_context,
-                                                  im->width, im->height >> 1, (AVPixelFormat)srcFormat,
--                                                 im->width, im->height >> 1, (AVPixelFormat)PIX_FMT_BGRA,
--                                                 SWS_FAST_BILINEAR | SwScaleCPUFlags(), NULL, NULL, NULL);
-+                                                 im->width, im->height >> 1, (AVPixelFormat)AV_PIX_FMT_BGRA,
-+                                                 SWS_FAST_BILINEAR, NULL, NULL, NULL);
-   uint8_t *dstTop[]    = { m_rgbBuffer, 0, 0, 0 };
-   uint8_t *dstBot[]    = { m_rgbBuffer + m_sourceWidth * m_sourceHeight * 2, 0, 0, 0 };
-   int      dstStride[] = { (int)m_sourceWidth * 4, 0, 0, 0 };
-Index: xbmc-16.0-Jarvis/xbmc/cores/VideoRenderers/LinuxRendererGLES.cpp
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/VideoRenderers/LinuxRendererGLES.cpp
-+++ xbmc-16.0-Jarvis/xbmc/cores/VideoRenderers/LinuxRendererGLES.cpp
-@@ -2006,8 +2006,8 @@ void CLinuxRendererGLES::UploadYV12Textu
- #endif
-     {
-       m_sw_context = sws_getCachedContext(m_sw_context,
--        im->width, im->height, PIX_FMT_YUV420P,
--        im->width, im->height, PIX_FMT_RGBA,
-+        im->width, im->height, AV_PIX_FMT_YUV420P,
-+        im->width, im->height, AV_PIX_FMT_RGBA,
-         SWS_FAST_BILINEAR, NULL, NULL, NULL);
- 
-       uint8_t *src[]  = { im->plane[0], im->plane[1], im->plane[2], 0 };
-Index: xbmc-16.0-Jarvis/xbmc/cores/VideoRenderers/WinRenderer.cpp
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/cores/VideoRenderers/WinRenderer.cpp
-+++ xbmc-16.0-Jarvis/xbmc/cores/VideoRenderers/WinRenderer.cpp
-@@ -94,16 +94,16 @@ CWinRenderer::~CWinRenderer()
-   UnInit();
- }
- 
--static enum PixelFormat PixelFormatFromFormat(ERenderFormat format)
-+static enum AVPixelFormat PixelFormatFromFormat(ERenderFormat format)
- {
--  if (format == RENDER_FMT_DXVA)      return PIX_FMT_NV12;
--  if (format == RENDER_FMT_YUV420P)   return PIX_FMT_YUV420P;
--  if (format == RENDER_FMT_YUV420P10) return PIX_FMT_YUV420P10;
--  if (format == RENDER_FMT_YUV420P16) return PIX_FMT_YUV420P16;
--  if (format == RENDER_FMT_NV12)      return PIX_FMT_NV12;
--  if (format == RENDER_FMT_UYVY422)   return PIX_FMT_UYVY422;
--  if (format == RENDER_FMT_YUYV422)   return PIX_FMT_YUYV422;
--  return PIX_FMT_NONE;
-+  if (format == RENDER_FMT_DXVA)      return AV_PIX_FMT_NV12;
-+  if (format == RENDER_FMT_YUV420P)   return AV_PIX_FMT_YUV420P;
-+  if (format == RENDER_FMT_YUV420P10) return AV_PIX_FMT_YUV420P10;
-+  if (format == RENDER_FMT_YUV420P16) return AV_PIX_FMT_YUV420P16;
-+  if (format == RENDER_FMT_NV12)      return AV_PIX_FMT_NV12;
-+  if (format == RENDER_FMT_UYVY422)   return AV_PIX_FMT_UYVY422;
-+  if (format == RENDER_FMT_YUYV422)   return AV_PIX_FMT_YUYV422;
-+  return AV_PIX_FMT_NONE;
- }
- 
- void CWinRenderer::ManageTextures()
-@@ -719,13 +719,13 @@ void CWinRenderer::Render(DWORD flags)
- 
- void CWinRenderer::RenderSW()
- {
--  enum PixelFormat format = PixelFormatFromFormat(m_format);
-+  enum AVPixelFormat format = PixelFormatFromFormat(m_format);
- 
-   // 1. convert yuv to rgb
-   m_sw_scale_ctx = sws_getCachedContext(m_sw_scale_ctx,
-                                         m_sourceWidth, m_sourceHeight, format,
--                                        m_sourceWidth, m_sourceHeight, PIX_FMT_BGRA,
--                                        SWS_FAST_BILINEAR | SwScaleCPUFlags(), NULL, NULL, NULL);
-+                                        m_sourceWidth, m_sourceHeight, AV_PIX_FMT_BGRA,
-+                                        SWS_FAST_BILINEAR, NULL, NULL, NULL);
- 
-   YUVBuffer* buf = (YUVBuffer*)m_VideoBuffers[m_iYV12RenderBuffer];
- 
-Index: xbmc-16.0-Jarvis/xbmc/pictures/Picture.cpp
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/pictures/Picture.cpp
-+++ xbmc-16.0-Jarvis/xbmc/pictures/Picture.cpp
-@@ -342,9 +342,9 @@ bool CPicture::ScaleImage(uint8_t *in_pi
-                           uint8_t *out_pixels, unsigned int out_width, unsigned int out_height, unsigned int out_pitch,
-                           CPictureScalingAlgorithm::Algorithm scalingAlgorithm /* = CPictureScalingAlgorithm::NoAlgorithm */)
- {
--  struct SwsContext *context = sws_getContext(in_width, in_height, PIX_FMT_BGRA,
--                                                         out_width, out_height, PIX_FMT_BGRA,
--                                                         CPictureScalingAlgorithm::ToSwscale(scalingAlgorithm) | SwScaleCPUFlags(), NULL, NULL, NULL);
-+  struct SwsContext *context = sws_getContext(in_width, in_height, AV_PIX_FMT_BGRA,
-+                                                         out_width, out_height, AV_PIX_FMT_BGRA,
-+                                                         CPictureScalingAlgorithm::ToSwscale(scalingAlgorithm), NULL, NULL, NULL);
- 
-   uint8_t *src[] = { in_pixels, 0, 0, 0 };
-   int     srcStride[] = { (int)in_pitch, 0, 0, 0 };
-Index: xbmc-16.0-Jarvis/xbmc/video/FFmpegVideoDecoder.cpp
-===================================================================
---- xbmc-16.0-Jarvis.orig/xbmc/video/FFmpegVideoDecoder.cpp
-+++ xbmc-16.0-Jarvis/xbmc/video/FFmpegVideoDecoder.cpp
-@@ -252,7 +252,7 @@ bool FFmpegVideoDecoder::nextFrame( CBas
-       return false;
- 
-     // Due to a bug in swsscale we need to allocate one extra line of data
--    if ( avpicture_alloc( m_pFrameRGB, PIX_FMT_RGB32, m_frameRGBwidth, m_frameRGBheight + 1 ) < 0 )
-+    if ( avpicture_alloc( m_pFrameRGB, AV_PIX_FMT_RGB32, m_frameRGBwidth, m_frameRGBheight + 1 ) < 0 )
-       return false;
-   }
- 
-@@ -287,7 +287,7 @@ bool FFmpegVideoDecoder::nextFrame( CBas
- 
-   // We got the video frame, render it into the picture buffer
-   struct SwsContext * context = sws_getContext( m_pCodecCtx->width, m_pCodecCtx->height, m_pCodecCtx->pix_fmt,
--                           m_frameRGBwidth, m_frameRGBheight, PIX_FMT_RGB32, SWS_FAST_BILINEAR, NULL, NULL, NULL );
-+                           m_frameRGBwidth, m_frameRGBheight, AV_PIX_FMT_RGB32, SWS_FAST_BILINEAR, NULL, NULL, NULL );
- 
-   sws_scale( context, m_pFrame->data, m_pFrame->linesize, 0, m_pCodecCtx->height,
-                                                                      m_pFrameRGB->data, m_pFrameRGB->linesize );
diff --git a/package/kodi/0007-exif-Fix-for-out-of-memory-errors-with-large-numbers.patch b/package/kodi/0007-exif-Fix-for-out-of-memory-errors-with-large-numbers.patch
deleted file mode 100644
index 9b0e47d07..000000000
--- a/package/kodi/0007-exif-Fix-for-out-of-memory-errors-with-large-numbers.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From f63563615e357b7d794a38e1d37276c325d1466f Mon Sep 17 00:00:00 2001
-From: popcornmix <popcornmix@gmail.com>
-Date: Sat, 7 May 2016 13:47:42 +0100
-Subject: [PATCH] [exif] Fix for out-of-memory errors with large numbers
- of jpegs
-
-This reverts part of https://github.com/xbmc/xbmc/pull/7472
-
-Basically the commit made the 4 comments in the exif block increase
-from 2K to 64K each, so you now need 256K per photo.
-
-When opening a folder exif information for all photos is extracted.
-So, for a folder of 5000 jpegs, 1.2GB of RAM is needed just for
-the comments.
-
-As a 64K comment string is of no use to kodi, just truncate them to 2K
-like we used to.
-
-See:
-http://trac.kodi.tv/ticket/16193
-http://forum.kodi.tv/showthread.php?tid=251908
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(backported from upstream commit in master branch:
- https://github.com/xbmc/xbmc/commit/f63563615e357b7d794a38e1d37276c325d1466f)
----
- lib/libexif/libexif.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/libexif/libexif.h b/lib/libexif/libexif.h
-index aa8da07..519ac30 100644
---- a/lib/libexif/libexif.h
-+++ b/lib/libexif/libexif.h
-@@ -81,7 +81,7 @@ typedef struct {
- #define EXIF_COMMENT_CHARSET_UNICODE    3 // Exif: Unicode (UTF-16)
- #define EXIF_COMMENT_CHARSET_JIS        4 // Exif: JIS X208-1990
- 
--#define MAX_COMMENT 65533 // 2 bytes - 2 for the length param
-+#define MAX_COMMENT 2000
- #define MAX_DATE_COPIES 10
- 
- typedef struct {
--- 
-2.8.1
-
diff --git a/package/kodi/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch b/package/kodi/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch
deleted file mode 100644
index dc428d6ce..000000000
--- a/package/kodi/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 78571ed421e3fd3d5244cd76670e4e1bab69132f Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Fri, 27 May 2016 17:30:28 +0200
-Subject: [PATCH 1/1] Fix nullpadding issue when reading certain id3v1 tags
-
-backported from upstream commit to master branch:
-
-https://github.com/xbmc/xbmc/commit/cdabf9dd9e82f4b2d639fb769db08227a7c52046
-
-to fix problems with taglib-1.11:
-
-http://trac.kodi.tv/ticket/16454
-https://github.com/taglib/taglib/issues/741#issuecomment-218059031
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- xbmc/music/tags/TagLoaderTagLib.cpp | 21 ---------------------
- xbmc/music/tags/TagLoaderTagLib.h   |  3 +++
- 2 files changed, 3 insertions(+), 21 deletions(-)
-
-diff --git a/xbmc/music/tags/TagLoaderTagLib.cpp b/xbmc/music/tags/TagLoaderTagLib.cpp
-index b78a591..0fc346a 100644
---- a/xbmc/music/tags/TagLoaderTagLib.cpp
-+++ b/xbmc/music/tags/TagLoaderTagLib.cpp
-@@ -46,31 +46,12 @@
- #include "utils/URIUtils.h"
- #include "utils/log.h"
- #include "utils/StringUtils.h"
--#include "utils/CharsetConverter.h"
- #include "utils/Base64.h"
- #include "settings/AdvancedSettings.h"
- 
- using namespace TagLib;
- using namespace MUSIC_INFO;
- 
--template<class T>
--class TagStringHandler : public T
--{
--public:
--  TagStringHandler() {}
--  virtual ~TagStringHandler() {}
--  virtual String parse(const ByteVector &data) const
--  {
--    std::string strSource(data.data(), data.size());
--    std::string strUTF8;
--    g_charsetConverter.unknownToUTF8(strSource, strUTF8);
--    return String(strUTF8, String::UTF8);
--  }
--};
--
--static const TagStringHandler<ID3v1::StringHandler> ID3v1StringHandler;
--static const TagStringHandler<ID3v2::Latin1StringHandler> ID3v2StringHandler;
--
- CTagLoaderTagLib::CTagLoaderTagLib()
- {
- }
-@@ -824,8 +805,6 @@ bool CTagLoaderTagLib::Load(const std::string& strFileName, CMusicInfoTag& tag,
-     return false;
-   }
- 
--  ID3v1::Tag::setStringHandler(&ID3v1StringHandler);
--  ID3v2::Tag::setLatin1StringHandler(&ID3v2StringHandler);
-   TagLib::File*              file = NULL;
-   TagLib::APE::File*         apeFile = NULL;
-   TagLib::ASF::File*         asfFile = NULL;
-diff --git a/xbmc/music/tags/TagLoaderTagLib.h b/xbmc/music/tags/TagLoaderTagLib.h
-index f83ea4f..0edb84f 100644
---- a/xbmc/music/tags/TagLoaderTagLib.h
-+++ b/xbmc/music/tags/TagLoaderTagLib.h
-@@ -44,6 +44,9 @@
- #include <taglib/mp4tag.h>
- #include "ImusicInfoTagLoader.h"
- 
-+#include <string>
-+#include <vector>
-+
- namespace MUSIC_INFO
- {
-   class CMusicInfoTag;
--- 
-2.8.1
-
diff --git a/package/kodi/0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch b/package/kodi/0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch
deleted file mode 100644
index a8de36c78..000000000
--- a/package/kodi/0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch
+++ /dev/null
@@ -1,1438 +0,0 @@
-From 8f82e51563f0e1bc9b7a8adf669ad2b66e7ce3e5 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Thu, 28 Apr 2016 17:17:40 +0200
-Subject: [PATCH] lib/cximage-6.0: fix compilation with gcc6
-
-For a quick fix I renamed min() to cxmin() and max() to cxmax() to
-prevent the conflict with the gcc definition.
-
-Forum thread for reference:
-http://forum.kodi.tv/showthread.php?tid=263884
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(Patch sent upstream: https://github.com/xbmc/xbmc/pull/9703)
----
- lib/cximage-6.0/CxImage/ximabmp.cpp  |   6 +-
- lib/cximage-6.0/CxImage/ximadef.h    |   8 +-
- lib/cximage-6.0/CxImage/ximadsp.cpp  | 182 +++++++++++++++++------------------
- lib/cximage-6.0/CxImage/ximage.cpp   |   4 +-
- lib/cximage-6.0/CxImage/ximagif.cpp  |   6 +-
- lib/cximage-6.0/CxImage/ximahist.cpp |  12 +--
- lib/cximage-6.0/CxImage/ximaint.cpp  |   8 +-
- lib/cximage-6.0/CxImage/ximaiter.h   |   4 +-
- lib/cximage-6.0/CxImage/ximajbg.cpp  |   2 +-
- lib/cximage-6.0/CxImage/ximapal.cpp  |  14 +--
- lib/cximage-6.0/CxImage/ximapng.cpp  |  12 +--
- lib/cximage-6.0/CxImage/ximaraw.cpp  |   4 +-
- lib/cximage-6.0/CxImage/ximasel.cpp  |  50 +++++-----
- lib/cximage-6.0/CxImage/ximath.cpp   |   8 +-
- lib/cximage-6.0/CxImage/ximatif.cpp  |   6 +-
- lib/cximage-6.0/CxImage/ximatran.cpp | 138 +++++++++++++-------------
- lib/cximage-6.0/CxImage/ximawnd.cpp  |  16 +--
- 17 files changed, 236 insertions(+), 244 deletions(-)
-
-diff --git a/lib/cximage-6.0/CxImage/ximabmp.cpp b/lib/cximage-6.0/CxImage/ximabmp.cpp
-index 726ff91..55842b1 100644
---- a/lib/cximage-6.0/CxImage/ximabmp.cpp
-+++ b/lib/cximage-6.0/CxImage/ximabmp.cpp
-@@ -46,7 +46,7 @@ bool CxImageBMP::Encode(CxFile * hFile)
- 		bihtoh(&infohdr);
- 
- 		// Write the file header
--		hFile->Write(&hdr,min(14,sizeof(BITMAPFILEHEADER)),1);
-+		hFile->Write(&hdr,cxmin(14,sizeof(BITMAPFILEHEADER)),1);
- 		hFile->Write(&infohdr,sizeof(BITMAPINFOHEADER),1);
- 		 //and DIB+ALPHA interlaced
- 		BYTE *srcalpha = AlphaGetPointer();
-@@ -64,7 +64,7 @@ bool CxImageBMP::Encode(CxFile * hFile)
- #endif //CXIMAGE_SUPPORT_ALPHA
- 	{
- 		// Write the file header
--		hFile->Write(&hdr,min(14,sizeof(BITMAPFILEHEADER)),1);
-+		hFile->Write(&hdr,cxmin(14,sizeof(BITMAPFILEHEADER)),1);
- 		//copy attributes
- 		memcpy(pDib,&head,sizeof(BITMAPINFOHEADER));
- 		bihtoh((BITMAPINFOHEADER*)pDib);
-@@ -86,7 +86,7 @@ bool CxImageBMP::Decode(CxFile * hFile)
- 	BITMAPFILEHEADER   bf;
- 	DWORD off = hFile->Tell(); //<CSC>
-   cx_try {
--	if (hFile->Read(&bf,min(14,sizeof(bf)),1)==0) cx_throw("Not a BMP");
-+	if (hFile->Read(&bf,cxmin(14,sizeof(bf)),1)==0) cx_throw("Not a BMP");
- 
- 	bf.bfSize = my_ntohl(bf.bfSize); 
- 	bf.bfOffBits = my_ntohl(bf.bfOffBits); 
-diff --git a/lib/cximage-6.0/CxImage/ximadef.h b/lib/cximage-6.0/CxImage/ximadef.h
-index fe383bf..53ea452 100644
---- a/lib/cximage-6.0/CxImage/ximadef.h
-+++ b/lib/cximage-6.0/CxImage/ximadef.h
-@@ -53,12 +53,8 @@
-  #define CXIMAGE_SUPPORT_WINDOWS 0
- #endif
- 
--#ifndef min
--#define min(a,b) (((a)<(b))?(a):(b))
--#endif
--#ifndef max
--#define max(a,b) (((a)>(b))?(a):(b))
--#endif
-+#define cxmin(a,b) (((a)<(b))?(a):(b))
-+#define cxmax(a,b) (((a)>(b))?(a):(b))
- 
- #ifndef PI
-  #define PI 3.141592653589793f
-diff --git a/lib/cximage-6.0/CxImage/ximadsp.cpp b/lib/cximage-6.0/CxImage/ximadsp.cpp
-index 8425bb2..813253b 100644
---- a/lib/cximage-6.0/CxImage/ximadsp.cpp
-+++ b/lib/cximage-6.0/CxImage/ximadsp.cpp
-@@ -389,8 +389,8 @@ RGBQUAD CxImage::RGBtoHSL(RGBQUAD lRGBColor)
- 	G = lRGBColor.rgbGreen;
- 	B = lRGBColor.rgbBlue;
- 
--	cMax = max( max(R,G), B);	/* calculate lightness */
--	cMin = min( min(R,G), B);
-+	cMax = cxmax( cxmax(R,G), B);	/* calculate lightness */
-+	cMin = cxmin( cxmin(R,G), B);
- 	L = (BYTE)((((cMax+cMin)*HSLMAX)+RGBMAX)/(2*RGBMAX));
- 
- 	if (cMax==cMin){			/* r=g=b --> achromatic case */
-@@ -489,9 +489,9 @@ RGBQUAD CxImage::YUVtoRGB(RGBQUAD lYUVColor)
- 	G = (int)( Y - 0.344f * U - 0.714f * V);
- 	B = (int)( Y + 1.770f * U);
- 
--	R= min(255,max(0,R));
--	G= min(255,max(0,G));
--	B= min(255,max(0,B));
-+	R= cxmin(255,cxmax(0,R));
-+	G= cxmin(255,cxmax(0,G));
-+	B= cxmin(255,cxmax(0,B));
- 	RGBQUAD rgb={(BYTE)B,(BYTE)G,(BYTE)R,0};
- 	return rgb;
- }
-@@ -510,9 +510,9 @@ RGBQUAD CxImage::RGBtoYUV(RGBQUAD lRGBColor)
- 	U = (int)((B-Y) * 0.565f + 128);
- 	V = (int)((R-Y) * 0.713f + 128);
- 
--	Y= min(255,max(0,Y));
--	U= min(255,max(0,U));
--	V= min(255,max(0,V));
-+	Y= cxmin(255,cxmax(0,Y));
-+	U= cxmin(255,cxmax(0,U));
-+	V= cxmin(255,cxmax(0,V));
- 	RGBQUAD yuv={(BYTE)V,(BYTE)U,(BYTE)Y,0};
- 	return yuv;
- }
-@@ -528,9 +528,9 @@ RGBQUAD CxImage::YIQtoRGB(RGBQUAD lYIQColor)
- 	G = (int)( Y - 0.273f * I - 0.647f * Q);
- 	B = (int)( Y - 1.104f * I + 1.701f * Q);
- 
--	R= min(255,max(0,R));
--	G= min(255,max(0,G));
--	B= min(255,max(0,B));
-+	R= cxmin(255,cxmax(0,R));
-+	G= cxmin(255,cxmax(0,G));
-+	B= cxmin(255,cxmax(0,B));
- 	RGBQUAD rgb={(BYTE)B,(BYTE)G,(BYTE)R,0};
- 	return rgb;
- }
-@@ -546,9 +546,9 @@ RGBQUAD CxImage::RGBtoYIQ(RGBQUAD lRGBColor)
- 	I = (int)( 0.5960f * R - 0.2742f * G - 0.3219f * B + 128);
- 	Q = (int)( 0.2109f * R - 0.5229f * G + 0.3120f * B + 128);
- 
--	Y= min(255,max(0,Y));
--	I= min(255,max(0,I));
--	Q= min(255,max(0,Q));
-+	Y= cxmin(255,cxmax(0,Y));
-+	I= cxmin(255,cxmax(0,I));
-+	Q= cxmin(255,cxmax(0,Q));
- 	RGBQUAD yiq={(BYTE)Q,(BYTE)I,(BYTE)Y,0};
- 	return yiq;
- }
-@@ -565,9 +565,9 @@ RGBQUAD CxImage::XYZtoRGB(RGBQUAD lXYZColor)
- 	G = (int)( -0.969256f * X + 1.875992f * Y + 0.041556f * Z * k);
- 	B = (int)(  0.055648f * X - 0.204043f * Y + 1.057311f * Z * k);
- 
--	R= min(255,max(0,R));
--	G= min(255,max(0,G));
--	B= min(255,max(0,B));
-+	R= cxmin(255,cxmax(0,R));
-+	G= cxmin(255,cxmax(0,G));
-+	B= cxmin(255,cxmax(0,B));
- 	RGBQUAD rgb={(BYTE)B,(BYTE)G,(BYTE)R,0};
- 	return rgb;
- }
-@@ -583,9 +583,9 @@ RGBQUAD CxImage::RGBtoXYZ(RGBQUAD lRGBColor)
- 	Y = (int)( 0.212671f * R + 0.715160f * G + 0.072169f * B);
- 	Z = (int)((0.019334f * R + 0.119193f * G + 0.950227f * B)*0.918483657f);
- 
--	//X= min(255,max(0,X));
--	//Y= min(255,max(0,Y));
--	//Z= min(255,max(0,Z));
-+	//X= cxmin(255,cxmax(0,X));
-+	//Y= cxmin(255,cxmax(0,Y));
-+	//Z= cxmin(255,cxmax(0,Z));
- 	RGBQUAD xyz={(BYTE)Z,(BYTE)Y,(BYTE)X,0};
- 	return xyz;
- }
-@@ -707,7 +707,7 @@ bool CxImage::Light(long brightness, long contrast)
- 
- 	BYTE cTable[256]; //<nipper>
- 	for (int i=0;i<256;i++)	{
--		cTable[i] = (BYTE)max(0,min(255,(int)((i-128)*c + brightness + 0.5f)));
-+		cTable[i] = (BYTE)cxmax(0,cxmin(255,(int)((i-128)*c + brightness + 0.5f)));
- 	}
- 
- 	return Lut(cTable);
-@@ -830,11 +830,11 @@ bool CxImage::Filter(long* kernel, long Ksize, long Kfactor, long Koffset)
- 						}
- 					}
- 					if (Kfactor==0 || ksumcur==0){
--						cPtr2[iY1] = (BYTE)min(255, max(0,(int)(b + Koffset)));
-+						cPtr2[iY1] = (BYTE)cxmin(255, cxmax(0,(int)(b + Koffset)));
- 					} else if (ksumtot == ksumcur) {
--						cPtr2[iY1] = (BYTE)min(255, max(0,(int)(b/Kfactor + Koffset)));
-+						cPtr2[iY1] = (BYTE)cxmin(255, cxmax(0,(int)(b/Kfactor + Koffset)));
- 					} else {
--						cPtr2[iY1] = (BYTE)min(255, max(0,(int)((b*ksumtot)/(ksumcur*Kfactor) + Koffset)));
-+						cPtr2[iY1] = (BYTE)cxmin(255, cxmax(0,(int)((b*ksumtot)/(ksumcur*Kfactor) + Koffset)));
- 					}
- 				}
- 			}
-@@ -863,17 +863,17 @@ bool CxImage::Filter(long* kernel, long Ksize, long Kfactor, long Koffset)
- 						}
- 					}
- 					if (Kfactor==0 || ksumcur==0){
--						c.rgbRed   = (BYTE)min(255, max(0,(int)(r + Koffset)));
--						c.rgbGreen = (BYTE)min(255, max(0,(int)(g + Koffset)));
--						c.rgbBlue  = (BYTE)min(255, max(0,(int)(b + Koffset)));
-+						c.rgbRed   = (BYTE)cxmin(255, cxmax(0,(int)(r + Koffset)));
-+						c.rgbGreen = (BYTE)cxmin(255, cxmax(0,(int)(g + Koffset)));
-+						c.rgbBlue  = (BYTE)cxmin(255, cxmax(0,(int)(b + Koffset)));
- 					} else if (ksumtot == ksumcur) {
--						c.rgbRed   = (BYTE)min(255, max(0,(int)(r/Kfactor + Koffset)));
--						c.rgbGreen = (BYTE)min(255, max(0,(int)(g/Kfactor + Koffset)));
--						c.rgbBlue  = (BYTE)min(255, max(0,(int)(b/Kfactor + Koffset)));
-+						c.rgbRed   = (BYTE)cxmin(255, cxmax(0,(int)(r/Kfactor + Koffset)));
-+						c.rgbGreen = (BYTE)cxmin(255, cxmax(0,(int)(g/Kfactor + Koffset)));
-+						c.rgbBlue  = (BYTE)cxmin(255, cxmax(0,(int)(b/Kfactor + Koffset)));
- 					} else {
--						c.rgbRed   = (BYTE)min(255, max(0,(int)((r*ksumtot)/(ksumcur*Kfactor) + Koffset)));
--						c.rgbGreen = (BYTE)min(255, max(0,(int)((g*ksumtot)/(ksumcur*Kfactor) + Koffset)));
--						c.rgbBlue  = (BYTE)min(255, max(0,(int)((b*ksumtot)/(ksumcur*Kfactor) + Koffset)));
-+						c.rgbRed   = (BYTE)cxmin(255, cxmax(0,(int)((r*ksumtot)/(ksumcur*Kfactor) + Koffset)));
-+						c.rgbGreen = (BYTE)cxmin(255, cxmax(0,(int)((g*ksumtot)/(ksumcur*Kfactor) + Koffset)));
-+						c.rgbBlue  = (BYTE)cxmin(255, cxmax(0,(int)((b*ksumtot)/(ksumcur*Kfactor) + Koffset)));
- 					}
- 					tmp.BlindSetPixelColor(x,y,c);
- 				}
-@@ -1078,8 +1078,8 @@ bool CxImage::Edge(long Ksize)
- // 
- void CxImage::Mix(CxImage & imgsrc2, ImageOpType op, long lXOffset, long lYOffset, bool bMixAlpha)
- {
--    long lWide = min(GetWidth(),imgsrc2.GetWidth()-lXOffset);
--    long lHeight = min(GetHeight(),imgsrc2.GetHeight()-lYOffset);
-+    long lWide = cxmin(GetWidth(),imgsrc2.GetWidth()-lXOffset);
-+    long lHeight = cxmin(GetHeight(),imgsrc2.GetHeight()-lYOffset);
- 
- 	bool bEditAlpha = imgsrc2.AlphaIsValid() & bMixAlpha;
- 
-@@ -1112,16 +1112,16 @@ void CxImage::Mix(CxImage & imgsrc2, ImageOpType op, long lXOffset, long lYOffse
- 						if (bEditAlpha) rgbDest.rgbReserved = (BYTE)((rgb1.rgbReserved+rgb2.rgbReserved)/2);
- 					break;
- 					case OpAdd:
--						rgbDest.rgbBlue = (BYTE)max(0,min(255,rgb1.rgbBlue+rgb2.rgbBlue));
--						rgbDest.rgbGreen = (BYTE)max(0,min(255,rgb1.rgbGreen+rgb2.rgbGreen));
--						rgbDest.rgbRed = (BYTE)max(0,min(255,rgb1.rgbRed+rgb2.rgbRed));
--						if (bEditAlpha) rgbDest.rgbReserved = (BYTE)max(0,min(255,rgb1.rgbReserved+rgb2.rgbReserved));
-+						rgbDest.rgbBlue = (BYTE)cxmax(0,cxmin(255,rgb1.rgbBlue+rgb2.rgbBlue));
-+						rgbDest.rgbGreen = (BYTE)cxmax(0,cxmin(255,rgb1.rgbGreen+rgb2.rgbGreen));
-+						rgbDest.rgbRed = (BYTE)cxmax(0,cxmin(255,rgb1.rgbRed+rgb2.rgbRed));
-+						if (bEditAlpha) rgbDest.rgbReserved = (BYTE)cxmax(0,cxmin(255,rgb1.rgbReserved+rgb2.rgbReserved));
- 					break;
- 					case OpSub:
--						rgbDest.rgbBlue = (BYTE)max(0,min(255,rgb1.rgbBlue-rgb2.rgbBlue));
--						rgbDest.rgbGreen = (BYTE)max(0,min(255,rgb1.rgbGreen-rgb2.rgbGreen));
--						rgbDest.rgbRed = (BYTE)max(0,min(255,rgb1.rgbRed-rgb2.rgbRed));
--						if (bEditAlpha) rgbDest.rgbReserved = (BYTE)max(0,min(255,rgb1.rgbReserved-rgb2.rgbReserved));
-+						rgbDest.rgbBlue = (BYTE)cxmax(0,cxmin(255,rgb1.rgbBlue-rgb2.rgbBlue));
-+						rgbDest.rgbGreen = (BYTE)cxmax(0,cxmin(255,rgb1.rgbGreen-rgb2.rgbGreen));
-+						rgbDest.rgbRed = (BYTE)cxmax(0,cxmin(255,rgb1.rgbRed-rgb2.rgbRed));
-+						if (bEditAlpha) rgbDest.rgbReserved = (BYTE)cxmax(0,cxmin(255,rgb1.rgbReserved-rgb2.rgbReserved));
- 					break;
- 					case OpAnd:
- 						rgbDest.rgbBlue = (BYTE)(rgb1.rgbBlue&rgb2.rgbBlue);
-@@ -1202,11 +1202,11 @@ void CxImage::Mix(CxImage & imgsrc2, ImageOpType op, long lXOffset, long lYOffse
- 							double dSmallAmt = dSmall*((double)rgb2.rgbBlue);
- 
- 							if( lAverage < lThresh+1){
--								rgbDest.rgbBlue = (BYTE)max(0,min(255,(int)(dLarge*((double)rgb1.rgbBlue) +
-+								rgbDest.rgbBlue = (BYTE)cxmax(0,cxmin(255,(int)(dLarge*((double)rgb1.rgbBlue) +
- 												dSmallAmt)));
--								rgbDest.rgbGreen = (BYTE)max(0,min(255,(int)(dLarge*((double)rgb1.rgbGreen) +
-+								rgbDest.rgbGreen = (BYTE)cxmax(0,cxmin(255,(int)(dLarge*((double)rgb1.rgbGreen) +
- 												dSmallAmt)));
--								rgbDest.rgbRed = (BYTE)max(0,min(255,(int)(dLarge*((double)rgb1.rgbRed) +
-+								rgbDest.rgbRed = (BYTE)cxmax(0,cxmin(255,(int)(dLarge*((double)rgb1.rgbRed) +
- 												dSmallAmt)));
- 							}
- 							else
-@@ -1274,9 +1274,9 @@ bool CxImage::ShiftRGB(long r, long g, long b)
- #endif //CXIMAGE_SUPPORT_SELECTION
- 				{
- 					color = BlindGetPixelColor(x,y);
--					color.rgbRed = (BYTE)max(0,min(255,(int)(color.rgbRed + r)));
--					color.rgbGreen = (BYTE)max(0,min(255,(int)(color.rgbGreen + g)));
--					color.rgbBlue = (BYTE)max(0,min(255,(int)(color.rgbBlue + b)));
-+					color.rgbRed = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbRed + r)));
-+					color.rgbGreen = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbGreen + g)));
-+					color.rgbBlue = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbBlue + b)));
- 					BlindSetPixelColor(x,y,color);
- 				}
- 			}
-@@ -1284,9 +1284,9 @@ bool CxImage::ShiftRGB(long r, long g, long b)
- 	} else {
- 		for(DWORD j=0; j<head.biClrUsed; j++){
- 			color = GetPaletteColor((BYTE)j);
--			color.rgbRed = (BYTE)max(0,min(255,(int)(color.rgbRed + r)));
--			color.rgbGreen = (BYTE)max(0,min(255,(int)(color.rgbGreen + g)));
--			color.rgbBlue = (BYTE)max(0,min(255,(int)(color.rgbBlue + b)));
-+			color.rgbRed = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbRed + r)));
-+			color.rgbGreen = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbGreen + g)));
-+			color.rgbBlue = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbBlue + b)));
- 			SetPaletteColor((BYTE)j,color);
- 		}
- 	}
-@@ -1310,7 +1310,7 @@ bool CxImage::Gamma(float gamma)
- 
- 	BYTE cTable[256]; //<nipper>
- 	for (int i=0;i<256;i++)	{
--		cTable[i] = (BYTE)max(0,min(255,(int)( pow((double)i, dinvgamma) / dMax)));
-+		cTable[i] = (BYTE)cxmax(0,cxmin(255,(int)( pow((double)i, dinvgamma) / dMax)));
- 	}
- 
- 	return Lut(cTable);
-@@ -1337,21 +1337,21 @@ bool CxImage::GammaRGB(float gammaR, float gammaG, float gammaB)
- 	dMax = pow(255.0, dinvgamma) / 255.0;
- 	BYTE cTableR[256];
- 	for (i=0;i<256;i++)	{
--		cTableR[i] = (BYTE)max(0,min(255,(int)( pow((double)i, dinvgamma) / dMax)));
-+		cTableR[i] = (BYTE)cxmax(0,cxmin(255,(int)( pow((double)i, dinvgamma) / dMax)));
- 	}
- 
- 	dinvgamma = 1/gammaG;
- 	dMax = pow(255.0, dinvgamma) / 255.0;
- 	BYTE cTableG[256];
- 	for (i=0;i<256;i++)	{
--		cTableG[i] = (BYTE)max(0,min(255,(int)( pow((double)i, dinvgamma) / dMax)));
-+		cTableG[i] = (BYTE)cxmax(0,cxmin(255,(int)( pow((double)i, dinvgamma) / dMax)));
- 	}
- 
- 	dinvgamma = 1/gammaB;
- 	dMax = pow(255.0, dinvgamma) / 255.0;
- 	BYTE cTableB[256];
- 	for (i=0;i<256;i++)	{
--		cTableB[i] = (BYTE)max(0,min(255,(int)( pow((double)i, dinvgamma) / dMax)));
-+		cTableB[i] = (BYTE)cxmax(0,cxmin(255,(int)( pow((double)i, dinvgamma) / dMax)));
- 	}
- 
- 	return Lut(cTableR, cTableG, cTableB);
-@@ -1442,11 +1442,11 @@ bool CxImage::Noise(long level)
- 			{
- 				color = BlindGetPixelColor(x,y);
- 				n=(long)((rand()/(float)RAND_MAX - 0.5)*level);
--				color.rgbRed = (BYTE)max(0,min(255,(int)(color.rgbRed + n)));
-+				color.rgbRed = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbRed + n)));
- 				n=(long)((rand()/(float)RAND_MAX - 0.5)*level);
--				color.rgbGreen = (BYTE)max(0,min(255,(int)(color.rgbGreen + n)));
-+				color.rgbGreen = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbGreen + n)));
- 				n=(long)((rand()/(float)RAND_MAX - 0.5)*level);
--				color.rgbBlue = (BYTE)max(0,min(255,(int)(color.rgbBlue + n)));
-+				color.rgbBlue = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbBlue + n)));
- 				BlindSetPixelColor(x,y,color);
- 			}
- 		}
-@@ -1561,8 +1561,8 @@ bool CxImage::FFT2(CxImage* srcReal, CxImage* srcImag, CxImage* dstReal, CxImage
- 
- 	//DFT buffers
- 	double *real2,*imag2;
--	real2 = (double*)malloc(max(w,h) * sizeof(double));
--	imag2 = (double*)malloc(max(w,h) * sizeof(double));
-+	real2 = (double*)malloc(cxmax(w,h) * sizeof(double));
-+	imag2 = (double*)malloc(cxmax(w,h) * sizeof(double));
- 
- 	/* Transform the rows */
- 	real = (double *)malloc(w * sizeof(double));
-@@ -1617,7 +1617,7 @@ bool CxImage::FFT2(CxImage* srcReal, CxImage* srcImag, CxImage* dstReal, CxImage
- 
- 	/* converting from double to byte, there is a HUGE loss in the dynamics
- 	  "nn" tries to keep an acceptable SNR, but 8bit=48dB: don't ask more */
--	double nn=pow((double)2,(double)log((double)max(w,h))/(double)log((double)2)-4);
-+	double nn=pow((double)2,(double)log((double)cxmax(w,h))/(double)log((double)2)-4);
- 	//reversed gain for reversed transform
- 	if (direction==-1) nn=1/nn;
- 	//bMagnitude : just to see it on the screen
-@@ -1626,15 +1626,15 @@ bool CxImage::FFT2(CxImage* srcReal, CxImage* srcImag, CxImage* dstReal, CxImage
- 	for (j=0;j<h;j++) {
- 		for (k=0;k<w;k++) {
- 			if (bMagnitude){
--				tmpReal->SetPixelIndex(k,j,(BYTE)max(0,min(255,(nn*(3+log(_cabs(grid[k][j])))))));
-+				tmpReal->SetPixelIndex(k,j,(BYTE)cxmax(0,cxmin(255,(nn*(3+log(_cabs(grid[k][j])))))));
- 				if (grid[k][j].x==0){
--					tmpImag->SetPixelIndex(k,j,(BYTE)max(0,min(255,(128+(atan(grid[k][j].y/0.0000000001)*nn)))));
-+					tmpImag->SetPixelIndex(k,j,(BYTE)cxmax(0,cxmin(255,(128+(atan(grid[k][j].y/0.0000000001)*nn)))));
- 				} else {
--					tmpImag->SetPixelIndex(k,j,(BYTE)max(0,min(255,(128+(atan(grid[k][j].y/grid[k][j].x)*nn)))));
-+					tmpImag->SetPixelIndex(k,j,(BYTE)cxmax(0,cxmin(255,(128+(atan(grid[k][j].y/grid[k][j].x)*nn)))));
- 				}
- 			} else {
--				tmpReal->SetPixelIndex(k,j,(BYTE)max(0,min(255,(128 + grid[k][j].x*nn))));
--				tmpImag->SetPixelIndex(k,j,(BYTE)max(0,min(255,(128 + grid[k][j].y*nn))));
-+				tmpReal->SetPixelIndex(k,j,(BYTE)cxmax(0,cxmin(255,(128 + grid[k][j].x*nn))));
-+				tmpImag->SetPixelIndex(k,j,(BYTE)cxmax(0,cxmin(255,(128 + grid[k][j].y*nn))));
- 			}
- 		}
- 	}
-@@ -1922,7 +1922,7 @@ bool CxImage::RepairChannel(CxImage *ch, float radius)
- 
- 			correction = ((1.0+iy*iy)*ixx - ix*iy*ixy + (1.0+ix*ix)*iyy)/(1.0+ix*ix+iy*iy);
- 
--			tmp.BlindSetPixelIndex(x,y,(BYTE)min(255,max(0,(xy0 + radius * correction + 0.5))));
-+			tmp.BlindSetPixelIndex(x,y,(BYTE)cxmin(255,cxmax(0,(xy0 + radius * correction + 0.5))));
- 		}
- 	}
- 
-@@ -1943,7 +1943,7 @@ bool CxImage::RepairChannel(CxImage *ch, float radius)
- 
- 			correction = ((1.0+iy*iy)*ixx - ix*iy*ixy + (1.0+ix*ix)*iyy)/(1.0+ix*ix+iy*iy);
- 
--			tmp.BlindSetPixelIndex(x,y,(BYTE)min(255,max(0,(xy0 + radius * correction + 0.5))));
-+			tmp.BlindSetPixelIndex(x,y,(BYTE)cxmin(255,cxmax(0,(xy0 + radius * correction + 0.5))));
- 		}
- 	}
- 	for (x=0;x<=w;x+=w){
-@@ -1963,7 +1963,7 @@ bool CxImage::RepairChannel(CxImage *ch, float radius)
- 
- 			correction = ((1.0+iy*iy)*ixx - ix*iy*ixy + (1.0+ix*ix)*iyy)/(1.0+ix*ix+iy*iy);
- 
--			tmp.BlindSetPixelIndex(x,y,(BYTE)min(255,max(0,(xy0 + radius * correction + 0.5))));
-+			tmp.BlindSetPixelIndex(x,y,(BYTE)cxmin(255,cxmax(0,(xy0 + radius * correction + 0.5))));
- 		}
- 	}
- 
-@@ -2621,8 +2621,8 @@ bool CxImage::SelectiveBlur(float radius, BYTE threshold, CxImage* iDst)
- 	}
- 
- 	//build the difference mask
--	BYTE thresh_dw = (BYTE)max( 0 ,(int)(128 - threshold));
--	BYTE thresh_up = (BYTE)min(255,(int)(128 + threshold));
-+	BYTE thresh_dw = (BYTE)cxmax( 0 ,(int)(128 - threshold));
-+	BYTE thresh_up = (BYTE)cxmin(255,(int)(128 + threshold));
- 	long kernel[]={-100,-100,-100,-100,801,-100,-100,-100,-100};
- 	if (!Tmp.Filter(kernel,3,800,128)){
- 		delete [] pPalette;
-@@ -2755,7 +2755,7 @@ bool CxImage::UnsharpMask(float radius /*= 5.0*/, float amount /*= 0.5*/, int th
- 					if (abs(diff) < threshold){
- 						dest_row[z] = cur_row[z];
- 					} else {
--						dest_row[z] = (BYTE)min(255, max(0,(int)(cur_row[z] + amount * diff)));
-+						dest_row[z] = (BYTE)cxmin(255, cxmax(0,(int)(cur_row[z] + amount * diff)));
- 					}
- 				}
- 			}
-@@ -2952,7 +2952,7 @@ bool CxImage::RedEyeRemove(float strength)
- 				float a = 1.0f-5.0f*((float)((x-0.5f*(xmax+xmin))*(x-0.5f*(xmax+xmin))+(y-0.5f*(ymax+ymin))*(y-0.5f*(ymax+ymin))))/((float)((xmax-xmin)*(ymax-ymin)));
- 				if (a<0) a=0;
- 				color = BlindGetPixelColor(x,y);
--				color.rgbRed = (BYTE)(a*min(color.rgbGreen,color.rgbBlue)+(1.0f-a)*color.rgbRed);
-+				color.rgbRed = (BYTE)(a*cxmin(color.rgbGreen,color.rgbBlue)+(1.0f-a)*color.rgbRed);
- 				BlindSetPixelColor(x,y,color);
- 			}
- 		}
-@@ -2990,7 +2990,7 @@ bool CxImage::Saturate(const long saturation, const long colorspace)
- 	case 1:
- 		{
- 			for (int i=0;i<256;i++)	{
--				cTable[i] = (BYTE)max(0,min(255,(int)(i + saturation)));
-+				cTable[i] = (BYTE)cxmax(0,cxmin(255,(int)(i + saturation)));
- 			}
- 			for(long y=ymin; y<ymax; y++){
- 				info.nProgress = (long)(100*(y-ymin)/(ymax-ymin));
-@@ -3012,7 +3012,7 @@ bool CxImage::Saturate(const long saturation, const long colorspace)
- 	case 2:
- 		{
- 			for (int i=0;i<256;i++)	{
--				cTable[i] = (BYTE)max(0,min(255,(int)((i-128)*(100 + saturation)/100.0f + 128.5f)));
-+				cTable[i] = (BYTE)cxmax(0,cxmin(255,(int)((i-128)*(100 + saturation)/100.0f + 128.5f)));
- 			}
- 			for(long y=ymin; y<ymax; y++){
- 				info.nProgress = (long)(100*(y-ymin)/(ymax-ymin));
-@@ -3242,10 +3242,10 @@ int  CxImage::OptimalThreshold(long method, RECT * pBox, CxImage* pContrastMask)
- 
- 	long xmin,xmax,ymin,ymax;
- 	if (pBox){
--		xmin = max(pBox->left,0);
--		xmax = min(pBox->right,head.biWidth);
--		ymin = max(pBox->bottom,0);
--		ymax = min(pBox->top,head.biHeight);
-+		xmin = cxmax(pBox->left,0);
-+		xmax = cxmin(pBox->right,head.biWidth);
-+		ymin = cxmax(pBox->bottom,0);
-+		ymax = cxmin(pBox->top,head.biHeight);
- 	} else {
- 		xmin = ymin = 0;
- 		xmax = head.biWidth; ymax=head.biHeight;
-@@ -3463,7 +3463,7 @@ bool CxImage::AdaptiveThreshold(long method, long nBoxSize, CxImage* pContrastMa
- 			r.top = r.bottom + nBoxSize;
- 			int threshold = OptimalThreshold(method, &r, pContrastMask);
- 			if (threshold <0) return false;
--			mask.SetPixelIndex(x,y,(BYTE)max(0,min(255,nBias+((1.0f-fGlobalLocalBalance)*threshold + fGlobalLocalBalance*globalthreshold))));
-+			mask.SetPixelIndex(x,y,(BYTE)cxmax(0,cxmin(255,nBias+((1.0f-fGlobalLocalBalance)*threshold + fGlobalLocalBalance*globalthreshold))));
- 		}
- 	}
- 
-@@ -3490,10 +3490,6 @@ bool CxImage::AdaptiveThreshold(long method, long nBoxSize, CxImage* pContrastMa
-  * Note: nOpacity=0 && bSelectFilledArea=true act as a "magic wand"
-  * \return true if everything is ok
-  */
--#if defined(XBMC) && !defined(_WIN32)
--int max(int a, int b) { return a > b ? a : b; }
--int min(int a, int b) { return a < b ? a : b; }
--#endif
- 
- bool CxImage::FloodFill(const long xStart, const long yStart, const RGBQUAD cFillColor, const BYTE nTolerance,
- 						BYTE nOpacity, const bool bSelectFilledArea, const BYTE nSelectionLevel)
-@@ -3538,8 +3534,8 @@ bool CxImage::FloodFill(const long xStart, const long yStart, const RGBQUAD cFil
- 	if (IsIndexed()){ //--- Generic indexed image, no tolerance OR Grayscale image with tolerance
- 		BYTE idxRef = GetPixelIndex(xStart,yStart);
- 		BYTE idxFill = GetNearestIndex(cFillColor);
--		BYTE idxMin = (BYTE)min(255, max(0,(int)(idxRef - nTolerance)));
--		BYTE idxMax = (BYTE)min(255, max(0,(int)(idxRef + nTolerance)));
-+		BYTE idxMin = (BYTE)cxmin(255, cxmax(0,(int)(idxRef - nTolerance)));
-+		BYTE idxMax = (BYTE)cxmin(255, cxmax(0,(int)(idxRef + nTolerance)));
- 
- 		while(!q.empty())
- 		{
-@@ -3575,12 +3571,12 @@ bool CxImage::FloodFill(const long xStart, const long yStart, const RGBQUAD cFil
- 	} else { //--- RGB image
- 		RGBQUAD cRef = GetPixelColor(xStart,yStart);
- 		RGBQUAD cRefMin, cRefMax;
--		cRefMin.rgbRed   = (BYTE)min(255, max(0,(int)(cRef.rgbRed   - nTolerance)));
--		cRefMin.rgbGreen = (BYTE)min(255, max(0,(int)(cRef.rgbGreen - nTolerance)));
--		cRefMin.rgbBlue  = (BYTE)min(255, max(0,(int)(cRef.rgbBlue  - nTolerance)));
--		cRefMax.rgbRed   = (BYTE)min(255, max(0,(int)(cRef.rgbRed   + nTolerance)));
--		cRefMax.rgbGreen = (BYTE)min(255, max(0,(int)(cRef.rgbGreen + nTolerance)));
--		cRefMax.rgbBlue  = (BYTE)min(255, max(0,(int)(cRef.rgbBlue  + nTolerance)));
-+		cRefMin.rgbRed   = (BYTE)cxmin(255, cxmax(0,(int)(cRef.rgbRed   - nTolerance)));
-+		cRefMin.rgbGreen = (BYTE)cxmin(255, cxmax(0,(int)(cRef.rgbGreen - nTolerance)));
-+		cRefMin.rgbBlue  = (BYTE)cxmin(255, cxmax(0,(int)(cRef.rgbBlue  - nTolerance)));
-+		cRefMax.rgbRed   = (BYTE)cxmin(255, cxmax(0,(int)(cRef.rgbRed   + nTolerance)));
-+		cRefMax.rgbGreen = (BYTE)cxmin(255, cxmax(0,(int)(cRef.rgbGreen + nTolerance)));
-+		cRefMax.rgbBlue  = (BYTE)cxmin(255, cxmax(0,(int)(cRef.rgbBlue  + nTolerance)));
- 
- 		while(!q.empty())
- 		{
-diff --git a/lib/cximage-6.0/CxImage/ximage.cpp b/lib/cximage-6.0/CxImage/ximage.cpp
-index e81d3c6..26c6993 100644
---- a/lib/cximage-6.0/CxImage/ximage.cpp
-+++ b/lib/cximage-6.0/CxImage/ximage.cpp
-@@ -460,7 +460,7 @@ bool CxImage::CreateFromArray(BYTE* pArray,DWORD dwWidth,DWORD dwHeight,DWORD dw
- 				src+=4;
- 			}
- 		} else {
--			memcpy(dst,src,min(info.dwEffWidth,dwBytesperline));
-+			memcpy(dst,src,cxmin(info.dwEffWidth,dwBytesperline));
- 		}
- 	}
- 	return true;
-@@ -500,7 +500,7 @@ bool CxImage::CreateFromMatrix(BYTE** ppMatrix,DWORD dwWidth,DWORD dwHeight,DWOR
- 					src+=4;
- 				}
- 			} else {
--				memcpy(dst,src,min(info.dwEffWidth,dwBytesperline));
-+				memcpy(dst,src,cxmin(info.dwEffWidth,dwBytesperline));
- 			}
- 		}
- 	}
-diff --git a/lib/cximage-6.0/CxImage/ximagif.cpp b/lib/cximage-6.0/CxImage/ximagif.cpp
-index b89e061..64b1ccc 100644
---- a/lib/cximage-6.0/CxImage/ximagif.cpp
-+++ b/lib/cximage-6.0/CxImage/ximagif.cpp
-@@ -478,7 +478,7 @@ bool CxImageGIF::Encode(CxFile * fp, CxImage ** pImages, int pagecount, bool bLo
- 	ghost.EncodeHeader(fp);
- 
- 	if (m_loops!=1){
--		ghost.SetLoops(max(0,m_loops-1));
-+		ghost.SetLoops(cxmax(0,m_loops-1));
- 		ghost.EncodeLoopExtension(fp);
- 	}
- 
-@@ -1340,10 +1340,10 @@ void CxImageGIF::GetComment(char* sz_comment_out)
- ////////////////////////////////////////////////////////////////////////////////
- void CxImageGIF::GifMix(CxImage & imgsrc2, struct_image & imgdesc)
- {
--	long ymin = max(0,(long)(GetHeight()-imgdesc.t - imgdesc.h));
-+	long ymin = cxmax(0,(long)(GetHeight()-imgdesc.t - imgdesc.h));
- 	long ymax = GetHeight()-imgdesc.t;
- 	long xmin = imgdesc.l;
--	long xmax = min(GetWidth(), (DWORD)(imgdesc.l + imgdesc.w));
-+	long xmax = cxmin(GetWidth(), (DWORD)(imgdesc.l + imgdesc.w));
- 
- 	long ibg2= imgsrc2.GetTransIndex();
-     BYTE i2;
-diff --git a/lib/cximage-6.0/CxImage/ximahist.cpp b/lib/cximage-6.0/CxImage/ximahist.cpp
-index a2aed03..5391107 100644
---- a/lib/cximage-6.0/CxImage/ximahist.cpp
-+++ b/lib/cximage-6.0/CxImage/ximahist.cpp
-@@ -110,7 +110,7 @@ bool CxImage::HistogramStretch(long method, double threshold)
- 	// calculate LUT
- 	BYTE lut[256];
- 	for (x = 0; x <256; x++){
--		lut[x] = (BYTE)max(0,min(255,(255 * (x - minc) / (maxc - minc))));
-+		lut[x] = (BYTE)cxmax(0,cxmin(255,(255 * (x - minc) / (maxc - minc))));
- 	}
- 
- 	for (y=0; y<head.biHeight; y++)	{
-@@ -152,7 +152,7 @@ bool CxImage::HistogramStretch(long method, double threshold)
- 		// calculate LUT
- 		BYTE lut[256];
- 		for (x = 0; x <256; x++){
--			lut[x] = (BYTE)max(0,min(255,(255 * (x - minc) / (maxc - minc))));
-+			lut[x] = (BYTE)cxmax(0,cxmin(255,(255 * (x - minc) / (maxc - minc))));
- 		}
- 
- 		// normalize image
-@@ -225,7 +225,7 @@ bool CxImage::HistogramStretch(long method, double threshold)
- 		BYTE range = maxR - minR;
- 		if (range != 0)	{
- 			for (x = 0; x <256; x++){
--				lutR[x] = (BYTE)max(0,min(255,(255 * (x - minR) / range)));
-+				lutR[x] = (BYTE)cxmax(0,cxmin(255,(255 * (x - minR) / range)));
- 			}
- 		} else lutR[minR] = minR;
- 
-@@ -233,7 +233,7 @@ bool CxImage::HistogramStretch(long method, double threshold)
- 		range = maxG - minG;
- 		if (range != 0)	{
- 			for (x = 0; x <256; x++){
--				lutG[x] = (BYTE)max(0,min(255,(255 * (x - minG) / range)));
-+				lutG[x] = (BYTE)cxmax(0,cxmin(255,(255 * (x - minG) / range)));
- 			}
- 		} else lutG[minG] = minG;
- 			
-@@ -241,7 +241,7 @@ bool CxImage::HistogramStretch(long method, double threshold)
- 		range = maxB - minB;
- 		if (range != 0)	{
- 			for (x = 0; x <256; x++){
--				lutB[x] = (BYTE)max(0,min(255,(255 * (x - minB) / range)));
-+				lutB[x] = (BYTE)cxmax(0,cxmin(255,(255 * (x - minB) / range)));
- 			}
- 		} else lutB[minB] = minB;
- 
-@@ -292,7 +292,7 @@ bool CxImage::HistogramStretch(long method, double threshold)
- 		// calculate LUT
- 		BYTE lut[256];
- 		for (x = 0; x <256; x++){
--			lut[x] = (BYTE)max(0,min(255,(255 * (x - minc) / (maxc - minc))));
-+			lut[x] = (BYTE)cxmax(0,cxmin(255,(255 * (x - minc) / (maxc - minc))));
- 		}
- 
- 		for(y=0; y<head.biHeight; y++){
-diff --git a/lib/cximage-6.0/CxImage/ximaint.cpp b/lib/cximage-6.0/CxImage/ximaint.cpp
-index 989d76c..5d49213 100644
---- a/lib/cximage-6.0/CxImage/ximaint.cpp
-+++ b/lib/cximage-6.0/CxImage/ximaint.cpp
-@@ -26,8 +26,8 @@ void CxImage::OverflowCoordinates(long &x, long &y, OverflowMethod const ofMetho
-   switch (ofMethod) {
-     case OM_REPEAT:
-       //clip coordinates
--      x=max(x,0); x=min(x, head.biWidth-1);
--      y=max(y,0); y=min(y, head.biHeight-1);
-+      x=cxmax(x,0); x=cxmin(x, head.biWidth-1);
-+      y=cxmax(y,0); y=cxmin(y, head.biHeight-1);
-       break;
-     case OM_WRAP:
-       //wrap coordinates
-@@ -59,8 +59,8 @@ void CxImage::OverflowCoordinates(float &x, float &y, OverflowMethod const ofMet
-   switch (ofMethod) {
-     case OM_REPEAT:
-       //clip coordinates
--      x=max(x,0); x=min(x, head.biWidth-1);
--      y=max(y,0); y=min(y, head.biHeight-1);
-+      x=cxmax(x,0); x=cxmin(x, head.biWidth-1);
-+      y=cxmax(y,0); y=cxmin(y, head.biHeight-1);
-       break;
-     case OM_WRAP:
-       //wrap coordinates
-diff --git a/lib/cximage-6.0/CxImage/ximaiter.h b/lib/cximage-6.0/CxImage/ximaiter.h
-index 9788919..01a720b 100644
---- a/lib/cximage-6.0/CxImage/ximaiter.h
-+++ b/lib/cximage-6.0/CxImage/ximaiter.h
-@@ -140,7 +140,7 @@ inline void CImageIterator::SetY(int y)
- inline void CImageIterator::SetRow(BYTE *buf, int n)
- {
- 	if (n<0) n = (int)ima->GetEffWidth();
--	else n = min(n,(int)ima->GetEffWidth());
-+	else n = cxmin(n,(int)ima->GetEffWidth());
- 
- 	if ((IterImage!=NULL)&&(buf!=NULL)&&(n>0)) memcpy(IterImage,buf,n);
- }
-@@ -148,7 +148,7 @@ inline void CImageIterator::SetRow(BYTE *buf, int n)
- inline void CImageIterator::GetRow(BYTE *buf, int n)
- {
- 	if ((IterImage!=NULL)&&(buf!=NULL)&&(n>0))
--		memcpy(buf,IterImage,min(n,(int)ima->GetEffWidth()));
-+		memcpy(buf,IterImage,cxmin(n,(int)ima->GetEffWidth()));
- }
- /////////////////////////////////////////////////////////////////////
- inline BYTE* CImageIterator::GetRow()
-diff --git a/lib/cximage-6.0/CxImage/ximajbg.cpp b/lib/cximage-6.0/CxImage/ximajbg.cpp
-index 06fb9bf..8a01e28 100644
---- a/lib/cximage-6.0/CxImage/ximajbg.cpp
-+++ b/lib/cximage-6.0/CxImage/ximajbg.cpp
-@@ -145,7 +145,7 @@ bool CxImageJBG::Encode(CxFile * hFile)
- 	jbg_enc_init(&jbig_state, w, h, planes, &buffer, jbig_data_out, hFile);
- 
-     //jbg_enc_layers(&jbig_state, 2);
--    //jbg_enc_lrlmax(&jbig_state, 800, 600);
-+    //jbg_enc_lrlcxmax(&jbig_state, 800, 600);
- 
- 	// Specify a few other options (each is ignored if negative)
- 	int dl = -1, dh = -1, d = -1, l0 = -1, mx = -1;
-diff --git a/lib/cximage-6.0/CxImage/ximapal.cpp b/lib/cximage-6.0/CxImage/ximapal.cpp
-index b3bd3da..3788c98 100644
---- a/lib/cximage-6.0/CxImage/ximapal.cpp
-+++ b/lib/cximage-6.0/CxImage/ximapal.cpp
-@@ -398,8 +398,8 @@ void CxImage::RGBtoBGR(BYTE *buffer, int length)
- {
- 	if (buffer && (head.biClrUsed==0)){
- 		BYTE temp;
--		length = min(length,(int)info.dwEffWidth);
--		length = min(length,(int)(3*head.biWidth));
-+		length = cxmin(length,(int)info.dwEffWidth);
-+		length = cxmin(length,(int)(3*head.biWidth));
- 		for (int i=0;i<length;i+=3){
- 			temp = buffer[i]; buffer[i] = buffer[i+2]; buffer[i+2] = temp;
- 		}
-@@ -444,7 +444,7 @@ void CxImage::SetPalette(DWORD n, BYTE *r, BYTE *g, BYTE *b)
- 	if (!g) g = r;
- 	if (!b) b = g;
- 	RGBQUAD* ppal=GetPalette();
--	DWORD m=min(n,head.biClrUsed);
-+	DWORD m=cxmin(n,head.biClrUsed);
- 	for (DWORD i=0; i<m;i++){
- 		ppal[i].rgbRed=r[i];
- 		ppal[i].rgbGreen=g[i];
-@@ -457,7 +457,7 @@ void CxImage::SetPalette(rgb_color *rgb,DWORD nColors)
- {
- 	if ((!rgb)||(pDib==NULL)||(head.biClrUsed==0)) return;
- 	RGBQUAD* ppal=GetPalette();
--	DWORD m=min(nColors,head.biClrUsed);
-+	DWORD m=cxmin(nColors,head.biClrUsed);
- 	for (DWORD i=0; i<m;i++){
- 		ppal[i].rgbRed=rgb[i].r;
- 		ppal[i].rgbGreen=rgb[i].g;
-@@ -469,7 +469,7 @@ void CxImage::SetPalette(rgb_color *rgb,DWORD nColors)
- void CxImage::SetPalette(RGBQUAD* pPal,DWORD nColors)
- {
- 	if ((pPal==NULL)||(pDib==NULL)||(head.biClrUsed==0)) return;
--	memcpy(GetPalette(),pPal,min(GetPaletteSize(),nColors*sizeof(RGBQUAD)));
-+	memcpy(GetPalette(),pPal,cxmin(GetPaletteSize(),nColors*sizeof(RGBQUAD)));
- 	info.last_c_isvalid = false;
- }
- ////////////////////////////////////////////////////////////////////////////////
-@@ -654,10 +654,10 @@ void CxImage::SetClrImportant(DWORD ncolors)
- 
- 	switch(head.biBitCount){
- 	case 1:
--		head.biClrImportant = min(ncolors,2);
-+		head.biClrImportant = cxmin(ncolors,2);
- 		break;
- 	case 4:
--		head.biClrImportant = min(ncolors,16);
-+		head.biClrImportant = cxmin(ncolors,16);
- 		break;
- 	case 8:
- 		head.biClrImportant = ncolors;
-diff --git a/lib/cximage-6.0/CxImage/ximapng.cpp b/lib/cximage-6.0/CxImage/ximapng.cpp
-index a58441c..4b5cc50 100644
---- a/lib/cximage-6.0/CxImage/ximapng.cpp
-+++ b/lib/cximage-6.0/CxImage/ximapng.cpp
-@@ -206,9 +206,9 @@ bool CxImagePNG::Decode(CxFile *hFile)
- 	} else SetGrayPalette(); //<DP> needed for grayscale PNGs
- 	
- #ifdef USE_NEW_LIBPNG_API
--	int nshift = max(0,(_bit_depth>>3)-1)<<3;
-+	int nshift = cxmax(0,(_bit_depth>>3)-1)<<3;
- #else
--	int nshift = max(0,(info_ptr->bit_depth>>3)-1)<<3;
-+	int nshift = cxmax(0,(info_ptr->bit_depth>>3)-1)<<3;
- #endif
- 
- #ifdef USE_NEW_LIBPNG_API
-@@ -255,10 +255,10 @@ bool CxImagePNG::Decode(CxFile *hFile)
- 			if (pal){
- 				DWORD ip;
- #ifdef USE_NEW_LIBPNG_API
--				for (ip=0;ip<min(head.biClrUsed,(unsigned long)_num_trans);ip++)
-+				for (ip=0;ip<cxmin(head.biClrUsed,(unsigned long)_num_trans);ip++)
- 					pal[ip].rgbReserved=_trans_alpha[ip];
- #else
--				for (ip=0;ip<min(head.biClrUsed,(unsigned long)info_ptr->num_trans);ip++)
-+				for (ip=0;ip<cxmin(head.biClrUsed,(unsigned long)info_ptr->num_trans);ip++)
- #if PNG_LIBPNG_VER > 10399
- 					pal[ip].rgbReserved=info_ptr->trans_alpha[ip];
- #else
-@@ -737,9 +737,9 @@ bool CxImagePNG::Encode(CxFile *hFile)
- #endif // CXIMAGE_SUPPORT_ALPHA	// <vho>
- 
- #ifdef USE_NEW_LIBPNG_API
--	int row_size = max(info.dwEffWidth, (_width * _channels * _bit_depth / 8));
-+	int row_size = cxmax(info.dwEffWidth, (_width * _channels * _bit_depth / 8));
- #else
--	int row_size = max(info.dwEffWidth, info_ptr->width*info_ptr->channels*(info_ptr->bit_depth/8));
-+	int row_size = cxmax(info.dwEffWidth, info_ptr->width*info_ptr->channels*(info_ptr->bit_depth/8));
- 	info_ptr->rowbytes = row_size;
- #endif
- 	BYTE *row_pointers = new BYTE[row_size];
-diff --git a/lib/cximage-6.0/CxImage/ximaraw.cpp b/lib/cximage-6.0/CxImage/ximaraw.cpp
-index fd86f96..52d964d 100644
---- a/lib/cximage-6.0/CxImage/ximaraw.cpp
-+++ b/lib/cximage-6.0/CxImage/ximaraw.cpp
-@@ -216,7 +216,7 @@ bool CxImageRAW::Decode(CxFile *hFile)
- 
- 		DWORD size = dcr.width * (dcr.colors*dcr.opt.output_bps/8);
- 		RGBtoBGR(ppm,size);
--		memcpy(GetBits(dcr.height - 1 - row), ppm, min(size,GetEffWidth()));
-+		memcpy(GetBits(dcr.height - 1 - row), ppm, cxmin(size,GetEffWidth()));
- 	}
- 	free (ppm);
- 
-@@ -298,7 +298,7 @@ bool CxImageRAW::GetExifThumbnail(const char *filename, const char *outname, int
- 			// Resizing.
-       		if (image.GetWidth() > 256 || image.GetHeight() > 256)
- 		    {
--				float amount = 256.0f / max(image.GetWidth(), image.GetHeight());
-+				float amount = 256.0f / cxmax(image.GetWidth(), image.GetHeight());
- 				image.Resample((long)(image.GetWidth() * amount), (long)(image.GetHeight() * amount), 0);
- 		    }
- 	      	
-diff --git a/lib/cximage-6.0/CxImage/ximasel.cpp b/lib/cximage-6.0/CxImage/ximasel.cpp
-index 3a7c9a1..37cd10f 100644
---- a/lib/cximage-6.0/CxImage/ximasel.cpp
-+++ b/lib/cximage-6.0/CxImage/ximasel.cpp
-@@ -113,15 +113,15 @@ bool CxImage::SelectionAddRect(RECT r, BYTE level)
- 	if (r.left<r.right) {r2.left=r.left; r2.right=r.right; } else {r2.left=r.right ; r2.right=r.left; }
- 	if (r.bottom<r.top) {r2.bottom=r.bottom; r2.top=r.top; } else {r2.bottom=r.top ; r2.top=r.bottom; }
- 
--	if (info.rSelectionBox.top <= r2.top) info.rSelectionBox.top = max(0L,min(head.biHeight,r2.top+1));
--	if (info.rSelectionBox.left > r2.left) info.rSelectionBox.left = max(0L,min(head.biWidth,r2.left));
--	if (info.rSelectionBox.right <= r2.right) info.rSelectionBox.right = max(0L,min(head.biWidth,r2.right+1));
--	if (info.rSelectionBox.bottom > r2.bottom) info.rSelectionBox.bottom = max(0L,min(head.biHeight,r2.bottom));
-+	if (info.rSelectionBox.top <= r2.top) info.rSelectionBox.top = cxmax(0L,cxmin(head.biHeight,r2.top+1));
-+	if (info.rSelectionBox.left > r2.left) info.rSelectionBox.left = cxmax(0L,cxmin(head.biWidth,r2.left));
-+	if (info.rSelectionBox.right <= r2.right) info.rSelectionBox.right = cxmax(0L,cxmin(head.biWidth,r2.right+1));
-+	if (info.rSelectionBox.bottom > r2.bottom) info.rSelectionBox.bottom = cxmax(0L,cxmin(head.biHeight,r2.bottom));
- 
--	long ymin = max(0L,min(head.biHeight,r2.bottom));
--	long ymax = max(0L,min(head.biHeight,r2.top+1));
--	long xmin = max(0L,min(head.biWidth,r2.left));
--	long xmax = max(0L,min(head.biWidth,r2.right+1));
-+	long ymin = cxmax(0L,cxmin(head.biHeight,r2.bottom));
-+	long ymax = cxmax(0L,cxmin(head.biHeight,r2.top+1));
-+	long xmin = cxmax(0L,cxmin(head.biWidth,r2.left));
-+	long xmax = cxmax(0L,cxmin(head.biWidth,r2.right+1));
- 
- 	for (long y=ymin; y<ymax; y++)
- 		memset(pSelection + xmin + y * head.biWidth, level, xmax-xmin);
-@@ -144,18 +144,18 @@ bool CxImage::SelectionAddEllipse(RECT r, BYTE level)
- 	long xcenter = (r.right + r.left)/2;
- 	long ycenter = (r.top + r.bottom)/2;
- 
--	if (info.rSelectionBox.left > (xcenter - xradius)) info.rSelectionBox.left = max(0L,min(head.biWidth,(xcenter - xradius)));
--	if (info.rSelectionBox.right <= (xcenter + xradius)) info.rSelectionBox.right = max(0L,min(head.biWidth,(xcenter + xradius + 1)));
--	if (info.rSelectionBox.bottom > (ycenter - yradius)) info.rSelectionBox.bottom = max(0L,min(head.biHeight,(ycenter - yradius)));
--	if (info.rSelectionBox.top <= (ycenter + yradius)) info.rSelectionBox.top = max(0L,min(head.biHeight,(ycenter + yradius + 1)));
-+	if (info.rSelectionBox.left > (xcenter - xradius)) info.rSelectionBox.left = cxmax(0L,cxmin(head.biWidth,(xcenter - xradius)));
-+	if (info.rSelectionBox.right <= (xcenter + xradius)) info.rSelectionBox.right = cxmax(0L,cxmin(head.biWidth,(xcenter + xradius + 1)));
-+	if (info.rSelectionBox.bottom > (ycenter - yradius)) info.rSelectionBox.bottom = cxmax(0L,cxmin(head.biHeight,(ycenter - yradius)));
-+	if (info.rSelectionBox.top <= (ycenter + yradius)) info.rSelectionBox.top = cxmax(0L,cxmin(head.biHeight,(ycenter + yradius + 1)));
- 
--	long xmin = max(0L,min(head.biWidth,xcenter - xradius));
--	long xmax = max(0L,min(head.biWidth,xcenter + xradius + 1));
--	long ymin = max(0L,min(head.biHeight,ycenter - yradius));
--	long ymax = max(0L,min(head.biHeight,ycenter + yradius + 1));
-+	long xmin = cxmax(0L,cxmin(head.biWidth,xcenter - xradius));
-+	long xmax = cxmax(0L,cxmin(head.biWidth,xcenter + xradius + 1));
-+	long ymin = cxmax(0L,cxmin(head.biHeight,ycenter - yradius));
-+	long ymax = cxmax(0L,cxmin(head.biHeight,ycenter + yradius + 1));
- 
- 	long y,yo;
--	for (y=ymin; y<min(ycenter,ymax); y++){
-+	for (y=ymin; y<cxmin(ycenter,ymax); y++){
- 		for (long x=xmin; x<xmax; x++){
- 			yo = (long)(ycenter - yradius * sqrt(1-pow((float)(x - xcenter)/(float)xradius,2)));
- 			if (yo<y) pSelection[x + y * head.biWidth] = level;
-@@ -268,10 +268,10 @@ bool CxImage::SelectionAddPolygon(POINT *points, long npoints, BYTE level)
- 		RECT r2;
- 		if (current->x < next->x) {r2.left=current->x; r2.right=next->x; } else {r2.left=next->x ; r2.right=current->x; }
- 		if (current->y < next->y) {r2.bottom=current->y; r2.top=next->y; } else {r2.bottom=next->y ; r2.top=current->y; }
--		if (localbox.top < r2.top) localbox.top = max(0L,min(head.biHeight-1,r2.top+1));
--		if (localbox.left > r2.left) localbox.left = max(0L,min(head.biWidth-1,r2.left-1));
--		if (localbox.right < r2.right) localbox.right = max(0L,min(head.biWidth-1,r2.right+1));
--		if (localbox.bottom > r2.bottom) localbox.bottom = max(0L,min(head.biHeight-1,r2.bottom-1));
-+		if (localbox.top < r2.top) localbox.top = cxmax(0L,cxmin(head.biHeight-1,r2.top+1));
-+		if (localbox.left > r2.left) localbox.left = cxmax(0L,cxmin(head.biWidth-1,r2.left-1));
-+		if (localbox.right < r2.right) localbox.right = cxmax(0L,cxmin(head.biWidth-1,r2.right+1));
-+		if (localbox.bottom > r2.bottom) localbox.bottom = cxmax(0L,cxmin(head.biHeight-1,r2.bottom-1));
- 
- 		i++;
- 	}
-@@ -385,10 +385,10 @@ bool CxImage::SelectionAddPolygon(POINT *points, long npoints, BYTE level)
- 		for (x=localbox.left; x<=localbox.right; x++)
- 			if (plocal[x + yoffset]!=1) pSelection[x + yoffset]=level;
- 	}
--	if (info.rSelectionBox.top <= localbox.top) info.rSelectionBox.top = min(head.biHeight,localbox.top + 1);
--	if (info.rSelectionBox.left > localbox.left) info.rSelectionBox.left = min(head.biWidth,localbox.left);
--	if (info.rSelectionBox.right <= localbox.right) info.rSelectionBox.right = min(head.biWidth,localbox.right + 1);
--	if (info.rSelectionBox.bottom > localbox.bottom) info.rSelectionBox.bottom = min(head.biHeight,localbox.bottom);
-+	if (info.rSelectionBox.top <= localbox.top) info.rSelectionBox.top = cxmin(head.biHeight,localbox.top + 1);
-+	if (info.rSelectionBox.left > localbox.left) info.rSelectionBox.left = cxmin(head.biWidth,localbox.left);
-+	if (info.rSelectionBox.right <= localbox.right) info.rSelectionBox.right = cxmin(head.biWidth,localbox.right + 1);
-+	if (info.rSelectionBox.bottom > localbox.bottom) info.rSelectionBox.bottom = cxmin(head.biHeight,localbox.bottom);
- 
- 	free(plocal);
- 	free(pix);
-diff --git a/lib/cximage-6.0/CxImage/ximath.cpp b/lib/cximage-6.0/CxImage/ximath.cpp
-index 37533e2..f84eb72 100644
---- a/lib/cximage-6.0/CxImage/ximath.cpp
-+++ b/lib/cximage-6.0/CxImage/ximath.cpp
-@@ -64,10 +64,10 @@ CxRect2 CxRect2::CrossSection(CxRect2 const &r2) const
-  */
- {
-   CxRect2 cs;
--  cs.botLeft.x=max(botLeft.x, r2.botLeft.x);
--  cs.botLeft.y=max(botLeft.y, r2.botLeft.y);
--  cs.topRight.x=min(topRight.x, r2.topRight.x);
--  cs.topRight.y=min(topRight.y, r2.topRight.y);
-+  cs.botLeft.x=cxmax(botLeft.x, r2.botLeft.x);
-+  cs.botLeft.y=cxmax(botLeft.y, r2.botLeft.y);
-+  cs.topRight.x=cxmin(topRight.x, r2.topRight.x);
-+  cs.topRight.y=cxmin(topRight.y, r2.topRight.y);
-   if (cs.botLeft.x<=cs.topRight.x && cs.botLeft.y<=cs.topRight.y) {
-     return cs;
-   } else {
-diff --git a/lib/cximage-6.0/CxImage/ximatif.cpp b/lib/cximage-6.0/CxImage/ximatif.cpp
-index 658392a..002766c 100644
---- a/lib/cximage-6.0/CxImage/ximatif.cpp
-+++ b/lib/cximage-6.0/CxImage/ximatif.cpp
-@@ -470,9 +470,9 @@ bool CxImageTIF::Decode(CxFile * hFile)
- 						if ( cb > 0.00304 ) cb = 1.055 * pow(cb,0.41667) - 0.055;
- 							else            cb = 12.92 * cb;
- 
--						c.rgbRed  =(BYTE)max(0,min(255,(int)(cr*255)));
--						c.rgbGreen=(BYTE)max(0,min(255,(int)(cg*255)));
--						c.rgbBlue =(BYTE)max(0,min(255,(int)(cb*255)));
-+						c.rgbRed  =(BYTE)cxmax(0,cxmin(255,(int)(cr*255)));
-+						c.rgbGreen=(BYTE)cxmax(0,cxmin(255,(int)(cg*255)));
-+						c.rgbBlue =(BYTE)cxmax(0,cxmin(255,(int)(cb*255)));
- 
- 						SetPixelColor(xi,yi,c);
- #if CXIMAGE_SUPPORT_ALPHA
-diff --git a/lib/cximage-6.0/CxImage/ximatran.cpp b/lib/cximage-6.0/CxImage/ximatran.cpp
-index 64a71e7..84d5e03 100644
---- a/lib/cximage-6.0/CxImage/ximatran.cpp
-+++ b/lib/cximage-6.0/CxImage/ximatran.cpp
-@@ -302,12 +302,12 @@ bool CxImage::RotateLeft(CxImage* iDst)
- 			for (ys = 0; ys < newHeight; ys+=RBLOCK) {
- 				if (head.biBitCount==24) {
- 					//RGB24 optimized pixel access:
--					for (x = xs; x < min(newWidth, xs+RBLOCK); x++){    //do rotation
-+					for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){    //do rotation
- 						info.nProgress = (long)(100*x/newWidth);
- 						x2=newWidth-x-1;
- 						dstPtr = (BYTE*) imgDest.BlindGetPixelPointer(x,ys);
- 						srcPtr = (BYTE*) BlindGetPixelPointer(ys, x2);
--						for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
-+						for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
- 							//imgDest.SetPixelColor(x, y, GetPixelColor(y, x2));
- 							*(dstPtr) = *(srcPtr);
- 							*(dstPtr+1) = *(srcPtr+1);
-@@ -318,19 +318,19 @@ bool CxImage::RotateLeft(CxImage* iDst)
- 					}//for x
- 				} else {
- 					//anything else than 24bpp (and 1bpp): palette
--					for (x = xs; x < min(newWidth, xs+RBLOCK); x++){
-+					for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){
- 						info.nProgress = (long)(100*x/newWidth); //<Anatoly Ivasyuk>
- 						x2=newWidth-x-1;
--						for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
-+						for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
- 							imgDest.SetPixelIndex(x, y, BlindGetPixelIndex(y, x2));
- 						}//for y
- 					}//for x
- 				}//if (version selection)
- #if CXIMAGE_SUPPORT_ALPHA
- 				if (AlphaIsValid()) {
--					for (x = xs; x < min(newWidth, xs+RBLOCK); x++){
-+					for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){
- 						x2=newWidth-x-1;
--						for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
-+						for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
- 							imgDest.AlphaSet(x,y,BlindAlphaGet(y, x2));
- 						}//for y
- 					}//for x
-@@ -343,9 +343,9 @@ bool CxImage::RotateLeft(CxImage* iDst)
- 					imgDest.info.rSelectionBox.right = newWidth-info.rSelectionBox.bottom;
- 					imgDest.info.rSelectionBox.bottom = info.rSelectionBox.left;
- 					imgDest.info.rSelectionBox.top = info.rSelectionBox.right;
--					for (x = xs; x < min(newWidth, xs+RBLOCK); x++){
-+					for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){
- 						x2=newWidth-x-1;
--						for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
-+						for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
- 							imgDest.SelectionSet(x,y,BlindSelectionGet(y, x2));
- 						}//for y
- 					}//for x
-@@ -447,12 +447,12 @@ bool CxImage::RotateRight(CxImage* iDst)
- 			for (ys = 0; ys < newHeight; ys+=RBLOCK) {
- 				if (head.biBitCount==24) {
- 					//RGB24 optimized pixel access:
--					for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
-+					for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
- 						info.nProgress = (long)(100*y/newHeight); //<Anatoly Ivasyuk>
- 						y2=newHeight-y-1;
- 						dstPtr = (BYTE*) imgDest.BlindGetPixelPointer(xs,y);
- 						srcPtr = (BYTE*) BlindGetPixelPointer(y2, xs);
--						for (x = xs; x < min(newWidth, xs+RBLOCK); x++){
-+						for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){
- 							//imgDest.SetPixelColor(x, y, GetPixelColor(y2, x));
- 							*(dstPtr) = *(srcPtr);
- 							*(dstPtr+1) = *(srcPtr+1);
-@@ -463,19 +463,19 @@ bool CxImage::RotateRight(CxImage* iDst)
- 					}//for y
- 				} else {
- 					//anything else than BW & RGB24: palette
--					for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
-+					for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
- 						info.nProgress = (long)(100*y/newHeight); //<Anatoly Ivasyuk>
- 						y2=newHeight-y-1;
--						for (x = xs; x < min(newWidth, xs+RBLOCK); x++){
-+						for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){
- 							imgDest.SetPixelIndex(x, y, BlindGetPixelIndex(y2, x));
- 						}//for x
- 					}//for y
- 				}//if
- #if CXIMAGE_SUPPORT_ALPHA
- 				if (AlphaIsValid()){
--					for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
-+					for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
- 						y2=newHeight-y-1;
--						for (x = xs; x < min(newWidth, xs+RBLOCK); x++){
-+						for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){
- 							imgDest.AlphaSet(x,y,BlindAlphaGet(y2, x));
- 						}//for x
- 					}//for y
-@@ -488,9 +488,9 @@ bool CxImage::RotateRight(CxImage* iDst)
- 					imgDest.info.rSelectionBox.right = info.rSelectionBox.top;
- 					imgDest.info.rSelectionBox.bottom = newHeight-info.rSelectionBox.right;
- 					imgDest.info.rSelectionBox.top = newHeight-info.rSelectionBox.left;
--					for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
-+					for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
- 						y2=newHeight-y-1;
--						for (x = xs; x < min(newWidth, xs+RBLOCK); x++){
-+						for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){
- 							imgDest.SelectionSet(x,y,BlindSelectionGet(y2, x));
- 						}//for x
- 					}//for y
-@@ -608,10 +608,10 @@ bool CxImage::Rotate(float angle, CxImage* iDst)
- 	newP4.x = (float)(p4.x*cos_angle - p4.y*sin_angle);
- 	newP4.y = (float)(p4.x*sin_angle + p4.y*cos_angle);
- 
--	leftTop.x = min(min(newP1.x,newP2.x),min(newP3.x,newP4.x));
--	leftTop.y = min(min(newP1.y,newP2.y),min(newP3.y,newP4.y));
--	rightBottom.x = max(max(newP1.x,newP2.x),max(newP3.x,newP4.x));
--	rightBottom.y = max(max(newP1.y,newP2.y),max(newP3.y,newP4.y));
-+	leftTop.x = cxmin(cxmin(newP1.x,newP2.x),cxmin(newP3.x,newP4.x));
-+	leftTop.y = cxmin(cxmin(newP1.y,newP2.y),cxmin(newP3.y,newP4.y));
-+	rightBottom.x = cxmax(cxmax(newP1.x,newP2.x),cxmax(newP3.x,newP4.x));
-+	rightBottom.y = cxmax(cxmax(newP1.y,newP2.y),cxmax(newP3.y,newP4.y));
- 	leftBottom.x = leftTop.x;
- 	leftBottom.y = rightBottom.y;
- 	rightTop.x = rightBottom.x;
-@@ -740,10 +740,10 @@ bool CxImage::Rotate2(float angle,
- 	}//if
- 
- 	//(read new dimensions from location of corners)
--	float minx = (float) min(min(newp[0].x,newp[1].x),min(newp[2].x,newp[3].x));
--	float miny = (float) min(min(newp[0].y,newp[1].y),min(newp[2].y,newp[3].y));
--	float maxx = (float) max(max(newp[0].x,newp[1].x),max(newp[2].x,newp[3].x));
--	float maxy = (float) max(max(newp[0].y,newp[1].y),max(newp[2].y,newp[3].y));
-+	float minx = (float) cxmin(cxmin(newp[0].x,newp[1].x),cxmin(newp[2].x,newp[3].x));
-+	float miny = (float) cxmin(cxmin(newp[0].y,newp[1].y),cxmin(newp[2].y,newp[3].y));
-+	float maxx = (float) cxmax(cxmax(newp[0].x,newp[1].x),cxmax(newp[2].x,newp[3].x));
-+	float maxy = (float) cxmax(cxmax(newp[0].y,newp[1].y),cxmax(newp[2].y,newp[3].y));
- 	int newWidth = (int) floor(maxx-minx+0.5f);
- 	int newHeight= (int) floor(maxy-miny+0.5f);
- 	float ssx=((maxx+minx)- ((float) newWidth-1))/2.0f;   //start for x
-@@ -1003,12 +1003,12 @@ bool CxImage::Resample(long newx, long newy, int mode, CxImage* iDst)
- 				if (info.nEscape) break;
- 				fY = y * yScale;
- 				ifY = (int)fY;
--				ifY1 = min(ymax, ifY+1);
-+				ifY1 = cxmin(ymax, ifY+1);
- 				dy = fY - ifY;
- 				for(long x=0; x<newx; x++){
- 					fX = x * xScale;
- 					ifX = (int)fX;
--					ifX1 = min(xmax, ifX+1);
-+					ifX1 = cxmin(xmax, ifX+1);
- 					dx = fX - ifX;
- 					// Interpolate using the four nearest pixels in the source
- 					if (head.biClrUsed){
-@@ -1328,9 +1328,9 @@ bool CxImage::DecreaseBpp(DWORD nbit, bool errordiffusion, RGBQUAD* ppal, DWORD
- 				eb=(long)c.rgbBlue - (long)ce.rgbBlue;
- 
- 				c = GetPixelColor(x+1,y);
--				c.rgbRed = (BYTE)min(255L,max(0L,(long)c.rgbRed + ((er*7)/16)));
--				c.rgbGreen = (BYTE)min(255L,max(0L,(long)c.rgbGreen + ((eg*7)/16)));
--				c.rgbBlue = (BYTE)min(255L,max(0L,(long)c.rgbBlue + ((eb*7)/16)));
-+				c.rgbRed = (BYTE)cxmin(255L,cxmax(0L,(long)c.rgbRed + ((er*7)/16)));
-+				c.rgbGreen = (BYTE)cxmin(255L,cxmax(0L,(long)c.rgbGreen + ((eg*7)/16)));
-+				c.rgbBlue = (BYTE)cxmin(255L,cxmax(0L,(long)c.rgbBlue + ((eb*7)/16)));
- 				SetPixelColor(x+1,y,c);
- 				int coeff=1;
- 				for(int i=-1; i<2; i++){
-@@ -1343,9 +1343,9 @@ bool CxImage::DecreaseBpp(DWORD nbit, bool errordiffusion, RGBQUAD* ppal, DWORD
- 						coeff=1; break;
- 					}
- 					c = GetPixelColor(x+i,y+1);
--					c.rgbRed = (BYTE)min(255L,max(0L,(long)c.rgbRed + ((er * coeff)/16)));
--					c.rgbGreen = (BYTE)min(255L,max(0L,(long)c.rgbGreen + ((eg * coeff)/16)));
--					c.rgbBlue = (BYTE)min(255L,max(0L,(long)c.rgbBlue + ((eb * coeff)/16)));
-+					c.rgbRed = (BYTE)cxmin(255L,cxmax(0L,(long)c.rgbRed + ((er * coeff)/16)));
-+					c.rgbGreen = (BYTE)cxmin(255L,cxmax(0L,(long)c.rgbGreen + ((eg * coeff)/16)));
-+					c.rgbBlue = (BYTE)cxmin(255L,cxmax(0L,(long)c.rgbBlue + ((eb * coeff)/16)));
- 					SetPixelColor(x+i,y+1,c);
- 				}
- 			}
-@@ -1566,10 +1566,10 @@ bool CxImage::Dither(long method)
- 				}
- 
- 				nlevel = GetPixelIndex(x + 1, y) + (error * 8) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(x + 1, y, level);
- 				nlevel = GetPixelIndex(x + 2, y) + (error * 4) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(x + 2, y, level);
- 				int i;
- 				for (i = -2; i < 3; i++) {
-@@ -1591,7 +1591,7 @@ bool CxImage::Dither(long method)
- 						break;
- 					}
- 					nlevel = GetPixelIndex(x + i, y + 1) + (error * coeff) / TotalCoeffSum;
--					level = (BYTE)min(255, max(0, (int)nlevel));
-+					level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 					SetPixelIndex(x + i, y + 1, level);
- 				}
- 			}
-@@ -1620,10 +1620,10 @@ bool CxImage::Dither(long method)
- 				}
- 
- 				nlevel = GetPixelIndex(x + 1, y) + (error * 8) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(x + 1, y, level);
- 				nlevel = GetPixelIndex(x + 2, y) + (error * 4) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(x + 2, y, level);
- 				int i;
- 				for (i = -2; i < 3; i++) {
-@@ -1645,7 +1645,7 @@ bool CxImage::Dither(long method)
- 						break;
- 					}
- 					nlevel = GetPixelIndex(x + i, y + 1) + (error * coeff) / TotalCoeffSum;
--					level = (BYTE)min(255, max(0, (int)nlevel));
-+					level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 					SetPixelIndex(x + i, y + 1, level);
- 				}
- 				for (i = -2; i < 3; i++) {
-@@ -1667,7 +1667,7 @@ bool CxImage::Dither(long method)
- 						break;
- 					}
- 					nlevel = GetPixelIndex(x + i, y + 2) + (error * coeff) / TotalCoeffSum;
--					level = (BYTE)min(255, max(0, (int)nlevel));
-+					level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 					SetPixelIndex(x + i, y + 2, level);
- 				}
- 			}
-@@ -1696,10 +1696,10 @@ bool CxImage::Dither(long method)
- 				}
- 
- 				nlevel = GetPixelIndex(x + 1, y) + (error * 7) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(x + 1, y, level);
- 				nlevel = GetPixelIndex(x + 2, y) + (error * 5) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(x + 2, y, level);
- 				int i;
- 				for (i = -2; i < 3; i++) {
-@@ -1721,7 +1721,7 @@ bool CxImage::Dither(long method)
- 						break;
- 					}
- 					nlevel = GetPixelIndex(x + i, y + 1) + (error * coeff) / TotalCoeffSum;
--					level = (BYTE)min(255, max(0, (int)nlevel));
-+					level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 					SetPixelIndex(x + i, y + 1, level);
- 				}
- 				for (i = -2; i < 3; i++) {
-@@ -1743,7 +1743,7 @@ bool CxImage::Dither(long method)
- 						break;
- 					}
- 					nlevel = GetPixelIndex(x + i, y + 2) + (error * coeff) / TotalCoeffSum;
--					level = (BYTE)min(255, max(0, (int)nlevel));
-+					level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 					SetPixelIndex(x + i, y + 2, level);
- 				}
- 			}
-@@ -1772,10 +1772,10 @@ bool CxImage::Dither(long method)
- 				}
- 
- 				nlevel = GetPixelIndex(x + 1, y) + (error * 5) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(x + 1, y, level);
- 				nlevel = GetPixelIndex(x + 2, y) + (error * 3) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(x + 2, y, level);
- 				int i;
- 				for (i = -2; i < 3; i++) {
-@@ -1797,7 +1797,7 @@ bool CxImage::Dither(long method)
- 						break;
- 					}
- 					nlevel = GetPixelIndex(x + i, y + 1) + (error * coeff) / TotalCoeffSum;
--					level = (BYTE)min(255, max(0, (int)nlevel));
-+					level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 					SetPixelIndex(x + i, y + 1, level);
- 				}
- 				for (i = -1; i < 2; i++) {
-@@ -1813,7 +1813,7 @@ bool CxImage::Dither(long method)
- 						break;
- 					}
- 					nlevel = GetPixelIndex(x + i, y + 2) + (error * coeff) / TotalCoeffSum;
--					level = (BYTE)min(255, max(0, (int)nlevel));
-+					level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 					SetPixelIndex(x + i, y + 2, level);
- 				}
- 			}
-@@ -1845,76 +1845,76 @@ bool CxImage::Dither(long method)
- 				int tmp_index_y = y;
- 				int tmp_coeff = 32;
- 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
- 
- 				tmp_index_x = x - 3;
- 				tmp_index_y = y + 1;
- 				tmp_coeff = 12;
- 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
- 
- 				tmp_index_x = x - 1;
- 				tmp_coeff = 26;
- 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
- 
- 				tmp_index_x = x + 1;
- 				tmp_coeff = 30;
- 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
- 
- 				tmp_index_x = x + 3;
- 				tmp_coeff = 16;
- 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
- 
- 				tmp_index_x = x - 2;
- 				tmp_index_y = y + 2;
- 				tmp_coeff = 12;
- 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
- 
- 				tmp_index_x = x;
- 				tmp_coeff = 26;
- 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
- 
- 				tmp_index_x = x + 2;
- 				tmp_coeff = 12;
- 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
- 
- 				tmp_index_x = x - 3;
- 				tmp_index_y = y + 3;
- 				tmp_coeff = 5;
- 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
- 
- 				tmp_index_x = x - 1;
- 				tmp_coeff = 12;
- 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
- 
- 				tmp_index_x = x + 1;
- 				tmp_coeff = 12;
- 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
- 
- 				tmp_index_x = x + 3;
- 				tmp_coeff = 5;
- 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
--				level = (BYTE)min(255, max(0, (int)nlevel));
-+				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
- 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
- 			}
- 		}
-@@ -1941,7 +1941,7 @@ bool CxImage::Dither(long method)
- 			Bmatrix[i] = (BYTE)(dither);
- 		}
- 
--		int scale = max(0,(8-2*order));
-+		int scale = cxmax(0,(8-2*order));
- 		int level;
- 		for (long y=0;y<head.biHeight;y++){
- 			info.nProgress = (long)(100*y/head.biHeight);
-@@ -1981,7 +1981,7 @@ bool CxImage::Dither(long method)
- 				}
- 
- 				nlevel = GetPixelIndex(x+1,y) + (error * 7)/16;
--				level = (BYTE)min(255,max(0,(int)nlevel));
-+				level = (BYTE)cxmin(255,cxmax(0,(int)nlevel));
- 				SetPixelIndex(x+1,y,level);
- 				for(int i=-1; i<2; i++){
- 					switch(i){
-@@ -1993,7 +1993,7 @@ bool CxImage::Dither(long method)
- 						coeff=1; break;
- 					}
- 					nlevel = GetPixelIndex(x+i,y+1) + (error * coeff)/16;
--					level = (BYTE)min(255,max(0,(int)nlevel));
-+					level = (BYTE)cxmin(255,cxmax(0,(int)nlevel));
- 					SetPixelIndex(x+i,y+1,level);
- 				}
- 			}
-@@ -2031,7 +2031,7 @@ bool CxImage::CropRotatedRectangle( long topx, long topy, long width, long heigh
- 	if ( fabs(angle)<0.0002 )
- 		return Crop( topx, topy, topx+width, topy+height, iDst);
- 
--	startx = min(topx, topx - (long)(sin_angle*(double)height));
-+	startx = cxmin(topx, topx - (long)(sin_angle*(double)height));
- 	endx   = topx + (long)(cos_angle*(double)width);
- 	endy   = topy + (long)(cos_angle*(double)height + sin_angle*(double)width);
- 	// check: corners of the rectangle must be inside
-@@ -2079,10 +2079,10 @@ bool CxImage::Crop(long left, long top, long right, long bottom, CxImage* iDst)
- {
- 	if (!pDib) return false;
- 
--	long startx = max(0L,min(left,head.biWidth));
--	long endx = max(0L,min(right,head.biWidth));
--	long starty = head.biHeight - max(0L,min(top,head.biHeight));
--	long endy = head.biHeight - max(0L,min(bottom,head.biHeight));
-+	long startx = cxmax(0L,cxmin(left,head.biWidth));
-+	long endx = cxmax(0L,cxmin(right,head.biWidth));
-+	long starty = head.biHeight - cxmax(0L,cxmin(top,head.biHeight));
-+	long endy = head.biHeight - cxmax(0L,cxmin(bottom,head.biHeight));
- 
- 	if (startx==endx || starty==endy) return false;
- 
-@@ -2443,8 +2443,8 @@ bool CxImage::CircleTransform(int type,long rmax,float Koeff)
- 						nx=x+(x%32)-16;
- 						ny=y;
- 					}
--//					nx=max(xmin,min(nx,xmax));
--//					ny=max(ymin,min(ny,ymax));
-+//					nx=cxmax(xmin,cxmin(nx,xmax));
-+//					ny=cxmax(ymin,cxmin(ny,ymax));
- 				}
- 				else { nx=-1;ny=-1;}
- 				if (head.biClrUsed==0){
-diff --git a/lib/cximage-6.0/CxImage/ximawnd.cpp b/lib/cximage-6.0/CxImage/ximawnd.cpp
-index 2ae2f93..7029cc7 100644
---- a/lib/cximage-6.0/CxImage/ximawnd.cpp
-+++ b/lib/cximage-6.0/CxImage/ximawnd.cpp
-@@ -682,10 +682,10 @@ long CxImage::Draw(HDC hdc, long x, long y, long cx, long cy, RECT* pClipRect, b
- 	RECT clipbox,paintbox;
- 	GetClipBox(hdc,&clipbox);
- 
--	paintbox.top = min(clipbox.bottom,max(clipbox.top,y));
--	paintbox.left = min(clipbox.right,max(clipbox.left,x));
--	paintbox.right = max(clipbox.left,min(clipbox.right,x+cx));
--	paintbox.bottom = max(clipbox.top,min(clipbox.bottom,y+cy));
-+	paintbox.top = cxmin(clipbox.bottom,cxmax(clipbox.top,y));
-+	paintbox.left = cxmin(clipbox.right,cxmax(clipbox.left,x));
-+	paintbox.right = cxmax(clipbox.left,cxmin(clipbox.right,x+cx));
-+	paintbox.bottom = cxmax(clipbox.top,cxmin(clipbox.bottom,y+cy));
- 
- 	long destw = paintbox.right - paintbox.left;
- 	long desth = paintbox.bottom - paintbox.top;
-@@ -730,12 +730,12 @@ long CxImage::Draw(HDC hdc, long x, long y, long cx, long cy, RECT* pClipRect, b
- 
- 				for(yy=0;yy<desth;yy++){
- 					dy = head.biHeight-(ymax-yy-y)*fy;
--					sy = max(0L,(long)floor(dy));
-+					sy = cxmax(0L,(long)floor(dy));
- 					psrc = info.pImage+sy*info.dwEffWidth;
- 					pdst = pbase+yy*ew;
- 					for(xx=0;xx<destw;xx++){
- 						dx = (xx+xmin-x)*fx;
--						sx = max(0L,(long)floor(dx));
-+						sx = cxmax(0L,(long)floor(dx));
- #if CXIMAGE_SUPPORT_INTERPOLATION
- 						if (bSmooth){
- 							if (fx > 1 && fy > 1) { 
-@@ -813,7 +813,7 @@ long CxImage::Draw(HDC hdc, long x, long y, long cx, long cy, RECT* pClipRect, b
- 				
- 				for(yy=0;yy<desth;yy++){
- 					dy = head.biHeight-(ymax-yy-y)*fy;
--					sy = max(0L,(long)floor(dy));
-+					sy = cxmax(0L,(long)floor(dy));
- 
- 					alphaoffset = sy*head.biWidth;
- 					pdst = pbase + yy*ew;
-@@ -821,7 +821,7 @@ long CxImage::Draw(HDC hdc, long x, long y, long cx, long cy, RECT* pClipRect, b
- 
- 					for(xx=0;xx<destw;xx++){
- 						dx = (xx+xmin-x)*fx;
--						sx = max(0L,(long)floor(dx));
-+						sx = cxmax(0L,(long)floor(dx));
- 
- 						if (bAlpha) a=pAlpha[alphaoffset+sx]; else a=255;
- 						a =(BYTE)((a*(1+info.nAlphaMax))>>8);
--- 
-2.8.0.rc3
-
diff --git a/package/kodi/0010-curl-support-version-7.5.0-and-upwards.patch b/package/kodi/0010-curl-support-version-7.5.0-and-upwards.patch
deleted file mode 100644
index b6743ae53..000000000
--- a/package/kodi/0010-curl-support-version-7.5.0-and-upwards.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7d3c70b163bc67aeb1fdef8fd2347b39f311c584 Mon Sep 17 00:00:00 2001
-From: fritsch <peter.fruehberger@gmail.com>
-Date: Sun, 24 Jul 2016 20:24:07 +0200
-Subject: [PATCH] Curl: Adjust multi_cleanup method which returns CURLMcode
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(backported from upstream commit:
- https://github.com/xbmc/xbmc/commit/2a8d3e7f6cffea52740b8392a3be8ec251d5ff70)
----
- xbmc/filesystem/DllLibCurl.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/xbmc/filesystem/DllLibCurl.h b/xbmc/filesystem/DllLibCurl.h
-index db97f92..9e78a91 100644
---- a/xbmc/filesystem/DllLibCurl.h
-+++ b/xbmc/filesystem/DllLibCurl.h
-@@ -52,7 +52,7 @@ namespace XCURL
-     virtual CURLMcode multi_fdset(CURLM *multi_handle, fd_set *read_fd_set, fd_set *write_fd_set, fd_set *exc_fd_set, int *max_fd)=0;
-     virtual CURLMcode multi_timeout(CURLM *multi_handle, long *timeout)=0;
-     virtual CURLMsg*  multi_info_read(CURLM *multi_handle, int *msgs_in_queue)=0;
--    virtual void multi_cleanup(CURL_HANDLE * handle )=0;
-+    virtual CURLMcode multi_cleanup(CURLM * handle )=0;
-     virtual struct curl_slist* slist_append(struct curl_slist *, const char *)=0;
-     virtual void  slist_free_all(struct curl_slist *)=0;
-   };
-@@ -77,7 +77,7 @@ namespace XCURL
-     DEFINE_METHOD5(CURLMcode, multi_fdset, (CURLM *p1, fd_set *p2, fd_set *p3, fd_set *p4, int *p5))
-     DEFINE_METHOD2(CURLMcode, multi_timeout, (CURLM *p1, long *p2))
-     DEFINE_METHOD2(CURLMsg*,  multi_info_read, (CURLM *p1, int *p2))
--    DEFINE_METHOD1(void, multi_cleanup, (CURLM *p1))
-+    DEFINE_METHOD1(CURLMcode, multi_cleanup, (CURLM *p1))
-     DEFINE_METHOD2(struct curl_slist*, slist_append, (struct curl_slist * p1, const char * p2))
-     DEFINE_METHOD1(void, slist_free_all, (struct curl_slist * p1))
-     DEFINE_METHOD1(const char *, easy_strerror, (CURLcode p1))
diff --git a/package/kodi/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch b/package/kodi/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch
deleted file mode 100644
index a3a9d50ed..000000000
--- a/package/kodi/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a17e8d39cf01e26955574acd236b4ef5b54b8c3b Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 5 Sep 2016 12:34:20 +0200
-Subject: [PATCH 2/2] xbmc_pvr_types.h: Fix compilation with gcc6
-
-Backport of upstream commit from master branch:
-https://github.com/xbmc/xbmc/commit/c8a346109926fa03bf6882c0b6e3885af0e0f8ed
-
-This patch can be removed when Kodi is bumped to 17.0-Krypton.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- xbmc/addons/include/xbmc_pvr_types.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/xbmc/addons/include/xbmc_pvr_types.h b/xbmc/addons/include/xbmc_pvr_types.h
-index c5ab20b..e518de1 100644
---- a/xbmc/addons/include/xbmc_pvr_types.h
-+++ b/xbmc/addons/include/xbmc_pvr_types.h
-@@ -34,6 +34,7 @@
- #endif
- #include <string.h>
- #include <stdint.h>
-+#include <stdio.h>
- 
- #include "xbmc_addon_types.h"
- #include "xbmc_epg_types.h"
--- 
-2.9.3
-
diff --git a/package/kodi/0012-Fix_includes_in_amcodec.patch b/package/kodi/0012-Fix_includes_in_amcodec.patch
deleted file mode 100644
index 4a6d44f68..000000000
--- a/package/kodi/0012-Fix_includes_in_amcodec.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-commit 4bbb21aa5cee6b2f40759aa8b1bd65246a237f79
-Author: Alex Deryskyba <alex@codesnake.com>
-Date:   Wed May 4 01:38:27 2016 +0200
-
-    [aml] Fix includes in amcodec/codec.h to make them relative
-
-[Taken from upstream commit
-https://github.com/xbmc/xbmc/commit/4bbb21aa5cee6b2f40759aa8b1bd65246a237f79.]
-Signed-off-by: Dagg Stompler <daggs@gmx.com>
-
-diff --git a/tools/depends/target/libamplayer/libamplayer/include/amcodec/codec.h b/tools/depends/target/libamplayer/libamplayer/include/amcodec/codec.h
-index 187d4d5..632c24e 100644
---- a/tools/depends/target/libamplayer/libamplayer/include/amcodec/codec.h
-+++ b/tools/depends/target/libamplayer/libamplayer/include/amcodec/codec.h
-@@ -12,8 +12,8 @@
- #ifndef CODEC_CTRL_H_
- #define CODEC_CTRL_H_
- 
--#include <codec_type.h>
--#include <codec_error.h>
-+#include "codec_type.h"
-+#include "codec_error.h"
- 
- 
- int codec_init(codec_para_t *);
-diff --git a/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in b/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in
-index a1a3447..1bf5a89 100644
---- a/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in
-+++ b/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in
-@@ -24,8 +24,6 @@ endif
- ifeq (@USE_LIBAMCODEC@,1)
- SRCS += AMLCodec.cpp
- SRCS += DVDVideoCodecAmlogic.cpp
--INCLUDES += -I$(prefix)/include/amcodec
--INCLUDES += -I$(prefix)/include/amplayer
- endif
- 
- ifeq (@USE_ANDROID@,1)
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f2a3e2e03..ef555b502 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -20,17 +20,18 @@ config BR2_PACKAGE_KODI_EGL_GLES
 	default y
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
-	depends on !BR2_PACKAGE_KODI_GL # prefer GL if available
+	depends on !BR2_PACKAGE_KODI_GL_EGL # prefer GL if available
 
-config BR2_PACKAGE_KODI_GL
+config BR2_PACKAGE_KODI_GL_EGL
 	bool
 	default y
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGL
 	depends on !BR2_arm # kodi needs egl/gles on arm
 
-comment "kodi needs an OpenGL or an openGL ES and EGL backend"
+comment "kodi needs an OpenGL EGL with either an openGL or an OpenGL ES backend"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_PACKAGE_KODI_GL && !BR2_PACKAGE_KODI_EGL_GLES
+	depends on !BR2_PACKAGE_KODI_GL_EGL && !BR2_PACKAGE_KODI_EGL_GLES
 
 comment "kodi requires an OpenGL ES and EGL backend"
 	depends on BR2_arm
@@ -43,15 +44,13 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL
+	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL_EGL
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # libsquish, and others
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
 	select BR2_NEEDS_HOST_JAVA
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_FFMPEG
@@ -60,25 +59,16 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_GIFLIB
-	select BR2_PACKAGE_JASPER
-	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBASS
 	select BR2_PACKAGE_LIBCDIO
 	select BR2_PACKAGE_LIBCROSSGUID
 	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBDCADEC
+	select BR2_PACKAGE_LIBDVDNAV
 	select BR2_PACKAGE_LIBFRIBIDI
-	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_KODI_GL
-	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_KODI_GL
+	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_KODI_GL_EGL
 	select BR2_PACKAGE_LIBGCRYPT
-	select BR2_PACKAGE_LIBMPEG2
-	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBPLIST
-	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBSAMPLERATE
-	select BR2_PACKAGE_LIBSQUISH
-	select BR2_PACKAGE_LIBVORBIS
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_LZO
@@ -98,10 +88,9 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TAGLIB
-	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_TINYXML
-	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_KODI_GL
-	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_KODI_GL
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_KODI_GL_EGL
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_KODI_GL_EGL
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 5aa580ec7..dbb3c956f 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	7d82c8aff2715c83deecdf10c566e26105bec0473af530a1356d4c747ebdfd10	kodi-16.1-Jarvis.tar.gz
+sha256 4bfffa2493973ae15ab1d922632c09a2583908d6140bc4f58ec8f9314e4f6545  kodi-17.0-Krypton.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index de4d308f6..9fe559c1e 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -4,20 +4,18 @@
 #
 ################################################################################
 
-KODI_VERSION = 16.1-Jarvis
+KODI_VERSION = 17.0-Krypton
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPLv2
 KODI_LICENSE_FILES = LICENSE.GPL
 # needed for binary addons
 KODI_INSTALL_STAGING = YES
 KODI_DEPENDENCIES = \
-	boost \
 	bzip2 \
 	expat \
 	ffmpeg \
 	fontconfig \
 	freetype \
-	giflib \
 	host-gawk \
 	host-gettext \
 	host-giflib \
@@ -27,23 +25,17 @@ KODI_DEPENDENCIES = \
 	host-lzo \
 	host-nasm \
 	host-swig \
+	host-xmlstarlet \
 	host-zip \
-	jasper \
-	jpeg \
 	libass \
 	libcdio \
 	libcrossguid \
 	libcurl \
-	libdcadec \
+	libdvdnav \
 	libfribidi \
 	libgcrypt \
-	libmpeg2 \
-	libogg \
 	libplist \
-	libpng \
 	libsamplerate \
-	libsquish \
-	libvorbis \
 	libxml2 \
 	libxslt \
 	lzo \
@@ -54,7 +46,6 @@ KODI_DEPENDENCIES = \
 	readline \
 	sqlite \
 	taglib \
-	tiff \
 	tinyxml \
 	yajl \
 	zlib
@@ -69,9 +60,11 @@ KODI_CONF_ENV = \
 	USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr" \
 	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
 
+KODI_MAKE_ENV = \
+	DVD_PREFIX="$(STAGING_DIR)"
+
 KODI_CONF_OPTS +=  \
 	--with-ffmpeg=shared \
-	--disable-joystick \
 	--disable-openmax \
 	--disable-pulse \
 	--disable-vtbdecoder \
@@ -149,9 +142,9 @@ endif
 # we choose the opposite because opengl offers more features, like libva support
 # GL means X11, and under X11, Kodi needs libdrm; libdrm is forcefully selected
 # by a modular Xorg server, which Kodi already depends on.
-ifeq ($(BR2_PACKAGE_KODI_GL),y)
-KODI_DEPENDENCIES += libglew libglu libgl xlib_libX11 xlib_libXext \
-	xlib_libXmu xlib_libXrandr xlib_libXt libdrm
+ifeq ($(BR2_PACKAGE_KODI_GL_EGL),y)
+KODI_DEPENDENCIES += libegl libglu libgl xlib_libX11 xlib_libXext \
+	xlib_libXrandr libdrm
 KODI_CONF_OPTS += --enable-gl --enable-x11 --disable-gles
 else
 KODI_CONF_OPTS += --disable-gl --disable-x11
@@ -267,9 +260,9 @@ KODI_CONF_OPTS += --disable-upnp
 endif
 
 ifeq ($(BR2_PACKAGE_KODI_OPTICALDRIVE),y)
-KODI_CONF_OPTS += --enable-optical-drive --enable-dvdcss
+KODI_CONF_OPTS += --enable-optical-drive
 else
-KODI_CONF_OPTS += --disable-optical-drive --disable-dvdcss
+KODI_CONF_OPTS += --disable-optical-drive
 endif
 
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
@@ -280,19 +273,18 @@ define KODI_BOOTSTRAP
 endef
 KODI_PRE_CONFIGURE_HOOKS += KODI_BOOTSTRAP
 
+# Remove versioncheck addon, updating Kodi is done by building a new
+# buildroot image.
+
+KODI_ADDON_MANIFEST = $(TARGET_DIR)/usr/share/kodi/system/addon-manifest.xml
 define KODI_CLEAN_UNUSED_ADDONS
-	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.milkdrop
-	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.projectm
-	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.itunes
+	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/service.xbmc.versioncheck
+	$(HOST_DIR)/usr/bin/xml ed -L \
+		-d "/addons/addon[text()='service.xbmc.versioncheck']" \
+		$(KODI_ADDON_MANIFEST)
 endef
 KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_UNUSED_ADDONS
 
-define KODI_CLEAN_CONFLUENCE_SKIN
-	find $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence/media -name *.png -delete
-	find $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence/media -name *.jpg -delete
-endef
-KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_CONFLUENCE_SKIN
-
 define KODI_INSTALL_BR_WRAPPER
 	$(INSTALL) -D -m 0755 package/kodi/br-kodi \
 		$(TARGET_DIR)/usr/bin/br-kodi
-- 
2.11.0
