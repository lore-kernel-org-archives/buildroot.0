From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:05 -0000
Subject: [Buildroot] [git commit branch/next] core/out-of-tree: fix Makefile
	wrapper
Message-ID: <20150808105635.CFCB280414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6bae1ac5757f7dac2c906447502542bbb0cbdd62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 971faf8 (Makefile: fix out-of-tree builds with multiple targets
with 'all') renamed the default target to '_all' to avoid name-clashing.

In doing so, I forgot to also fix the instance in the .PHONY rule.

Fix that now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/mkmakefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
index 974e2c0..833be6a 100755
--- a/support/scripts/mkmakefile
+++ b/support/scripts/mkmakefile
@@ -30,7 +30,7 @@ MAKEARGS += O=\$(if \$(patsubst /%,,\$(makedir)),\$(CURDIR)/)\$(patsubst %/,%,\$
 
 MAKEFLAGS += --no-print-directory
 
-.PHONY: all \$(MAKECMDGOALS)
+.PHONY: _all \$(MAKECMDGOALS)
 
 all	:= \$(filter-out Makefile,\$(MAKECMDGOALS))
 
