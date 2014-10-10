From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Oct 2014 09:40:55 +0100
Subject: [Buildroot] [PATCH] kmod: add host-automake dependency
Message-ID: <1412930455-40512-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kmod can fail to build in systems which have old automake versions like
CentOS 6.5, for instance. It will cause an error like this one:

/buildroot/output/build/kmod-18/build-aux/missing: line 81:
aclocal-1.14: command not found

Adding host-automake as a dependency fixes the problem.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 package/kmod/kmod.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 1f170dd..c0212bb 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -8,8 +8,8 @@ KMOD_VERSION = 18
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-KMOD_DEPENDENCIES = host-pkgconf
-HOST_KMOD_DEPENDENCIES = host-pkgconf
+KMOD_DEPENDENCIES = host-automake host-pkgconf
+HOST_KMOD_DEPENDENCIES = host-automake host-pkgconf
 
 # license info for libkmod only, conditionally add more below
 KMOD_LICENSE = LGPLv2.1+
-- 
1.7.1
