From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 28 Jul 2013 17:02:35 +0200
Subject: [Buildroot] [PATCH v3] ser2net: bump to 2.9
Message-ID: <1375023755-3329-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SER2NET_AUTORECONF is needed because of libtool version mismatch.
See error message bellow:

/bin/bash ./libtool --tag=CC   --mode=link gcc -Wall -g -O2   -o
ser2net controller.o dataxfer.o devcfg.o readconfig.o selector.o
ser2net.o utils.o telnet.o buffer.o  -lnsl
libtool: Version mismatch error.  This is libtool 2.4.2
Debian-2.4.2-1ubuntu1, but the
libtool: definition of this LT_INIT comes from libtool 2.2.6b.
libtool: You should recreate aclocal.m4 with macros from libtool 2.4.2
Debian-2.4.2-1ubuntu1
libtool: and run autoconf again.
make: *** [ser2net] Error 63

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes since v2: added reason for autoreconf to ser2net.mk
Changes since v1: added reason for autoreconf

 package/ser2net/ser2net.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 588571c..db729fa 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,9 +4,13 @@
 #
 ################################################################################

-SER2NET_VERSION = 2.8
+SER2NET_VERSION = 2.9
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
+SER2NET_AUTORECONF = YES
 SER2NET_LICENSE = GPLv2+
+
+# needed due to libtool version mismatch. Check if it was corrected in the
+# next version.
 SER2NET_LICENSE_FILES = COPYING

 $(eval $(autotools-package))
--
1.8.1.2
