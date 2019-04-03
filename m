From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Apr 2019 22:48:56 +0200
Subject: [Buildroot] [PATCH] infra/pkg-generic: simplify dependency tree
Message-ID: <20190403204856.27629-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Why do things simply, when we can do it complicated?

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c86338b856..a83813e28d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -865,7 +865,7 @@ $(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPEND
 $(1)-show-dependency-tree: $$(patsubst %,%-show-dependency-tree,$$($(2)_FINAL_ALL_DEPENDENCIES))
 	@:
 	$$(info $(1): $(4) $$(if $$($(2)_IS_VIRTUAL),virtual,$$($(2)_DL_VERSION)))
-	$$(info $(1) -> $$(foreach d,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(d)))
+	$$(info $(1) -> $$($(2)_FINAL_ALL_DEPENDENCIES))
 
 $(1)-graph-depends: graph-depends-requirements
 	$(call pkg-graph-depends,$(1),--direct)
-- 
2.14.1
