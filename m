From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Oct 2012 23:14:39 +0200
Subject: [Buildroot] [git commit] vsftpd: bump to version 3.0.2
Message-ID: <20121016212109.3710499884@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75f6e1df60b29e8e9d11ce91d548ef5d149c6804
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump vsftpd to version 3.0.2, closes bug #5330

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...ile.patch => vsftpd-dont-force-largefile.patch} |    0
 package/vsftpd/vsftpd.mk                           |    4 +++-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
