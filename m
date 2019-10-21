From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 23:28:53 +0200
Subject: [Buildroot] [git commit] package/python-asgiref: properly order
 "depends on" vs. bool
Message-ID: <20191021212233.76DE083AE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a398e8bdefb87339740924e7ab6a5f2afe9f830
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes a check-package warning introduced by commit
9b746f8 ("package/python-asgiref: drop Python 2 support")
Fixes:

$: ./utils/check-package package/python-asgiref/*
package/python-asgiref/Config.in:3: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)
34 lines processed
1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-asgiref/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-asgiref/Config.in b/package/python-asgiref/Config.in
index 71069bf48b..e131f476c2 100644
--- a/package/python-asgiref/Config.in
+++ b/package/python-asgiref/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_ASGIREF
-	depends on BR2_PACKAGE_PYTHON3
 	bool "python-asgiref"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  ASGI is a standard for Python asynchronous web apps and
 	  servers to communicate with each other, and positioned as
