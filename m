From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:46:11 +0100
Subject: [Buildroot] [git commit] package/pkg-luarocks: add per package
 upgrade target
Message-ID: <20181231164201.06C8D83C19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5c6d238cfd64a14aab94b3531cb428d01cec4a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-luarocks.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index f0985433b7..78d6c325f8 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -72,6 +72,12 @@ endif
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
 
+# Upgrade helper
+$(1)-upgrade: host-luarocks
+	$$(LUAROCKS_RUN_CMD) buildroot $$($(2)_NAME_UPSTREAM) $(1)
+
+.PHONY: $(1)-upgrade
+
 endef
 
 ################################################################################
