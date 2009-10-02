From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Oct 2009 10:33:29 +0200
Subject: [Buildroot] [git commit master] ltrace: fix build for powerpc
Message-ID: <20091002083428.7D30F77756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=090b407fe16d2fb996c3d010c142d95fd38e155b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ltrace wants ARCH=ppc when building for powerpc.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ltrace/ltrace.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index c5b8096..424c39d 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -11,7 +11,8 @@ LTRACE_DIR=$(BUILD_DIR)/ltrace-$(LTRACE_VERSION)
 LTRACE_BINARY=ltrace
 LTRACE_TARGET_BINARY=usr/bin/ltrace
 
-LTRACE_ARCH:=$(KERNEL_ARCH)
+# ltrace uses arch=ppc for powerpc
+LTRACE_ARCH:=$(KERNEL_ARCH:powerpc=ppc)
 ifeq ("$(strip $(ARCH))","armeb")
 LTRACE_ARCH:=arm
 endif
-- 
1.6.3.3
