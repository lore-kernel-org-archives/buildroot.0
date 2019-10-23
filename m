From: Grzegorz Blach <grzegorz@blach.pl>
Date: Wed, 23 Oct 2019 13:10:57 +0000
Subject: [Buildroot] [PATCH 1/1] package/dbus-python: fix build with python
 3.8
Message-ID: <20191023131057.707-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/b30/b308eeb5c5d95ab9f1dbfc19f9183f2ba3ba0ce3/
 - http://autobuild.buildroot.org/results/0dd/0dd9203f859b97ee5a3b6358644c26f8ab784ed8/
   and many similar failures.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/dbus-python/dbus-python.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index eaf4e5f483..1da912a3fb 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -35,14 +35,14 @@ DBUS_PYTHON_DEPENDENCIES += python3 host-python3
 DBUS_PYTHON_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
-	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
+	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags --embed`"
 
 HOST_DBUS_PYTHON_DEPENDENCIES += host-python3
 
 HOST_DBUS_PYTHON_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_INCLUDES="`$(HOST_DIR)/usr/bin/python3-config --includes`" \
-	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python3-config --ldflags`"
+	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python3-config --ldflags --embed`"
 endif
 
 $(eval $(autotools-package))
-- 
2.23.0
