From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:20:42 +0200
Subject: [Buildroot] [git commit] Makefile: add a few more targets to
	nobuild_targets
Message-ID: <20150426202108.C083E7FC25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4feeb2db3484dec940ff1f8921bb4db15031e8fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this commit, one can now execute the source-check, external-deps
and legal-info targets regardless of the checks normally being done by
packages on the configuration.

Note that we intentionally do not go down the road of adding %-source,
%-legal-info, and the miryad of other targets that could work in such
situations. We only whitelist a few targets that are really useful to
have as nobuild_targets.

[Thomas: also add 'clean' and 'distclean' to the nobuild_targets, as
suggested by Yann.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index e0be636..3983fce 100644
--- a/Makefile
+++ b/Makefile
@@ -86,7 +86,9 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
 # We're building in two situations: when MAKECMDGOALS is empty
 # (default target is to build), or when MAKECMDGOALS contains
 # something else than one of the nobuild_targets.
-nobuild_targets := source
+nobuild_targets := source source-check \
+	legal-info external-deps _external-deps \
+	clean distclean
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
