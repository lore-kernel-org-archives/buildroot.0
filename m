From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 14:48:02 -0300
Subject: [Buildroot] [PATCH 3/3] gnupg2: security bump to version 2.0.25
In-Reply-To: <1407174482-16108-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407174482-16108-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1407174482-16108-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-4617 (The do_uncompress function in g10/compress.c
allows context-dependent attackers to cause a denial of service
(infinite loop) via malformed compressed packets, as demonstrated by an
a3 01 5b ff byte sequence.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnupg2/gnupg2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index fd35e6e..9502a82 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.0.23
+GNUPG2_VERSION = 2.0.25
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG2_LICENSE = GPLv3+
-- 
1.8.5.5
