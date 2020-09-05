From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  5 Sep 2020 22:53:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnutls: security bump to version
 3.6.15
Message-ID: <20200905205353.1641544-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgnutls: Fixed "no_renegotiation" alert handling at incorrect timing.
The server sending a "no_renegotiation" alert in an unexpected timing,
followed by an invalid second handshake was able to cause a TLS 1.3
client to crash via a null-pointer dereference. The crash happens in the
application's error handling path, where the gnutls_deinit function is
called after detecting a handshake failure (#1071).
[GNUTLS-SA-2020-09-04, CVSS: medium]

https://lists.gnupg.org/pipermail/gnutls-help/2020-September/004669.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 6a4203f3a2..c360a56f93 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.14.tar.xz.sig
-sha256  5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63  gnutls-3.6.14.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.15.tar.xz.sig
+sha256  0ea8c3283de8d8335d7ae338ef27c53a916f15f382753b174c18b45ffd481558  gnutls-3.6.15.tar.xz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 34878e97b4..9f53150004 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.6
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).14
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).15
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.28.0
