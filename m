From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  5 Feb 2019 15:28:26 +0100
Subject: [Buildroot] [PATCH] package/pugixml: force-enable 'long long'
 support to support gcc<4.8
Message-ID: <20190205142826.18285-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Although pugixml will enable 'long long' support automatically if it detects
C++11 (gcc 4.8+), we would like to support older gcc compilers too.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/pugixml/pugixml.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index acf22604c4..8edaddd827 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -10,6 +10,12 @@ PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = readme.txt
 PUGIXML_INSTALL_STAGING = YES
 
+# Pugixml will automatically enable 'long long' support on C++11 compilers,
+# which means gcc 4.8+. As gcc always supports the 'long long' type,
+# force-enable this option to support older gcc versions. See also:
+# https://gcc.gnu.org/onlinedocs/gcc/Long-Long.html
+PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
+
 ifeq ($(BR2_PACKAGE_PUGIXML_XPATH_SUPPORT),)
 PUGIXML_BUILD_DEFINES += PUGIXML_NO_XPATH
 endif
-- 
2.19.2
