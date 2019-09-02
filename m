From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:14:50 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/libpri: add -fPIC
Message-ID: <20190902151045.1F49E8A2D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8db2876815ddcdcb8adebc3c36e591e151aac22b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=11961

[Retrieved (and updated to keep line under 80 characters) from:
https://bugs.buildroot.org/show_bug.cgi?id=11961]
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit fe9e709254c3bae8da5428f06a37900269537b64)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
