From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 22:26:04 +0200
Subject: [Buildroot] [git commit] package/libv4l: add optional support for
	libglu
Message-ID: <20160612202631.129C88050F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55d626c4a1d51dd3070af170a2e20d8429db5d02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libv4l has optional support for libglu:
https://git.linuxtv.org/v4l-utils.git/tree/configure.ac#n166

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
