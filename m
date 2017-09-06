From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 12:30:04 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/minidlna: Do not
	mark .service file executable
Message-ID: <20170906112607.772518211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ece5e098913d77846908e010fb67711bbb2e500a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Do not mark .service file executable, otherwise systemd
will give us a warning about it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit fb825fbaf9dabce2b22c9a32645802f8f64fca23)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minidlna/minidlna.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 0e765e8..c67373f 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -29,7 +29,7 @@ define MINIDLNA_INSTALL_INIT_SYSV
 endef
 
 define MINIDLNA_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0755 package/minidlna/minidlnad.service \
+	$(INSTALL) -D -m 0644 package/minidlna/minidlnad.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/minidlnad.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
