From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Nov 2016 23:13:27 +0100
Subject: [Buildroot] [PATCH 2/4] qextserialport: remove useless () around
	configure command
In-Reply-To: <20161120221329.5827-1-arnout@mind.be>
References: <20161120221329.5827-1-arnout@mind.be>
Message-ID: <20161120221329.5827-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qextserialport/qextserialport.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 11b1cc8..f48f596 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -19,7 +19,7 @@ QEXTSERIALPORT_QMAKE = $(QT5_QMAKE)
 endif
 
 define QEXTSERIALPORT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QEXTSERIALPORT_QMAKE))
+	cd $(@D); $(TARGET_MAKE_ENV) $(QEXTSERIALPORT_QMAKE)
 endef
 
 define QEXTSERIALPORT_BUILD_CMDS
-- 
2.10.2
