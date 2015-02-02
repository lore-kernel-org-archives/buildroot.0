From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon,  2 Feb 2015 18:05:16 +0100
Subject: [Buildroot] [PATCH] bootstrap: use the UNZIP variable instead of
	calling it directly
Message-ID: <1422896716-23276-1-git-send-email-Fabio.Porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Porcedda <fabio.porcedda@gmail.com>

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/bootstrap/bootstrap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
index 1a1c4f1..17752ce 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -10,7 +10,7 @@ BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
 BOOTSTRAP_LICENSE = MIT
 
 define BOOTSTRAP_EXTRACT_CMDS
-	unzip $(DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
+	$(UNZIP) $(DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
 endef
 
 define BOOTSTRAP_INSTALL_TARGET_CMDS
-- 
2.1.0
