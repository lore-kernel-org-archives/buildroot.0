From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 21:49:14 +0200
Subject: [Buildroot] [git commit branch/next] conntrack-tools: use
	pkg-config for libtirpc flags
Message-ID: <20150808105642.6195B7FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b7edd7756cac51a04cf90799bd31e08e1b4b01f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Instead of hardcoding the flags needed for libtirpc, use pkg-config.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/conntrack-tools/conntrack-tools.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index c01501a..983f954 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -15,8 +15,8 @@ CONNTRACK_TOOLS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 CONNTRACK_TOOLS_CONF_ENV += \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
-CONNTRACK_TOOLS_DEPENDENCIES += libtirpc
+	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
+CONNTRACK_TOOLS_DEPENDENCIES += libtirpc host-pkgconf
 endif
 
 $(eval $(autotools-package))
