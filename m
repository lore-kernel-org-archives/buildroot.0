From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Dec 2010 16:10:32 -0300
Subject: [Buildroot] [PATCH 07/10] package: drop sparc64 bits
In-Reply-To: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1293563435-10054-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove VIS optimization, it's for sparc64 and it's gone.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Makefile.in |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 983f9f5..a1e290f 100644
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
