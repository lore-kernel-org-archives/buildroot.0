From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Apr 2012 21:55:04 +0200
Subject: [Buildroot] [git commit] neon: use select rather than 'depends on'
	for xml dependencies
Message-ID: <20120404200933.1EF3496A02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4fbff28b990276c9a37d04b4e1ab947f10b87ea4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to how we recently changed dbus. At the same time also reorder
options to put 'none' option in front (default).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neon/Config.in |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/neon/Config.in b/package/neon/Config.in
index 53cc8f5..92af8da 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -24,27 +24,27 @@ choice
 	depends on BR2_PACKAGE_NEON
 	help
 	  Select which XML library to use...
+	  none       do not build with XML support
 	  expat      use expat
 	  libxml2    use libxml2
-	  none       do not build with XML support
+
+config BR2_PACKAGE_NEON_NOXML
+	bool "none"
+	help
+	  none       don't use XML, if this is the only option
+	             and you want XML support, you must choose
+		     XML handling below.
 
 config BR2_PACKAGE_NEON_EXPAT
 	bool "expat"
-	depends on BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_EXPAT
 	help
 	  expat      use expat, a library for parsing XML.
 
 config BR2_PACKAGE_NEON_LIBXML2
 	bool "libxml2"
-	depends on BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXML2
 	help
 	  libxml2    use libxml2, a library to read, modify and
 	             write XML and HTML files.
-
-config BR2_PACKAGE_NEON_NOXML
-	bool "none"
-	help
-	  none       don't use XML, if this is the only option
-	             and you want XML support, you must choose
-		     XML handling below.
 endchoice
