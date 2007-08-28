From: Simon Pasch <fpasch@googlemail.com>
Date: Tue, 28 Aug 2007 10:09:49 +0200
Subject: [Buildroot] jpeg-package with wrong include-dir
Message-ID: <f90898420708280109x64309671h96426a22b52b5eaf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Shouldn't jpeg-package use staging_dir/usr/include instead of
staging_dir/include?! (gtk2-package wants the header files to be there...)


--- buildroot.old/package/jpeg.mk	2007-08-28 09:59:45.000000000 +0200
+++ buildroot/package/jpeg.mk	2007-08-28 10:00:28.000000000 +0200
@@ -54,7 +54,7 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--enable-shared \
