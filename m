From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Jun 2014 15:41:54 -0300
Subject: [Buildroot] [PATCH] gnupg: security bump to version 1.4.17
Message-ID: <1403721714-14795-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-4617: The do_uncompress function in g10/compress.c in
GnuPG 1.x before 1.4.17 and 2.x before 2.0.24 allows context-dependent
attackers to cause a denial of service (infinite loop) via malformed
compressed packets, as demonstrated by an a3 01 5b ff byte sequence.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnupg/gnupg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index c334ac6..4c96967 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG_VERSION = 1.4.16
+GNUPG_VERSION = 1.4.17
 GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG_LICENSE = GPLv3+
-- 
1.8.5.5
