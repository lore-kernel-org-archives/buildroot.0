From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2015 17:05:43 +0200
Subject: [Buildroot] [git commit] dos2unix: remove host-gettext dependency
	from host package
Message-ID: <20150904150747.962E58016D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=708818aaa287b17d607ee35b57fef194e38f1055
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This shortens build time.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dos2unix/dos2unix.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 4c5f4fc..55608c6 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -9,7 +9,7 @@ DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2c
 DOS2UNIX_LICENSE_FILES = COPYING.txt
 DOS2UNIX_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-HOST_DOS2UNIX_DEPENDENCIES = host-gettext
+HOST_DOS2UNIX_DEPENDENCIES =
 
 ifeq ($(BR2_ENABLE_LOCALE),)
 DOS2UNIX_MAKE_OPTS += ENABLE_NLS=
@@ -34,11 +34,12 @@ define DOS2UNIX_INSTALL_TARGET_CMDS
 endef
 
 define HOST_DOS2UNIX_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) ENABLE_NLS=
 endef
 
 define HOST_DOS2UNIX_INSTALL_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) ENABLE_NLS= \
+		install
 endef
 
 $(eval $(generic-package))
