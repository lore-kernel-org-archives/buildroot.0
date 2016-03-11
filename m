From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Mar 2016 14:40:40 -0300
Subject: [Buildroot] [PATCH] dnsmasq: re-enable parallel builds
Message-ID: <1457718040-5459-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

They don't seem to be causing any issues after many bumps and tests.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dnsmasq/dnsmasq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index b3e8c4c..7fb1200 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -90,7 +90,7 @@ define DNSMASQ_BUILD_CMDS
 	$(DNSMASQ_ENABLE_DBUS)
 	$(DNSMASQ_ENABLE_LUA)
 	$(DNSMASQ_ENABLE_CONNTRACK)
-	$(DNSMASQ_MAKE_ENV) $(MAKE1) -C $(@D) $(DNSMASQ_MAKE_OPTS) all$(DNSMASQ_I18N)
+	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPTS) all$(DNSMASQ_I18N)
 endef
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-- 
2.4.10
