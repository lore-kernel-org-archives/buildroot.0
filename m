From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Jul 2015 23:16:46 +0200
Subject: [Buildroot] [PATCH] core/out-of-tree: fix Makefile wrapper
Message-ID: <1437081406-16475-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 971faf8 (Makefile: fix out-of-tree builds with multiple targets
with 'all') renamed the default target to '_all' to avoid name-clashing.

In doing so, I forgot to also fix the instance in the .PHONY rule.

Fix that now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/mkmakefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
index 974e2c0..833be6a 100755
--- a/support/scripts/mkmakefile
+++ b/support/scripts/mkmakefile
@@ -30,7 +30,7 @@ MAKEARGS += O=\$(if \$(patsubst /%,,\$(makedir)),\$(CURDIR)/)\$(patsubst %/,%,\$
 
 MAKEFLAGS += --no-print-directory
 
-.PHONY: all \$(MAKECMDGOALS)
+.PHONY: _all \$(MAKECMDGOALS)
 
 all	:= \$(filter-out Makefile,\$(MAKECMDGOALS))
 
-- 
1.9.1
