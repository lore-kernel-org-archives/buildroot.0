From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 11:22:04 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/samba4: security
 bump to version 4.9.8
Message-ID: <20190526091608.1C48F8149A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cf301dad9ef7549b676afe757ff0a119c816851
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

CVE-2018-16860: The checksum validation in the S4U2Self handler in the
embedded Heimdal KDC did not first confirm that the checksum was keyed,
allowing replacement of the requested target (client) principal.

For more details, see the advisory:
https://www.samba.org/samba/security/CVE-2018-16860.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7037a761eedced7ab9680ba7ad91a8bc29f1ec09)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 9576690e4f..7e82261b4e 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.7.tar.asc
-sha256 44e5bc58dcae6d86ca8d5f269fa927f20ff91bce97cde86fe4e83addcb89c001  samba-4.9.7.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.8.tar.asc
+sha256 82ebb7c3f1847c39341dd97ff8b73f40fa83f5f794daeceb80f3c349ace3cf56  samba-4.9.8.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 941d4df1d6..d2f89e2c82 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.7
+SAMBA4_VERSION = 4.9.8
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
