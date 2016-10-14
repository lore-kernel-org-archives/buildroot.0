From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 16:52:08 +0200
Subject: [Buildroot] [git commit] package/nut: fix build with musl
Message-ID: <20161014145259.CB2727F995@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c387674c7fafeaf154b0361c9a56c8b4ab0e632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing header, backport from an upstream commit.

Fixes;
    http://autobuild.buildroot.org/results/441/4419b24fff68dbddf488003100b6abd7b3cd5576/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../nut/0003-client-ups-add-missing-include.patch  | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/nut/0003-client-ups-add-missing-include.patch b/package/nut/0003-client-ups-add-missing-include.patch
new file mode 100644
index 0000000..78472cd
--- /dev/null
+++ b/package/nut/0003-client-ups-add-missing-include.patch
@@ -0,0 +1,29 @@
+From da0969b26ad4bb839bcb88362c8f41aaf0eb8363 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Tue, 11 Oct 2016 12:05:36 +0200
+Subject: [PATCH] client/ups: add missing include
+
+struct timeval is declared in sys/time.h, so we need to #include it.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Backported from upstream.
+---
+ clients/upsclient.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/clients/upsclient.c b/clients/upsclient.c
+index 43c0e79..dfadd0d 100644
+--- a/clients/upsclient.c
++++ b/clients/upsclient.c
+@@ -37,6 +37,7 @@
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ #include <fcntl.h>
++#include <sys/time.h>
+ 
+ #include "upsclient.h"
+ #include "common.h"
+-- 
+2.7.4
+
