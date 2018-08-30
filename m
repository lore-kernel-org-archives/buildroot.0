From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 30 Aug 2018 18:46:16 +0200
Subject: [Buildroot] [PATCH 1/1] expat: disable docbook
Message-ID: <20180830164616.6288-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/3a351ddd9b42b090e4a69ac480b7a16397699f6c
 - http://autobuild.buildroot.net/results/41402af8bd102b35083e34c53c5f2e8a266dc63e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 61f3176312..548ec826a0 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -13,5 +13,8 @@ HOST_EXPAT_DEPENDENCIES = host-pkgconf
 EXPAT_LICENSE = MIT
 EXPAT_LICENSE_FILES = COPYING
 
+EXPAT_CONF_OPTS = --without-docbook
+HOST_EXPAT_CONF_OPTS = --without-docbook
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.14.1
