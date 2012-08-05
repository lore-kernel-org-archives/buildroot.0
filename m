From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Aug 2012 12:04:28 +0200
Subject: [Buildroot] [PATCH 3/4] mips64: remove toolchain kludge
In-Reply-To: <1344161069-19804-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1344161069-19804-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1344161069-19804-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo@zacarias.com.ar>

-mno-abicalls is an old kludge for some (probably) old issue.
Remove it since it's actually harmful, static busybox doesn't build with
it for a modern-ish toolchain (defaults as of this commit, uClibc
0.9.33.2 + gcc 4.5.4).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 21b8634..340e387 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -87,10 +87,6 @@ endif
 
 TARGET_CFLAGS=$(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 
-ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_NABI64)),yy)
-TARGET_CFLAGS+=-fno-pic -mno-abicalls
-endif
-
 ifeq ($(BR2_LARGEFILE),y)
 TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
-- 
1.7.9.5
