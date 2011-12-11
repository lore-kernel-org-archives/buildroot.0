From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Dec 2011 12:25:57 -0300
Subject: [Buildroot] [PATCH 2/5] vsftpd: bump to version 2.3.4
In-Reply-To: <1323617160-4360-1-git-send-email-gustavo@zacarias.com.ar>
References: <1323617160-4360-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1323617160-4360-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump vsftpd to version 2.3.4
Fixes build issues with binutils 2.22+ and changed upstream URL

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...tch => vsftpd-2.3.4-dont-force-largefile.patch} |    0
 package/vsftpd/vsftpd.mk                           |    5 ++---
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename package/vsftpd/{vsftpd-2.3.2-dont-force-largefile.patch => vsftpd-2.3.4-dont-force-largefile.patch} (100%)

diff --git a/package/vsftpd/vsftpd-2.3.2-dont-force-largefile.patch b/package/vsftpd/vsftpd-2.3.4-dont-force-largefile.patch
similarity index 100%
rename from package/vsftpd/vsftpd-2.3.2-dont-force-largefile.patch
rename to package/vsftpd/vsftpd-2.3.4-dont-force-largefile.patch
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 4490287..e67ab4a 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -3,10 +3,9 @@
 # vsftpd
 #
 #############################################################
-VSFTPD_VERSION = 2.3.2
-VSFTPD_SOURCE = vsftpd-$(VSFTPD_VERSION).tar.gz
-VSFTPD_SITE = ftp://vsftpd.beasts.org/users/cevans
 
+VSFTPD_VERSION = 2.3.4
+VSFTPD_SITE = https://security.appspot.com/downloads
 VSFTPD_LIBS = -lcrypt
 
 define VSFTPD_ENABLE_SSL
-- 
1.7.3.4
