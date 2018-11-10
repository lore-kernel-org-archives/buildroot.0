From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 10 Nov 2018 15:08:32 +0100
Subject: [Buildroot] [PATCH 5/5] pkg-luarocks: add per package upgrade target
In-Reply-To: <20181110140832.9700-1-francois.perrad@gadz.org>
References: <20181110140832.9700-1-francois.perrad@gadz.org>
Message-ID: <20181110140832.9700-6-francois.perrad@gadz.org>
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
index e2b48cfb4..5505cf96a 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -75,6 +75,12 @@ $(call inner-generic-package,$(1),$(2),$(3),$(4))
 # but host-luarocks is required to do the extract
 $$($(2)_TARGET_EXTRACT): | host-luarocks
 
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
