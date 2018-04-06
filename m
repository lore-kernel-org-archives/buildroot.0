From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 16:35:54 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/enlightenment:
 fix meson warning
Message-ID: <20180406165912.C104D83E91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6f7a0e38bb1f15e1553b9cdaf5ad979051e2d15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

--disable-rpath was added by m4/lib-link.m4 with autotools based
buildsystem. Now we use meson, we don't have such option anymore.

The autotools eet-eet and eldbus_codegen options are named respectively
eet and eldbus-codegen with meson.

Fixes:
WARNING: Unknown command line options: "eet-eet, eldbus_codegen, rpath"

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b582d137a121a456635d29735a27a0144a18b75e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/enlightenment/enlightenment.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 17309619ad..0d87119bb3 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -22,10 +22,9 @@ ENLIGHTENMENT_MESON_OPTS += \
 	--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
 	--cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf \
 	-Dedje-cc=$(HOST_DIR)/bin/edje_cc \
-	-Deet-eet=$(HOST_DIR)/bin/eet \
-	-Deldbus_codegen=$(HOST_DIR)/bin/eldbus-codegen \
-	-Dpam=false \
-	-Drpath=false
+	-Deet=$(HOST_DIR)/bin/eet \
+	-Deldbus-codegen=$(HOST_DIR)/bin/eldbus-codegen \
+	-Dpam=false
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 ENLIGHTENMENT_MESON_OPTS += -Dsystemd=true
