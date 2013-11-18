From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 18 Nov 2013 14:23:42 +0000
Subject: [Buildroot] [PATCH] libiscsi: Call autoreconf to use buildroot's
	libtool
Message-ID: <1384784622-45380-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use updated libtool from buildroot to fix MIPS64/n64 build problems
http://autobuild.humanoidz.org/results/a9a/a9aa506a591581e413dc38c53d0e56bec5970634/build-end.log

Acked-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libiscsi/libiscsi.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index 5a29923..7277bd9 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -10,5 +10,6 @@ LIBISCSI_LICENSE         = GPLv2+ LGPLv2.1+
 LIBISCSI_LICENSE_FILES   = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
 LIBISCSI_DEPENDENCIES    = popt
+LIBISCSI_AUTORECONF      = YES
 
 $(eval $(autotools-package))
-- 
1.7.1
