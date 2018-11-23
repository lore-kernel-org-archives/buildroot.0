From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 21:47:50 +0100
Subject: [Buildroot] [git commit] botan: fix install directory
Message-ID: <20181123204533.9996887F61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dcea42403cd1c574c4cbabece6fd9eb2fd933e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using $(STAGING_DIR)/usr and $(TARGET_DIR)/usr as the DESTDIR value
causes Botan to be installed in $(STAGING_DIR)/usr/usr and
$(TARGET_DIR)/usr/usr, which obviously isn't correct. Let's fix that
by passing the appropriate DESTDIR values.

Signed-off-by: DUPONCHEEL S??bastien <sebastien.duponcheel@corp.ovh.com>
[Thomas: extend commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/botan.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 7f0bbb66c9..e07b786c85 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -92,11 +92,11 @@ define BOTAN_BUILD_CMDS
 endef
 
 define BOTAN_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)/usr" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
 endef
 
 define BOTAN_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)/usr" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))
