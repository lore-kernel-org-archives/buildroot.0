From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 13 Jun 2019 12:50:46 -0700
Subject: [Buildroot] [PATCH v2 1/2] lmbench: mark scripts/build as bash
 script
In-Reply-To: <20190613195047.24870-1-mmayer@broadcom.com>
References: <20190613195047.24870-1-mmayer@broadcom.com>
Message-ID: <20190613195047.24870-2-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

scripts/build makes use of the "+=" operator which is not supported by
/bin/sh. We switch to /bin/bash in order to avoid errors of the form

    ../scripts/build: 21: ../scripts/build: LDLIBS+= -lm: not found

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 ...-scripts-build-use-bin-bash-as-shell.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch

diff --git a/package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch b/package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch
new file mode 100644
index 000000000000..649a5f922454
--- /dev/null
+++ b/package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch
@@ -0,0 +1,28 @@
+From 02a538c2b4b54b41d23dbd7668714ea4d2016131 Mon Sep 17 00:00:00 2001
+From: Markus Mayer <mmayer@broadcom.com>
+Date: Thu, 13 Jun 2019 12:27:04 -0700
+Subject: [PATCH 1/2] scripts/build: use /bin/bash as shell
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
-- 
2.17.1
