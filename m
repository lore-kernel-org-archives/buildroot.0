From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 May 2019 15:59:43 +0200
Subject: [Buildroot] [git commit] package/cracklib: properly handle
 BR2_SYSTEM_ENABLE_NLS=y configurations
Message-ID: <20190510135424.0AE3E88F9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4292b23123d0862eb809e2bcc9543c8b52e4d791
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the TARGET_NLS_DEPENDENCIES and TARGET_NLS_LIBS variables to
correctly handle BR2_SYSTEM_ENABLE_NLS=y configurations.

Fixes:

  http://autobuild.buildroot.net/results/dda70b5b88c75d36c61fbf1cc5fca16ea8414582/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cracklib/cracklib.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index b9e3dc0d75..91d510ff34 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -9,7 +9,8 @@ CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/v$(CRACKL
 CRACKLIB_LICENSE = LGPL-2.1
 CRACKLIB_LICENSE_FILES = COPYING.LIB
 CRACKLIB_INSTALL_STAGING = YES
-CRACKLIB_DEPENDENCIES = host-cracklib
+CRACKLIB_DEPENDENCIES = host-cracklib $(TARGET_NLS_DEPENDENCIES)
+CRACKLIB_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 CRACKLIB_CONF_OPTS += --with-zlib
