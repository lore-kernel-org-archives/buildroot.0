From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 23:01:31 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/libcec: disable
 build infos
Message-ID: <20180501073416.417C3890ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36f039a6247a29351c3c6a317651f91b159fa5b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Build infos can break the build due to missing terminating " character.

Fixes:
http://autobuild.buildroot.net/results/3b1/3b1182783fc958dfed96c6b1c097993662fc7308

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4600c2444d3df3f709d6656f98e636223e0bc4af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcec/libcec.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 6d14447958..99d1c8b2ba 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -37,4 +37,11 @@ ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
 LIBCEC_DEPENDENCIES += xlib_libXrandr
 endif
 
+# Disable information about how libCEC is compiled.
+LIBCEC_CONF_OPTS += -DHAVE_GIT_BIN="" \
+	-DHAVE_DATE_BIN="" \
+	-DHAVE_WHOAMI_BIN="" \
+	-DHAVE_HOSTNAME_BIN="" \
+	-DHAVE_UNAME_BIN=""
+
 $(eval $(cmake-package))
