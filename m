From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Feb 2019 11:49:57 +0100
Subject: [Buildroot] [PATCH v3 3/5] package/mender: adding artifact_info file
In-Reply-To: <1549363799-30840-1-git-send-email-angelo@amarulasolutions.com>
References: <1549363799-30840-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1549363799-30840-4-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to have the mender package working out of the box, the
/etc/mender/artifact_info should be present and should contain a
valid artifact_name value.
This patch provides a default file that can be overridden easily
from an overlay.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Acked-by: <aduskett@gmail.com>
---
 package/mender/artifact_info | 1 +
 package/mender/mender.mk     | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 package/mender/artifact_info

diff --git a/package/mender/artifact_info b/package/mender/artifact_info
new file mode 100644
index 0000000..1c84b08
--- /dev/null
+++ b/package/mender/artifact_info
@@ -0,0 +1 @@
+artifact_name=BUILDROOT_ARTIFACT
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index dc4a73b..0377270 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -50,6 +50,9 @@ define MENDER_INSTALL_CONFIG_FILES
 			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
 	)
 
+	$(INSTALL) -D -m 0755 package/mender/artifact_info \
+			$(TARGET_DIR)/etc/mender/artifact_info
+
 	ln -snf /var/run/mender $(TARGET_DIR)/var/lib/mender
 endef
 
-- 
2.7.4
