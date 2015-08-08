From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:40 -0000
Subject: [Buildroot] [git commit branch/next] scripts: mkmakefile: set umask
	before calling BR's makefile
Message-ID: <20150808105630.798377FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd13247a22884880fd759796dfdfad728590d5d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Small optimization so we don't have another 'make' level (caused by the
umask fix) when running the generated makefile.

Signed-off-by: Guido Mart??nez <guido@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/mkmakefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
index 27b1507..974e2c0 100755
--- a/support/scripts/mkmakefile
+++ b/support/scripts/mkmakefile
@@ -35,7 +35,7 @@ MAKEFLAGS += --no-print-directory
 all	:= \$(filter-out Makefile,\$(MAKECMDGOALS))
 
 _all:
-	\$(MAKE) \$(MAKEARGS) \$(all)
+	umask 0022 && \$(MAKE) \$(MAKEARGS) \$(all)
 
 Makefile:;
 
