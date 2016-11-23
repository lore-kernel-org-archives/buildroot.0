From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 22 Nov 2016 21:23:02 -0500
Subject: [Buildroot] [PATCH 1/1] Makefile: fix distclean removal of $(O)
Message-ID: <1479867782-2666-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The distclean target no longer removes the "output" directory for
in-tree builds, because $(O) is no longer just "output" in that
case. Change the test to be against "$(CURDIR)/output", to match
the O setting, and a similar test elsewhere in the same Makefile.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 37e4bd4..1323961 100644
--- a/Makefile
+++ b/Makefile
@@ -928,7 +928,7 @@ clean:
 		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
 
 distclean: clean
-ifeq ($(O),output)
+ifeq ($(O),$(CURDIR)/output)
 	rm -rf $(O)
 endif
 	rm -rf $(TOPDIR)/dl $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
-- 
1.9.1
