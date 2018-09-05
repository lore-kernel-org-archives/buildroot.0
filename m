From: Grzegorz Blach <grzegorz@blach.pl>
Date: Wed,  5 Sep 2018 13:39:31 +0200
Subject: [Buildroot] [PATCH 2/2] python3: add optional dependency on
 bluez5_utils-headers
In-Reply-To: <20180905113931.6703-1-grzegorz@blach.pl>
References: <20180905113931.6703-1-grzegorz@blach.pl>
Message-ID: <20180905113931.6703-2-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When python3 depends on bluez5_utils-headers,
python3 is build with bluetooth support.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python3/python3.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 5e94e8e726..913e0773ca 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -255,6 +255,11 @@ endif
 # Provided to other packages
 PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/
 
+# Support for socket.AF_BLUETOOTH
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_HEADERS),y)
+	PYTHON3_DEPENDENCIES += bluez5_utils-headers
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-- 
2.17.1
