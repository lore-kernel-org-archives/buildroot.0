From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 23:20:52 +0200
Subject: [Buildroot] [git commit] gnuradio: sys/types.h is needed for mode_t
Message-ID: <20150829212101.2321E819A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aca921d2affb2e59db828da5ef7c09356d022d89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fix :
http://autobuild.buildroot.net/results/8e3/8e3afd5f22312f0660f631fdb82bbb64eda913fb/build-end.log

error: 'mode_t' has not been declared

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gnuradio/0002-types_t-is-need-for-mode_t.patch |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/gnuradio/0002-types_t-is-need-for-mode_t.patch b/package/gnuradio/0002-types_t-is-need-for-mode_t.patch
new file mode 100644
index 0000000..7730d2d
--- /dev/null
+++ b/package/gnuradio/0002-types_t-is-need-for-mode_t.patch
@@ -0,0 +1,19 @@
+To avoid :
+error: 'mode_t' has not been declared
+sys/types.h must be included 
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+Index: gnuradio-3.7.5/gnuradio-runtime/include/gnuradio/logger.h.in
+===================================================================
+--- gnuradio-3.7.5.orig/gnuradio-runtime/include/gnuradio/logger.h.in
++++ gnuradio-3.7.5/gnuradio-runtime/include/gnuradio/logger.h.in
+@@ -44,6 +44,8 @@
+ 
+ #ifdef _MSC_VER
+ typedef unsigned short mode_t;
++#else
++#include <sys/types.h>
+ #endif
+ 
+ #include <gnuradio/api.h>
