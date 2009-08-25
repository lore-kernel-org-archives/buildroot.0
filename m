From: Will Newton <will.newton@gmail.com>
Date: Tue, 25 Aug 2009 13:08:39 +0100
Subject: [Buildroot] [PATCH] package/Makefile.autotools.in: Add
	$(PKG)_AUTORECONF_OPT variable.
Message-ID: <87a5b0800908250508n6e9e23a7q2de0a1da16c26ea8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow options to be passed to the autoreconf script if necessary.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/Makefile.autotools.in |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index d6da7e8..c366bee 100644
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
1.5.5.2
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-package-Makefile.autotools.in-Add-PKG-_AUTORECONF.patch
Type: text/x-patch
Size: 1796 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090825/7e82ca26/attachment.bin>
