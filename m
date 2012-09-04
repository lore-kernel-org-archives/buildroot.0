From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Sep 2012 22:04:00 +0200
Subject: [Buildroot] [git commit] mips64: remove toolchain kludge
Message-ID: <20120904200553.36D49972C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bb39acb6adc90a9d9264e19d3ac3c5affcbb528
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-mno-abicalls is an old kludge for some (probably) old issue.
Remove it since it's actually harmful, static busybox doesn't build with
it for a modern-ish toolchain (defaults as of this commit, uClibc
0.9.33.2 + gcc 4.5.4).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

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
