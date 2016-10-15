From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:16:52 +0200
Subject: [Buildroot] [git commit] tinyalsa: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.3FE1581F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d60344955c1f158a7d7be559fc3928abf375f2fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tinyalsa/tinyalsa.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index e470b47..816f683 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -10,7 +10,7 @@ TINYALSA_LICENSE = BSD-3c
 TINYALSA_INSTALL_STAGING = YES
 
 define TINYALSA_BUILD_CMDS
-	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
 endef
 
 define TINYALSA_INSTALL_STAGING_CMDS
