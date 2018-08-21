From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 21 Aug 2018 06:16:40 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libsrtp: fix static build
Message-ID: <20180821041640.14089-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The library name was updated upstream:

Fixes
make[1]: *** No rule to make target 'libsrtp.a'.  Stop.

http://autobuild.buildroot.net/results/10e/10e4198e8d86eecb9c672db77cbaff1e8a592ad3/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.18.0
