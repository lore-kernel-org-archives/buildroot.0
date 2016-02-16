From: Martin Bark <martin@barkynet.com>
Date: Tue, 16 Feb 2016 11:21:19 +0000
Subject: [Buildroot] [PATCH 1/2] package/nodejs: update python variable patch
Message-ID: <1455621680-28674-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update 0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
for v5.5.0 to include the js2c.py tool.

Fixes:
http://autobuild.buildroot.net/results/87e9bbbb36f7fe4868d238ef6a7b72eb8cca7052/
http://autobuild.buildroot.net/results/f748c0956f71a7857d5cc9ae7bfe3c14357a078a/

Signed-off-by: Martin Bark <martin@barkynet.com>
---

v1 -> v2
 - new in v2, split out from patch to bump node to v5.6.0
 - hand crafted patch to minimise changes

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 ...hon-variable-instead-of-hardcoding-Python.patch | 25 ++++++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/package/nodejs/5.5.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/5.5.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
index 3104644..4d8d715 100644
--- a/package/nodejs/5.5.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
+++ b/package/nodejs/5.5.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
@@ -16,15 +16,17 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Martin Bark <martin@barkynet.com>
 [yann.morin.1998 at free.fr: adapt to 4.1.2]
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Martin: adapt to 5.5.0]
+Signed-off-by: Martin Bark <martin@barkynet.com>
 ---
  deps/v8/tools/gyp/v8.gyp | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/deps/v8/tools/gyp/v8.gyp b/deps/v8/tools/gyp/v8.gyp
-index c703155..06c0b2b 100644
+index 1e5705d..e2e5dfe 100644
 --- a/deps/v8/tools/gyp/v8.gyp
 +++ b/deps/v8/tools/gyp/v8.gyp
-@@ -1696,14 +1696,14 @@
+@@ -1723,14 +1723,14 @@
                        '<(PRODUCT_DIR)/natives_blob_host.bin',
                      ],
                      'action': [
@@ -41,7 +43,7 @@ index c703155..06c0b2b 100644
                      ],
                    }],
                  ],
-@@ -1712,7 +1712,7 @@
+@@ -1739,7 +1739,7 @@
                    '<(PRODUCT_DIR)/natives_blob.bin',
                  ],
                  'action': [
@@ -50,7 +52,7 @@ index c703155..06c0b2b 100644
                  ],
                }],
              ],
-@@ -1812,7 +1812,7 @@
+@@ -1847,7 +1847,7 @@
              '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
            ],
            'action': [
@@ -59,7 +61,7 @@ index c703155..06c0b2b 100644
              '../../tools/js2c.py',
              '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
              'CORE',
-@@ -1838,7 +1838,7 @@
+@@ -1873,7 +1873,7 @@
              '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
            ],
            'action': [
@@ -68,7 +70,16 @@ index c703155..06c0b2b 100644
              '../../tools/js2c.py',
              '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
              'EXPERIMENTAL',
-@@ -1863,7 +1863,7 @@
+@@ -1898,7 +1898,7 @@
+             '<(SHARED_INTERMEDIATE_DIR)/code-stub-libraries.cc',
+           ],
+           'action': [
+-            'python',
++            '<(python)',
+             '../../tools/js2c.py',
+             '<(SHARED_INTERMEDIATE_DIR)/code-stub-libraries.cc',
+             'CODE_STUB',
+@@ -1923,7 +1923,7 @@
              '<(SHARED_INTERMEDIATE_DIR)/extras-libraries.cc',
            ],
            'action': [
@@ -77,7 +88,7 @@ index c703155..06c0b2b 100644
              '../../tools/js2c.py',
              '<(SHARED_INTERMEDIATE_DIR)/extras-libraries.cc',
              'EXTRAS',
-@@ -1900,7 +1900,7 @@
+@@ -1960,7 +1960,7 @@
                '<(SHARED_INTERMEDIATE_DIR)/debug-support.cc',
              ],
              'action': [
-- 
2.5.0
