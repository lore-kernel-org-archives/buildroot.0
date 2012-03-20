From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Mar 2012 14:21:35 +0100
Subject: [Buildroot] [git commit] libsigc: bump to 2.2.10 to fix build with
	gcc 4.6
Message-ID: <20120320132248.3731695403@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b71aea910eb8c24ba1b9c6a65a6f654ffe171959
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build of libsigc 2.2.8 fails with gcc 4.6 with the following error
message:

In file included from signal_base.cc:20:0:
../sigc++/signal_base.h:48:11: error: 'size_t' does not name a type In file included from ../sigc++/signal.h:8:0,

The 2.2.9 version was released with a fix for this build problem, so
we directly bump to the latest version 2.2.10, which builds fine under
gcc 4.6.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsigc/libsigc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 4c443eb..8c20ba3 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -3,7 +3,7 @@
 # libsigc++
 #
 #############################################################
-LIBSIGC_VERSION = 2.2.8
+LIBSIGC_VERSION = 2.2.10
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.bz2
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
 LIBSIGC_INSTALL_STAGING = YES
