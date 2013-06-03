From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Jun 2013 16:33:20 +0200
Subject: [Buildroot] [git commit] sconeserver: fix autouild failure
Message-ID: <20130603143943.CF6299A892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=626f9e37492c7f9f5332df02c17e09349f54565b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes autobuild failures such as the following.

  http://autobuild.buildroot.net/results/1bdb5e014daf76b701afea5c82ac83ac4c97d4cb/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sconeserver/sconeserver.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 744f389..565d467 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -60,7 +60,8 @@ endif
 ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
 	SCONESERVER_DEPENDENCIES += mysql_client
 	SCONESERVER_CONF_OPT += --with-mysql \
-		--with-mysql_config="$(STAGING_DIR)/usr/bin/mysql_config"
+		--with-mysql_config="$(STAGING_DIR)/usr/bin/mysql_config" \
+		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib/mysql"
 else
 	SCONESERVER_CONF_OPT += --without-mysql
 endif
