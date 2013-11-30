From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Nov 2013 09:03:23 +0100
Subject: [Buildroot] [git commit] libiscsi: Call autoreconf to use
	buildroot's libtool
Message-ID: <20131130080744.7FE339BD0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=155d27303e63f8b906191bcce74ea4c6f63332da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use updated libtool from buildroot to fix MIPS64/n64 build problems
http://autobuild.humanoidz.org/results/a9a/a9aa506a591581e413dc38c53d0e56bec5970634/build-end.log

[Peter: add comment explaining why]
Acked-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiscsi/libiscsi.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index 5a29923..eddde33 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -10,5 +10,7 @@ LIBISCSI_LICENSE         = GPLv2+ LGPLv2.1+
 LIBISCSI_LICENSE_FILES   = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
 LIBISCSI_DEPENDENCIES    = popt
+# fixes MIPS64 link failure
+LIBISCSI_AUTORECONF      = YES
 
 $(eval $(autotools-package))
