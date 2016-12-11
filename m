From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:03:15 +0100
Subject: [Buildroot] [git commit] package/enlightenment: remove uClibc
	0.9.33 workaround
Message-ID: <20161211140741.DC3A0818C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf294289683f0b0d524247f8402a13bfbe3d65c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This workaround was added for uClibc <= 0.9.33.2 by commit [1].
This issue has been fixed long time ago in uClibc-ng for powerpc [2], sparc and
xtensa [3].

Nowadays, enlightenment can't be selected for xtensa ans sparc due to luajit
dependency from the efl stack and uClibc 0.9.33 was removed from Buildroot
since 2016.02 release.

[1] https://git.buildroot.net/buildroot/commit/?id=37acd25ee1376de5734415ac60be16991ee6d150
[2] http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=90298bc4fb1303151d6213d13beefcf9b378c5e1
[3] https://git.buildroot.net/buildroot/commit/?id=0b056944f5878304f51af3e9edb6d596f24fc370

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/enlightenment/enlightenment.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 1cbf598..c936140 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -30,11 +30,6 @@ else
 ENLIGHTENMENT_CONF_OPTS += --disable-systemd
 endif
 
-# uClibc has an old incomplete sys/ptrace.h for powerpc & sparc
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_powerpc)$(BR2_sparc),yy)
-ENLIGHTENMENT_CONF_ENV += ac_cv_header_sys_ptrace_h=no
-endif
-
 # alsa backend needs mixer support
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
 ENLIGHTENMENT_DEPENDENCIES += alsa-lib
