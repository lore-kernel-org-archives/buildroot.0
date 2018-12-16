From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 21:20:42 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/libpjsip: disable
 build of test binaries
Message-ID: <20181216201819.BC5C08B62D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbaa1b31e8b3d18b724ab9395c99ccbf6340830f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8e50901517f8adf7c5b3a273a0876c836bd3292f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index db9e474be7..b3c439d51c 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -67,4 +67,7 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 LIBPJSIP_DEPENDENCIES += util-linux
 endif
 
+# disable build of test binaries
+LIBPJSIP_MAKE_OPTS = lib
+
 $(eval $(autotools-package))
