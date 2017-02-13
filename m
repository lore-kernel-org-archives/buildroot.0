From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Mon, 13 Feb 2017 21:08:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/classpath: Don't depend on jamvm
Message-ID: <20170213200838.21068-1-m.hoffmann@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GNU classpath can exist without jamvm, so don't depend on it.

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
---
 package/classpath/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/classpath/Config.in b/package/classpath/Config.in
index ce71160..caab619 100644
--- a/package/classpath/Config.in
+++ b/package/classpath/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_CLASSPATH
 	bool "classpath"
 	select BR2_NEEDS_HOST_JAR
 	select BR2_NEEDS_HOST_JAVAC
-	depends on BR2_PACKAGE_JAMVM
 	help
 	  GNU Classpath, Essential Libraries for Java, is a GNU
 	  project to create free core class libraries for use with
-- 
2.9.3
