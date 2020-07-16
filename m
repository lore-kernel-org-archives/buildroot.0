From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:00:32 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/gnutls: security
 bump to 3.6.14
Message-ID: <20200716150352.8620086E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f1db89b57b63666388f26f9904cb66b2bd3105d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes the following security issue:

 * CVE-2020-13777: It was found that GnuTLS 3.6.4 introduced a
   regression in the TLS protocol implementation. This caused the TLS
   server to not securely construct a session ticket encryption key
   considering the application supplied secret, allowing a MitM
   attacker to bypass authentication in TLS 1.3 and recover previous
   conversations in TLS 1.2

Release announcement:
 https://lists.gnupg.org/pipermail/gnutls-help/2020-June/004648.html

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 16ea3ee784c5203b33c086f84474b1dba6a3e54a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.hash | 8 ++++----
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 99279bfb6b..6a4203f3a2 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.13.tar.xz.sig
-sha256	32041df447d9f4644570cf573c9f60358e865637d69b7e59d1159b7240b52f38	gnutls-3.6.13.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.14.tar.xz.sig
+sha256  5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63  gnutls-3.6.14.tar.xz
 # Locally calculated
-sha256	e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b	doc/COPYING
-sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	doc/COPYING.LESSER
+sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index a1dfce62a2..34878e97b4 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.6
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).14
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
