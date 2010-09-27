From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Sep 2010 22:34:11 +0200
Subject: [Buildroot] [git commit master 1/1] docs/buildroot.html: document
	Makefile wrapper in output dir
Message-ID: <20100927203433.C9AFF8B6D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1110062e465354fdee9ee887024f4a58783533c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For out-of-tree builds.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index edb75b1..b7a8641 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -278,15 +278,30 @@ or
  $ make O=/tmp/build
 </pre>
 
+    <p>Or:</p>
+
+<pre>
+ $ cd /tmp/build; make O=$PWD -C path/to/buildroot
+</pre>
+
     <p>All the output files will be located under
     <code>/tmp/build</code>.</p>
 
     <p>When using out-of-tree builds, the Buildroot
-    <code>.config</code> and  temporary files are also stored in the
+    <code>.config</code> and temporary files are also stored in the
     output directory. This means that you can safely run multiple
     builds in parallel using the same source tree as long as they use
     unique output directories.</p>
 
+    <p>For ease of use, Buildroot generates a Makefile wrapper in the
+    output directory - So after the first run, you no longer need to
+    pass <code>O=..</code> and <code>-C ..</code>, simply run (in the
+    output directory):</p>
+
+<pre>
+ $ make &lt;target&gt;
+</pre>
+
     <h3><a name="environment_variables" id="environment_variables"></a>
     Environment variables</h3>
 
-- 
1.7.1
