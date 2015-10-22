From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 Oct 2015 13:20:27 -0300
Subject: [Buildroot] [PATCH] iproute2: drop dead tipc disabling code
Message-ID: <1445530827-31937-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since it's automatic via libmnl being present it's just dead code that's
not defined any longer, so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iproute2/iproute2.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index d1aa6bf..6660eb2 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -54,7 +54,6 @@ define IPROUTE2_CONFIGURE_CMDS
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure
 	$(IPROUTE2_DISABLE_ARPD)
 	$(IPROUTE2_WITH_IPTABLES)
-	$(IPROUTE2_DISABLE_TIPC)
 endef
 
 define IPROUTE2_BUILD_CMDS
-- 
2.4.10
