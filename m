From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Dec 2011 22:54:25 +0100
Subject: [Buildroot] [git commit] vsftpd: bump to version 2.3.4
Message-ID: <20111211215606.CF6128F8D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5806dd23ed28818b3787e027647f516f0bef352b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump vsftpd to version 2.3.4
Fixes build issues with binutils 2.22+ and changed upstream URL

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...tch => vsftpd-2.3.4-dont-force-largefile.patch} |    0
 package/vsftpd/vsftpd.mk                           |    5 ++---
 2 files changed, 2 insertions(+), 3 deletions(-)

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
