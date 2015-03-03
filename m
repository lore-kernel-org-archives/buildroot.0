From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:10 +0100
Subject: [Buildroot] [RFC v3 05/30] pppd: use TARGET_LDFLAGS
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-6-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is in order to support the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pppd/pppd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 453445b..a5095fe 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -53,7 +53,7 @@ define PPPD_CONFIGURE_CMDS
 endef
 
 define PPPD_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" \
+	$(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
 		-C $(@D) $(PPPD_MAKE_OPTS)
 endef
 
-- 
2.3.1
