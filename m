From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 12:42:30 +0200
Subject: [Buildroot] [git commit] package/harfbuzz: fix build with cairo
Message-ID: <20190623104321.C936681882@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ced273e4f1a0048319441a01be367c0bb65f6a2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

harfbuzz needs svg support on cairo

Fixes:
 - http://autobuild.buildroot.org/results/f6c0b85fa476e0f52cc06f0133d2e4f9920f7556

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
