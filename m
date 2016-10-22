From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] ed: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132036.A33BB81974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca3ae3bd35cf08f45b4ac06c6a09bcae35cbaa09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ed/ed.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index f3bcb74..36f2f2e 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -14,18 +14,18 @@ ED_LICENSE_FILES = COPYING
 
 define ED_CONFIGURE_CMDS
 	(cd $(@D); \
-		./configure \
+		$(TARGET_MAKE_ENV) ./configure \
 		--prefix=/usr \
 		$(TARGET_CONFIGURE_OPTS) \
 	)
 endef
 
 define ED_BUILD_CMDS
-	$(MAKE)	-C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define ED_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))
