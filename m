From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 15 Oct 2019 20:05:18 +0200
Subject: [Buildroot] [PATCH] package/python-jaraco-functools: fix Config.in
 indentation
Message-ID: <1571162718-8401-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

$: ./utils/check-package package/python-jaraco-functools/*
package/python-jaraco-functools/Config.in:5: continuation line should be indented using tabs
30 lines processed
1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/python-jaraco-functools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-jaraco-functools/Config.in b/package/python-jaraco-functools/Config.in
index e07c313..62669db 100644
--- a/package/python-jaraco-functools/Config.in
+++ b/package/python-jaraco-functools/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS
 	bool "python-jaraco-functools"
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE \
-               if BR2_PACKAGE_PYTHON # runtime
+	       if BR2_PACKAGE_PYTHON # runtime
 	help
 	  Additional functools in the spirit of stdlib?s
 	  functools.
-- 
2.7.4
