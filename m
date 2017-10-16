From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 17 Oct 2017 10:59:02 +1300
Subject: [Buildroot] [PATCH 1/3] zstd: install to staging directory
In-Reply-To: <20171016215904.3380-1-judge.packham@gmail.com>
References: <20171016215904.3380-1-judge.packham@gmail.com>
Message-ID: <20171016215904.3380-2-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install libzstd to the staging directory.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/zstd/zstd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 089d654749..f149ad2f91 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -6,6 +6,7 @@
 
 ZSTD_VERSION = v1.3.2
 ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
+ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause, GPL-2.0
 ZSTD_LICENSE_FILES = LICENSE COPYING
 
@@ -46,4 +47,9 @@ define ZSTD_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
 endef
 
+define ZSTD_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib install
+endef
+
 $(eval $(generic-package))
-- 
2.14.2
