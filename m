From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:01 +0200
Subject: [Buildroot] [git commit] smstools3: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.736BC81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e546fa328a979b2a5179e8ef3a8ebaaf1df6de4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/smstools3/smstools3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/smstools3/smstools3.mk b/package/smstools3/smstools3.mk
index a1684de..52f9b31 100644
--- a/package/smstools3/smstools3.mk
+++ b/package/smstools3/smstools3.mk
@@ -14,7 +14,7 @@ SMSTOOLS3_CFLAGS += -D NUMBER_OF_MODEMS=$(BR2_PACKAGE_SMSTOOLS3_NB_MODEMS)
 SMSTOOLS3_CFLAGS += -D NOSTATS
 
 define SMSTOOLS3_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(SMSTOOLS3_CFLAGS)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(SMSTOOLS3_CFLAGS)" -C $(@D)
 endef
 
 define SMSTOOLS3_INSTALL_INIT_SYSV
