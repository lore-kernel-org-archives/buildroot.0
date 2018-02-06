From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Tue,  6 Feb 2018 15:39:50 +0100
Subject: [Buildroot] [PATCH 2/4] openjdk size optimization: disable debug
 info
In-Reply-To: <20180206143952.12332-1-thomas.de_schampheleire@nokia.com>
References: <20180206143952.12332-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180206143952.12332-3-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Impact on other items than size is to be investigated.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/openjdk/openjdk.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 790a36ba8d..7364d5b370 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -55,6 +55,8 @@ OPENJDK_CONF_OPTS += \
 	--with-extra-cflags="-DHEADLESS=true -Wno-error" \
 	--with-extra-cxxflags="-DHEADLESS=true -Wno-error" \
 	--with-x=no \
+	--disable-debug-symbols \
+	--disable-zip-debug-info \
 
 ifeq ($(BR2_PACKAGE_OPENJDK_CUSTOM_BOOT_JDK),y)
 OPENJDK_CONF_OPTS += --with-boot-jdk=$(call qstrip,$(BR2_PACKAGE_OPENJDK_CUSTOM_BOOT_JDK_PATH))
-- 
2.13.6
