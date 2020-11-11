From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 12:09:41 +0100
Subject: [Buildroot] [git commit] docs/manual: add some minimal
 documentation about show-info and pkg-stats
Message-ID: <20201111110343.B46EB82A90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b9d3dedbb1c690850fc222609cfa7f9613ef8b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/common-usage.txt | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 7cfda10365..9ba87a8339 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -157,6 +157,29 @@ your filesystem, those parts may not be all-zeroes when read back). You
 should only use sparse files when handling files on the build machine, not
 when transferring them to an actual device that will be used on the target.
 
+=== Details about packages
+
+[[package-details]]
+
+Buildroot can produce a JSON blurb that describes the set of enabled
+packages in the current configuration, together with their
+dependencies, licenses and other metadata. This JSON blurb is produced
+by using the +show-info+ make target:
+
+------------------------
+make show-info
+------------------------
+
+Buildroot can also produce details about packages as HTML and JSON
+output using the +pkg-stats+ make target. Amongst other things, these
+details include whether known CVEs (security vulnerabilities) affect
+the packages in your current configuration. It also shows if there is
+a newer upstream version for those packages.
+
+------------------------
+make pkg-stats
+------------------------
+
 === Graphing the dependencies between packages
 
 [[graph-depends]]
