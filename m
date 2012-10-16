From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Oct 2012 22:50:26 -0300
Subject: [Buildroot] [PATCH] vsftpd: bump to version 3.0.2
Message-ID: <1350352226-23133-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump vsftpd to version 3.0.2, closes bug #5330

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ile.patch => vsftpd-dont-force-largefile.patch} |    0
 package/vsftpd/vsftpd.mk                           |    4 +++-
 2 files changed, 3 insertions(+), 1 deletions(-)
 rename package/vsftpd/{vsftpd-2.3.4-dont-force-largefile.patch => vsftpd-dont-force-largefile.patch} (100%)

diff --git a/package/vsftpd/vsftpd-2.3.4-dont-force-largefile.patch b/package/vsftpd/vsftpd-dont-force-largefile.patch
similarity index 100%
rename from package/vsftpd/vsftpd-2.3.4-dont-force-largefile.patch
rename to package/vsftpd/vsftpd-dont-force-largefile.patch
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index ce042c5..8d261c8 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-VSFTPD_VERSION = 2.3.5
+VSFTPD_VERSION = 3.0.2
 VSFTPD_SITE = https://security.appspot.com/downloads
 VSFTPD_LIBS = -lcrypt
+VSFTPD_LICENSE = GPLv2
+VSFTPD_LICENSE_FILES = COPYING
 
 define VSFTPD_ENABLE_SSL
 	$(SED) 's/.*VSF_BUILD_SSL/#define VSF_BUILD_SSL/' $(@D)/builddefs.h
-- 
1.7.8.6
