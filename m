From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Feb 2020 10:46:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: annotate _IGNORE_CVES for
 CVE-2009-3654
Message-ID: <20200229094609.2451566-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unspecified vulnerability in Boost before 6.x-1.03, a module for Drupal,
allows remote attackers to create new webroot directories via unknown
attack vectors.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/boost.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 322429a10c..c9e80266e0 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -11,6 +11,9 @@ BOOST_INSTALL_STAGING = YES
 BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
 
+# module for Drupal
+BOOST_IGNORE_CVES += CVE-2009-3654
+
 # keep host variant as minimal as possible
 HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
-- 
2.25.0
