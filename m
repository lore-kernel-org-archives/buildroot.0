From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 20:19:09 +0200
Subject: [Buildroot] [git commit] libseccomp: bump to version 2.1.1
Message-ID: <20140923182014.39D609D75C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02505644ab88b64e079cde51637b6fb0b6e32bcc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libseccomp/libseccomp.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
