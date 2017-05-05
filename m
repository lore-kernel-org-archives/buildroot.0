From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 May 2017 21:35:23 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] picocom: force target
	LDFLAGS
Message-ID: <20170505194757.0C251828A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a33076ffb68b9d90e6a918d4cb86f2740c2c824
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

This allows a static build of picocom when BR2_STATIC_LIBS=y but the toolchain
provides static and shared libraries.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit add51b89bfb5ebe7b533e14714088a4d3912c9a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/picocom/picocom.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 59a749f..e0e817e 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -10,7 +10,8 @@ PICOCOM_LICENSE = GPLv2+
 PICOCOM_LICENSE_FILES = LICENSE.txt
 
 define PICOCOM_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
 endef
 
 define PICOCOM_INSTALL_TARGET_CMDS
