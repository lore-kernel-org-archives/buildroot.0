From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 15:30:24 +0200
Subject: [Buildroot] [git commit] package/xerces: fix typo,
 which re-enables package
Message-ID: <20200913132235.B073B8A4B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e61a4ce04fee1613eea9b703348c15906de9013
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4e60247be67a8e7f9937a8bf2b123ddb2be9dad2 ("package/xerces: fix
coding style in Config.in") introduced a silly typo in the xerces
package depends on... which effectively made it impossible to enable
this package as the "USE_WCHAR" option does not exist.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xerces/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index d3f4967413..828b5dd2a0 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XERCES
 	bool "xerces-c++"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on USE_WCHAR
+	depends on BR2_USE_WCHAR
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
 
