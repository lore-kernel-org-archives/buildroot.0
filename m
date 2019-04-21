From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 12:23:07 +0200
Subject: [Buildroot] [git commit] package/libcpprestsdk: fix static build
 with boost 1.70.0
Message-ID: <20190421101832.83B388142A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=762eec1ce974ed8109c588bb12d0b590089ab4eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/36ef83aefd24bcc6bbf58812aa07aa0f6072cd09

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcpprestsdk/libcpprestsdk.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index cd48ca7bed..e8dddeddd7 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -12,6 +12,12 @@ LIBCPPRESTSDK_SUBDIR = Release
 LIBCPPRESTSDK_DEPENDENCIES += host-pkgconf boost openssl zlib
 LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF -DBUILD_SAMPLES=OFF
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBCPPRESTSDK_CONF_OPTS += \
+	-DBoost_USE_STATIC_LIBS=ON \
+	-DBoost_USE_STATIC_RUNTIME=ON
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LIBCPPRESTSDK_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
 endif
