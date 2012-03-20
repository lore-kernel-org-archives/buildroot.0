From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Mar 2012 13:24:22 +0100
Subject: [Buildroot] [PATCH 1/1] libsigc: bump to 2.2.10 to fix build with
	gcc 4.6
In-Reply-To: <cover.1332246256.git.thomas.petazzoni@free-electrons.com>
References: <cover.1332246256.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d4121fc18311c18a0d9a046017ca4a450aed4e3c.1332246256.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build of libsigc 2.2.8 fails with gcc 4.6 with the following error
message:

In file included from signal_base.cc:20:0:
../sigc++/signal_base.h:48:11: error: 'size_t' does not name a typeIn file included from ../sigc++/signal.h:8:0,

The 2.2.9 version was released with a fix for this build problem, so
we directly bump to the latest version 2.2.10, which builds fine under
gcc 4.6.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1
