From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Feb 2015 23:36:14 +0100
Subject: [Buildroot] [PATCH 01/11 v5] package/freerdp: bump version
In-Reply-To: <cover.1424558036.git.yann.morin.1998@free.fr>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
Message-ID: <56dbfc1bf1b30d83d8a709da1a0106baaef65fe5.1424558036.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we bumped to CMake-3.1, the build of FreeRDP is broken:

    CMake Error at channels/client/CMakeLists.txt:33 (list):
      list sub-command REMOVE_DUPLICATES requires list to be present.

This has been fixed upstream, so just bump the version to get that fix.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/freerdp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.9.1
