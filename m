From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:06 +0100
Subject: [Buildroot] [RFC v3 01/30] rtmpdump: use TARGET_LDFLAGS instead of
	TARGET_CFLAGS for XLDFLAGS
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The XLDFLAGS is for ld related flags so use TARGET_LDFLAGS instead of
TARGET_CFLAGS, also the TARGET_CFLAGS is already used for XCFLAGS.

This fix is also needed for supporting the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/rtmpdump/rtmpdump.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.3.1
