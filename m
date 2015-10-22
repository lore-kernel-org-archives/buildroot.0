From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Oct 2015 23:42:27 +0200
Subject: [Buildroot] [git commit] feh: install in /usr
Message-ID: <20151022214501.0E1B08191C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=948e4837d32e7c708427864551090ee1935ea0ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, feh installs into /usr/local. Adjusting the prefix to point
to a system distribution path.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/feh/feh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 03435dc..7381e25 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -18,7 +18,7 @@ endef
 
 define FEH_INSTALL_TARGET_CMDS
 	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
-		DESTDIR=$(TARGET_DIR) -C $(@D) install
+		PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
 $(eval $(generic-package))
