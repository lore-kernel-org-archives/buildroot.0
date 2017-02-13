From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 22:18:10 +0100
Subject: [Buildroot] [git commit] package/classpath: Don't depend on jamvm
Message-ID: <20170213212116.BB83A81D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a75ab1fc1dcc7eee8668b1c3c19b703f1390b2cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNU classpath can exist without jamvm, so don't depend on it.

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
