From: Romain Naour <romain.naour@smile.fr>
Date: Sun,  8 Mar 2020 19:35:33 +0100
Subject: [Buildroot] [PATCH 2/4] package/optee-test: use python3 instead of
 python
In-Reply-To: <20200308183535.1206604-1-romain.naour@smile.fr>
References: <20200308183535.1206604-1-romain.naour@smile.fr>
Message-ID: <20200308183535.1206604-2-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
TypeError: cannot use a str to initialize an array with typecode 'B'
  File "../../scripts/file_to_c.py", line 32, in main
    for x in array.array("B", inf.read()):
    for x in array.array("B", inf.read()):
TypeError: cannot use a str to initialize an array with typecode 'B'
TypeError: cannot use a str to initialize an array with typecode 'B'

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../0001-use-python3-instead-of-python.patch  | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/optee-test/0001-use-python3-instead-of-python.patch

diff --git a/package/optee-test/0001-use-python3-instead-of-python.patch b/package/optee-test/0001-use-python3-instead-of-python.patch
new file mode 100644
index 0000000000..2765a980db
--- /dev/null
+++ b/package/optee-test/0001-use-python3-instead-of-python.patch
@@ -0,0 +1,50 @@
+From cc3cb798375c5f47ea5c7579f32060933435e231 Mon Sep 17 00:00:00 2001
+From: Scott Branden <scott.branden@broadcom.com>
+Date: Fri, 27 Dec 2019 12:54:28 -0800
+Subject: [PATCH] use python3 instead of python
+
+use python3 instead of python as python2 is EOL January 2020.
+
+Signed-off-by: Scott Branden <scott.branden@broadcom.com>
+Reviewed-by: Jerome Forissier <jerome@forissier.org>
+Tested-by: Jerome Forissier <jerome@forissier.org> (QEMU, CFG_GCM_NIST_VECTORS=y)
+
+(cherry picked from commit 6271160639002a2580d80b75b5397a96d56329f2)
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ scripts/file_to_c.py       | 4 ++--
+ scripts/rsp_to_gcm_test.py | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/file_to_c.py b/scripts/file_to_c.py
+index ae16f52..b4ce2a2 100755
+--- a/scripts/file_to_c.py
++++ b/scripts/file_to_c.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # SPDX-License-Identifier: BSD-2-Clause
+ #
+ # Copyright (c) 2018, Linaro Limited
+@@ -29,7 +29,7 @@ def main():
+ 
+     f.write("const uint8_t " + args.name + "[] = {\n")
+     i = 0
+-    for x in array.array("B", inf.read()):
++    for x in array.array("B", map(ord, (inf.read()))):
+         f.write("0x" + '{0:02x}'.format(x) + ",")
+         i = i + 1
+         if i % 8 == 0:
+diff --git a/scripts/rsp_to_gcm_test.py b/scripts/rsp_to_gcm_test.py
+index 0543541..e4418be 100755
+--- a/scripts/rsp_to_gcm_test.py
++++ b/scripts/rsp_to_gcm_test.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ modes = {'encrypt': 0, 'decrypt': 1}
+ 
+-- 
+2.24.1
+
-- 
2.24.1
