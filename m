From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 02:05:06 +0200
Subject: [Buildroot] [git commit] mrouted: Use github call
Message-ID: <20141025001137.10FE8B0CEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2311214615d8818ab54449b2d58c9589abbcbf98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mrouted/mrouted.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 67bb8a1..78fe98a 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 MROUTED_VERSION = 3.9.6
-MROUTED_SOURCE = mrouted-$(MROUTED_VERSION).tar.bz2
-MROUTED_SITE = http://cloud.github.com/downloads/troglobit/mrouted
+MROUTED_SITE = $(call github,troglobit,mrouted,$(MROUTED_VERSION))
 MROUTED_DEPENDENCIES = host-bison
 
 define MROUTED_BUILD_CMDS
