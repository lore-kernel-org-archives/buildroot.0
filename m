From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Jun 2015 10:17:56 -0300
Subject: [Buildroot] [PATCH] icu: enable parallel build
Message-ID: <1433423876-23823-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Re-enable parallel builds, it doesn't seem to be affected by the issue
worked around in 5a8c7934 any more.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/icu/icu.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 2590178..e89290a 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -24,7 +24,6 @@ HOST_ICU_CONF_OPTS = \
 	--disable-icuio \
 	--disable-layout \
 	--disable-renaming
-ICU_MAKE = $(MAKE1)
 ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
 
-- 
2.3.6
