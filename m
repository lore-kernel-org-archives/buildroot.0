From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Mar 2018 19:30:59 +0200
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.7.6
Message-ID: <7e46c960480c6cbe00fab7113c6adfd7365032ff.1520962259.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2018-1050: Vulnerability to a denial of service attack when the RPC
spoolss service is configured to be run as an external daemon.

https://www.samba.org/samba/security/CVE-2018-1050.html

CVE-2018-1057: Authenticated users might change any other users'
passwords, including administrative users and privileged service
accounts (eg Domain Controllers).

https://www.samba.org/samba/security/CVE-2018-1057.html

Add clnt_create() test result to cache to fix cross configure breakage.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/samba4/samba4-cache.txt | 1 +
 package/samba4/samba4.hash      | 5 +++--
 package/samba4/samba4.mk        | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4-cache.txt b/package/samba4/samba4-cache.txt
index 4a6471dd7a7a..0485f0dbb180 100644
--- a/package/samba4/samba4-cache.txt
+++ b/package/samba4/samba4-cache.txt
@@ -38,3 +38,4 @@ Checking value of _NSIG: "65"
 Checking value of SIGRTMAX: "64"
 Checking value of SIGRTMIN: "34"
 Checking errno of iconv for illegal multibyte sequence: "0"
+checking for clnt_create(): OK
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 28765440d130..dddd132d246d 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,3 +1,4 @@
-# Locally calculated
-sha256 fb12d0c4452f85b67b78bbeabd4c762d8feb8ff83e39d044d285120c2c488247  samba-4.7.4.tar.gz
+# Locally calculated after checking pgp signature
+# https://download.samba.org/pub/samba/stable/samba-4.7.6.tar.asc
+sha256 1eede30fc8ef6504e24602fb72b00baa0a7b73b59f16d25cb0771dc8c7c57d6e  samba-4.7.6.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 6f3207fb6416..ada03c024f96 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.7.4
+SAMBA4_VERSION = 4.7.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.16.1
