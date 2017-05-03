From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 May 2017 17:24:43 +0200
Subject: [Buildroot] [git commit] picocom: force target LDFLAGS
Message-ID: <20170503152613.665477FAD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=add51b89bfb5ebe7b533e14714088a4d3912c9a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows a static build of picocom when BR2_STATIC_LIBS=y but the toolchain
provides static and shared libraries.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/picocom/picocom.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 07bda0e..4e25556 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -10,7 +10,8 @@ PICOCOM_LICENSE = GPL-2.0+
 PICOCOM_LICENSE_FILES = LICENSE.txt
 
 define PICOCOM_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
 endef
 
 define PICOCOM_INSTALL_TARGET_CMDS
