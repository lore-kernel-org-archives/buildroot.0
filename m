From: Mario Lang <mlang@blind.guru>
Date: Sat, 30 Dec 2017 11:48:02 +0100
Subject: [Buildroot] [PATCH 1/3] package/brltty: add missing dependency on
 host-pkgconf
Message-ID: <20171230104804.16489-1-mlang@blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes the following error:
  ./configure: line 14978: .../host/bin/pkg-config: No such file or directory

Signed-off-by: Mario Lang <mlang@blind.guru>
---
 package/brltty/brltty.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 632aa68386..eb91ef8ff7 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -11,7 +11,7 @@ BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
 BRLTTY_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
 BRLTTY_LICENSE_FILES = LICENSE-GPL LICENSE-LGPL
 
-BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf
+BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf host-pkgconf
 
 BRLTTY_CONF_OPTS = \
 	--disable-java-bindings \
-- 
2.15.0
