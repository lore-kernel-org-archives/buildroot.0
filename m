From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 14:09:17 +0100
Subject: [Buildroot] [git commit] package/mender: adding device_type file
Message-ID: <20190205130901.82CF383F64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=387fadbf8ddebbdbb1b1f0a27ab22c5f94d623cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to have the mender package working out of the box, the
/etc/mender/device_type should be present and should contain a
valid device_type value.
This patch provides a default file that can be overridden easily
from an overlay.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Acked-by: <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/device_type | 1 +
 package/mender/mender.mk   | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/mender/device_type b/package/mender/device_type
new file mode 100644
index 0000000000..a097ef2b3a
--- /dev/null
+++ b/package/mender/device_type
@@ -0,0 +1 @@
+device_type=BUILDROOT_DEVICE
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 0377270a43..0d719382f8 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -53,6 +53,9 @@ define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -D -m 0755 package/mender/artifact_info \
 			$(TARGET_DIR)/etc/mender/artifact_info
 
+	$(INSTALL) -D -m 0755 package/mender/device_type \
+			$(TARGET_DIR)/etc/mender/device_type
+
 	ln -snf /var/run/mender $(TARGET_DIR)/var/lib/mender
 endef
 
