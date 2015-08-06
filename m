From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 11:06:32 +0200
Subject: [Buildroot] [git commit] squid: fix systemd unit file location
Message-ID: <20150806090708.D4A48819EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e911e95df40dd5a93ec5876c08088790ef20244a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

squid.service is in tools/systemd/, not in tools/.

Fixes:

  http://autobuild.buildroot.net/results/cec/cecb968172cb00281e439566e5ae154538435a51/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index e201673..e140773 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -90,7 +90,7 @@ define SQUID_INSTALL_INIT_SYSV
 endef
 
 define SQUID_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 $(@D)/tools/squid.service \
+	$(INSTALL) -D -m 0644 $(@D)/tools/systemd/squid.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/squid.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf ../../../..//usr/lib/systemd/system/squid.service \
