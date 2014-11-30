From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:18 +0100
Subject: [Buildroot] [PATCHv3 30/74] ndisc6: remove man page related code
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-31-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The target-finalize target takes care of removing
$(TARGET_DIR)/usr/share/man, so there's no point in having package
specific code doing this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ndisc6/ndisc6.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index b0e4caf..7235ebb 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -27,14 +27,9 @@ NDISC6_SBIN_$(BR2_PACKAGE_NDISC6_RDNSSD) += rdnssd
 NDISC6_SBIN_$(BR2_PACKAGE_NDISC6_RLTRACEROUTE6) += rltraceroute6 tracert6
 NDISC6_SBIN_$(BR2_PACKAGE_NDISC6_TCPTRACEROUTE6) += tcptraceroute6
 
-NDISC6_MAN1_ = $(addsuffix .1,$(NDISC6_BIN_))
-NDISC6_MAN8_ = $(addsuffix .8,$(NDISC6_SBIN_))
-
 define NDISC6_REMOVE_UNNEEDED
 	rm -rf $(addprefix $(TARGET_DIR)/usr/bin/,$(NDISC6_BIN_)) \
-		$(addprefix $(TARGET_DIR)/usr/sbin/,$(NDISC6_SBIN_)) \
-		$(addprefix $(TARGET_DIR)/usr/share/man/man1/,$(NDISC6_MAN1_)) \
-		$(addprefix $(TARGET_DIR)/usr/share/man/man8/,$(NDISC6_MAN8_))
+		$(addprefix $(TARGET_DIR)/usr/sbin/,$(NDISC6_SBIN_))
 	$(if $(BR2_PACKAGE_NDISC6_RDNSSD),,\
 		rm -rf $(TARGET_DIR)/etc/rdnssd $(TARGET_DIR)/var/run/rdnssd)
 endef
-- 
2.1.0
