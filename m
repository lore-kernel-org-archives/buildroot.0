From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 14 Jan 2017 20:08:29 +0200
Subject: [Buildroot] [PATCH] jasper: disable PDF documentation generation
Message-ID: <b17e9f42b1d2e17bb543c9d5b3b17e80a95c38d0.1484417309.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't need the PDF document on target. This also avoids incompatible host
Latex packages.

Fixes:
http://autobuild.buildroot.net/results/e60/e60c4a71a08aebadd0bc3fb95a57a4a223e4b6fa/
http://autobuild.buildroot.net/results/4ec/4ec8a1735590a3cad4b74630b4b6bdd2e3a7eec8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/jasper/jasper.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index f4db8c492064..d659682a56e9 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -10,6 +10,8 @@ JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer License Version 2.0
 JASPER_LICENSE_FILES = LICENSE
 JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
+JASPER_CONF_OPTS = -DCMAKE_DISABLE_FIND_PACKAGE_DOXYGEN=TRUE \
+		-DCMAKE_DISABLE_FIND_PACKAGE_LATEX=TRUE
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
-- 
2.11.0
