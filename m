From: Peter Bouda <pbouda@cidles.eu>
Date: Thu, 28 May 2015 08:22:04 +0100
Subject: [Buildroot] [PATCH 1/1] python-pygame: remove python dependency
Message-ID: <1432797724-5329-1-git-send-email-pbouda@cidles.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the dependency on BR2_PACKAGE_PYTHON it was only possible to
build the package with python2. However, python-pygame works with
python3 so enable it to be built with it.

Signed-off-by: Peter Bouda <pbouda@cidles.eu>
---
 package/python-pygame/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
index f72ee31..932b0f1 100644
--- a/package/python-pygame/Config.in
+++ b/package/python-pygame/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYGAME
 	bool "python-pygame"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_SDL
 	help
 	  Pygame is a cross-platfrom library designed to make it easy to write
-- 
2.1.4
