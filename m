From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Dec 2014 11:08:17 -0300
Subject: [Buildroot] [PATCH 3/6] subversion: security bump to version 1.7.19
In-Reply-To: <1418738900-16150-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418738900-16150-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1418738900-16150-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-3580: mod_dav_svn DoS from invalid REPORT requests.
CVE-2014-8108: mod_dav_svn DoS from use of invalid transaction names.

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/subversion/subversion.hash | 2 ++
 package/subversion/subversion.mk   | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)
 create mode 100644 package/subversion/subversion.hash

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
-- 
2.0.4
