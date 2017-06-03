From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Jun 2017 18:30:12 +0200
Subject: [Buildroot] [PATCH 2/2] package/exiv2: fix glibc pthread detection
In-Reply-To: <20170603163012.21169-1-bernd.kuhls@t-online.de>
References: <20170603163012.21169-1-bernd.kuhls@t-online.de>
Message-ID: <20170603163012.21169-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch ported from librtlsdr:
https://git.busybox.net/buildroot/commit/?id=4c6eace6f756d15ae9639a503c9245d1e7fb12a9

Fixes
http://autobuild.buildroot.net/results/6c0/6c0264bf35c4cc0c4afaf6001930fdbd6125029d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exiv2/exiv2.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index f56e86122..e68abb710 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -9,7 +9,9 @@ EXIV2_SITE = http://www.exiv2.org/builds
 EXIV2_SOURCE = exiv2-$(EXIV2_VERSION)-trunk.tar.gz
 EXIV2_INSTALL_STAGING = YES
 
-EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
+EXIV2_CONF_OPTS += \
+	-DEXIV2_ENABLE_BUILD_SAMPLES=OFF \
+	-DTHREADS_PTHREAD_ARG=OFF
 
 ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),)
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=OFF
-- 
2.11.0
