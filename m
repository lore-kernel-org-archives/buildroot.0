From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 17 Apr 2013 15:10:35 -0700
Subject: [Buildroot] [PATCH] dnsmasq: build with MAKE1
Message-ID: <1366236635-6353-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dnsmasq build breaks with parallel builds.
By the time final target needs to be linked, some object files are missing.

Fix it by using MAKE1 instead.

Fixes:
http://autobuild.buildroot.org/results/7a68e2f64105013c1040c01c0e55fb5d910ef8d8

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/dnsmasq/dnsmasq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 285f06e..8fb1fb1 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -84,7 +84,7 @@ define DNSMASQ_BUILD_CMDS
 	$(DNSMASQ_ENABLE_DBUS)
 	$(DNSMASQ_ENABLE_LUA)
 	$(DNSMASQ_ENABLE_CONNTRACK)
-	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPT) all$(DNSMASQ_I18N)
+	$(DNSMASQ_MAKE_ENV) $(MAKE1) -C $(@D) $(DNSMASQ_MAKE_OPT) all$(DNSMASQ_I18N)
 endef
 
 define DNSMASQ_INSTALL_TARGET_CMDS
-- 
1.7.4.1
