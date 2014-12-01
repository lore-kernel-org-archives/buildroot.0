From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:26:10 +0100
Subject: [Buildroot] [git commit] transmission: install init script
	unconditionally
Message-ID: <20141201233009.5DE7A80051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa6c7a8a994adad042668b569543e308318ecc5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/transmission.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 27ad9d9..b8a5c42 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -37,9 +37,8 @@ ifeq ($(BR2_PACKAGE_TRANSMISSION_DAEMON),y)
 	TRANSMISSION_CONF_OPTS += --enable-daemon
 
 define TRANSMISSION_INSTALL_INIT_SYSV
-	[ -f $(TARGET_DIR)/etc/init.d/S92transmission ] || \
-		$(INSTALL) -m 0755 -D package/transmission/S92transmission \
-			$(TARGET_DIR)/etc/init.d/S92transmission
+	$(INSTALL) -m 0755 -D package/transmission/S92transmission \
+		$(TARGET_DIR)/etc/init.d/S92transmission
 endef
 
 else
