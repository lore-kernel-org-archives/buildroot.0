From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  8 Apr 2019 12:49:52 +0200
Subject: [Buildroot] [PATCH] package/samba4: security bump to version 4.9.6
Message-ID: <20190408104952.19872-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerabilities:

 - CVE-2019-3870:
   During the provision of a new Active Directory DC, some files in the private/
   directory are created world-writable.
   https://www.samba.org/samba/security/CVE-2019-3870.html

 - CVE-2019-3880:
   Authenticated users with write permission can trigger a symlink traversal to
   write or detect files outside the Samba share.
   https://www.samba.org/samba/security/CVE-2019-3880.html

For more details, see the release notes:
https://www.samba.org/samba/history/samba-4.9.6.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 70cea4809b..7762456cfd 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.5.tar.asc
-sha256 078956d2d98e22011265afd4b7221efe4861067dcba4a031583b01f34d423700  samba-4.9.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.6.tar.asc
+sha256 c9205a651a83d69e200fec9dd65e9fa360f0c75ab3275b3dcb74e5cbaec60807  samba-4.9.6.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 9b226a0e05..3f16b5be4a 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.5
+SAMBA4_VERSION = 4.9.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.11.0
