From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 13:22:18 +0100
Subject: [Buildroot] [git commit] subversion: security bump to version 1.7.19
Message-ID: <20141221122244.2CB7B80427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d80f5c99fdaf2ffb20e3453236b987301b277b34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-3580: mod_dav_svn DoS from invalid REPORT requests.
CVE-2014-8108: mod_dav_svn DoS from use of invalid transaction names.

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/subversion/subversion.hash |    2 ++
 package/subversion/subversion.mk   |    3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
new file mode 100644
index 0000000..b6a0e88
--- /dev/null
+++ b/package/subversion/subversion.hash
@@ -0,0 +1,2 @@
+# From https://mail-archives.apache.org/mod_mbox/subversion-dev/201412.mbox/%3C548F4EEB.7030601 at apache.org%3E
+sha1	bb3cd135bbd856e7f0f2d59313f075b9bbec9848	subversion-1.7.19.tar.gz
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 5f37a87..3c6c3f0 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.7.18
+SUBVERSION_VERSION = 1.7.19
 SUBVERSION_SITE = http://archive.apache.org/dist/subversion
 SUBVERSION_LICENSE = Apache-2.0
 SUBVERSION_LICENSE_FILES = LICENSE
-
 SUBVERSION_DEPENDENCIES = host-pkgconf apr apr-util expat neon zlib sqlite
 SUBVERSION_CONF_OPTS = \
 	--with-expat=$(STAGING_DIR)/usr/include:$(STAGING_DIR)/usr/lib: \
