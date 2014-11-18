From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 14:08:22 +0100
Subject: [Buildroot] [git commit] coreutils: disable documentation build
Message-ID: <20141118131512.36B92B4869@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fde7a1900d7221eb50805508b8e31ab6ff5121ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The makeinfo utility may not be installed on the build machine, and we don't
install documentation anyway.

Fixes:
http://autobuild.buildroot.net/results/b42/b42ceb3128ed832f0dd901a1db8fa3dfd92ce5ef/
http://autobuild.buildroot.net/results/94f/94fcd06b320374f46b340f516c54b7ca726041af/
http://autobuild.buildroot.net/results/c54/c54608ac7e03f14055e2912cf06f6d41d21227c0/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Karoly Kasza <kaszak@gmail.com>
Acked-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 391d2cd..e06510e 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -51,7 +51,8 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	gl_getline_needs_run_time_check=no \
 	gl_cv_have_proc_uptime=yes \
 	utils_cv_localtime_cache=no \
-	PERL=missing
+	PERL=missing \
+	MAKEINFO=true
 
 COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false \
 	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
