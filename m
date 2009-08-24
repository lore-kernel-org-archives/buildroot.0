From: Will Newton <will.newton@gmail.com>
Date: Mon, 24 Aug 2009 22:28:47 +0200
Subject: [Buildroot] [git commit master] berkeleydb: Update config.{sub,
	guess} in configure step.
Message-ID: <20090824202956.49C21775A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5e64f5057b2485e02cce431eb5d82e5cb8048fef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some architectures may need updates to the configure helper scripts
before it is possible to safely configure.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/berkeleydb/berkeleydb.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index a6e0439..bea3eb7 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -20,6 +20,7 @@ $(DB_DIR)/.dist: $(DL_DIR)/$(DB_SOURCE)
 	touch $@
 
 $(DB_DIR)/.configured: $(DB_DIR)/.dist
+	$(CONFIG_UPDATE) $(DB_DIR)/dist
 	(cd $(DB_DIR)/build_unix; rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-- 
1.6.3.3
