From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Jun 2019 09:59:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: fix build with cairo
Message-ID: <20190623075907.13362-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

harfbuzz needs svg support on cairo

Fixes:
 - http://autobuild.buildroot.org/results/f6c0b85fa476e0f52cc06f0133d2e4f9920f7556

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/harfbuzz/harfbuzz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index ded5e554e6..1144133254 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -30,7 +30,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 HARFBUZZ_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) -pthread"
 endif
 
-ifeq ($(BR2_PACKAGE_CAIRO),y)
+ifeq ($(BR2_PACKAGE_CAIRO_SVG),y)
 HARFBUZZ_DEPENDENCIES += cairo
 HARFBUZZ_CONF_OPTS += --with-cairo=yes
 else
-- 
2.20.1
