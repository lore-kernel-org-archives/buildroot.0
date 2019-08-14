From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 14 Aug 2019 19:55:45 +0200
Subject: [Buildroot] [PATCH 3/4] package/libpri: add -fPIC
In-Reply-To: <20190814175546.14670-1-fontaine.fabrice@gmail.com>
References: <20190814175546.14670-1-fontaine.fabrice@gmail.com>
Message-ID: <20190814175546.14670-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=11961

[Retrieved (and updated to keep line under 80 characters) from:
https://bugs.buildroot.org/show_bug.cgi?id=11961]
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpri/libpri.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libpri/libpri.mk b/package/libpri/libpri.mk
index 2e2d0e8a6c..e1fa2abcf5 100644
--- a/package/libpri/libpri.mk
+++ b/package/libpri/libpri.mk
@@ -33,7 +33,8 @@ endif
 LIBPRI_UTILS = pridump pritest rosetest testprilib
 
 define LIBPRI_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC" -C $(@D) \
 		$(LIBPRI_LIBS) $(LIBPRI_UTILS)
 endef
 
-- 
2.20.1
