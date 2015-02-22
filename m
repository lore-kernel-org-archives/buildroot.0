From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 10:37:02 +0100
Subject: [Buildroot] [git commit] package/freerdp: bump version
Message-ID: <20150302222721.D6F8481773@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=361f528aea3682929990e53d38f72f30ab86ba3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we bumped to CMake-3.1, the build of FreeRDP is broken:

    CMake Error at channels/client/CMakeLists.txt:33 (list):
      list sub-command REMOVE_DUPLICATES requires list to be present.

This has been fixed upstream, so just bump the version to get that fix.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 57cd7a8..ffe014c 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Changeset on the stable-1.1 branch
-FREERDP_VERSION = 440916eae2e07463912d5fe507677e67096eb083
+FREERDP_VERSION = b21ff842ef3de5837513042dc30488b12bd9cf9d
 FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
 FREERDP_DEPENDENCIES = openssl zlib \
 	xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
