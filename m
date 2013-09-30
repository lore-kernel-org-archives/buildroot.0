From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 30 Sep 2013 13:09:27 +0200
Subject: [Buildroot] [PATCH 2 of 2] make clean: remove redundant removal of
	STAGING_DIR
In-Reply-To: <patchbomb.1380539365@argentina>
References: <patchbomb.1380539365@argentina>
Message-ID: <e4d1fd22ccc32a9c0ffc.1380539367@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since STAGING_DIR is defined as (package/Makefile.in):

STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)

removing HOST_DIR will automatically remove STAGING_DIR. This patch updates
'make clean' based on this knowledge.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Makefile |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -748,7 +748,7 @@ printvars:
 		$(info $V=$($V) ($(value $V)))))
 
 clean:
-	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
+	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(STAMP_DIR) $(BUILD_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR)
 
