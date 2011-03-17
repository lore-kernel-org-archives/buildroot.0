From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Mar 2011 12:10:08 +0100
Subject: [Buildroot] [git commit master 1/1] icu: fix parallel builds
Message-ID: <20110317111324.A4934909DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5a8c7934bd704e7ff1f39b6c0c0f8e1b541f87d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The icu build system seems to have a race condition, which gets triggered
by high BR2_JLEVEL settings, so disable parallel builds.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/icu/icu.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 4eddb11..c1d4d00 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -12,6 +12,7 @@ ICU_INSTALL_STAGING = YES
 ICU_CONF_OPT = --with-cross-build=$(HOST_ICU_DIR)/source --disable-samples \
 		--disable-tests
 HOST_ICU_CONF_OPT = --disable-samples --disable-tests
+ICU_MAKE = $(MAKE1)
 ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
 
-- 
1.7.3.4
