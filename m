From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jun 2010 23:07:12 +0200
Subject: [Buildroot] [git commit master 1/1] docs: Document location of
	.config for out-of-tree builds
Message-ID: <20100621210813.1E60E817F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cd7459b4eef742069f7796c4dfceed8facbfab68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/README         |    2 +-
 docs/buildroot.html |    6 ++++++
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/docs/README b/docs/README
index 022936b..c330a60 100644
--- a/docs/README
+++ b/docs/README
@@ -35,7 +35,7 @@ make command line, E.G.:
 
 $ make O=/tmp/build
 
-And all the output files will be located under /tmp/build.
+And all the output files (including .config) will be located under /tmp/build.
 
 More finegrained configuration:
 ===============================
diff --git a/docs/buildroot.html b/docs/buildroot.html
index 37d3876..71bd72b 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -281,6 +281,12 @@ or
     <p>All the output files will be located under
     <code>/tmp/build</code>.</p>
 
+    <p>When using out-of-tree builds, the Buildroot
+    <code>.config</code> and  temporary files are also stored in the
+    output directory. This means that you can safely run multiple
+    builds in parallel using the same source tree as long as they use
+    unique output directories.</p>
+
     <h3><a name="environment_variables" id="environment_variables"></a>
     Environment variables</h3>
 
-- 
1.7.1
