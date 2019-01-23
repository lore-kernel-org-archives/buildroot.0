From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 11:40:30 +0100
Subject: [Buildroot] [PATCH] package/subversion: security bump to version
 1.9.10
Message-ID: <20190123104030.12528-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Additional fixes for CVE-2017-9800: Malicious server can execute arbitrary
command on client and a number of crash fixes.

https://svn.apache.org/repos/asf/subversion/tags/1.9.10/CHANGES

Drop upstream SHA1 hash as that is no longer listed.  Also add a hash for
the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/subversion/subversion.hash | 9 +++++----
 package/subversion/subversion.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index 6adb57c1ae..be0c8ec931 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,4 +1,5 @@
-# From http://subversion.apache.org/download.cgi#recommended-release
-sha1 874b81749cdc3e88152d103243c3623ac6338388  subversion-1.9.7.tar.bz2
-# From https://www.apache.org/dist/subversion/subversion-1.9.7.tar.bz2.sha512
-sha512 a55efd3edaddbc099450d849fcc6fe5a8d20b85ece966d8ac2fd73ee9cb4255a0349bbcfceb4e9fca6daf054ce7c648eff8d273c6873f5dade6e62dcea7eeb2b  subversion-1.9.7.tar.bz2
+# From https://www.apache.org/dist/subversion/subversion-1.9.10.tar.bz2.sha512
+sha512 58ac11078e0e5a1720199e5c66da76e7a20b86d02edcb8d313f98e2ddc74ae70aa3e0763a7d8a8fcb5a1fd7d65186829625ff110d78028b1c447e91f420d6f48 subversion-1.9.10.tar.bz2
+
+# Locally calculated
+sha256 3202942c1aba495fd17390618dedc1d3542815c5bc11958da7fd98c985abc11a LICENSE
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 55738a826d..db7e36a638 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.9.7
+SUBVERSION_VERSION = 1.9.10
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = http://mirror.catn.com/pub/apache/subversion
 SUBVERSION_LICENSE = Apache-2.0
-- 
2.11.0
