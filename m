From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Apr 2015 21:05:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/clamav: bump version to 0.98.7,
	enable ipv6 support
Message-ID: <1430334334-31393-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clamav uses AC_TRY_RUN in m4/reorganization/code_checks/ipv6.m4 to check
for ipv6 support, which is not cross-compile safe. Since buildroot
supports ipv6 out-of-the-box now this patch forces ipv6 support.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/clamav.hash |    4 ++--
 package/clamav/clamav.mk   |    5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 7913388..21983f9 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,2 +1,2 @@
-# From http://sourceforge.net/projects/clamav/files/clamav/0.98.6/
-sha1	03cb9a20a08aba9176b1f58d5527d06ec8261f9c	clamav-0.98.6.tar.gz
+# From http://sourceforge.net/projects/clamav/files/clamav/0.98.7/
+sha1	c9793d67c041e2b944116d912f8681c8bd6e4432	clamav-0.98.7.tar.gz
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 6a8fddf..e6a1195 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.98.6
+CLAMAV_VERSION = 0.98.7
 CLAMAV_SITE = http://sourceforge.net/projects/clamav/files/clamav/$(CLAMAV_VERSION)
 CLAMAV_LICENSE = GPLv2
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
@@ -16,7 +16,8 @@ CLAMAV_DEPENDENCIES = openssl zlib $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 # mmap cannot be detected when cross-compiling, needed for mempool support
 CLAMAV_CONF_ENV = \
-	ac_cv_c_mmap_private=yes
+	ac_cv_c_mmap_private=yes \
+	have_cv_ipv6=yes
 
 CLAMAV_CONF_OPTS = \
 	--with-dbdir=/var/lib/clamav \
-- 
1.7.10.4
