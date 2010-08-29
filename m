From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Aug 2010 23:36:46 +0200
Subject: [Buildroot] [git commit master 1/1] luafilesystems: unbreak builds
	with largefile support
Message-ID: <20100829213822.434438A2D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8e32ec9a1fa9a520017594b38c6e261e2c5f490d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A typo was introduced in e6c4ce6c (luafilesystem: remove LARGE_FILE
constraint), breaking the build when largefile support was enabled.

Reported-by: Marcus Osdoba <marcus.osdoba@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/luafilesystem/luafilesystem.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index e688734..5f1119a 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -9,7 +9,7 @@ LUAFILESYSTEM_SITE = http://github.com/downloads/keplerproject/luafilesystem
 LUAFILESYSTEM_DEPENDENCIES = lua
 
 ifeq ($(BR2_LARGEFILE),y)
-LFS_CFLAGS = -D_FILE_OFFSET_BITS=64 _LARGEFILE64_SOURCE
+LFS_CFLAGS = -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
 endif
 
 define LUAFILESYSTEM_BUILD_CMDS
-- 
1.7.1
