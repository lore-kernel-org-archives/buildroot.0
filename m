From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 22:26:03 +0200
Subject: [Buildroot] [git commit] package/libv4l: add optional support for
	libgl
Message-ID: <20160612202631.02F0C8025D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6609cd803a2f6eaac606a44bcd3bb886eae3badf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libv4l has optional support for OpenGL:
https://git.linuxtv.org/v4l-utils.git/tree/configure.ac#n160

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libv4l/libv4l.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index e7a57f0..a73b6cf 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -36,6 +36,10 @@ else
 LIBV4L_CONF_OPTS += --without-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+LIBV4L_DEPENDENCIES += libgl
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBV4L_CONF_OPTS += --with-libudev
 LIBV4L_DEPENDENCIES += udev
