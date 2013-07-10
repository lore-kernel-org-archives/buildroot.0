From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Jul 2013 15:39:16 -0300
Subject: [Buildroot] [PATCH 1/3] python external modules: reorder menu entry
Message-ID: <1373481558-30193-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reorder the external python modules menu entry so that it belongs under
python(2) and not under python3 to avoid confusion.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index c58f61c..fbbb6e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -344,7 +344,6 @@ endmenu
 endif
 source "package/php/Config.in"
 source "package/python/Config.in"
-source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON
 menu "external python modules"
 source "package/python-bottle/Config.in"
@@ -362,6 +361,7 @@ source "package/python-setuptools/Config.in"
 source "package/python-thrift/Config.in"
 endmenu
 endif
+source "package/python3/Config.in"
 source "package/ruby/Config.in"
 source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
-- 
1.8.1.5
