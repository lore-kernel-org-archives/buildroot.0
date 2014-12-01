From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:13:44 +0100
Subject: [Buildroot] [git commit] ndisc6: remove man page related code
Message-ID: <20141201223450.22B9480048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51d973a622c9befc8caa6445e7e98aca2e1ded94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The target-finalize target takes care of removing
$(TARGET_DIR)/usr/share/man, so there's no point in having package
specific code doing this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ndisc6/ndisc6.mk |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index cd43b01..f431035 100644
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
