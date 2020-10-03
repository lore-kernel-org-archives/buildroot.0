From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat,  3 Oct 2020 19:08:24 +0200
Subject: [Buildroot] [PATCH] package/python-cycler: drop redundant
 python|python3 dependencies
Message-ID: <20201003170825.8873-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All the python packages are inside a

if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3

conditional, so no need to repeat it in the Config.in.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cycler/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-cycler/Config.in b/package/python-cycler/Config.in
index 854873c969..813bc69dd4 100644
--- a/package/python-cycler/Config.in
+++ b/package/python-cycler/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_CYCLER
 	bool "python-cycler"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  Creates a Cycler objects much like cycler, but
 	  includes input validation.
-- 
2.20.1
