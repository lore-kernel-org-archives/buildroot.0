From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:12:47 +0200
Subject: [Buildroot] [git commit] noip: add $(TARGET_MAKE_ENV) before $(MAKE)
Message-ID: <20151021201411.EB95F80790@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2683c7e515a29214f36032b0573db963f05bf11e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For consistency reasons, this commit adjusts the noip package to pass
$(TARGET_MAKE_ENV) in the environment when calling $(MAKE).

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/noip/noip.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index 98edfca..a61d141 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -12,8 +12,8 @@ NOIP_LICENSE_FILES = COPYING
 
 define NOIP_BUILD_CMDS
 	$(SED) "/^#define CONFIG_FILENAME/ s/PREFIX//" $(@D)/noip2.c
-	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
-		PREFIX=/usr CONFDIR=/etc
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" PREFIX=/usr CONFDIR=/etc
 endef
 
 define NOIP_INSTALL_TARGET_CMDS
