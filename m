From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 14:46:27 +0200
Subject: [Buildroot] [git commit] ficl: add missing -fPIC
Message-ID: <20160603124633.35191803F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65512bf8bef8a96c6d2868a12eb1c7464769fd54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fix http://autobuild.buildroot.net/results/dec/dec926ad7d7880c385835ba7b380dd41fd7f3762/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
