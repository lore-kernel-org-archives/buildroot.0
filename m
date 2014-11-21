From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 21 Nov 2014 13:19:05 -0300
Subject: [Buildroot] [PATCH v4 6/9] scripts: mkmakefile: set umask before
	calling BR's makefile
In-Reply-To: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1416586748-12936-7-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Small optimization so we don't have another 'make' level (caused by the
umask fix) when running the generated makefile.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 support/scripts/mkmakefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
2.1.3
