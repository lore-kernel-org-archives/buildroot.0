From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 23:48:12 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] subversion: security bump
	to version 1.9.7
Message-ID: <20170906214509.B5DB580435@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f4428337e0c0d0fe03efb781c69508225f087a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-9800: Arbitrary code execution on clients through malicious
svn+ssh URLs in svn:externals and svn:sync-from-url

For more details, see
http://subversion.apache.org/security/CVE-2017-9800-advisory.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit c6b793779c32120bc9ff9334aad4d772d6ee49f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/subversion/subversion.hash | 7 +++----
 package/subversion/subversion.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index 1a85961..6adb57c 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,5 +1,4 @@
 # From http://subversion.apache.org/download.cgi#recommended-release
-sha1 8bd6a44a1aed30c4c6b6b068488dafb44eaa6adf  subversion-1.9.5.tar.bz2
-# Locally calculated after checking PGP signature
-# https://www.apache.org/dist/subversion/subversion-1.9.5.tar.bz2.asc
-sha256 8a4fc68aff1d18dcb4dd9e460648d24d9e98657fbed496c582929c6b3ce555e5  subversion-1.9.5.tar.bz2
+sha1 874b81749cdc3e88152d103243c3623ac6338388  subversion-1.9.7.tar.bz2
+# From https://www.apache.org/dist/subversion/subversion-1.9.7.tar.bz2.sha512
+sha512 a55efd3edaddbc099450d849fcc6fe5a8d20b85ece966d8ac2fd73ee9cb4255a0349bbcfceb4e9fca6daf054ce7c648eff8d273c6873f5dade6e62dcea7eeb2b  subversion-1.9.7.tar.bz2
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 05569c1..55738a8 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.9.5
+SUBVERSION_VERSION = 1.9.7
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = http://mirror.catn.com/pub/apache/subversion
 SUBVERSION_LICENSE = Apache-2.0
