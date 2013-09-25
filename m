From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 25 Sep 2013 14:32:39 -0500
Subject: [Buildroot] [PATCH v3 04/16] bzip2: Add host build shared library
	installation
In-Reply-To: <1380137571-688-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1380137571-688-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1380137571-688-5-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v2 -> v3:
  - Changed order of patch to correct dependency issue (suggested by Thomas).
Changes v1 -> v2:
  - No changes

 package/bzip2/bzip2.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 45d5108..5876837 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -71,6 +71,8 @@ endef
 define HOST_BZIP2_INSTALL_CMDS
 	$(HOST_MAKE_ENV) \
 		$(MAKE) PREFIX=$(HOST_DIR)/usr -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE) \
+		-f Makefile-libbz2_so PREFIX=$(HOST_DIR)/usr -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
1.7.1
