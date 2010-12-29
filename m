From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Dec 2010 23:14:48 +0100
Subject: [Buildroot] [git commit master 1/1] package: drop sparc64 bits
Message-ID: <20101229221645.6248E8EE79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=74058758e4165dbef1d8f1d446cce0d9fb27a955
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove VIS optimization, it's for sparc64 and it's gone.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 9765a1a..7ff1700 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -92,11 +92,6 @@ ifeq ($(BR2_VFP_FLOAT),y)
 TARGET_CFLAGS+=-mfpu=vfp
 endif
 
-# enable VIS for v9a and v9b
-ifeq ($(findstring y,$(BR2_sparc_v9a)$(BR2_sparc64_v9a)$(BR2_sparc_v9b)$(BR2_sparc64_v9b)),y)
-TARGET_CFLAGS+=-mvis
-endif
-
 ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
 TARGET_CFLAGS+=-fno-pic -mno-abicalls
 endif
-- 
1.7.2.2
