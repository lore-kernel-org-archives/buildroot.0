From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  8 Jan 2020 08:41:09 +0100
Subject: [Buildroot] [PATCH] package/libcurl: bump version to 7.68.0
Message-ID: <20200108074109.27474-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Notice that 7.68.0 includes a Windows-only security fix:

- CVE-2019-15601: SMB access smuggling via FILE URL on Windows
  https://curl.haxx.se/docs/CVE-2019-15601.html

So not applicable to Buildroot.

Update the license hash for a copyright year update:

-Copyright (c) 1996 - 2019, Daniel Stenberg, <daniel@haxx.se>, and many
+Copyright (c) 1996 - 2020, Daniel Stenberg, <daniel@haxx.se>, and many

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index b46ee52d04..e60194254e 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f5d2e7320379338c3952dcc7566a140abb49edb575f9f99272455785c40e536c  curl-7.67.0.tar.xz
-sha256 8c8824f50e73a021f5dde1fccbf69685939247399a33a32abab1fa448c9ddabb  COPYING
+sha256 b724240722276a27f6e770b952121a3afd097129d8c9fe18e6272dc34192035a  curl-7.68.0.tar.xz
+sha256 db3c4a3b3695a0f317a0c5176acd2f656d18abc45b3ee78e50935a78eb1e132e  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index d46b874b37..a7f10ddde5 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.67.0
+LIBCURL_VERSION = 7.68.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.20.1
