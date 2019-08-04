From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 19:10:53 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] Makefile: don't export
 GZIP environment variable
Message-ID: <20190804201459.CE5FE80DA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a66a618f66eb4100dee6aa2f70a16db3a5b9da88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

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
(cherry picked from commit d590b37633ab2a7cfdfdccb1343717d6b452fcbb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index c5d398a5a9..738c3bf8c8 100644
--- a/Makefile
+++ b/Makefile
@@ -248,7 +248,6 @@ ifeq ($(BR2_REPRODUCIBLE),y)
 export TZ = UTC
 export LANG = C
 export LC_ALL = C
-export GZIP = -n
 endif
 
 # To put more focus on warnings, be less verbose as default
