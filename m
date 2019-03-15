From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:46:41 +0100
Subject: [Buildroot] [git commit] package/ulogd: fix musl build
Message-ID: <20190315205531.0CBAD7FFDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=040df7714eaedc4b9079293e4437eee7567738d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/26fefd491a8a313c12d62c5f522ddfd48decf6c9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-ulogd-fix-build-with-musl-libc.patch      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch b/package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000000..af6e13648c
--- /dev/null
+++ b/package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch
@@ -0,0 +1,32 @@
+From 675e762091380590f78ff07a94a25caa459b786b Mon Sep 17 00:00:00 2001
+From: Cameron Norman <camerontnorman@gmail.com>
+Date: Sat, 27 Oct 2018 13:05:45 -0700
+Subject: ulogd: fix build with musl libc
+
+The attached patch fixes building ulogd2 with musl libc. It is being
+used on Void Linux right now.
+
+Closes: https://bugzilla.netfilter.org/show_bug.cgi?id=1278
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrrieved from:
+https://git.netfilter.org/ulogd2/commit/?id=675e762091380590f78ff07a94a25caa459b786b]
+---
+ src/ulogd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ulogd.c b/src/ulogd.c
+index b8bc57c..9cd64e8 100644
+--- a/src/ulogd.c
++++ b/src/ulogd.c
+@@ -65,6 +65,7 @@
+ #include <sys/time.h>
+ #include <sys/stat.h>
+ #include <sched.h>
++#include <limits.h>
+ #include <ulogd/conffile.h>
+ #include <ulogd/ulogd.h>
+ #ifdef DEBUG
+-- 
+cgit v1.2.1
+
