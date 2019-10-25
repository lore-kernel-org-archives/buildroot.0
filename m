From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 25 Oct 2019 03:16:30 -0500
Subject: [Buildroot] [PATCH v2] package/jitterentropy-library: fix build
 failure due to missing -fPIC
Message-ID: <20191025081630.20102-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jitterentropy-library needs -fPIC flag to build so add it when building.

Fixes:
http://autobuild.buildroot.net/results/505/5059207ec9ab0b502717626cc84956dafd0c3c32/

[Original: http://patchwork.ozlabs.org/patch/1182068/]
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
NOTE: Need this series applied first
http://patchwork.ozlabs.org/project/buildroot/list/?series=138439

Changes v1 -> v2
[Arnout
 - Suggested reordering of TARGET_CONFIGURE_OPTS which allows the
   project to stack options ontop of the base vs overriding
---
 package/jitterentropy-library/jitterentropy-library.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index a8e15ce792..3e8cbe8585 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -24,7 +24,7 @@ endif
 
 
 define JITTERENTROPY_LIBRARY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 		$(JITTERENTROPY_LIBRARY_BUILD_TARGETS)
 endef
 
-- 
2.17.1
