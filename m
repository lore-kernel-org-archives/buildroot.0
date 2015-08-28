From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 28 Aug 2015 16:47:44 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: stat.h is need for mode_t
Message-ID: <1440773264-14999-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

fix :
http://autobuild.buildroot.net/results/8e3/8e3afd5f22312f0660f631fdb82bbb64eda913fb/build-end.log

error: 'mode_t' has not been declared

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/0002-stat_t-is-need-for-mode_t.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/gnuradio/0002-stat_t-is-need-for-mode_t.patch

diff --git a/package/gnuradio/0002-stat_t-is-need-for-mode_t.patch b/package/gnuradio/0002-stat_t-is-need-for-mode_t.patch
new file mode 100644
index 0000000..391a12f
--- /dev/null
+++ b/package/gnuradio/0002-stat_t-is-need-for-mode_t.patch
@@ -0,0 +1,13 @@
+Index: gnuradio-3.7.5/gnuradio-runtime/include/gnuradio/logger.h.in
+===================================================================
+--- gnuradio-3.7.5.orig/gnuradio-runtime/include/gnuradio/logger.h.in
++++ gnuradio-3.7.5/gnuradio-runtime/include/gnuradio/logger.h.in
+@@ -44,6 +44,8 @@
+ 
+ #ifdef _MSC_VER
+ typedef unsigned short mode_t;
++#else
++#include <sys/stat.h>
+ #endif
+ 
+ #include <gnuradio/api.h>
-- 
2.4.6
