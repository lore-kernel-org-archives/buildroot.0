From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:16:44 +0200
Subject: [Buildroot] [git commit] pifmrds: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.1975681F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2672b225d4a4b3894c9d45a560e7657972f48d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pifmrds/pifmrds.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
index 5179715..a30c013 100644
--- a/package/pifmrds/pifmrds.mk
+++ b/package/pifmrds/pifmrds.mk
@@ -11,7 +11,7 @@ PIFMRDS_LICENSE = GPLv3+
 PIFMRDS_LICENSE_FILES = LICENSE
 
 define PIFMRDS_BUILD_CMDS
-	$(MAKE) -C $(@D)/src CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" \
 		CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -ffast-math -c" \
 		app rds_wav
 endef
