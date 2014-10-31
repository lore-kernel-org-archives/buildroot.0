From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 31 Oct 2014 07:14:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: Needs python2 host
	package
Message-ID: <1414736064-2972-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/3aa/3aaa28eb4fd04a5b578c5128b57ce89165e473be/
http://autobuild.buildroot.net/results/467/467df0fde737de0ec89fe023b2ce33546543d335/
http://autobuild.buildroot.net/results/f5a/f5aa44e0a96820fb8edd47e8096131b68f64f6a7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index bd46d0e..5cc8adf 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -35,7 +35,7 @@ define TVHEADEND_CONFIGURE_CMDS
 	 --prefix=/usr				\
 	 --arch="$(ARCH)"			\
 	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
-	 --python="$(HOST_DIR)/usr/bin/python"	\
+	 --python="$(HOST_DIR)/usr/bin/python2"	\
 	 --disable-dvbscan			\
 	 --enable-bundle			\
 	 $(TVHEADEND_CONF_OPTS)			\
-- 
1.7.10.4
