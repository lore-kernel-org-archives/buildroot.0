From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Mar 2016 23:56:00 +0100
Subject: [Buildroot] [git commit] dnsmasq: re-enable parallel builds
Message-ID: <20160312225604.13743817CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ba69a7322cdc6f63682000c543fef4e3c967110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They don't seem to be causing any issues after many bumps and tests.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
