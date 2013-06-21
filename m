From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 21 Jun 2013 12:53:30 +0200
Subject: [Buildroot] [PATCH] libserial: prevent documentation from being
	build
Message-ID: <1371812010-9902-1-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If docbook2pdf is present on the host, the documentation is built, no
matter all the --disable-doc*
But forcing ac_cv_prog_DOCBOOK2PDF to no tells configure that
docbook2pdf is absent, and thus the documentation is not built.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/libserial/libserial.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libserial/libserial.mk b/package/libserial/libserial.mk
index c5142c5..d2c928b 100644
--- a/package/libserial/libserial.mk
+++ b/package/libserial/libserial.mk
@@ -10,4 +10,6 @@ LIBSERIAL_INSTALL_STAGING = YES
 LIBSERIAL_LICENSE = GPLv2+
 LIBSERIAL_LICENSE_FILES = COPYING
 
+LIBSERIAL_CONF_ENV = ac_cv_prog_DOCBOOK2PDF=no
+
 $(eval $(autotools-package))
-- 
1.7.10.4
