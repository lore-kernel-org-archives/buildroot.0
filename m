From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 11:12:04 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/cracklib:
 properly handle BR2_SYSTEM_ENABLE_NLS=y configurations
Message-ID: <20190526091607.D889480F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a422e5f1f9ebb50d765079ab9c16a4d14a59ba11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Use the TARGET_NLS_DEPENDENCIES and TARGET_NLS_LIBS variables to
correctly handle BR2_SYSTEM_ENABLE_NLS=y configurations.

Fixes:

  http://autobuild.buildroot.net/results/dda70b5b88c75d36c61fbf1cc5fca16ea8414582/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4292b23123d0862eb809e2bcc9543c8b52e4d791)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cracklib/cracklib.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index aeee60d1e7..387fd8ba00 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -9,7 +9,8 @@ CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/cracklib-
 CRACKLIB_LICENSE = LGPL-2.1
 CRACKLIB_LICENSE_FILES = COPYING.LIB
 CRACKLIB_INSTALL_STAGING = YES
-CRACKLIB_DEPENDENCIES = host-cracklib
+CRACKLIB_DEPENDENCIES = host-cracklib $(TARGET_NLS_DEPENDENCIES)
+CRACKLIB_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 CRACKLIB_CONF_OPTS += --with-zlib
