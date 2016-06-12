From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 22:26:02 +0200
Subject: [Buildroot] [git commit] package/libv4l: add optional support for
	alsa-lib
Message-ID: <20160612202630.E2E7F8050F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6af4471f081a2a40f41c644cb0d54eceee3dd1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add alsa-lib as optional dependency to get a reproducable build.
Without this patch configure logs:

checking for ALSA... no
configure: WARNING: ALSA library not available

After this patch alsa-lib was built before libv4l:
checking for ALSA... yes

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libv4l/libv4l.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index d0a0369..e7a57f0 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -18,6 +18,10 @@ LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 LIBV4L_LICENSE = GPLv2+ (utilities), LGPLv2.1+ (libraries)
 LIBV4L_LICENSE_FILES = COPYING COPYING.libv4l lib/libv4l1/libv4l1-kernelcode-license.txt
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+LIBV4L_DEPENDENCIES += alsa-lib
+endif
+
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 LIBV4L_DEPENDENCIES += argp-standalone
 LIBV4L_LIBS += -largp
