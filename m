From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 5 Nov 2010 10:27:37 +0100
Subject: [Buildroot] [git commit master 1/1] autotools: fix MESSAGE calls
Message-ID: <20101105092847.1740D8DBA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e1317731c89e0460a836e0772f6204827d7ab02b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 87c3092..b24c2b1 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -138,7 +138,7 @@ $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 # Hook to patch libtool to make it work properly for cross-compilation
 #
 define LIBTOOL_PATCH_HOOK
-	@$(call MESSAGE,"Patching libtool")
+	@$$(call MESSAGE,"Patching libtool")
 	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES" \
 		-a "$$($$(PKG)_AUTORECONF)" != "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
@@ -162,7 +162,7 @@ endif
 # Hook to autoreconf the package if needed
 #
 define AUTORECONF_HOOK
-	@$(call MESSAGE,"Autoreconfiguring")
+	@$$(call MESSAGE,"Autoreconfiguring")
 	$(Q)cd $$($$(PKG)_SRCDIR) && $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
 	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
-- 
1.7.1
