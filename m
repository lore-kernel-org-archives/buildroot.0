From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 27 Jun 2014 07:32:29 +0300
Subject: [Buildroot] [PATCH] lzo: security bump to version 2.07
Message-ID: <b7658f620fcbca547e5aa330bec28c862e8d59b2.1403843549.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-4607.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lzo/lzo.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 10107fea3be3..bf85e84e9a71 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-LZO_VERSION = 2.06
+LZO_VERSION = 2.07
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPLv2+
 LZO_LICENSE_FILES = COPYING
 LZO_INSTALL_STAGING = YES
+# Make libtool patch apply
+LZO_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.0.0
