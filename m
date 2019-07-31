From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jul 2019 23:38:28 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/python3: drop
 unrecognized option
Message-ID: <20190731213630.95F97813FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c86a7790c8cb0ee21f6a6f0bcfa2e5cc56cd593
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

--enable-old-stdlib-cache is not recognozed since at least version
3.6.3, see:
http://autobuild.buildroot.org/results/b957f956100fc36c7d5ffab1d7df41a65ae52ded

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 440eaa41d2514c51eaa25e138d2980c06189d568)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 2211cfed81..ca834059fb 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -70,10 +70,6 @@ else
 PYTHON3_CONF_OPTS += --with-expat=none
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
-PYTHON3_CONF_OPTS += --enable-old-stdlib-cache
-endif
-
 ifeq ($(BR2_PACKAGE_PYTHON3_SQLITE),y)
 PYTHON3_DEPENDENCIES += sqlite
 else
