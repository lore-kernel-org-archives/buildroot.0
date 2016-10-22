From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] collectd: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132039.0FB2D819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9894b11792212944cb4f478c6fa3a3644329ab2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index b9422f3..4846ee4 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -180,7 +180,7 @@ endef
 COLLECTD_POST_PATCH_HOOKS += COLLECTD_DROP_WERROR
 
 define COLLECTD_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 	rm -f $(TARGET_DIR)/usr/bin/collectd-nagios
 	rm -f $(TARGET_DIR)/usr/share/collectd/postgresql_default.conf
 endef
