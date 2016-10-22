From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] fio: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132038.13AE37F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=966358d2992393935f318ca325b6fd2299731448
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fio/fio.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 3270629..5c02bc9 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -22,11 +22,11 @@ FIO_DEPENDENCIES += zlib
 endif
 
 define FIO_CONFIGURE_CMDS
-	(cd $(@D); ./configure --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)")
+	(cd $(@D); $(TARGET_MAKE_ENV) ./configure --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)")
 endef
 
 define FIO_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define FIO_INSTALL_TARGET_CMDS
