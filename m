From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 21:56:40 +0200
Subject: [Buildroot] [git commit] make clean: remove redundant removal of
	STAGING_DIR
Message-ID: <20131001195951.05CA58F6F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=300eb6b751bc623a2446ead4c885bcfa84419744
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since STAGING_DIR is defined as (package/Makefile.in):

STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)

removing HOST_DIR will automatically remove STAGING_DIR. This patch updates
'make clean' based on this knowledge.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 667e233..cd3dc0d 100644
--- a/Makefile
+++ b/Makefile
@@ -751,7 +751,7 @@ printvars:
 		$(info $V=$($V) ($(value $V)))))
 
 clean:
-	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
+	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(STAMP_DIR) $(BUILD_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR)
 
