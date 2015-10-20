From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 22:54:24 +0200
Subject: [Buildroot] [git commit] sed: directly install binary into /bin
Message-ID: <20151020205519.6C78481917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdab16744238f231ea9a81e38f7e37d24cc5e55a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of having to move it after installation, which doesn't work with the
merged /usr option.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sed/sed.mk |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index b819300..71c62d0 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -10,7 +10,7 @@ SED_LICENSE = GPLv3
 SED_LICENSE_FILES = COPYING
 
 SED_CONF_OPTS = \
-	--bindir=/usr/bin \
+	--bindir=/bin \
 	--libdir=/lib \
 	--libexecdir=/usr/lib \
 	--sysconfdir=/etc \
@@ -19,10 +19,4 @@ SED_CONF_OPTS = \
 	--infodir=/usr/share/info \
 	--include=$(STAGING_DIR)/usr/include
 
-define SED_MOVE_BINARY
-	mv $(TARGET_DIR)/usr/bin/sed $(TARGET_DIR)/bin/
-endef
-
-SED_POST_INSTALL_TARGET_HOOKS = SED_MOVE_BINARY
-
 $(eval $(autotools-package))
