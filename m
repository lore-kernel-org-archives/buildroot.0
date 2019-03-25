From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 22:13:17 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/musl: remove
 rcrt1.o from target installation
Message-ID: <20190325211649.4AA4A81807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5219bb25bf28939d23d876b069911228b3fc41d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

rcrt1.o is a new startup for "static-pie" apps, and only needed for
building, should not end up in the target filesystem.

Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit de5fef8c0482889743fb27542ccb013c10f1db8a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musl/musl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 90c753926e..ff807c0cba 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -58,7 +58,7 @@ endef
 define MUSL_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) install-libs
-	$(RM) $(addprefix $(TARGET_DIR)/lib/,crt1.o crtn.o crti.o Scrt1.o)
+	$(RM) $(addprefix $(TARGET_DIR)/lib/,crt1.o crtn.o crti.o rcrt1.o Scrt1.o)
 endef
 
 $(eval $(generic-package))
