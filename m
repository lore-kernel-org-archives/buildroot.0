From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 15:29:55 +0200
Subject: [Buildroot] [git commit] lz4: disable static library on shared only
Message-ID: <20180425133014.8954E88D19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1667fe58106aa5bdb63e0c8db2e34c605947464a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't build the static library when BR2_SHARED_LIBS=y, to reduce build
time.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lz4/lz4.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index b17bc8ada9..c5540124e9 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -12,6 +12,8 @@ LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
 
 ifeq ($(BR2_STATIC_LIBS),y)
 LZ4_MAKE_OPTS += BUILD_SHARED=no
+else ifeq ($(BR2_SHARED_LIBS),y)
+LZ4_MAKE_OPTS += BUILD_STATIC=no
 endif
 
 define HOST_LZ4_BUILD_CMDS
