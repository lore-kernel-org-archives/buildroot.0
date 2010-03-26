From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 26 Mar 2010 17:14:40 +0100
Subject: [Buildroot] Cross-compiling Problem with Boingo Embedded
	Wireless Toolkit for arm target
In-Reply-To: <dfcd449c1003260755n48095488u2d889fc176b1fb25@mail.gmail.com>
References: <dfcd449c1003260755n48095488u2d889fc176b1fb25@mail.gmail.com>
Message-ID: <4d28d4b51003260914o2cf8aa4fka3206af5ec4b9af4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I suspect your added '-02' (minus zero two) option instead of '-O2'
(minus o two) in your configuration file...

On Fri, Mar 26, 2010 at 3:55 PM, Viktar Palstsiuk
<viktar.palstsiuk@promwad.com> wrote:
> I am trying to integrate the Boingo Embedded Wireless Toolkit (BEWT)
> [see http://sourceforge.net/projects/boingowifitool/ ] to compile
> under buildroot-2010.02 for an arm-based target. I am trying to write
> package/bewt.mk. BEWT has dependencies on the wireless-tools and
> libcurl (I have integrated this into my configuration for my local
> project). BEWT comes with auto-tools support for building.
> I have successfully compiled PAL. But it fails during BEWT compilation.
>
> --
>
> Here is my build log:
>
> rm -rf /home/viktor/projects/gps/buildroot-2010.02/output/build/buildroot-config
> mkdir -p /home/viktor/projects/gps/buildroot-2010.02/output/build
> cp -dpRf package/config/buildroot-config
> /home/viktor/projects/gps/buildroot-2010.02/output/build/buildroot-config
> /usr/bin/make -j1 -C
> /home/viktor/projects/gps/buildroot-2010.02/output/build/bewt2_rev101
> make[1]: Entering directory
> `/home/viktor/projects/gps/buildroot-2010.02/output/build/bewt2_rev101'
> Making all in pal
> make[2]: Entering directory
> `/home/viktor/projects/gps/buildroot-2010.02/output/build/bewt2_rev101/pal'
> Making all in linux
> make[3]: Entering directory
> `/home/viktor/projects/gps/buildroot-2010.02/output/build/bewt2_rev101/pal/linux'
> make[3]: Nothing to be done for `all'.
> make[3]: Leaving directory
> `/home/viktor/projects/gps/buildroot-2010.02/output/build/bewt2_rev101/pal/linux'
> make[3]: Entering directory
> `/home/viktor/projects/gps/buildroot-2010.02/output/build/bewt2_rev101/pal'
> make[3]: Nothing to be done for `all-am'.
> make[3]: Leaving directory
> `/home/viktor/projects/gps/buildroot-2010.02/output/build/bewt2_rev101/pal'
> make[2]: Leaving directory
> `/home/viktor/projects/gps/buildroot-2010.02/output/build/bewt2_rev101/pal'
> Making all in bewt
> make[2]: Entering directory
> `/home/viktor/projects/gps/buildroot-2010.02/output/build/bewt2_rev101/bewt'
> Making all in linux
> make[3]: Entering directory
> `/home/viktor/projects/gps/buildroot-2010.02/output/build/bewt2_rev101/bewt/linux'
> /bin/sh ../../libtool --tag=CXX ? --mode=compile
> /home/viktor/projects/gps/buildroot-2010.02/output/staging/usr/bin/arm-linux-uclibcgnueabi-g++
> -Os -pipe -Os ?-I/home/viktor/projects/gps/buildroot-2010.02/output/staging/usr/include
> -I/home/viktor/projects/gps/buildroot-2010.02/output/staging/include
> --sysroot=/home/viktor/projects/gps/buildroot-2010.02/output/staging/
> -isysroot /home/viktor/projects/gps/buildroot-2010.02/output/staging
> -mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float
> -DPACKAGE_NAME=\"boingowifitoolkit\"
> -DPACKAGE_TARNAME=\"boingowifitoolkit\" -DPACKAGE_VERSION=\"1.0\"
> -DPACKAGE_STRING=\"boingowifitoolkit\ 1.0\"
> -DPACKAGE_BUGREPORT=\"jlake at boingo.com\"
> -DPACKAGE=\"boingowifitoolkit\" -DVERSION=\"1.0\" -DSTDC_HEADERS=1
> -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1
> -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1
> -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1
> -DHAVE_DLFCN_H=1 -DHAVE_LIBM=1 -DHAVE_LIBIW=1 -DHAVE_LIBCURL=1
> -DHAVE_LIBPTHREAD=1 -DLINUX=1 -DWIFI_DEVICE=1 -D_REENTRANT=1 -I.
> -pipe -I/usr/include -I./../../lib/proxies/include
> -I./../../lib/storage/include -I./../../lib/platform/include
> -I./../../lib/wifiengine/include -I./../../lib/interpreter/include
> -I./../../lib/http/include -I./. -I./../../pal/linux/include
> -I./../../lib/updater/include -I./../../lib/xml/include
> -I./../../lib/bewt2/include -I./../../lib/networkreporter/include
> -I././include -DBEWT_EXPORTS -02 -Os ? -MT HttpImp.lo -MD -MP -MF
> .deps/HttpImp.Tpo -c -o HttpImp.lo `test -f
> '../../lib/http/src/HttpImp.cpp' || echo
> './'`../../lib/http/src/HttpImp.cpp
> ?/home/viktor/projects/gps/buildroot-2010.02/output/staging/usr/bin/arm-linux-uclibcgnueabi-g++
> -Os -pipe -Os -I/home/viktor/projects/gps/buildroot-2010.02/output/staging/usr/include
> -I/home/viktor/projects/gps/buildroot-2010.02/output/staging/include
> --sysroot=/home/viktor/projects/gps/buildroot-2010.02/output/staging/
> -isysroot /home/viktor/projects/gps/buildroot-2010.02/output/staging
> -mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float
> -DPACKAGE_NAME=\"boingowifitoolkit\"
> -DPACKAGE_TARNAME=\"boingowifitoolkit\" -DPACKAGE_VERSION=\"1.0\"
> "-DPACKAGE_STRING=\"boingowifitoolkit 1.0\""
> -DPACKAGE_BUGREPORT=\"jlake at boingo.com\"
> -DPACKAGE=\"boingowifitoolkit\" -DVERSION=\"1.0\" -DSTDC_HEADERS=1
> -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1
> -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1
> -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1
> -DHAVE_DLFCN_H=1 -DHAVE_LIBM=1 -DHAVE_LIBIW=1 -DHAVE_LIBCURL=1
> -DHAVE_LIBPTHREAD=1 -DLINUX=1 -DWIFI_DEVICE=1 -D_REENTRANT=1 -I. -pipe
> -I/usr/include -I./../../lib/proxies/include
> -I./../../lib/storage/include -I./../../lib/platform/include
> -I./../../lib/wifiengine/include -I./../../lib/interpreter/include
> -I./../../lib/http/include -I./. -I./../../pal/linux/include
> -I./../../lib/updater/include -I./../../lib/xml/include
> -I./../../lib/bewt2/include -I./../../lib/networkreporter/include
> -I././include -DBEWT_EXPORTS -02 -Os -MT HttpImp.lo -MD -MP -MF
> .deps/HttpImp.Tpo -c ../../lib/http/src/HttpImp.cpp ?-fPIC -DPIC -o
> .libs/HttpImp.o
> arm-linux-uclibcgnueabi-g++: unrecognized option '-02'
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual INT8
> HttpImp::PostUrl(const CHAR*, const CHAR*, const CHAR*, const CHAR*,
> const CHAR*, const CHAR*, const CHAR*, UINT32, BOOL*)?:
> ../../lib/http/src/HttpImp.cpp:142: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BOOL
> HttpImp::SetForm(const CHAR*, const CHAR*)?:
> ../../lib/http/src/HttpImp.cpp:211: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp:212: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BewtString
> HttpImp::GetForm(const CHAR*, const CHAR*, UINT32)?:
> ../../lib/http/src/HttpImp.cpp:237: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BewtString
> HttpImp::GetTag(const CHAR*, const CHAR*, const CHAR*)?:
> ../../lib/http/src/HttpImp.cpp:262: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BOOL
> HttpImp::IsPost(const CHAR*)?:
> ../../lib/http/src/HttpImp.cpp:279: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BOOL
> HttpImp::SetPost(const CHAR*, const CHAR*)?:
> ../../lib/http/src/HttpImp.cpp:299: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BewtString
> HttpImp::GetPost(const CHAR*)?:
> ../../lib/http/src/HttpImp.cpp:318: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BOOL
> HttpImp::DropPost(const CHAR*)?:
> ../../lib/http/src/HttpImp.cpp:336: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BewtString
> HttpImp::GetPostUrl()?:
> ../../lib/http/src/HttpImp.cpp:351: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?INT32
> HttpImp::sendRequest(BOOL, const CHAR*, const CHAR*, const CHAR*,
> BOOL, const CHAR*, const CHAR*, const CHAR*, UINT32, BOOL, BOOL*)?:
> ../../lib/http/src/HttpImp.cpp:459: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> make[3]: *** [HttpImp.lo] Error 1
> make[3]: Leaving directory
> `/home/viktor/projects/gps/buildroot-2010.02/output/build/bewt2_rev101/bewt/linux'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory
> `/home/viktor/projects/gps/buildroot-2010.02/output/build/bewt2_rev101/bewt'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory
> `/home/viktor/projects/gps/buildroot-2010.02/output/build/bewt2_rev101'
> make: *** [/home/viktor/projects/gps/buildroot-2010.02/output/build/bewt2_rev101/bewt]
> Error 2
>
>
>
> ---
>
> Here is my bewt.mk file:
>
> # Current version, use the latest unless there are any known issues.
> BEWT_VERSION=rev101
> # The filename of the package to download.
> BEWT_SOURCE=bewt2_$(BEWT_VERSION).tgz
> # The site and path to where the source packages are.
> BEWT_SITE=http://kent.dl.sourceforge.net/sourceforge/boingowifitool
> # The directory which the source package is extracted to.
> BEWT_DIR=$(BUILD_DIR)/bewt2_$(BEWT_VERSION)
> # Which decompression to use, BZCAT or ZCAT.
> BEWT_CAT:=$(ZCAT)
> # Target binary for the package.
> BEWT_BINARY:=bewt
> # Not really needed, but often handy define.
> BEWT_TARGET_BINARY:=usr/bin/$(BEWT_BINARY)
>
> # The download rule. Main purpose is to download the source package.
> $(DL_DIR)/$(BEWT_SOURCE):
> ? ? ? ?$(WGET) -P $(DL_DIR) $(BEWT_SITE)/$(BEWT_SOURCE)
>
> # The unpacking rule. Main purpose is to extract the source package, apply any
> # patches and update config.guess and config.sub.
> $(BEWT_DIR)/.unpacked: $(DL_DIR)/$(BEWT_SOURCE)
> ? ? ? ?mkdir -p $(BEWT_DIR)
> ? ? ? ?$(BEWT_CAT) $(DL_DIR)/$(BEWT_SOURCE) | tar -C $(BEWT_DIR) $(TAR_OPTIONS) -
> ? ? ? ?(cd $(BEWT_DIR); autoreconf -i)
> ? ? ? ?touch $@
>
> # The configure rule. Main purpose is to get the package ready for compilation,
> # usually by running the configure script with different kinds of options
> # specified.
> $(BEWT_DIR)/.configured: $(BEWT_DIR)/.unpacked
> ? ? ? ?(cd $(BEWT_DIR); rm -rf config.cache; \
> ? ? ? ? ? ? ? ?aclocal; automake -a; \
> ? ? ? ? ? ? ? ?$(TARGET_CONFIGURE_OPTS) \
> ? ? ? ? ? ? ? ?$(TARGET_CONFIGURE_ARGS) \
> ? ? ? ? ? ? ? ?./configure \
> ? ? ? ? ? ? ? ?--target=$(GNU_TARGET_NAME) \
> ? ? ? ? ? ? ? ?--host=$(GNU_TARGET_NAME) \
> ? ? ? ? ? ? ? ?--build=$(GNU_HOST_NAME) \
> ? ? ? ? ? ? ? ?--prefix=/usr \
> ? ? ? ? ? ? ? ?--sysconfdir=/etc \
> ? ? ? ? ? ? ? ?$(DISABLE_NLS) \
> ? ? ? ? ? ? ? ?$(DISABLE_LARGEFILE) \
> ? ? ? ? ? ? ? ?--enable-wifi \
> ? ? ? ?)
> ? ? ? ?touch $@
>
> $(BEWT_DIR)/$(BEWT_BINARY): $(BEWT_DIR)/.configured
> ? ? ? ?$(MAKE) -C $(BEWT_DIR)
>
> # The installing rule. Main purpose is to install the binary into the target
> # root directory and make sure it is stripped from debug symbols to reduce the
> # space requirements to a minimum.
> #
> # Only the files needed to run the application should be installed to the
> # target root directory, to not waste valuable flash space.
> $(TARGET_DIR)/$(BEWT_TARGET_BINARY): $(BEWT_DIR)/$(BEWT_BINARY)
> ? ? ? ?cp -dpf $(BEWT_DIR)/bewt $@
> ? ? ? ?$(STRIPCMD) --strip-unneeded $@
>
> # Main rule which shows which other packages must be installed before the bewt
> # package is installed. This to ensure that all depending libraries are
> # installed.
> bewt: ? uclibc $(TARGET_DIR)/$(BEWT_TARGET_BINARY)
>
> # Source download rule. Main purpose to download the source package. Since some
> # people would like to work offline, it is mandotory to implement a rule which
> # downloads everything this package needs.
> bewt-source: $(DL_DIR)/$(BEWT_SOURCE)
>
> # Clean rule. Main purpose is to clean the build directory, thus forcing a new
> # rebuild the next time Buildroot is made.
> bewt-clean:
> ? ? ? ?-$(MAKE) -C $(BEWT_DIR) clean
>
> # Directory clean rule. Main purpose is to remove the build directory, forcing
> # a new extraction, patching and rebuild the next time Buildroot is made.
> bewt-dirclean:
> ? ? ? ?rm -rf $(BEWT_DIR)
>
> #############################################################
> #
> # Toplevel Makefile options
> #
> #############################################################
> # This is how the bewt package is added to the list of rules to build.
> ifeq ($(strip $(BR2_PACKAGE_BEWT)),y)
> TARGETS+=bewt
> endif
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
