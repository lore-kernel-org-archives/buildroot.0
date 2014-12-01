From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:22:34 +0100
Subject: [Buildroot] [git commit] gnupg: don't bother removing a man page
Message-ID: <20141201223450.64AC380048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05ef5316d0f6a74187cad0d0778f12ac044f8517
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The target-finalize target in the main Makefile removes
$(TARGET_DIR)/usr/share/man entirely, so there's no point in having
some package specific logic to remove man pages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg/gnupg.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index e7c403a..c0bf88c 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -39,8 +39,7 @@ endif
 
 ifneq ($(BR2_PACKAGE_GNUPG_GPGV),y)
 define GNUPG_REMOVE_GPGV
-	rm -f $(TARGET_DIR)/usr/bin/gpgv \
-		$(TARGET_DIR)/usr/share/man/man1/gpgv.1
+	rm -f $(TARGET_DIR)/usr/bin/gpgv
 endef
 GNUPG_POST_INSTALL_TARGET_HOOKS += GNUPG_REMOVE_GPGV
 endif
