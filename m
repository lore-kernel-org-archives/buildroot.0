From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:07:15 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/xerces: fix typo,
 which re-enables package
Message-ID: <20200915185503.AD42A868C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef2ce170c6e53538c65a9893d8b000f6b7ddd3e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Commit 4e60247be67a8e7f9937a8bf2b123ddb2be9dad2 ("package/xerces: fix
coding style in Config.in") introduced a silly typo in the xerces
package depends on... which effectively made it impossible to enable
this package as the "USE_WCHAR" option does not exist.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6e61a4ce04fee1613eea9b703348c15906de9013)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
