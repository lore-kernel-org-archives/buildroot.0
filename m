From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 05 Aug 2014 12:36:52 +0200
Subject: [Buildroot] [PATCH 1 of 2 v3] infra/pkg-kconfig: join comments to
 the related code-block
In-Reply-To: <patchbomb.1407235011@localhost>
References: <patchbomb.1407235011@localhost>
Message-ID: <f81734945d5b08517be7.1407235012@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The current layout of comments wrt. to the related code-blocks is a bit
hard to handle visually.

Remove empty lines between the comments and their respective related
code-blocks.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: no changes

 package/pkg-kconfig.mk | 7 -------
 1 file changed, 7 deletions(-)

diff -r df91fcff2e1a -r f81734945d5b package/pkg-kconfig.mk
--- a/package/pkg-kconfig.mk	Wed Apr 30 16:21:53 2014 +0200
+++ b/package/pkg-kconfig.mk	Tue Aug 05 00:06:57 2014 +0200
@@ -32,36 +32,30 @@
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
 
 # Default values
-
 $(2)_KCONFIG_EDITORS ?= menuconfig
 $(2)_KCONFIG_OPT ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
 
 # FOO_KCONFIG_FILE is required
-
 ifndef $(2)_KCONFIG_FILE
 $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
 endif
 
 # The .config file is obtained by copying it from the specified source
 # configuration file, after the package has been patched.
-
 $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) | $(1)-patch
 	$$(INSTALL) -m 0644 $$($(2)_KCONFIG_FILE) $$($(2)_DIR)/.config
 
 # In order to get a usable, consistent configuration, some fixup may be needed.
 # The exact rules are specified by the package .mk file.
-
 $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
 	$$($(2)_KCONFIG_FIXUP_CMDS)
 	$$(Q)touch $$@
 
 # Before running configure, the configuration file should be present and fixed
-
 $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 
 # Configuration editors (menuconfig, ...)
-
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPT) $$(subst $(1)-,,$$@)
@@ -69,7 +63,6 @@
 	rm -f $$($(2)_DIR)/.stamp_{target,staging}_installed
 
 # Target to copy back the configuration to the source configuration file
-
 $(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
