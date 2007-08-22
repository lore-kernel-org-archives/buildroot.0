From: Simon Pasch <fpasch@googlemail.com>
Date: Wed, 22 Aug 2007 14:36:00 +0200
Subject: [Buildroot] libdrm with wrong include-dir
Message-ID: <f90898420708220536h695f49bcy3c227fd36784b5d5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Shouldn't libdrm-package use staging_dir/usr/include instead of
staging_dir/include?!



diff -Naur buildroot.old/package/libdrm/libdrm.mk
buildroot/package/libdrm/libdrm.mk
--- buildroot.old/package/libdrm/libdrm.mk	2007-08-22 14:07:12.000000000 +0200
+++ buildroot/package/libdrm/libdrm.mk	2007-08-22 14:09:12.000000000 +0200
@@ -36,7 +36,7 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 	)
