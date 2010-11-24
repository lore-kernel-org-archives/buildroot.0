From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Nov 2010 15:38:36 +0100
Subject: [Buildroot] [PATCH 2/8] documentation: Tell not to use make -jN
In-Reply-To: <cover.1290609511.git.thomas.petazzoni@free-electrons.com>
References: <cover.1290609511.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f6ec679f7b290489e177457ae40bce28371a8d88.1290609511.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 0b87bff..571414b 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -182,6 +182,12 @@
  $ make
 </pre>
 
+    <p>You <b>should never</b> use <code>make -jN</code> with
+    Buildroot: it does not support <i>top-level parallel
+    make</i>. Instead, use the <code>BR2_JLEVEL</code> option to tell
+    Buildroot to run each package compilation with <pre>make
+    -jN</pre>.</p>
+
     <p>This command will generally perform the following steps:</p>
     <ul>
       <li>Download source files (as required)</li>
-- 
1.7.0.4
