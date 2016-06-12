From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 22:21:57 +0200
Subject: [Buildroot] [git commit] fmlib: use RM macro
Message-ID: <20160612202229.DC95181E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0db6f93ef07cea7a57e3c15f51b7863173b9b20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fmlib/fmlib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index ede4415..405ee14 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -30,7 +30,7 @@ define FMLIB_BUILD_CMDS
 endef
 
 define FMLIB_INSTALL_STAGING_CMDS
-	rm $(STAGING_DIR)/usr/lib/libfm.a -f
+	$(RM) $(STAGING_DIR)/usr/lib/libfm.a
 	$(FMLIB_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPTS) -C $(@D) install-libfm-$(FMLIB_ARCHTYPE)
 endef
 
