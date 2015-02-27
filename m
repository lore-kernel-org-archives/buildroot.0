From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 27 Feb 2015 14:08:12 +0200
Subject: [Buildroot] [PATCH] gnupg2: security bump to version 2.0.27
Message-ID: <ec6dbcb67f0991bd436814cba72f677695cba5a4.1425038892.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

CVE-2015-1606: Use after free, resulting from failure to skip invalid packets

CVE-2015-1607: memcpy with overlapping ranges, resulting from incorrect
bitwise left shifts

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 62fdaee916a4..404c40bedddd 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	7758e30dc382ae7a7167ed41b7f936aa50af5ea2d6fccdef663b5b750b65b8e0	gnupg-2.0.26.tar.bz2
+# From http://lists.gnupg.org/pipermail/gnupg-announce/2015q1/000362.html
+sha1	d065be185f5bac8ea07b210ab7756e79b83b63d4	gnupg-2.0.27.tar.bz2
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 2d133aa0d5b8..aa35c36c5a4b 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.0.26
+GNUPG2_VERSION = 2.0.27
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG2_LICENSE = GPLv3+
-- 
2.1.4
