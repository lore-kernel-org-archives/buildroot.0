From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jun 2018 20:23:27 +0200
Subject: [Buildroot] [git commit] cifs-utils: disable man page generation
Message-ID: <20180603182153.9262D83453@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57d16fd480d3eb57822e634e409fb0bbc4dd475b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot does not generate documentation for target.

This fixes the build on hosts where the rst2man command does not support
the --syntax-highlight parameter.

Fixes:
http://autobuild.buildroot.net/results/265/2655c0e1fa3ad0a10b4aed39a17feead94e47bfb/
http://autobuild.buildroot.net/results/92d/92d7c608f717bbfe01ecfb9bc9604cb303d8594c/
http://autobuild.buildroot.net/results/4b9/4b95404a89a595ca9c1e3df912169e9d36ff2bd7/

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cifs-utils/cifs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index bfbdd56923..3456cd9198 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -15,7 +15,7 @@ CIFS_UTILS_DEPENDENCIES = host-pkgconf
 
 # Let's disable PIE unconditionally. We want PIE to be enabled only by
 # the global BR2_RELRO_FULL option.
-CIFS_UTILS_CONF_OPTS = --disable-pie
+CIFS_UTILS_CONF_OPTS = --disable-pie --disable-man
 
 ifeq ($(BR2_PACKAGE_KEYUTILS),y)
 CIFS_UTILS_DEPENDENCIES += keyutils
