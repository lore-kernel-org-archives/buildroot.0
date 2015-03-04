From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 22:14:10 +0100
Subject: [Buildroot] [git commit] libglib2: remove kludges for old and
	removed xilinx toolchains
Message-ID: <20150304211938.C32A781809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4274f758ed2b2f9a1440b3f8e4c8bae25786e807
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/libglib2.mk |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 991c972..2129a85 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -49,17 +49,12 @@ LIBGLIB2_CONF_ENV = \
 	gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 # old uClibc versions don't provide qsort_r
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=no
 else
 LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=yes
 endif
 
-# old toolchains don't have working inotify support
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
-LIBGLIB2_CONF_ENV += ac_cv_header_sys_inotify_h=no
-endif
-
 HOST_LIBGLIB2_CONF_OPTS = \
 	--disable-dtrace \
 	--disable-systemtap \
