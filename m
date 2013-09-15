From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 22:48:28 +0200
Subject: [Buildroot] [git commit] package/Makefile.in: fix incorrect comment
Message-ID: <20130915213314.54BB29B76A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87bb43994282b875d334cbaeb10f49fc08c6d0a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The TARGET_{CC,CXX,LD,...} variables no longer contain any --sysroot
option, since we're now using a toolchain wrapper for external
toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index dd365be..4adc33d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -147,8 +147,7 @@ endif
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
 
-# Define TARGET_xx variables for all common binutils/gcc tools by
-# including the --sysroot option where necessary.
+# Define TARGET_xx variables for all common binutils/gcc
 TARGET_AR       = $(TARGET_CROSS)ar
 TARGET_AS       = $(TARGET_CROSS)as
 TARGET_CC       = $(TARGET_CROSS)gcc
