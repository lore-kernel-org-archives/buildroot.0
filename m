From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:54 +0200
Subject: [Buildroot] [git commit] espeak: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121836.76C2081F71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98d693e4786cd65977c436844884924d3ca698d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/espeak/espeak.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index 0aa049e..734ec30e 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -32,12 +32,12 @@ define ESPEAK_CONFIGURE_CMDS
 endef
 
 define ESPEAK_BUILD_CMDS
-	$(MAKE) -C $(@D)/src  $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src  $(TARGET_CONFIGURE_OPTS) \
 		AUDIO="$(ESPEAK_AUDIO_BACKEND)" all
 endef
 
 define ESPEAK_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/src DESTDIR="$(TARGET_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))
