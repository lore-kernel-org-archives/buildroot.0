From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:17 +0100
Subject: [Buildroot] [RFC v3 12/30] dhcpdump: use TARGET_CONFIGURE_OPTS in
	order to support PPS
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-13-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to support the per-package staging directory we need to pass
the TARGET_LDFLAGS, so instead of adding directly to the make command
line use the TARGET_CONFIGURE_OPTS variable that already contain the
TARGET_LDFALGS contents.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/dhcpdump/dhcpdump.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 0756319..d9fb98f 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -16,7 +16,7 @@ DHCPDUMP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additiona
 endif
 
 define DHCPDUMP_BUILD_CMDS
-	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" LIBS="$(DHCPDUMP_LIBS)"
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) LIBS="$(DHCPDUMP_LIBS)"
 endef
 
 define DHCPDUMP_INSTALL_TARGET_CMDS
-- 
2.3.1
