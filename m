From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Sep 2015 13:08:50 +0100
Subject: [Buildroot] [PATCH] webkitgtk24: fix compilation failure due to
	unicode quotes
Message-ID: <1441195730-38798-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported in this upstream bug...

https://bugs.webkit.org/show_bug.cgi?id=128971

...the pretty unicode double quotes break Python stdin. Backporting the
patch that was attached to that bug report and tweak it minimally to
make it apply on Buildroot.

Fixes:

  http://autobuild.buildroot.net/results/c8e/c8ea1cab0a1ee081f9bca994ff5309ea0117d692/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...etty-quotes-in-licence-break-Python-stdin.patch |   36 ++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 package/webkitgtk24/0003-Pretty-quotes-in-licence-break-Python-stdin.patch

diff --git a/package/webkitgtk24/0003-Pretty-quotes-in-licence-break-Python-stdin.patch b/package/webkitgtk24/0003-Pretty-quotes-in-licence-break-Python-stdin.patch
new file mode 100644
index 0000000..df51078
--- /dev/null
+++ b/package/webkitgtk24/0003-Pretty-quotes-in-licence-break-Python-stdin.patch
@@ -0,0 +1,36 @@
+Pretty quotes in licence break Python stdin.
+
+This patch was submitted upstream in this bug report:
+
+https://bugs.webkit.org/show_bug.cgi?id=128971
+
+[Vincent: tweak the patch to make it apply on Buildroot]
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+Pretty quotes in licence break Python stdin.
+
+https://bugs.webkit.org/show_bug.cgi?id=128971
+
+--- a/Source/WebCore/xml/XMLViewer.css	2014-01-23 16:49:58.000000000 +0000
++++ b/Source/WebCore/xml/XMLViewer.css
+@@ -14,7 +14,7 @@
+  * distribution.
+  *
+  * THIS SOFTWARE IS PROVIDED BY GOOGLE INC. AND ITS CONTRIBUTORS
+- * ???AS IS??? AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+  * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL GOOGLE INC.
+  * OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+--- a/Source/WebCore/xml/XMLViewer.js	2014-01-23 16:49:58.000000000 +0000
++++ b/Source/WebCore/xml/XMLViewer.js
+@@ -15,7 +15,7 @@
+  * distribution.
+  *
+  * THIS SOFTWARE IS PROVIDED BY GOOGLE INC. AND ITS CONTRIBUTORS
+- * ???AS IS??? AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+  * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL GOOGLE INC.
+  * OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
-- 
1.7.1
