From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Tue,  6 Feb 2018 15:39:51 +0100
Subject: [Buildroot] [PATCH 3/4] openjdk size optimization: link dynamically
 with system libstdc++
In-Reply-To: <20180206143952.12332-1-thomas.de_schampheleire@nokia.com>
References: <20180206143952.12332-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180206143952.12332-4-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Saves one copy of libstdc++ that would be statically linked.

Trick found at:
http://zlika.github.io/presentations/compile-openjdk8/slides_en.html

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/openjdk/openjdk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 7364d5b370..1dac44ede5 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -57,6 +57,7 @@ OPENJDK_CONF_OPTS += \
 	--with-x=no \
 	--disable-debug-symbols \
 	--disable-zip-debug-info \
+	--with-stdc++lib=dynamic \
 
 ifeq ($(BR2_PACKAGE_OPENJDK_CUSTOM_BOOT_JDK),y)
 OPENJDK_CONF_OPTS += --with-boot-jdk=$(call qstrip,$(BR2_PACKAGE_OPENJDK_CUSTOM_BOOT_JDK_PATH))
-- 
2.13.6
