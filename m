From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:52 -0000
Subject: [Buildroot] [git commit] package/sdbusplus: fix check-package
 warnings
Message-ID: <20191202083932.E0C667F98A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5c246412b3b7fb2ab944af09a6e304beb269b4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/sdbusplus/Config.in.host:7: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/sdbusplus/sdbusplus.mk:26: expected indent with tabs

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdbusplus/Config.in.host | 4 ++--
 package/sdbusplus/sdbusplus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdbusplus/Config.in.host b/package/sdbusplus/Config.in.host
index cff9f20384..2b1d1ce31d 100644
--- a/package/sdbusplus/Config.in.host
+++ b/package/sdbusplus/Config.in.host
@@ -4,7 +4,7 @@ config BR2_PACKAGE_HOST_SDBUSPLUS
 	help
 	  A C++ library for sd-bus with a bindings and doc generator.
 
-	  This will build the Python host side generation tool for bindings
-	  and documentation.
+	  This will build the Python host side generation tool for
+	  bindings and documentation.
 
 	  https://github.com/openbmc/sdbusplus
diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus.mk
index 976f987fad..e7a3dc2665 100644
--- a/package/sdbusplus/sdbusplus.mk
+++ b/package/sdbusplus/sdbusplus.mk
@@ -23,7 +23,7 @@ SDBUSPLUS_LICENSE = Apache-2.0
 SDBUSPLUS_LICENSE_FILES = LICENSE
 
 define SDBUSPLUS_CREATE_M4
-    mkdir -p $(@D)/m4
+	mkdir -p $(@D)/m4
 endef
 SDBUSPLUS_POST_PATCH_HOOKS += SDBUSPLUS_CREATE_M4
 HOST_SDBUSPLUS_POST_PATCH_HOOKS += SDBUSPLUS_CREATE_M4
