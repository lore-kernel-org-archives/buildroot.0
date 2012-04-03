From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 Apr 2012 22:51:05 +0200
Subject: [Buildroot] [git commit] tinyhttpd: fix initscript,
	install as /usr/sbin/tinyhttpd
Message-ID: <20120403205317.ED380969F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d58777fdf0d18da7c08f6b604d36f85aae2ec5bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The init script was expecting the binary to be called tinyhttpd, but httpd
was used. Fix it to install as tinyhttpd as httpd will conflict with other
web servers (E.G. the busybox one).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tinyhttpd/tinyhttpd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 6bc37d4..9b06589 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -12,14 +12,14 @@ define TINYHTTPD_BUILD_CMDS
 endef
 
 define TINYHTTPD_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/httpd $(TARGET_DIR)/usr/sbin/httpd
+	$(INSTALL) -m 0755 -D $(@D)/httpd $(TARGET_DIR)/usr/sbin/tinyhttpd
 	$(INSTALL) -m 0755 -D package/tinyhttpd/S85tinyhttpd \
 		$(TARGET_DIR)/etc/init.d/S85tinyhttpd
 	mkdir -p $(TARGET_DIR)/var/www
 endef
 
 define TINYHTTPD_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/httpd
+	rm -f $(TARGET_DIR)/usr/sbin/tinyhttpd
 	rm -f $(TARGET_DIR)/etc/init.d/S85tinyhttpd
 endef
 
