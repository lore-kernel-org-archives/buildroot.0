From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 12:52:29 -0300
Subject: [Buildroot] [PATCH v2 6/8] libglib2: remove kludges for old and
	removed xilinx toolchains
In-Reply-To: <1425397951-30603-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425397951-30603-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425397951-30603-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libglib2/libglib2.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

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
-- 
2.0.5
