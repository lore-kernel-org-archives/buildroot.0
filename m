From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 21:51:14 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/matchbox: add
 missing expat dependency
Message-ID: <20200510203114.312C7913C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d914cd2c6afda9b37521860ec2610647ce06d6f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

matchbox selects expat but does not add it to its dependency resulting
in the following build failure:

configure: error: cannot find expat library
make: *** [/home/buildroot/autobuild/run/instance-2/output-1/build/matchbox-1.2/.stamp_configured] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/37021f1d7fcfd890011068a28ce6181dc509e746

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3a784f49eb93cd75111f510a1d366f6ecaa2791f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox/matchbox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index c0a2778b67..4d30a42ca3 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -10,7 +10,7 @@ MATCHBOX_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-win
 MATCHBOX_LICENSE = GPL-2.0+
 MATCHBOX_LICENSE_FILES = COPYING
 
-MATCHBOX_DEPENDENCIES = matchbox-lib
+MATCHBOX_DEPENDENCIES = expat matchbox-lib
 MATCHBOX_CONF_OPTS = \
 	--enable-expat \
 	--disable-gconf \
