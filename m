From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:28:53 +0200
Subject: [Buildroot] [git commit] lzip: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132857.EAC3A81941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00a44f89575317bef010d03eea28e617cf56aa90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzip/lzip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 7b1fdf4..c6f0543 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -20,7 +20,7 @@ define HOST_LZIP_CONFIGURE_CMDS
 endef
 
 define LZIP_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define HOST_LZIP_BUILD_CMDS
@@ -28,7 +28,7 @@ define HOST_LZIP_BUILD_CMDS
 endef
 
 define LZIP_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 define HOST_LZIP_INSTALL_CMDS
