From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  6 Dec 2018 05:34:02 +0100
Subject: [Buildroot] [PATCH v2 5/5] pkg-luarocks: add per package upgrade
 target
In-Reply-To: <20181206043402.31755-1-francois.perrad@gadz.org>
References: <20181206043402.31755-1-francois.perrad@gadz.org>
Message-ID: <20181206043402.31755-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-luarocks.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index f0985433b..78d6c325f 100644
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
-- 
2.17.1
