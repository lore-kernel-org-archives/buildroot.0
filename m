From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jan 2014 17:00:22 +0100
Subject: [Buildroot] [git commit] rtmpdump: fix CFLAGS/LDFLAGS
Message-ID: <20140127161129.636E59C4DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e467ce2a7d305e30454aa60fac75ed1b026eee3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rtmpdump makefile looks at XCFLAGS/XLDFLAGS for additional flags,
so use those instead of completely overriding the flags.

Fixes http://autobuild.buildroot.net/results/190/1902a6613e5fc9656842fbcbd5731ac871d7ef59/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtmpdump/rtmpdump.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 81fb83f..7ef9ff4 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -33,8 +33,8 @@ endif
 define RTMPDUMP_BUILD_CMDS
 	$(MAKE) CRYPTO=$(RTMPDUMP_CRYPTO) \
 		prefix=/usr \
-		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(RTMPDUMP_CFLAGS)" \
+		XCFLAGS="$(RTMPDUMP_CFLAGS)" \
+		XLDFLAGS="$(TARGET_CFLAGS)" \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
 		-C $(@D)/librtmp
 endef
