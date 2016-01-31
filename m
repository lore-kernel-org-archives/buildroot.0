From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 19:23:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/subversion: security version bump
	to 1.9.3
Message-ID: <1454264630-10916-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release announcement:
http://mail-archives.apache.org/mod_mbox/subversion-dev/201512.mbox/%3CCAP_GPNj_GCA869VQeJUrp5ngXsgN7pQQHSS=sqoXm8_6hHTTxg at mail.gmail.com%3E

CVE-2015-5259:
Remotely triggerable heap overflow and out-of-bounds read caused by
integer overflow in the svn:// protocol parser.
http://subversion.apache.org/security/CVE-2015-5259-advisory.txt

CVE-2015-5343:
Remotely triggerable heap overflow and out-of-bounds read in mod_dav_svn
caused by integer overflow when parsing skel-encoded request bodies.
http://subversion.apache.org/security/CVE-2015-5343-advisory.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/subversion/subversion.hash | 2 +-
 package/subversion/subversion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index 7806374..4f0a446 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,2 +1,2 @@
 # From http://subversion.apache.org/download.cgi#recommended-release
-sha1 fb9db3b7ddf48ae37aa8785872301b59bfcc7017 subversion-1.9.2.tar.bz2
+sha1	27e8df191c92095f48314a415194ec37c682cbcf	subversion-1.9.3.tar.bz2
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 2f6a249..e9aa0ae 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.9.2
+SUBVERSION_VERSION = 1.9.3
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = http://mirror.catn.com/pub/apache/subversion
 SUBVERSION_LICENSE = Apache-2.0
-- 
2.7.0
