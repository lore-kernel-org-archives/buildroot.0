From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Nov 2014 17:39:32 +0100
Subject: [Buildroot] [git commit branch/next] libsoup: bump version
Message-ID: <20141119164141.29CE4B4F86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a22ca1b63a82a548077ab0316f6a058dfabb804
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

python3 patch is now upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsoup/libsoup-01-python3-fix.patch |   39 --------------------------
 package/libsoup/libsoup.mk                   |    4 +-
 2 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/libsoup/libsoup-01-python3-fix.patch b/package/libsoup/libsoup-01-python3-fix.patch
deleted file mode 100644
index 682d57c..0000000
--- a/package/libsoup/libsoup-01-python3-fix.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 74f27b8305cfbcf9324a07bea93829237c86e687 Mon Sep 17 00:00:00 2001
-From: Ross Lagerwall <rosslagerwall@gmail.com>
-Date: Tue, 18 Jun 2013 08:48:44 +0100
-Subject: tld-parser.py: Force file io to use utf-8
-
-This fixes an issue where the build would fail with a UnicodeDecodeError
-when run in a non-utf8 locale (which is typical in build environments)
-using Python 3.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=702534
-
-Patch status: upstream
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-
-diff --git a/libsoup/tld-parser.py b/libsoup/tld-parser.py
-index c1a0346..5d9d2ba 100755
---- a/libsoup/tld-parser.py
-+++ b/libsoup/tld-parser.py
-@@ -5,13 +5,14 @@
- # Based on tld-parser.c Copyright (C) 2012 Igalia S.L.
- 
- import sys
-+import codecs
- 
- SOUP_TLD_RULE_NORMAL = 0
- SOUP_TLD_RULE_MATCH_ALL = 1 << 0
- SOUP_TLD_RULE_EXCEPTION = 1 << 1
- 
--tlds_file = open(sys.argv[1])
--inc_file = open(sys.argv[2], 'w')
-+tlds_file = codecs.open(sys.argv[1], encoding='utf-8')
-+inc_file = codecs.open(sys.argv[2], 'w', encoding='utf-8')
- 
- first = True
- for rule in tlds_file:
--- 
-cgit v0.10.1
-
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 723b6cc..70f1074 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSOUP_VERSION_MAJOR = 2.43
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).1
+LIBSOUP_VERSION_MAJOR = 2.48
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPLv2+
