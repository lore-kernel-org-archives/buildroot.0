From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 30 Oct 2017 21:11:02 +0200
Subject: [Buildroot] [PATCH 2/2] apr-util: security bump to version 1.6.1
In-Reply-To: <6c5b5801af6b7ce17eae8176827b0ce141a15c94.1509390662.git.baruch@tkos.co.il>
References: <6c5b5801af6b7ce17eae8176827b0ce141a15c94.1509390662.git.baruch@tkos.co.il>
Message-ID: <86642b9b91de8bec45167d6d947fa134f34334d5.1509390662.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-12618: Out-of-bounds access in corrupted SDBM database.

Switch to bz2 compressed tarball.

Use upstream provided SHA256 hash.

Add license hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/apr-util/apr-util.hash | 6 ++++--
 package/apr-util/apr-util.mk   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/apr-util/apr-util.hash b/package/apr-util/apr-util.hash
index 3db43960585b..82ad475619e1 100644
--- a/package/apr-util/apr-util.hash
+++ b/package/apr-util/apr-util.hash
@@ -1,2 +1,4 @@
-# From http://archive.apache.org/dist/apr/apr-util-1.5.4.tar.gz.sha1
-sha1	72cc3ac693b52fb831063d5c0de18723bc8e0095	apr-util-1.5.4.tar.gz
+# From http://www.apache.org/dist/apr/apr-util-1.6.1.tar.bz2.sha256
+sha256	d3e12f7b6ad12687572a3a39475545a072608f4ba03a6ce8a3778f607dd0035b	apr-util-1.6.1.tar.bz2
+# Locally calculated
+sha256	ef5609d18601645ad6fe22c6c122094be40e976725c1d0490778abacc836e7a2	LICENSE
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index bc0572e1109a..c44cef009f82 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-APR_UTIL_VERSION = 1.5.4
+APR_UTIL_VERSION = 1.6.1
+APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
 APR_UTIL_SITE = http://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
 APR_UTIL_LICENSE_FILES = LICENSE
-- 
2.14.2
