From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 14:57:29 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] libcurl: security bump to
 version 7.61.1
Message-ID: <20180928125653.277078A3C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e27b54659247b17c854d8c26471b08d874231e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Fixes CVE-2018-14618: NTLM password overflow via integer overflow

For more details, see the advisory:
https://curl.haxx.se/docs/CVE-2018-14618.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 87d58cccf19039fdca30ad5274ed75030919656d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 9a57153d2b..395307653d 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.61.0.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.61.1.tar.xz.asc
 # with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256 ef6e55192d04713673b4409ccbcb4cb6cd723137d6e10ca45b0c593a454e1720  curl-7.61.0.tar.xz
+sha256 3d5913d6a39bd22e68e34dff697fd6e4c3c81563f580c76fca2009315cd81891  curl-7.61.1.tar.xz
 sha256 5f3849ec38ddb927e79f514bf948890c41b8d1407286a49609b8fb1585931095  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3f6733e6cb..7993062c6e 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.61.0
+LIBCURL_VERSION = 7.61.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
