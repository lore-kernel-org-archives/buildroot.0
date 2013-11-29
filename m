From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2013 12:19:00 +0100
Subject: [Buildroot] [git commit] tvheadend: remove -Werror from CFLAGS
Message-ID: <20131129112040.203EF9BE61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf4ec89bfb0f9ae1ecf37fd070c1e167558ba0d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove -Werror from CFLAGS to avoid build failures caused by warnings.

Fixes the following autobuild failure on MIPS64 n32/64:

   http://autobuild.buildroot.net/results/6be/6be075726ac6db0a48dd6b535841ada932c9ffbb/

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../tvheadend/tvheadend-003-remove-werror.patch    |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/tvheadend/tvheadend-003-remove-werror.patch b/package/tvheadend/tvheadend-003-remove-werror.patch
new file mode 100644
index 0000000..1b0e687
--- /dev/null
+++ b/package/tvheadend/tvheadend-003-remove-werror.patch
@@ -0,0 +1,15 @@
+tvheadend: remove -Werror from CFLAGS
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+--- tvheadend-2b649954346aa2e9c81834d500a25c528f31f829/Makefile.orig	2013-11-28 15:52:52.284041848 +0000
++++ tvheadend-2b649954346aa2e9c81834d500a25c528f31f829/Makefile	2013-11-28 15:53:03.715220194 +0000
+@@ -27,7 +27,7 @@ PROG    := $(BUILDDIR)/tvheadend
+ # Common compiler flags
+ #
+ 
+-CFLAGS  += -Wall -Werror -Wwrite-strings -Wno-deprecated-declarations
++CFLAGS  += -Wall -Wwrite-strings -Wno-deprecated-declarations
+ CFLAGS  += -Wmissing-prototypes -fms-extensions
+ CFLAGS  += -g -funsigned-char -O2 
+ CFLAGS  += -D_FILE_OFFSET_BITS=64
