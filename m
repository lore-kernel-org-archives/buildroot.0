From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Nov 2010 21:28:40 +0100
Subject: [Buildroot] [git commit master 1/1] zlib: don't point
	libdir/includedir at staging
Message-ID: <20101124203041.891FC8DECF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bab71ad4ddf28a8f5af5572c699a438331a63d3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes 'make install'.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/zlib/zlib.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 016752e..58f758b 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -24,8 +24,6 @@ define ZLIB_CONFIGURE_CMDS
 		./configure \
 		$(ZLIB_SHARED) \
 		--prefix=/usr \
-		--libdir=$(STAGING_DIR)/usr/lib \
-		--includedir=$(STAGING_DIR)/usr/include \
 	)
 endef
 
-- 
1.7.2.2
