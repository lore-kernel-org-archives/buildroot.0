From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Feb 2019 10:43:12 +0100
Subject: [Buildroot] [PATCH 4/5] package/mender: adding device_type file
In-Reply-To: <1549359793-12666-1-git-send-email-angelo@amarulasolutions.com>
References: <1549359793-12666-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1549359793-12666-5-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to have the mender package working out of the box, the
/etc/mender/device_type should be present and should contain a
valid device_type value.
This patch provides a default file that can be overridden easily
from an overlay.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mender/device_type | 1 +
 package/mender/mender.mk   | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 package/mender/device_type

diff --git a/package/mender/device_type b/package/mender/device_type
new file mode 100644
index 0000000..a097ef2
--- /dev/null
+++ b/package/mender/device_type
@@ -0,0 +1 @@
+device_type=BUILDROOT_DEVICE
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 3f9518e..f77e171 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -53,6 +53,9 @@ define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -D -m 0755 package/mender/artifact_info \
 			$(TARGET_DIR)/etc/mender/artifact_info
 
+	$(INSTALL) -D -m 0755 package/mender/device_type \
+			$(TARGET_DIR)/etc/mender/device_type
+
 	ln -sf /var/run/mender $(TARGET_DIR)/var/lib/mender
 endef
 
-- 
2.7.4
