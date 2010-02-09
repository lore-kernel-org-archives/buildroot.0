From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Feb 2010 16:23:52 +0100
Subject: [Buildroot] [git commit master] Bump lighttpd to 1.4.26
Message-ID: <20100209152411.26D6877756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d5d48254dc539dfb3f50d18fa3d72a1effd74267
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1063.

lighttpd 1.4.26 fixes:

* Request parser handling for splitted header data
* FD leak in mod_cgi
* Segfault with broken configs in mod_rewrite/mod_redirect
* An OOM/DoS vulnerability (CVE-2010-0295)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    1 +
 package/lighttpd/lighttpd.mk |    3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6037b24..9f9aa01 100644
--- a/CHANGES
+++ b/CHANGES
@@ -50,6 +50,7 @@
 	#1009: [SECURITY] Bump php to 5.2.12
 	#1015: [SECURITY] Bump bind to 9.5.1-P2
 	#1027: Busybox flash commands conflict with those from mtd-utils
+	#1063: [SECURITY] Update lighttpd to 1.4.26
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 2326722..b17f72c 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -4,10 +4,9 @@
 #
 #############################################################
 
-LIGHTTPD_VERSION = 1.4.25
+LIGHTTPD_VERSION = 1.4.26
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-1.4.x
 LIGHTTPD_LIBTOOL_PATCH = NO
-LIGHTTPD_DEPENDENCIES =
 
 ifneq ($(BR2_LARGEFILE),y)
 LIGHTTPD_LFS:=$(DISABLE_LARGEFILE) --disable-lfs
-- 
1.6.3.3
