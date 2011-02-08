From: Martin Hicks <mort@bork.org>
Date: Tue,  8 Feb 2011 16:12:14 -0500
Subject: [Buildroot] [PATCH] microperl compile fix with ccache enabled
Message-ID: <1297199534-30597-1-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just a simple quote problem with $(HOSTCC)

Signed-off-by: Martin Hicks <mort@bork.org>
---
 package/microperl/microperl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index bf76fa7..b68e825 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -32,7 +32,7 @@ $(MICROPERL_DIR)/.source: $(DL_DIR)/$(MICROPERL_SOURCE)
 
 $(MICROPERL_DIR)/.host_configured: $(MICROPERL_DIR)/.source
 	# we need to build a perl for the host just for Errno.pm
-	(cd $(MICROPERL_DIR); ./Configure -Dcc=$(HOSTCC) -de  )
+	(cd $(MICROPERL_DIR); ./Configure -Dcc="$(HOSTCC)" -de  )
 	touch $@
 
 
-- 
1.5.6.5
