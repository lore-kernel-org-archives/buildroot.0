From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2016 23:09:12 +0100
Subject: [Buildroot] [git commit] libgcrypt: security bump to version 1.6.5
Message-ID: <20160211221019.2FB51818B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f05056b03ed19905870a7a5b15d7e57d2163bba9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-7511 - Mitigate side-channel attack on ECDH with Weierstrass
curves.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgcrypt/libgcrypt.hash | 6 ++++--
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index e845a51..272d332 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,2 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2015-09/msg00000.html
-sha1 ed52add1ce635deeb2f5c6650e52667debd4ec70  libgcrypt-1.6.4.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2016q1/000384.html
+sha1	c3a5a13e717f7b3e3895650afc1b6e0d3fe9c726	libgcrypt-1.6.5.tar.bz2
+# Calculated based on the hash above
+sha256	f49ebc5842d455ae7019def33eb5a014a0f07a2a8353dc3aa50a76fd1dafa924	libgcrypt-1.6.5.tar.bz2
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 53d1d6c..7c27a22 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.6.4
+LIBGCRYPT_VERSION = 1.6.5
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
