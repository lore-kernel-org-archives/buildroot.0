From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:24 +0200
Subject: [Buildroot] [PATCH 08/30] package/libsemanage: reformat
 HOST_LIBSEMANAGE_DEPENDENCIES
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-9-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use a more common formatting for HOST_LIBSEMANAGE_DEPENDENCIES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsemanage/libsemanage.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 9a4ddc1a4d..bd1e01febf 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -25,8 +25,13 @@ define LIBSEMANAGE_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
 
-HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-audit host-libsepol host-libselinux \
-				host-bzip2 host-swig
+HOST_LIBSEMANAGE_DEPENDENCIES = \
+	host-bison \
+	host-audit \
+	host-libsepol \
+	host-libselinux \
+	host-bzip2 \
+	host-swig
 
 HOST_LIBSEMANAGE_MAKE_OPTS += \
 	$(HOST_CONFIGURE_OPTS) \
-- 
2.21.0
