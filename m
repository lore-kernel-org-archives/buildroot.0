From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat, 18 Sep 2010 14:16:47 +0200
Subject: [Buildroot] [PATCH 3/3] autotools: fix MESSAGE calls
In-Reply-To: <1284812207-31798-1-git-send-email-llandwerlin@gmail.com>
References: <1284812207-31798-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1284812207-31798-4-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/Makefile.autotools.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 1ccf44c..bc813e3 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -142,7 +142,7 @@ $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 # Hook to patch libtool to make it work properly for cross-compilation
 #
 define LIBTOOL_PATCH_HOOK
-	@$(call MESSAGE,"Patching libtool")
+	@$$(call MESSAGE,"Patching libtool")
 	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES" -a \
 	"$$($$(PKG)_AUTORECONF)" != "YES"; then \
 	for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
@@ -160,7 +160,7 @@ endif
 # Hook to autoreconf the package if needed
 #
 define AUTORECONF_HOOK
-	@$(call MESSAGE,"Autoreconfiguring")
+	@$$(call MESSAGE,"Autoreconfiguring")
 	$(Q)cd $$($$(PKG)_SRCDIR) && $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
 	$(Q)if test "$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
-- 
1.7.1
