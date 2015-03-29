From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:27 +0200
Subject: [Buildroot] [PATCH 13/35] Makefile: directories are not PHONY
	targets
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The global .PHONY specification in the main Makefile is describing a
number of directory targets as being PHONY, which doesn't make much
sense. PHONY targets are targets that do not exist on the filesystem,
and which make should always consider as not being up-to-date, so that
the commands associated to these targets are always executed by make
when the command is invoked, even if a file with the same name exists
on the filesystem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 5a6f825..56477bb 100644
--- a/Makefile
+++ b/Makefile
@@ -433,9 +433,7 @@ world: target-post-image
 	legal-info legal-info-prepare legal-info-clean printvars \
 	target-finalize target-post-image \
 	$(TARGETS) $(TARGETS_ROOTFS) \
-	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
-	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR)
+	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO)
 
 ################################################################################
 #
-- 
2.1.0
