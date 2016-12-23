From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 11:16:05 +0100
Subject: [Buildroot] [PATCH] libcurl: security bump to 7.52.1
Message-ID: <20161223101605.27718-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2016-9594 - Unitilized random

Libcurl's (new) internal function that returns a good 32bit random value was
implemented poorly and overwrote the pointer instead of writing the value
into the buffer the pointer pointed to.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 2b68c6a..7a942f2 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 b9a2e18b4785eb75ad84598720e1559e1c53550ea011c0e00becdb94e2df5cc6  curl-7.52.0.tar.bz2
+sha256 d16185a767cb2c1ba3d5b9096ec54e5ec198b213f45864a38b3bda4bbf87389b  curl-7.52.1.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index b2a1b24..ea37309 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.52.0
+LIBCURL_VERSION = 7.52.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.10.2
