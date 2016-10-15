From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:13 +0200
Subject: [Buildroot] [git commit] ti-utils: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.B063581F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19b22278035bde768a5d67712305724dec98a46e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ti-utils/ti-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 06aca6d..cfb0cb8 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -14,7 +14,7 @@ TI_UTILS_CFLAGS = `$(PKG_CONFIG_HOST_BINARY) --cflags libnl-genl-3.0`
 TI_UTILS_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs libnl-genl-3.0`
 
 define TI_UTILS_BUILD_CMDS
-	$(MAKE1) NFSROOT="$(STAGING_DIR)" \
+	$(TARGET_MAKE_ENV) $(MAKE1) NFSROOT="$(STAGING_DIR)" \
 		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(TI_UTILS_CFLAGS)" \
 		LIBS="$(TI_UTILS_LIBS)" -C $(@D) all
 endef
