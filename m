From: Antoine Tenart <atenart@kernel.org>
Date: Wed, 10 Feb 2021 19:51:58 +0100
Subject: [Buildroot] [PATCH] package/refpolicy: do not use the bare target
 in the configuration step
Message-ID: <20210210185158.1254415-1-atenart@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'bare' target is a clean target, removing generated files from
previous builds. Here in Buildroot we'll only build the refpolicy from a
clean state and we don't need to execute this target. Remove it.

Signed-off-by: Antoine Tenart <atenart@kernel.org>
---
 package/refpolicy/refpolicy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 0194708b378d..62d96e68043c 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -108,7 +108,7 @@ define REFPOLICY_CONFIGURE_CMDS
 	$(if $(REFPOLICY_EXTRA_MODULES_DIRS), \
 		$(REFPOLICY_COPY_EXTRA_MODULES)
 	)
-	$(REFPOLICY_MAKE) -C $(@D) bare conf
+	$(REFPOLICY_MAKE) -C $(@D) conf
 	$(REFPOLICY_CONFIGURE_MODULES)
 endef
 
-- 
2.29.2
