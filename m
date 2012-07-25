From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Jul 2012 18:24:12 -0300
Subject: [Buildroot] [PATCH 1/2] mips64: remove toolchain kludge
In-Reply-To: <1343251453-6462-1-git-send-email-gustavo@zacarias.com.ar>
References: <1343251453-6462-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1343251453-6462-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-mno-abicalls is an old kludge for some (probably) old issue.
Remove it since it's actually harmful, static busybox doesn't build with
it for a modern-ish toolchain (defaults as of this commit, uClibc
0.9.33.2 + gcc 4.5.4).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Makefile.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 6fad224..340e387 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -87,10 +87,6 @@ endif
 
 TARGET_CFLAGS=$(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 
-ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
-TARGET_CFLAGS+=-fno-pic -mno-abicalls
-endif
-
 ifeq ($(BR2_LARGEFILE),y)
 TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
-- 
1.7.8.6
