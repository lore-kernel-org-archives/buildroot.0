From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 22:49:15 +0200
Subject: [Buildroot] [git commit] package/hiawatha: reorder CONF_OPTS in the
 .mk file
Message-ID: <20200602200122.53A6C812A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b35df346a61c1b4d8835679dc5416734dfc07419
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the unconditional CONF_OPTS assignment toward the beginning of
the file, before the conditionals on optional dependencies. And use =
for this unconditional assignment instead of +=. No functional
changes, just to align with the coding style used in most other
packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hiawatha/hiawatha.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 28fd286ea8..01b9292035 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -10,6 +10,14 @@ HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPL-2.0
 HIAWATHA_LICENSE_FILES = LICENSE
 
+HIAWATHA_CONF_OPTS = \
+	-DENABLE_TOOLKIT=OFF \
+	-DCONFIG_DIR=/etc/hiawatha \
+	-DLOG_DIR=/var/log \
+	-DPID_DIR=/var/run \
+	-DWEBROOT_DIR=/var/www/hiawatha \
+	-DWORK_DIR=/var/lib/hiawatha
+
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
 HIAWATHA_CONF_OPTS += -DUSE_SYSTEM_MBEDTLS=ON
 HIAWATHA_DEPENDENCIES += mbedtls
@@ -24,12 +32,4 @@ else
 HIAWATHA_CONF_OPTS += -DENABLE_XSLT=OFF
 endif
 
-HIAWATHA_CONF_OPTS += \
-	-DENABLE_TOOLKIT=OFF \
-	-DCONFIG_DIR=/etc/hiawatha \
-	-DLOG_DIR=/var/log \
-	-DPID_DIR=/var/run \
-	-DWEBROOT_DIR=/var/www/hiawatha \
-	-DWORK_DIR=/var/lib/hiawatha
-
 $(eval $(cmake-package))
