From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 11 Feb 2019 14:10:50 -0500
Subject: [Buildroot] [PATCH v7 2/3] package/openjdk: package/openjdk: Add
 AArch64 support
In-Reply-To: <20190211191051.62970-1-aduskett@gmail.com>
References: <20190211191051.62970-1-aduskett@gmail.com>
Message-ID: <20190211191051.62970-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

OpenJDK has CPU ports for the AArch64 and ARM architectures.
Add support for AArch64 as the first.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/openjdk/openjdk.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 5a486dd200..a2602ffd12 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -86,6 +86,11 @@ OPENJDK_CONF_OPTS = \
 	--with-version-string="$(OPENJDK_VERSION_MAJOR)" \
 	--with-zlib=bundled
 
+# If building for AArch64, use the provided CPU port.
+ifeq ($(BR2_aarch64),y)
+OPENJDK_CONF_OPTS += --with-cpu-port=aarch64 --with-abi-profile=aarch64
+endif
+
 ifeq ($(BR2_CCACHE),y)
 OPENJDK_CONF_OPTS += \
 	--enable-ccache \
-- 
2.20.1
