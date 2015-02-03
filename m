From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Feb 2015 15:59:57 +0100
Subject: [Buildroot] [git commit] iprutils: drop unneeded ncurses5-config
	handling
Message-ID: <20150203150007.C94568175D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6abdd97a1b6bd7e943e0ea04e99ad509abcbe1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ncurses nowadays installs the headers directly into $prefix/usr/include, so
ncurses5-config doesn't return anything important and the logic wasn't
taking the wchar variant into consideration - So just drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iprutils/iprutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
index e3f3a37..b2fe4cf 100644
--- a/package/iprutils/iprutils.mk
+++ b/package/iprutils/iprutils.mk
@@ -13,7 +13,7 @@ IPRUTILS_LICENSE_FILES = LICENSE
 
 define IPRUTILS_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		INCLUDEDIR="-I. $(shell $(STAGING_DIR)/usr/bin/ncurses5-config --cflags)" all
+		INCLUDEDIR="-I." all
 endef
 
 define IPRUTILS_INSTALL_TARGET_CMDS
