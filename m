From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 08:46:05 +0200
Subject: [Buildroot] [git commit] Makefile: don't export GZIP environment
 variable
Message-ID: <20190717064413.D83D9828FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d590b37633ab2a7cfdfdccb1343717d6b452fcbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We export GZIP = -n so that GZIP does not record original
name and timestamps. However..

GZIP environment variable is deprecated and soon will not be
supported in future GZIP versions. GZIP suggests the use of a
wrapper to pass options globally but it might be difficult to
implement in Buildroot. For now, we don't export the variable
and fix reproducibility issues per package as they show up in
Autobuilder.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
