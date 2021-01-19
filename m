From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Jan 2021 19:05:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/poppler: add boost optional
 dependency
Message-ID: <20210119180542.497919-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

boost is an optional dependency which is enabled by default since
version 0.80.0 and
https://github.com/freedesktop/poppler/commit/355fd8d58ca0209284fe568b3add28f207e995c1

There is no cmake option to enable or disable this dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/poppler/poppler.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 669ee6be7f..aba8602e06 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -23,6 +23,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 POPPLER_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
 endif
 
+ifeq ($(BR2_PACKAGE_BOOST),y)
+POPPLER_DEPENDENCIES += boost
+endif
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 POPPLER_DEPENDENCIES += jpeg
 POPPLER_CONF_OPTS += -DENABLE_DCTDECODER=libjpeg -DWITH_JPEG=ON
-- 
2.29.2
