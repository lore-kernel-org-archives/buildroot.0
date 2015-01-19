From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Jan 2015 11:08:19 -0300
Subject: [Buildroot] [PATCH] gnutls: bump to version 3.3.12
Message-ID: <1421676499-11519-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the new stable, so switch to it.
Still no dice with nettle 3.0, see:
http://lists.gnutls.org/pipermail/gnutls-devel/2014-June/006977.html
and nettle upstream:
http://lists.lysator.liu.se/pipermail/nettle-bugs/2014/003129.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 70130b9..16a6fcb 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	824196254cf9162b9ff841677f292d108ca1efa6cf8ae1c02b9a8682a3d7087f	gnutls-3.2.21.tar.xz
+sha256	67ab3e92c5d48f3323b897d7c1aa0bb2af6f3a84f5bd9931cda163a7ff32299b	gnutls-3.3.12.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 3cd8e17..ab176a6 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GNUTLS_VERSION_MAJOR = 3.2
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).21
+GNUTLS_VERSION_MAJOR = 3.3
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).12
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
-- 
2.0.5
