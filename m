From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:52 -0000
Subject: [Buildroot] [git commit] package/libsrtp: fix static build
Message-ID: <20180907111540.E28577F981@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=058202102aae858f9624738988db0939dc0554d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The library name was updated upstream:

Fixes
make[1]: *** No rule to make target 'libsrtp.a'.  Stop.

http://autobuild.buildroot.net/results/10e/10e4198e8d86eecb9c672db77cbaff1e8a592ad3/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsrtp/libsrtp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index dd83dbc003..8af463928b 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -11,11 +11,11 @@ LIBSRTP_LICENSE = BSD-3-Clause
 LIBSRTP_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_STATIC_LIBS),y)
-LIBSRTP_MAKE_OPTS = libsrtp.a
+LIBSRTP_MAKE_OPTS = libsrtp2.a
 else ifeq ($(BR2_SHARED_LIBS),y)
 LIBSRTP_MAKE_OPTS = shared_library
 else
-LIBSRTP_MAKE_OPTS = libsrtp.a shared_library
+LIBSRTP_MAKE_OPTS = libsrtp2.a shared_library
 endif
 
 # While libsrtp is not using pkg-config itself, it checks if
