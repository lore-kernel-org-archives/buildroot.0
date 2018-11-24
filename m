From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 13:01:28 +0100
Subject: [Buildroot] [git commit] dante: disable pam
Message-ID: <20181202071558.A3CB382855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d8abc7c1aca00a8ee514b38d88744ccd9ec194f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/5222592f2052e18c184fae42214c112e7f39be6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dante/dante.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index 687567e100..a147aa36dc 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -12,7 +12,7 @@ DANTE_LICENSE_FILES = LICENSE
 # Dante uses a *VERY* old configure.ac
 DANTE_LIBTOOL_PATCH = NO
 
-DANTE_CONF_OPTS += --disable-client --disable-preload
+DANTE_CONF_OPTS += --disable-client --disable-preload --without-pam
 
 define DANTE_INSTALL_CONFIG_FILE
 	$(INSTALL) -D -m 644 $(@D)/example/sockd.conf \
