From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 11:06:43 +0200
Subject: [Buildroot] [git commit] nfs-utils: fix build failure caused by
	missing include
Message-ID: <20130913090700.C54A69B750@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=afa2a7cebe1d7c31adfd69548842978ea00f6c75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/a7fabcf61d56bca4bb005a91f8f367ffc8474ea0/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...s-0007-sockaddr-h-needs-stddef-h-for-NULL.patch |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/nfs-utils/nfs-utils-0007-sockaddr-h-needs-stddef-h-for-NULL.patch b/package/nfs-utils/nfs-utils-0007-sockaddr-h-needs-stddef-h-for-NULL.patch
new file mode 100644
index 0000000..8fcf1dd
--- /dev/null
+++ b/package/nfs-utils/nfs-utils-0007-sockaddr-h-needs-stddef-h-for-NULL.patch
@@ -0,0 +1,19 @@
+[PATCH] sockaddr.h: needs stddef.h for NULL
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ support/include/sockaddr.h |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: nfs-utils-1.2.6/support/include/sockaddr.h
+===================================================================
+--- nfs-utils-1.2.6.orig/support/include/sockaddr.h
++++ nfs-utils-1.2.6/support/include/sockaddr.h
+@@ -25,6 +25,7 @@
+ #include <libio.h> 
+ #endif
+ #include <stdbool.h>
++#include <stddef.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+ 
