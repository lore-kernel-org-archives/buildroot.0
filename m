From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 23 Sep 2014 11:45:44 +0200
Subject: [Buildroot] [PATCH 5/8] libseccomp: bump to version 2.1.1
In-Reply-To: <1411465547-6847-1-git-send-email-jezz@sysmic.org>
References: <1411465547-6847-1-git-send-email-jezz@sysmic.org>
Message-ID: <1411465547-6847-5-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 1.0.0 was not compatible with systemd. With 1.0.0, systemd
compilation produce:

src/shared/seccomp-util.c: In function 'seccomp_add_secondary_archs':
src/shared/seccomp-util.c:73:9: warning: implicit declaration of function 'seccomp_arch_add' [-Wimplicit-function-declaration]
         r = seccomp_arch_add(c, SCMP_ARCH_X86);
         ^
src/shared/seccomp-util.c:73:9: warning: nested extern declaration of 'seccomp_arch_add' [-Wnested-externs]
src/shared/seccomp-util.c:73:33: error: 'SCMP_ARCH_X86' undeclared (first use in this function)
         r = seccomp_arch_add(c, SCMP_ARCH_X86);
                                 ^
src/shared/seccomp-util.c:77:33: error: 'SCMP_ARCH_X86_64' undeclared (first use in this function)
         r = seccomp_arch_add(c, SCMP_ARCH_X86_64);
                                 ^
src/shared/seccomp-util.c:81:33: error: 'SCMP_ARCH_X32' undeclared (first use in this function)
         r = seccomp_arch_add(c, SCMP_ARCH_X32);

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/libseccomp/libseccomp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index da1dadd..3002388 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION         = 1.0.0
-LIBSECCOMP_SITE            = http://downloads.sourceforge.net/project/libseccomp
+LIBSECCOMP_VERSION         = 2.1.1
+LIBSECCOMP_SITE            = http://downloads.sourceforge.net/project/libseccomp/libseccomp-$(LIBSECCOMP_VERSION)/
 LIBSECCOMP_LICENSE         = LGPLv2.1
 LIBSECCOMP_LICENSE_FILES   = LICENSE
 LIBSECCOMP_INSTALL_STAGING = YES
-- 
1.9.1
