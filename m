From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 16:43:53 +0200
Subject: [Buildroot] [git commit] mender: fix check-package warnings
Message-ID: <20180610144221.31AA7846DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12b70acb82acfa4925a8436a31a668ac92a58d1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/mender/Config.in:7: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/mender/Config.in:8: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/mender/mender.mk:8: remove default value of _SOURCE variable (http://nightly.buildroot.org/#generic-package-reference)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/Config.in | 8 ++++----
 package/mender/mender.mk | 1 -
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index 61a20cfd8a..e461857486 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -4,10 +4,10 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
-	  Mender is an open source over-the-air (OTA) software updater for
-	  embedded Linux devices. Mender comprises a client running at the
-	  embedded device, as well as a server that manages deployments
-	  across many devices.
+	  Mender is an open source over-the-air (OTA) software updater
+	  for embedded Linux devices. Mender comprises a client
+	  running at the embedded device, as well as a server that
+	  manages deployments across many devices.
 
 	  https://github.com/mendersoftware/mender
 
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index ab0078e0cc..695b5e7a91 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 MENDER_VERSION = 1.4.0
-MENDER_SOURCE = mender-$(MENDER_VERSION).tar.gz
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
 
 define MENDER_INSTALL_CONFIG_FILES
