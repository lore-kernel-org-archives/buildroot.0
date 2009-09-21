From: Will Newton <will.newton@gmail.com>
Date: Mon, 21 Sep 2009 17:42:22 +0200
Subject: [Buildroot] [git commit master] package/Makefile.autotools.in: Add
	$(PKG)_AUTORECONF_OPT variable.
Message-ID: <20090921154311.CA50E776EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bf5e693d75890f5642e1679af40a687b9189de9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow options to be passed to the autoreconf script if necessary.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/Makefile.autotools.in |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index d4e6160..c4c4b1c 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -30,6 +30,8 @@
 #	list of (package) targets that must be built before foo
 # FOO_AUTORECONF [YES/NO, default NO]
 #	run <autoreconf> before <configure>
+# FOO_AUTORECONF_OPT [default empty]
+#	arguments passed to the <autoreconf> script
 # FOO_LIBTOOL_PATCH [YES/NO, default YES]
 #	Do you want the standard buildroot patch applied to ltmain.sh? (libtool)
 # FOO_USE_CONFIG_CACHE [YES/NO default $(BR2_CONFIG_CACHE)]
@@ -225,7 +227,7 @@ endif
 # Running autoreconf
 $(BUILD_DIR)/%/.stamp_autoconfigured:
 	$(call MESSAGE,"Running autoreconf")
-	$(Q)cd $(@D)/$($(PKG)_SUBDIR) && $(AUTORECONF)
+	$(Q)cd $(@D)/$($(PKG)_SUBDIR) && $(AUTORECONF) $($(PKG)_AUTORECONF_OPT)
 # if the package uses libtool, patch it for cross-compiling in buildroot
 	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 		for i in `find $(@D)/$($(PKG)_SUBDIR) -name ltmain.sh`; do \
@@ -329,6 +331,7 @@ $(2)_SITE			?= \
 	http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/$(1)
 $(2)_DEPENDENCIES		?=
 $(2)_AUTORECONF			?= NO
+$(2)_AUTORECONF_OPT		?=
 $(2)_LIBTOOL_PATCH		?= YES
 $(2)_USE_CONFIG_CACHE   ?= $(if $(BR2_CONFIG_CACHE),YES,NO)
 $(2)_CONF_ENV			?=
-- 
1.6.3.3
