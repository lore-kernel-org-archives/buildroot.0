From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 14 Aug 2019 19:55:46 +0200
Subject: [Buildroot] [PATCH 4/4] package/libss7: add -fPIC
In-Reply-To: <20190814175546.14670-1-fontaine.fabrice@gmail.com>
References: <20190814175546.14670-1-fontaine.fabrice@gmail.com>
Message-ID: <20190814175546.14670-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - No autobuilder failures

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libss7/libss7.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libss7/libss7.mk b/package/libss7/libss7.mk
index 541505b264..151b6a61b5 100644
--- a/package/libss7/libss7.mk
+++ b/package/libss7/libss7.mk
@@ -36,7 +36,8 @@ endif
 LIBSS7_UTILS = parser_debug ss7test ss7linktest
 
 define LIBSS7_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC" -C $(@D) \
 		$(LIBSS7_LIBS) $(LIBSS7_UTILS)
 endef
 
-- 
2.20.1
