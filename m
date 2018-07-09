From: Carlos Santos <casantos@datacom.com.br>
Date: Mon,  9 Jul 2018 00:31:28 -0300
Subject: [Buildroot] [PATCH 2/8] busybox: add logging configuration file
In-Reply-To: <20180709033134.22175-1-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
Message-ID: <20180709033134.22175-3-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Provide a template to help users to customize syslogd and klogd without
editting the startup script.

syslogd options worth to configure are remote logging (-R), rotation
(-s, -b) and minimal priority level (-l).

klogd minimal priority level (-c) can be configured too, preventing
non-critical kernel messages from appearing on the console.

This file is also useful as an example for init script authors.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/busybox/busybox.mk          |  2 ++
 package/busybox/etc.default.logging | 13 +++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 package/busybox/etc.default.logging

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 5266f844b6..fac2c394cf 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -252,6 +252,8 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	then \
 		$(INSTALL) -m 0755 -D package/busybox/S01logging \
 			$(TARGET_DIR)/etc/init.d/S01logging; \
+		$(INSTALL) -m 0644 -D package/busybox/etc.default.logging \
+			$(TARGET_DIR)/etc/default/logging; \
 	fi
 endef
 
diff --git a/package/busybox/etc.default.logging b/package/busybox/etc.default.logging
new file mode 100644
index 0000000000..6775622779
--- /dev/null
+++ b/package/busybox/etc.default.logging
@@ -0,0 +1,13 @@
+#
+# /etc/default/logging (busybox version)
+#
+
+# Use SYSLOGD_ARGS to pass additional arguments to syslogd (e.g. for log
+# rotation).
+# SYSLOGD_ARGS="" # (default value)
+
+# Use KLOGD_ARGS to pass additional arguments to klogd.
+# KLOGD_ARGS="" # (default value)
+
+# Uncomment the line below to disable this service
+# ENABLED="no"
-- 
2.17.1
