From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 24 Apr 2018 14:14:43 +0300
Subject: [Buildroot] [PATCH] lz4: disable static library on shared only
Message-ID: <65ebbceb3ef38f7ce913f048d32921ab438e6ab3.1524568483.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't build the static library when BR2_SHARED_LIBS=y, to reduce build
time.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lz4/lz4.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index b17bc8ada90f..c5540124e920 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -12,6 +12,8 @@ LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
 
 ifeq ($(BR2_STATIC_LIBS),y)
 LZ4_MAKE_OPTS += BUILD_SHARED=no
+else ifeq ($(BR2_SHARED_LIBS),y)
+LZ4_MAKE_OPTS += BUILD_STATIC=no
 endif
 
 define HOST_LZ4_BUILD_CMDS
-- 
2.17.0
