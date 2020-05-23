From: Joachim Nilsson <troglobit@gmail.com>
Date: Sat, 23 May 2020 16:05:03 +0200
Subject: [Buildroot] [PATCH] docs/manual: new chapter on release engineering
Message-ID: <20200523140503.2149568-1-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Describe release engineering and development phases of the project.

Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
---
 docs/manual/manual.txt              |  2 ++
 docs/manual/release-engineering.txt | 34 +++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 docs/manual/release-engineering.txt

diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index b76ab40d40..48de65ee10 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -66,6 +66,8 @@ include::contribute.txt[]
 
 include::developers.txt[]
 
+include::release-engineering.txt[]
+
 = Appendix
 
 include::appendix.txt[]
diff --git a/docs/manual/release-engineering.txt b/docs/manual/release-engineering.txt
new file mode 100644
index 0000000000..0cf38183f9
--- /dev/null
+++ b/docs/manual/release-engineering.txt
@@ -0,0 +1,34 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[RELENG]]
+== Release Engineering
+=== Releases
+
+The Buildroot project makes quarterly releases with monthly bugfix
+releases.  The first release of each year is a long term support
+release, LTS.
+
+ - Quarterly releases: 2020.02, 2020.05, 2020.08, and 2020.11
+ - Bugfix releases: 2020.02.1, 2020.02.2, ...
+ - LTS releases: 2020.02, 2021.02, ...
+
+Releases are supported until the first bugfix release of the next
+release, e.g., 2020.05.x is EOL when 2020.08.1 is released.
+
+LTS releases are supported until the first bugfix release of the next
+LTS, e.g., 2020.02.x is supported until 2021.02.1 is released.
+
+=== Development
+
+Each release cycle consist of two months of development on the +master+
+branch and one month stabilization before the release is made.  During
+this phase no new features are added to +master+, only bugfixes.
+
+The stabilization phase starts with tagging +-rc1+, and every week until
+the release, another release candidate is tagged.
+
+To handle new features and version bumps during the stabilization phase,
+a +next+ branch may be created for these features.  Once the current
+release has been made, the +next+ branch is merged into +master+ and
+the development cycle for the next release continues there.
-- 
2.25.1
