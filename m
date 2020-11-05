From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Nov 2020 17:30:23 +0100
Subject: [Buildroot] [PATCH 5/5] docs/manual: add some minimal documentation
 about show-info and pkg-stats
In-Reply-To: <20201105163024.1387248-1-thomas.petazzoni@bootlin.com>
References: <20201105163024.1387248-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201105163024.1387248-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.26.2
