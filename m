From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Aug 2017 16:09:56 +0200
Subject: [Buildroot] [git commit] package/minidlna: Do not mark .service
	file executable
Message-ID: <20170825140416.1582581D49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb825fbaf9dabce2b22c9a32645802f8f64fca23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not mark .service file executable, otherwise systemd
will give us a warning about it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minidlna/minidlna.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index d0d9136..d2bc9f5 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -29,7 +29,7 @@ define MINIDLNA_INSTALL_INIT_SYSV
 endef
 
 define MINIDLNA_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0755 package/minidlna/minidlnad.service \
+	$(INSTALL) -D -m 0644 package/minidlna/minidlnad.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/minidlnad.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
