From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 21:51:37 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/lmbench: mark
 scripts/build as bash script
Message-ID: <20190624195256.CC0A788564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ededb6cf77eef64df3ffa919cdd463a81f7a1e3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

scripts/build makes use of the "+=" operator which is not supported by
a pure POSIX shell. We switch to /bin/bash in order to avoid errors of
the form:

    ../scripts/build: 21: ../scripts/build: LDLIBS+= -lm: not found

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 037d5ffcb67dc72d37db7a0383145e9e99b36fc7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-scripts-build-use-bin-bash-as-shell.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch b/package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch
new file mode 100644
index 0000000000..b7e1dc64d0
--- /dev/null
+++ b/package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch
@@ -0,0 +1,28 @@
+From 02a538c2b4b54b41d23dbd7668714ea4d2016131 Mon Sep 17 00:00:00 2001
+From: Markus Mayer <mmayer@broadcom.com>
+Date: Thu, 13 Jun 2019 12:27:04 -0700
+Subject: [PATCH] scripts/build: use /bin/bash as shell
+
+scripts/build makes use of the "+=" operator which is not supported by
+/bin/sh. We switch to /bin/bash in order to avoid errors of the form
+
+    ../scripts/build: 21: ../scripts/build: LDLIBS+= -lm: not found
+
+Signed-off-by: Markus Mayer <mmayer@broadcom.com>
+---
+ scripts/build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/build b/scripts/build
+index 34a1371d0056..60b755cd2320 100755
+--- a/scripts/build
++++ b/scripts/build
+@@ -1,4 +1,4 @@
+-#!/bin/sh
++#!/bin/bash
+ 
+ CC=${CC-`../scripts/compiler`}
+ MAKE=${MAKE-`../scripts/make`}
+-- 
+2.17.1
+
