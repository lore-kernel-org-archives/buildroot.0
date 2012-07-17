From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 19:06:17 +0200
Subject: [Buildroot] [git commit] netkitbase: warn that legal-info is not
	implemented
Message-ID: <20120717173300.20F3496A7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a6180021c4f93366e48e1c798746a32b42b4d39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netkitbase/netkitbase.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/netkitbase/netkitbase.mk b/package/netkitbase/netkitbase.mk
index 83991f2..56480fc 100644
--- a/package/netkitbase/netkitbase.mk
+++ b/package/netkitbase/netkitbase.mk
@@ -47,6 +47,9 @@ $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY): $(NETKITBASE_DIR)/$(NETKITBASE_BINARY
 	fi
 	touch -c $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
 
+netkitbase-legal-info:
+	@$(call legal-warning-pkg,netkitbase,legal-info not yet implemented)
+
 netkitbase: $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
 
 netkitbase-clean:
