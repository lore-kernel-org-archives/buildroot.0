From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 29 Jun 2014 07:47:51 +0300
Subject: [Buildroot] [PATCH v2] lzo: security bump to version 2.07
Message-ID: <178793dde59515317a045893c8e0c090be510fcf.1404017271.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-4607.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
   Rephrase the comment explaining the need for AUTORECONF (Peter).
---
 package/lzo/lzo.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 10107fea3be3..3b348a3eff30 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-LZO_VERSION = 2.06
+LZO_VERSION = 2.07
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPLv2+
 LZO_LICENSE_FILES = COPYING
 LZO_INSTALL_STAGING = YES
+# Out libtool patch does not apply to bundled ltmain.sh since it's too new.
+# Run autoreconf to regenerate ltmain.sh.
+LZO_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.0.0
