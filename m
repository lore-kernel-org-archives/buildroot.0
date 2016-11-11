From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 21:28:36 +0100
Subject: [Buildroot] [git commit] package/kvmtool: fix a musl build issue on
	ARM
Message-ID: <20161111202850.96A7D81926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1595020670aec5185dcc01df0d42c0905f930928
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We simply bump the version rather than backport the patch, as there has
been only very few, minor commits in-between.

The kvmtool build with musl still produce some warning but they are
fixed with the current master 0093df80 (kvmtool: Makefile: disable PIE
build for bios and pre_init). So the next version bump should fixes
them.

Fixes:
http://autobuild.buildroot.net/results/8e8/8e81354e82a8c0495e2ca465eb79cb8cf4c9b153

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kvmtool/kvmtool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index 7f682db..12454e1 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVMTOOL_VERSION = 372f583d359a5bdcbbe7268809c8d1dc179c64d2
+KVMTOOL_VERSION = bed2bd9e1fbef5819090feeada7b86eed97ca5e2
 KVMTOOL_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/will/kvmtool.git
 KVMTOOL_SITE_METHOD = git
 KVMTOOL_DEPENDENCIES = \
