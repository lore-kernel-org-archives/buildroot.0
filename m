From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 19 Jul 2013 14:01:32 +0200
Subject: [Buildroot] [PATCH] trivial: add space in 'bool"package"' construct
	in Config.in
Message-ID: <c92bd20931ef072a188e.1374235292@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In early buildroot, it apparently was customary to have following style in
Config.in files:
    bool"expat"

Nowadays, only two packages remain with this style: diffutils and expat.
This trivial patch lines them up with the style:
    bool "expat"

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/diffutils/Config.in |  2 +-
 package/expat/Config.in     |  2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/diffutils/Config.in b/package/diffutils/Config.in
--- a/package/diffutils/Config.in
+++ b/package/diffutils/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_DIFFUTILS
-	bool"diffutils"
+	bool "diffutils"
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
diff --git a/package/expat/Config.in b/package/expat/Config.in
--- a/package/expat/Config.in
+++ b/package/expat/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_EXPAT
-	bool"expat"
+	bool "expat"
 	help
 	  The Expat XML Parser.
 
