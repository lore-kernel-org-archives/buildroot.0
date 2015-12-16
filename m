From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 23:38:38 +0100
Subject: [Buildroot] [git commit] package/gnupg2: fix build with musl
Message-ID: <20151216224311.F091A822E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35a8bcfad949a9eb37411c8fad4aef8305f90142
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a missing include to get select().

Fixes:
    http://autobuild.buildroot.org/results/8b2/8b282f546dc36f4bf9c25721cdf922c7a7ba340b/
    http://autobuild.buildroot.org/results/dc1/dc192255b1fcae18db8b98e65309e5c1493bdbc1/
    http://autobuild.buildroot.org/results/4c0/4c0ab2b28500a28945da3f4df742d8c2e2f21cd0/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/0002-missing-include.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

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
