From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  3 Jun 2016 11:32:31 +0200
Subject: [Buildroot] [PATCH] ficl: add missing -fPIC
Message-ID: <1464946351-5489-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix http://autobuild.buildroot.net/results/dec/dec926ad7d7880c385835ba7b380dd41fd7f3762/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ficl/ficl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
index 6c212a6..65df146 100644
--- a/package/ficl/ficl.mk
+++ b/package/ficl/ficl.mk
@@ -39,7 +39,7 @@ endif
 
 define FICL_BUILD_CMDS
 	$(MAKE) -C $(@D) -f Makefile.linux $(TARGET_CONFIGURE_OPTS) \
-		CPPFLAGS="$(TARGET_CPPFLAGS) -I. -Dlinux" $(FICL_BUILD_TARGETS)
+		CFLAGS="$(TARGET_CFLAGS) -fPIC -I. -Dlinux" CPPFLAGS="" $(FICL_BUILD_TARGETS)
 endef
 
 define FICL_INSTALL_STAGING_CMDS
-- 
1.9.1
