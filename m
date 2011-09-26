From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Sep 2011 22:24:18 +0200
Subject: [Buildroot] [git commit] valgrind: workaround for segmentation
	fault on PowerPC
Message-ID: <20110926204531.6E44C8DA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6bad62cb7806bbbc1b6a2ebecda4298868a1a4e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../valgrind-3.6.1-workaround-SIGSEGV-on-PPC.patch |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/valgrind/valgrind-3.6.1-workaround-SIGSEGV-on-PPC.patch b/package/valgrind/valgrind-3.6.1-workaround-SIGSEGV-on-PPC.patch
new file mode 100644
index 0000000..a788511
--- /dev/null
+++ b/package/valgrind/valgrind-3.6.1-workaround-SIGSEGV-on-PPC.patch
@@ -0,0 +1,28 @@
+From db894abcaa12555f60880a15840010f81d354806 Mon Sep 17 00:00:00 2001
+From: Pierre Habouzit <madcoder@debian.org>
+Date: Tue, 10 May 2011 23:11:45 +0200
+Subject: [PATCH] workaround SIGSEGV on PPC.
+
+Signed-off-by: Pierre Habouzit <madcoder@debian.org>
+---
+ coregrind/m_machine.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/coregrind/m_machine.c b/coregrind/m_machine.c
+index 8dc3e17..7921502 100644
+--- a/coregrind/m_machine.c
++++ b/coregrind/m_machine.c
+@@ -28,6 +28,10 @@
+    The GNU General Public License is contained in the file COPYING.
+ */
+ 
++#ifdef __powerpc__
++#  pragma GCC optimize ("-O0")
++#endif
++
+ #include "pub_core_basics.h"
+ #include "pub_core_vki.h"
+ #include "pub_core_threadstate.h"
+-- 
+1.7.5.1.290.g2095dc
+
