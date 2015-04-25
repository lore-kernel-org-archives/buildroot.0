From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 16:43:02 +0200
Subject: [Buildroot] [PATCHv3 18/18] Makefile: add a few more targets to
	nobuild_targets
In-Reply-To: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1429972982-25495-19-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this commit, one can now execute the source-check, external-deps
and legal-info targets regardless of the checks normally being done by
packages on the configuration.

Note that we intentionally do not go down the road of adding %-source,
%-legal-info, and the miryad of other targets that could work in such
situations. We only whitelist a few targets that are really useful to
have as nobuild_targets.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e0be636..2d7c05a 100644
--- a/Makefile
+++ b/Makefile
@@ -86,7 +86,7 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
 # We're building in two situations: when MAKECMDGOALS is empty
 # (default target is to build), or when MAKECMDGOALS contains
 # something else than one of the nobuild_targets.
-nobuild_targets := source
+nobuild_targets := source source-check legal-info external-deps _external-deps
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
-- 
2.1.0
