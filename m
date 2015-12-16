From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Dec 2015 22:44:29 +0100
Subject: [Buildroot] [PATCH 1/2] package/gnupg2: fix build with musl
In-Reply-To: <cover.1450302183.git.yann.morin.1998@free.fr>
References: <cover.1450302183.git.yann.morin.1998@free.fr>
Message-ID: <ea05db285850a9ea615a3893a6e18f07b9dca221.1450302183.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a missing include to get select().

Fixes:
    http://autobuild.buildroot.org/results/8b2/8b282f546dc36f4bf9c25721cdf922c7a7ba340b/
    http://autobuild.buildroot.org/results/dc1/dc192255b1fcae18db8b98e65309e5c1493bdbc1/
    http://autobuild.buildroot.org/results/4c0/4c0ab2b28500a28945da3f4df742d8c2e2f21cd0/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gnupg2/0002-missing-include.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/gnupg2/0002-missing-include.patch

diff --git a/package/gnupg2/0002-missing-include.patch b/package/gnupg2/0002-missing-include.patch
new file mode 100644
index 0000000..f20994c
--- /dev/null
+++ b/package/gnupg2/0002-missing-include.patch
@@ -0,0 +1,15 @@
+tools/watchgnupg: select() is from sys/select.h
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN gnupg2-2.0.29.orig/tools/watchgnupg.c gnupg2-2.0.29/tools/watchgnupg.c
+--- gnupg2-2.0.29.orig/tools/watchgnupg.c	2015-09-08 14:39:24.000000000 +0200
++++ gnupg2-2.0.29/tools/watchgnupg.c	2015-12-16 18:17:17.758057787 +0100
+@@ -32,6 +32,7 @@
+ #include <sys/un.h>
+ #include <fcntl.h>
+ #include <time.h>
++#include <sys/select.h>
+ 
+ #define PGM "watchgnupg"
+ 
-- 
1.9.1
