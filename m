From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:54:30 +0200
Subject: [Buildroot] [git commit] fmlib: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161029135923.97E517FEB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da87f590ddf1b804779facad7c1e626301f5e488
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And drop FMLIB_MAKE_ENV which is non-existant as pointed by Arnout.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fmlib/fmlib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 42cdc27..16e8176 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -31,7 +31,7 @@ endef
 
 define FMLIB_INSTALL_STAGING_CMDS
 	$(RM) $(STAGING_DIR)/usr/lib/libfm.a
-	$(FMLIB_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPTS) -C $(@D) install-libfm-$(FMLIB_ARCHTYPE)
+	$(TARGET_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPTS) -C $(@D) install-libfm-$(FMLIB_ARCHTYPE)
 endef
 
 $(eval $(generic-package))
