From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 11 Jul 2017 19:47:37 -0700
Subject: [Buildroot] [PATCH] package/Makefile.in: Tweak TARGET_ABI for
	MPC8548
Message-ID: <20170712024737.21578-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Mark Hinds <mhinds@spaceflightindustries.com>

Add -mcpu=8548 -mhard-float to TARGET_ABI so that hardware FP is used
to build all of the package in the system.

Signed-off-by: Mark Hinds <zoronic@gmail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index b95e5e3..958d72c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -78,7 +78,7 @@ ifeq ($(BR2_powerpc_8540),y)
 TARGET_ABI += -mabi=spe -mfloat-gprs=single -Wa,-me500
 endif
 ifeq ($(BR2_powerpc_8548),y)
-TARGET_ABI += -mabi=spe -mfloat-gprs=double -Wa,-me500x2
+TARGET_ABI += -mabi=spe -mfloat-gprs=double -Wa,-me500x2 -mcpu=8548 -mhard-float
 endif
 ifeq ($(BR2_powerpc_e500mc),y)
 TARGET_ABI += -mabi=spe -mfloat-gprs=double -Wa,-me500mc
-- 
2.9.4
