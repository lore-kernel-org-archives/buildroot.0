From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Jul 2012 17:18:06 +0200
Subject: [Buildroot] [PATCH v2] sconeserver: new package
In-Reply-To: <1343382707-2698-1-git-send-email-spdawson@gmail.com>
References: <1343382707-2698-1-git-send-email-spdawson@gmail.com>
Message-ID: <5017F72E.1010502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/27/12 11:51, spdawson at gmail.com wrote:
> Signed-off-by: Simon Dawson<spdawson@gmail.com>

  Looks good, except I get a build failure with the following defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_CCACHE=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103=y
BR2_PACKAGE_SCONESERVER=y
BR2_PACKAGE_SCONESERVER_MYSQL=y
BR2_PACKAGE_SCONESERVER_BLUETOOTH=y
BR2_PACKAGE_SCONESERVER_RSS=y
BR2_PACKAGE_SCONESERVER_LETTUCE=y
BR2_PACKAGE_SCONESERVER_MATHS=y
BR2_PACKAGE_SCONESERVER_UI=y


>>> sconeserver 178 Configuring
(cd /home/arnout/src/buildroot/output-sconeserver/build/sconeserver-178/ && rm -rf config.cache && 
PATH="/home/arnout/src/buildroot/output-sconeserver/host/bin:/home/arnout/src/buildroot/output-sconeserver/host/usr/bin:/home/arnout/src/buildroot/output-sconeserver/host/usr/sbin/:/home/arnout/bin:/home/arnout/bin:/home/arnout/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/sbin:/sbin:/usr/sbin:/sbin" 
AR="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-ar" 
AS="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-as" 
LD="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-ld" 
NM="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-nm" 
CC="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/ccache 
/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-gcc" 
GCC="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/ccache 
/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-gcc" 
CPP="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-cpp" 
CXX="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/ccache 
/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-g++" 
FC="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-gfortran" 
RANLIB="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-ranlib" 
STRIP="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-strip" 
OBJCOPY="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-objcopy" 
OBJDUMP="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-objdump" 
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" 
CC_FOR_BUILD="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/ccache /usr/bin/gcc" 
GCC_FOR_BUILD="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/ccache /usr/bin/gcc" 
CXX_FOR_BUILD="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/ccache /usr/bin/g++" 
FC_FOR_BUILD="/usr/bin/ld" LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="-O2 
-I/home/arnout/src/buildroot/output-sconeserver/host/include 
-I/home/arnout/src/buildroot/output-sconeserver/host/usr/include" 
CXXFLAGS_FOR_BUILD="-I/home/arnout/src/buildroot/output-sconeserver/host/include 
-I/home/arnout/src/buildroot/output-sconeserver/host/usr/include" 
LDFLAGS_FOR_BUILD="-L/home/arnout/src/buildroot/output-sconeserver/host/lib 
-L/home/arnout/src/buildroot/output-sconeserver/host/usr/lib 
-Wl,-rpath,/home/arnout/src/buildroot/output-sconeserver/host/usr/lib" FCFLAGS_FOR_BUILD="" 
DEFAULT_ASSEMBLER="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-as" 
DEFAULT_LINKER="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/arm-none-linux-gnueabi-ld" CFLAGS=" -pipe -Os 
  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CXXFLAGS=" -pipe -Os  -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="" FCFLAGS="" 
PKG_CONFIG="/home/arnout/src/buildroot/output-sconeserver/host/usr/bin/pkg-config" 
PERLLIB="/home/arnout/src/buildroot/output-sconeserver/host/usr/lib/perl" 
STAGING_DIR="/home/arnout/src/buildroot/output-sconeserver/host/usr/arm-unknown-linux-gnueabi/sysroot" 
ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes 
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes 
ac_cv_func_realloc_0_nonnull=yes lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no  ./configure 
--target=arm-unknown-linux-gnueabi --host=arm-unknown-linux-gnueabi --build=x86_64-unknown-linux-gnu --prefix=/usr 
--exec-prefix=/usr --sysconfdir=/etc --program-prefix="" --disable-gtk-doc   --enable-ipv6 --enable-static 
--enable-shared  --with-ip --with-local 
CPPFLAGS="-I/home/arnout/src/buildroot/output-sconeserver/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/libxml2" --with-ip6 
--without-ssl --without-examples --without-sconesite --without-sconesite-image --with-mysql --with-bluetooth --with-rss 
--without-location --with-lettuce --with-maths --without-testbuilder --with-ui )
[snip]
checking for mysql_init in -lmysqlclient... no
configure: error: library 'mysqlclient' is required for the mysql module


  I guess you need to pass some configure option to point to
  $(STAGING_DIR)/usr/lib/mysql.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
