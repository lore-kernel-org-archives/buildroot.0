From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  3 Jan 2015 16:59:15 +0100
Subject: [Buildroot] [PATCH] package/python3: disable decimal module
Message-ID: <1420300755-24170-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python3 decimal module needs libmpdecimal >=2.4.1.

Fixes:
  http://autobuild.buildroot.org/results/c9b/c9b6dd19f16a56a16ef441d5b303badab9720bd7/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---

Note that the mpdecimal package cannot currently be upgraded because
its site seems unreachable.
---
 package/python3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 375390f..d459dc3 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -57,6 +57,7 @@ config BR2_PACKAGE_PYTHON3_CURSES
 
 config BR2_PACKAGE_PYTHON3_DECIMAL
 	select BR2_PACKAGE_MPDECIMAL
+	depends on BR2_BROKEN # needs libmpdecimal >=2.4.1
 	bool "decimal module"
 	help
 	  decimal module for Python3.
-- 
2.2.1
