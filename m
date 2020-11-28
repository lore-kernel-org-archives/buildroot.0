From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Nov 2020 11:04:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: also set HAVE_LIBCURL
Message-ID: <20201128100403.1123560-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set HAVE_LIBCURL when libcurl is available to enable genprotimg and
libekmfweb:
https://github.com/ibm-s390-tools/s390-tools/blob/master/README.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/s390-tools/s390-tools.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index dd70efe10b..bb261ff80e 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -19,9 +19,13 @@ S390_TOOLS_MAKE_OPTS = \
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 S390_TOOLS_DEPENDENCIES += libcurl
-S390_TOOLS_MAKE_OPTS += HAVE_CURL=1
+S390_TOOLS_MAKE_OPTS += \
+	HAVE_CURL=1 \
+	HAVE_LIBCURL=1
 else
-S390_TOOLS_MAKE_OPTS += HAVE_CURL=0
+S390_TOOLS_MAKE_OPTS += \
+	HAVE_CURL=0 \
+	HAVE_LIBCURL=0
 endif
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
-- 
2.29.2
