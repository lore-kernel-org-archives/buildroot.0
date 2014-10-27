From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Oct 2014 16:11:27 +0000
Subject: [Buildroot] [PATCH] trinity: Bump version to fix a PowerPC build
	failure
Message-ID: <1414426287-18973-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some PowerPC toolchains have old Linux headers which don't define the
KVM_CREATE_SPAPR_TCE and KVM_ALLOCATE_RMA macros. To workaround this
problem we enclose the lines which use these macros into ifdef blocks.

This fix has been merged upstream so we bump the version to fix the
problem in Buildroot as well.

Fixes:
	http://autobuild.buildroot.net/results/3a4/3a4e7e6077cd4bbbcb8fe398e0938ad228306d2d/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/trinity/trinity.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 8415141..52805e0 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRINITY_VERSION = d68d1f7b9ab6c65a379ea990a263ee6b4f234bbd
+TRINITY_VERSION = 5d2dfe9727eb9c8dc44c31e95968e8d85284ffcc
 TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
 TRINITY_LICENSE = GPLv2
 TRINITY_LICENSE_FILES = COPYING
-- 
1.7.1
