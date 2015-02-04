From: johanderycke at gmail.com <johanderycke@gmail.com>
Date: Wed,  4 Feb 2015 20:55:44 +0100
Subject: [Buildroot] [PATCH v1 1/1] Prevent installing log4cxx documentation.
Message-ID: <1423079744-1471-1-git-send-email-johanderycke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pieter Ronsijn <pieter.ronsijn@barco.com>

Saves around 14 MiB of data in usr/share/log4cxx/html.

Signed-off-by: Johan Derycke <johan.derycke@barco.com>
---
 package/log4cxx/log4cxx.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 00d851e..7d7e2e9 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -13,7 +13,10 @@ LOG4CXX_LICENSE_FILES = LICENSE
 
 LOG4CXX_CONF_OPTS = \
 	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
-	--with-apr-util=$(STAGING_DIR)/usr/bin/apu-1-config
+	--with-apr-util=$(STAGING_DIR)/usr/bin/apu-1-config \
+	--disable-dot \
+	--disable-doxygen \
+	--disable-html-docs
 
 LOG4CXX_DEPENDENCIES = apr apr-util
 
-- 
2.1.4
