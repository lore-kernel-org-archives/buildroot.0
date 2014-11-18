From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Nov 2014 12:28:36 +0200
Subject: [Buildroot] [PATCH] coreutils: disable documentation build
Message-ID: <6eb52607527cefc15203eb26da99044fe6c6e3cd.1416306516.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The makeinfo utility may not be installed on the build machine, and we don't
install documentation anyway.

Fixes:
http://autobuild.buildroot.net/results/b42/b42ceb3128ed832f0dd901a1db8fa3dfd92ce5ef/
http://autobuild.buildroot.net/results/94f/94fcd06b320374f46b340f516c54b7ca726041af/
http://autobuild.buildroot.net/results/c54/c54608ac7e03f14055e2912cf06f6d41d21227c0/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/coreutils/coreutils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 391d2cd40719..e06510e096fe 100644
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
-- 
2.1.3
