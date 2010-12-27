From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Dec 2010 21:32:05 +0100
Subject: [Buildroot] [git commit master 1/1] lsof: fix build after
	gentargets conversion
Message-ID: <20101227203241.7387589001@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=50e0338bc86955bd982a43317a49175d16868dae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the gentargets conversion, the tarball is extracted directly in the
source directory, so adjust paths to match.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lsof/lsof.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 05365da..167cb20 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -18,16 +18,16 @@ endif
 ifeq ($(BR2_USE_WCHAR),)
 define LSOF_CONFIGURE_WCHAR_FIXUPS
 	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' \
-		$(@D)/lsof_$(LSOF_VERSION)_src/machine.h
+		$(@D)/machine.h
 	$(SED) 's,^#define[[:space:]]*WIDECHARINCL.*,,' \
-		$(@D)/lsof_$(LSOF_VERSION)_src/machine.h
+		$(@D)/machine.h
 endef
 endif
 
 ifeq ($(BR2_ENABLE_LOCALE),)
 define LSOF_CONFIGURE_LOCALE_FIXUPS
 	$(SED) 's,^#define[[:space:]]*HASSETLOCALE.*,#undef HASSETLOCALE,' \
-		$(@D)/lsof_$(LSOF_VERSION)_src/machine.h
+		$(@D)/machine.h
 endef
 endif
 
@@ -60,7 +60,7 @@ define LSOF_UNINSTALL_TARGET_CMDS
 endef
 
 define LSOF_CLEAN_CMDS
-	-$(MAKE) -C $(@D)/lsof_$(LSOF_VERSION)_src clean
+	-$(MAKE) -C $(@D) clean
 endef
 
 $(eval $(call GENTARGETS,package,lsof))
-- 
1.7.2.2
