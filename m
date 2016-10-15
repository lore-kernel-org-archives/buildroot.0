From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:16:48 +0200
Subject: [Buildroot] [git commit] irda-utils: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.2ACEB81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bccfde628f1265d732671eb72f6a6c46aeb8a19d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/irda-utils/irda-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index 2c35dff..4b17007 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -15,7 +15,7 @@ IRDA_UTILS_CFLAGS += -DNO_FORK=1
 endif
 
 define IRDA_UTILS_BUILD_CMDS
-	$(MAKE) \
+	$(TARGET_MAKE_ENV) $(MAKE) \
 		CC="$(TARGET_CC)" \
 		CFLAGS="$(IRDA_UTILS_CFLAGS)" \
 		SYS_INCLUDES= \
