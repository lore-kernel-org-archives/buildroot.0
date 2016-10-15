From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:42 +0200
Subject: [Buildroot] [git commit] unrar: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161015121836.4049D81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d796044eb1b03297ed96fdcb3e63359d801aa293
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/unrar/unrar.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index 68d81b7..f5a95ea 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -11,13 +11,13 @@ UNRAR_LICENSE = unrar
 UNRAR_LICENSE_FILES = license.txt
 
 define UNRAR_BUILD_CMDS
-	$(MAKE) CXX="$(TARGET_CXX)" STRIP="/bin/true" \
+	$(TARGET_MAKE_ENV) $(MAKE) CXX="$(TARGET_CXX)" STRIP="/bin/true" \
 		CXXFLAGS="$(TARGET_CXXFLAGS) -pthread" \
 		LDFLAGS="$(TARGET_LDFLAGS) -pthread" -C $(@D)
 endef
 
 define UNRAR_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
 endef
 
 $(eval $(generic-package))
