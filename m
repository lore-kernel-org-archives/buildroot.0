From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 08:48:37 +0100
Subject: [Buildroot] [git commit branch/next] rtmpdump: use TARGET_LDFLAGS
	instead of TARGET_CFLAGS for XLDFLAGS
Message-ID: <20150214074955.668D380422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33735aec520aba776c09b458844a8ce2ca94ff6a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The XLDFLAGS is for ld related flags so use TARGET_LDFLAGS instead of
TARGET_CFLAGS, also the TARGET_CFLAGS is already used for XCFLAGS.

This fix is also needed for supporting the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rtmpdump/rtmpdump.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 14037fb..613f1cd 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -39,7 +39,7 @@ define RTMPDUMP_BUILD_CMDS
 	$(MAKE) CRYPTO=$(RTMPDUMP_CRYPTO) \
 		prefix=/usr \
 		XCFLAGS="$(RTMPDUMP_CFLAGS)" \
-		XLDFLAGS="$(TARGET_CFLAGS)" \
+		XLDFLAGS="$(TARGET_LDFLAGS)" \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
 		$(RTMPDUMP_SHARED) \
 		-C $(@D)/librtmp
