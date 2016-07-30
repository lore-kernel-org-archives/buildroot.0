From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 18:10:18 +0200
Subject: [Buildroot] [git commit] Revert "package/Makefile.in should grab
	HOST_DIR headers using -isystem instead of -I."
Message-ID: <20160730161041.C8179807AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=255b6f80d395ef048f46cfcf75dba690c56af657
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 6f8162cf8c1abef7e0a4771fe0d6b26a28f5c2b6. This is
causing too many problems that are not easy to solve.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index b0ef706..afd5d3a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -222,7 +222,7 @@ UNZIP := $(shell which unzip || type -p unzip) -q
 
 APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
-HOST_CPPFLAGS  = -isystem $(HOST_DIR)/usr/include
+HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
 HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
