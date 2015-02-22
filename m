From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 22 Feb 2015 22:25:07 +0100
Subject: [Buildroot] [PATCH 2/2] package/thrift: remove tests
In-Reply-To: <1424640307-26144-1-git-send-email-romain.naour@openwide.fr>
References: <1424640307-26144-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1424640307-26144-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/thrift/thrift.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 1215aed..eb1af7e 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -55,7 +55,12 @@ define THRIFT_TOOL_NO_HARDCODE
 	$(SED) "s:top_builddir)/compiler/cpp/thrift:THRIFT):" $(@D)/tutorial/Makefile.am
 endef
 
-THRIFT_POST_PATCH_HOOKS += THRIFT_TOOL_NO_HARDCODE
+# Tests in lib/cpp/test are not disabled by --disabe-tests
+define THRIFT_REMOVE_CPP_TEST
+	$(SED) "s:test::" $(@D)/lib/cpp/Makefile.am
+endef
+
+THRIFT_POST_PATCH_HOOKS += THRIFT_TOOL_NO_HARDCODE THRIFT_REMOVE_CPP_TEST
 
 define THRIFT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) THRIFT=$(HOST_DIR)/usr/bin/thrift -C $(@D)
-- 
1.9.3
