From: Martin Bark <martin@barkynet.com>
Date: Sat,  1 Feb 2014 12:46:58 +0000
Subject: [Buildroot] [PATCH 1/1] axel: fixed package download issue
Message-ID: <1391258818-19350-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch updates axel.mk to download axel v2.4 from snapshot.debian.org.
The download from alioth.debian.org is currently broken resulting in a
malformed axel.2.4.tar.gz being downloaded and the build failing.  The
package is available instead from snapshot.debian.org.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/axel/axel.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index a83001f..d448dbb 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 AXEL_VERSION = 2.4
-AXEL_SITE = https://alioth.debian.org/frs/download.php/file/3015
+AXEL_SOURCE = axel_$(AXEL_VERSION).orig.tar.gz
+AXEL_SITE = http://snapshot.debian.org/archive/debian/20090429T154100Z/pool/main/a/axel
 AXEL_LICENSE = GPLv2+
 AXEL_LICENSE_FILES = COPYING
 
-- 
1.7.9.5
