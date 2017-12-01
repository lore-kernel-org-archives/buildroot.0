From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:21:29 +0100
Subject: [Buildroot] [git commit] package/feh: Cleanup build configuration
Message-ID: <20171201211635.67C7182591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2168d42852487986c8c3ab5c7136d2313498f071
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* build in parallel
* use TARGET_CONFIGURE_OPTS
* cleanup FEH_INSTALL_TARGET_CMDS

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/feh/feh.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 7211dc7..3442f57 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -12,13 +12,12 @@ FEH_LICENSE = MIT
 FEH_LICENSE_FILES = COPYING
 
 define FEH_BUILD_CMDS
-	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -std=gnu99" $(MAKE1) \
-		CC="$(TARGET_CC) $(TARGET_LDFLAGS)" -C $(@D) all
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
+		$(MAKE) -C $(@D) all
 endef
 
 define FEH_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
-		PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
 $(eval $(generic-package))
