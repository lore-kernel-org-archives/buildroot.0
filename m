From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 20:47:20 +0100
Subject: [Buildroot] [git commit] iprutils: use correct include path for
	ncurses
Message-ID: <20141214194750.740948040E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02f7dd34938f5f165c73f9f1e54bf55b2015be31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Makefile is hardcoded for /usr/include/ncurses, so override it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reported-by: Romain Naour <romain.naour@openwide.fr>
---
 package/iprutils/iprutils.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
index 53516b6..35bffa3 100644
--- a/package/iprutils/iprutils.mk
+++ b/package/iprutils/iprutils.mk
@@ -12,7 +12,8 @@ IPRUTILS_LICENSE = Common Public License Version 1.0
 IPRUTILS_LICENSE_FILES = LICENSE
 
 define IPRUTILS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		INCLUDEDIR="-I. $(shell $(STAGING_DIR)/usr/bin/ncurses5-config --cflags)" all
 endef
 
 define IPRUTILS_INSTALL_TARGET_CMDS
