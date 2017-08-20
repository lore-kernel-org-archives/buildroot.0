From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Aug 2017 10:00:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/lzo: switch to cmake
Message-ID: <20170820080029.4728-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

autoreconf for the host package is broken after bumping to 2.10:
http://lists.busybox.net/pipermail/buildroot/2017-August/200634.html

To solve the problem we switch to cmake.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lzo/lzo.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 5b8efdd54..dba965fcd 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -9,9 +9,7 @@ LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPL-2.0+
 LZO_LICENSE_FILES = COPYING
 LZO_INSTALL_STAGING = YES
-# Ships a beta libtool version hence our patch doesn't apply.
-# Run autoreconf to regenerate ltmain.sh.
-LZO_AUTORECONF = YES
+LZO_SUPPORTS_IN_SOURCE_BUILD = NO
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.11.0
