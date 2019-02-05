From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 14:08:47 +0100
Subject: [Buildroot] [git commit] package/mender: adding artifact_info file
Message-ID: <20190205130901.7AE4A83F64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99ed53cc2b52e68d322f2154a3c9b9af335c0c6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to have the mender package working out of the box, the
/etc/mender/artifact_info should be present and should contain a
valid artifact_name value.
This patch provides a default file that can be overridden easily
from an overlay.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Acked-by: <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/artifact_info | 1 +
 package/mender/mender.mk     | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/mender/artifact_info b/package/mender/artifact_info
new file mode 100644
index 0000000000..1c84b088d0
--- /dev/null
+++ b/package/mender/artifact_info
@@ -0,0 +1 @@
+artifact_name=BUILDROOT_ARTIFACT
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index dc4a73b0f3..0377270a43 100644
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
 
