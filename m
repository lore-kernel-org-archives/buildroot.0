From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 17:28:20 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/poppler: add
 boost optional dependency
Message-ID: <20210128200057.D301F843AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=831a862f64d6e0d66fca221150a95a47ebc8e049
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

boost is an optional dependency which is enabled by default since
version 0.80.0 and
https://github.com/freedesktop/poppler/commit/355fd8d58ca0209284fe568b3add28f207e995c1

There is no cmake option to enable or disable this dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 497f989d7595a1c801a587e77d508ec3fa6edf0f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 69a3bcace5..c5e1a800f2 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -27,6 +27,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 POPPLER_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
 endif
 
+ifeq ($(BR2_PACKAGE_BOOST),y)
+POPPLER_DEPENDENCIES += boost
+endif
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 POPPLER_DEPENDENCIES += jpeg
 POPPLER_CONF_OPTS += -DENABLE_DCTDECODER=libjpeg -DWITH_JPEG=ON
