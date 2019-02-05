From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 20:44:55 +0100
Subject: [Buildroot] [git commit] package/pugixml: force-enable 'long long'
 support to support gcc<4.8
Message-ID: <20190205195502.439CA83689@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=189c63f276fa98ef3a59b6762d87cbe0cd9974ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although pugixml will enable 'long long' support automatically if it detects
C++11 (gcc 4.8+), we would like to support older gcc compilers too.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
