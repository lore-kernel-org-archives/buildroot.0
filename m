From: Jan Heylen <heyleke@gmail.com>
Date: Fri,  6 Mar 2015 06:43:15 +0100
Subject: [Buildroot] [PATCH 1/1] docs/manual: add host package documentation
Message-ID: <1425620595-4032-1-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jan Heylen <heyleke@gmail.com>
---
 docs/manual/adding-packages-directory.txt | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 8a88282..9abef23 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -49,6 +49,39 @@ supposed to contain anything but the 'bare' name of the package.
 source "package/libfoo/Config.in"
 --------------------------
 
+
+=== Target packages with a host part
+
+For packages having a host part, there are two options:
+Either the host packages is only required for one or more target packages
+to be build. In that case, add a host-<foo> to each of the packages +depends+
+or +select+.
+
+Or if it is feasible that the user wants to be able to select or deselect the
+host package, you can use the +Config.in.host+ file. This file will contain the
+option descriptions related to our +host-<foo>+ software that will be used
+and displayed in the configuration tool. It should basically contain:
+
+---------------------------
+config BR2_PACKAGE_HOST_FOO
+	bool "host foo"
+	help
+	  This is a comment that explains what foo for the host is.
+
+	  http://foosoftware.org/foo/
+---------------------------
+
+The same coding style and options as for the +Config.in+ file are valid.
+
+Finally you have to add your new +libfoo/Config.in.host+ to
++package/Config.in.host+. The files included there are 'sorted alphabetically'
+and are 'NOT' supposed to contain anything but the 'bare' name of the package.
+
+--------------------------
+source "package/foo/Config.in.host"
+--------------------------
+
+
 [[depends-on-vs-select]]
 ==== Choosing +depends on+ or +select+
 
-- 
1.9.1
