From: Atharva Lele <itsatharva@gmail.com>
Date: Wed,  3 Jul 2019 22:09:58 +0530
Subject: [Buildroot] [PATCH 1/2] Makefile: don't export GZIP environment
 variable
Message-ID: <20190703163959.23070-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We export GZIP = -n so that GZIP does not record original
name and timestamps. However..

GZIP environment variable is deprecated and soon will not be
supported in future GZIP versions. GZIP suggests the use of a
wrapper to pass options globally but it might be difficult to
implement in Buildroot. For now, we don't export the variable
and fix reproducibility issues per package as they show up in
Autobuilder.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index c98a0ed87e..9cce934990 100644
--- a/Makefile
+++ b/Makefile
@@ -248,7 +248,6 @@ ifeq ($(BR2_REPRODUCIBLE),y)
 export TZ = UTC
 export LANG = C
 export LC_ALL = C
-export GZIP = -n
 endif
 
 # To put more focus on warnings, be less verbose as default
-- 
2.22.0
