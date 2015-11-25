From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 11:24:52 +0100
Subject: [Buildroot] [git commit] gmp: disable assembly for MIPS r6 ISA
Message-ID: <20151125102615.C148F81E03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ec9588a65f4ba3c3f7a08d4679251dd9f56cf20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's still not supported/implemented, fixes:
http://autobuild.buildroot.net/results/d06/d0686b3e7b8884f93034d4ea4b79fa8590ffa221/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gmp/gmp.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index f71a210..96dd6ed 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -12,5 +12,10 @@ GMP_LICENSE = LGPLv3+
 GMP_LICENSE_FILES = COPYING.LESSERv3
 GMP_DEPENDENCIES = host-m4
 
+# GMP doesn't support assembly for r6 ISA yet
+ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+GMP_CONF_OPTS += --disable-assembly
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
