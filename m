From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:29:06 -0300
Subject: [Buildroot] [PATCH] samba: fix config symbols
Message-ID: <1413329346-25534-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some of the configure cache symbols changed name because some routines
were moved to libreplace instead of samba itself.
So change the naming for those affected so that samba can work nicely
again with some configuration directives (like interfaces = X).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba/samba.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 03b901e..5472edd 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -19,13 +19,14 @@ SAMBA_DEPENDENCIES = popt \
 
 SAMBA_CONF_ENV = \
 	ac_cv_file__proc_sys_kernel_core_pattern=yes \
-	samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
+	libreplace_cv_HAVE_GETTIMEOFDAY_TZ=yes \
 	samba_cv_USE_SETREUID=yes \
 	samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes \
-	samba_cv_HAVE_IFACE_IFCONF=yes \
-	samba_cv_HAVE_MMAP=yes \
+	libreplace_cv_HAVE_IFACE_GETIFADDRS=yes \
+	libreplace_cv_HAVE_IFACE_IFCONF=yes \
+	libreplace_cv_HAVE_MMAP=yes \
 	samba_cv_HAVE_FCNTL_LOCK=yes \
-	samba_cv_HAVE_SECURE_MKSTEMP=yes \
+	libreplace_cv_HAVE_SECURE_MKSTEMP=yes \
 	samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
 	samba_cv_fpie=no \
 	libreplace_cv_HAVE_IPV6=$(if $(BR2_INET_IPV6),yes,no) \
-- 
2.0.4
