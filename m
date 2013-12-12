From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 12 Dec 2013 12:27:04 -0600
Subject: [Buildroot] [ PATCH v4 04/20] bzip2: Add host build shared library
	installation
In-Reply-To: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1386872840-22051-5-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v3 -> v4:
  - No changes.
Changes v2 -> v3:
  - Changed order of patch to correct dependency issue (suggested by Thomas).
Changes v1 -> v2:
  - No changes
---
 package/bzip2/bzip2.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index fcddb55..a06e980 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -61,6 +61,8 @@ endef
 define HOST_BZIP2_INSTALL_CMDS
 	$(HOST_MAKE_ENV) \
 		$(MAKE) PREFIX=$(HOST_DIR)/usr -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE) \
+		-f Makefile-libbz2_so PREFIX=$(HOST_DIR)/usr -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
1.7.1
