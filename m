From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 16:31:37 +0200
Subject: [Buildroot] [git commit] ser2net: bump to 2.9
Message-ID: <20130728143129.94E309AD30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0c0635fe2b50d8baff95f62b857e12a2cbb4167
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ser2net/ser2net.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 588571c..23ae48a 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 2.8
+SER2NET_VERSION = 2.9
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
+# shipped configure script is broken (libtool version error)
+SER2NET_AUTORECONF = YES
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
 
