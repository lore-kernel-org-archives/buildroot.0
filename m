From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:34:22 +0200
Subject: [Buildroot] [git commit] xenomai: update list of Analogy installed
	files
Message-ID: <20170420211016.E3473817E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab3218f1089e8a2cbb3d184e64daa5609ffeaaf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Xenomai 3, the list of files installed for Analogy is longer, causing
the extra files to remain on the target filesystem even if Analogy is not
selected.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/xenomai.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 0866144..a9cb296 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -81,11 +81,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_XENOMAI_ANALOGY),)
 define XENOMAI_REMOVE_ANALOGY
-	for i in cmd_bits cmd_read cmd_write insn_write \
-		insn_bits insn_read ; do \
+	for i in cmd_read cmd_write cmd_bits insn_read insn_write insn_bits \
+			wf_generate ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
 	done
-	rm -f $(TARGET_DIR)/usr/sbin/analogy_config
+	for i in analogy_config analogy_calibrate ; do \
+		rm -f $(TARGET_DIR)/usr/sbin/$$i ; \
+	done
 	rm -f $(TARGET_DIR)/usr/lib/libanalogy.*
 endef
 
