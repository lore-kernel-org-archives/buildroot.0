From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:14:01 +0200
Subject: [Buildroot] [git commit] package/libdrm: fix building if GCC's C
	standard is not gnu99
Message-ID: <20150704121413.963D98082A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24147efb21de3f38d919ee45cf997434b096539c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
checking for /home/fli4l/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc option to accept ISO C99... unsupported
configure: error: Building libdrm requires C99 enabled compiler

using this defconfig
BR2_KERNEL_HEADERS_4_0=y
BR2_BINUTILS_VERSION_2_25=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_LIBDRM=y

Patch inspired by
http://git.buildroot.net/buildroot/commit/?id=5cf5b390385fb6325485e37dc9d38e1e3ac1f091

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/libdrm.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 4cca645..1768214 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -19,6 +19,8 @@ LIBDRM_CONF_OPTS = \
 	--disable-cairo-tests \
 	--disable-manpages
 
+LIBDRM_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+
 ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
 LIBDRM_CONF_OPTS += --enable-intel
 LIBDRM_DEPENDENCIES += libatomic_ops libpciaccess
