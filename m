From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 20 May 2013 13:42:25 +0100
Subject: [Buildroot] [PATCH] ed: Fix quiet building
Message-ID: <1369053745-25578-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

The configure script is a custom one, and '-q' is not supported.
It fixes the following problem when building using 'make -s'

configure: Unrecognized option: "-q"; use --help for usage.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/ed/ed.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 2bb8e0e..d29239f 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -11,4 +11,8 @@ ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 ED_LICENSE = GPLv3+
 ED_LICENSE_FILES = COPYING
 
+# The configure script is not a standard autotools one
+# and the '-q' option is not supported.
+QUIET=
+
 $(eval $(autotools-package))
-- 
1.8.2.1
