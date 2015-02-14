From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:11:45 +0100
Subject: [Buildroot] [git commit branch/next] lmbench: use pkg-config to
	find libtirpc
Message-ID: <20150214211151.E162580450@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f1be2acf48d11d8bf234681986214d1ea126958
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lmbench/lmbench.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 63a83fd..59e750c 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -14,9 +14,9 @@ LMBENCH_CFLAGS = $(TARGET_CFLAGS)
 LMBENCH_LDLIBS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-LMBENCH_DEPENDENCIES += libtirpc
-LMBENCH_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
-LMBENCH_LDFLAGS += -ltirpc
+LMBENCH_DEPENDENCIES += host-pkgconf libtirpc
+LMBENCH_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags libtirpc)
+LMBENCH_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs libtirpc)
 endif
 
 define LMBENCH_CONFIGURE_CMDS
