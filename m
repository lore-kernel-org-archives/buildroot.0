From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:35 +0200
Subject: [Buildroot] [PATCH 49/74] openntpd: use correct step override method
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3ec45c80b18b15233344125ab8bc12472cfd3dc6.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openntpd/openntpd.mk |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index c42ed9c..81b268b 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -9,11 +9,10 @@ OPENNTPD_SITE = ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_CONF_OPT = --with-builtin-arc4random --disable-strip
 OPENNTPD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-$(eval $(call AUTOTARGETS,package,openntpd))
-
-$(OPENNTPD_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define OPENNTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/ntpd
 	rm -f $(TARGET_DIR)/etc/ntpd.conf
 	rm -f $(TARGET_DIR)/usr/share/man/man?/ntpd*
-	rm -f $(OPENNTPD_TARGET_INSTALL_TARGET) $(OPENNTPD_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,openntpd))
-- 
1.7.0.4
