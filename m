From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Jul 2011 16:38:07 +0200
Subject: [Buildroot] [git commit] linux: fix build with release candidates
Message-ID: <20110714144643.75FDC8A5A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ea7f5ff97617e6d84017df63a8599b17d10ca57c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes *** Recursive variable `LINUX_SITE' references itself

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 0679238..bdd8bb3 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -23,7 +23,7 @@ LINUX_VERSION_MINOR = $(word 2,$(subst ., ,$(subst -, ,$(LINUX_VERSION))))
 LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(LINUX_VERSION_MAJOR).$(LINUX_VERSION_MINOR)/
 # release candidates are in testing/ subdir
 ifneq ($(findstring -rc,$(LINUX_VERSION)),)
-LINUX_SITE = $(LINUX_SITE)testing/
+LINUX_SITE := $(LINUX_SITE)testing/
 endif # -rc
 endif
 
-- 
1.7.3.4
