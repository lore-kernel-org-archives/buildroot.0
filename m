From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 22:45:35 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] dante: disable pam
Message-ID: <20181203215204.1BC6E81E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b987a79c3cae51d3fb35099f1035eff429961a38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes:
 - http://autobuild.buildroot.org/results/5222592f2052e18c184fae42214c112e7f39be6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 982805a32ba210b5f68eec03e0181d9fdda569f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
