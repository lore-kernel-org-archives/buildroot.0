From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 22:47:32 +0200
Subject: [Buildroot] [git commit] docs/manual: add list of instrumentation
	steps
Message-ID: <20150505204814.A972B81DAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8548238e95491b98c2b6565c9bf31ee07cae13f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The names of steps are not obvious, so add this list to the manual.

Small formatting fix at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/debugging-buildroot.txt |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/docs/manual/debugging-buildroot.txt b/docs/manual/debugging-buildroot.txt
index b97f633..f575fc4 100644
--- a/docs/manual/debugging-buildroot.txt
+++ b/docs/manual/debugging-buildroot.txt
@@ -12,8 +12,8 @@ space-separated list, you want called before and after each step. The
 scripts are called in sequence, with three parameters:
 
   - +start+ or +end+ to denote the start (resp. the end) of a step;
-  - the name of the step about to be started, or which just ended.
-  - the name of the package
+  - the name of the step about to be started, or which just ended;
+  - the name of the package.
 
 For example :
 
@@ -21,7 +21,18 @@ For example :
 make BR2_INSTRUMENTATION_SCRIPTS="/path/to/my/script1 /path/to/my/script2"
 ----
 
-That script has access to the following variables:
+The list of steps is:
+
+  - +extract+
+  - +patch+
+  - +configure+
+  - +build+
+  - +install-host+, when a host-package is installed in +$(HOST_DIR)+
+  - +install-target+, when a target-package is installed in +$(TARGET_DIR)+
+  - +install-staging+, when a target-package is installed in +$(STAGING_DIR)+
+  - +install-image+, when a target-package installs files in +$(BINARIES_DIR)+
+
+The script has access to the following variables:
 
   - +BR2_CONFIG+: the path to the Buildroot .config file
   - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
