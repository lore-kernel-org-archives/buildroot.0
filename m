From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Jun 2019 14:06:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: drop unrecognized option
Message-ID: <20190623120641.13814-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--enable-old-stdlib-cache is not recognozed since at least version
3.6.3, see:
http://autobuild.buildroot.org/results/b957f956100fc36c7d5ffab1d7df41a65ae52ded

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.20.1
