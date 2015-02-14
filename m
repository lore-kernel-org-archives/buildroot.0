From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 16:34:26 +0100
Subject: [Buildroot] [git commit branch/next] kconfig infra: remove all
	install stamp files
Message-ID: <20150214163206.61BD580457@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9fec0ad76133b2846f798496307909016ff2bd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some packages (like linux) may install things inside images/ as well, so
remove the associated stamp file after running the configuration editor.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index f76c7a7..8e68315 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -71,7 +71,7 @@ $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) $$(subst $(1)-,,$$@)
 	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
-	rm -f $$($(2)_DIR)/.stamp_{target,staging}_installed
+	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
 
 $(1)-savedefconfig: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
