From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Jun 2016 11:30:23 +0200
Subject: [Buildroot] [PATCH 5/5] package/libv4l: add optional support for
	libglu
In-Reply-To: <1465723823-6113-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465723823-6113-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465723823-6113-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libv4l has optional support for libglu:
https://git.linuxtv.org/v4l-utils.git/tree/configure.ac#n166

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libv4l/libv4l.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index a73b6cf..d0a3f2b 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -47,6 +47,10 @@ else
 LIBV4L_CONF_OPTS += --without-libudev
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLU),y)
+LIBV4L_DEPENDENCIES += libglu
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
 LIBV4L_CONF_OPTS += --enable-v4l-utils
 # clock_gettime is used, which is provided by librt for glibc < 2.17
-- 
2.8.1
