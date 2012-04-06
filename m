From: Stephan Hoffmann <sho@relinux.de>
Date: Fri,  6 Apr 2012 18:44:22 +0200
Subject: [Buildroot] [PATCH] Add documentation for <pkg>-rebuild and
	<pkg>-reconfigure
In-Reply-To: <20111128130636.09dee43e@skate>
References: <20111128130636.09dee43e@skate>
Message-ID: <1333730662-21942-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since these two special make targets are very useful but not yet
mentioned in the documentation I added them to the make help and
the manual.

Signed-off-by: Stephan Hoffmann <sho@reLinux.de>
---
 Makefile                            |    2 ++
 docs/manual/rebuilding-packages.txt |    4 ++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 30099d9..3a09417 100644
--- a/Makefile
+++ b/Makefile
@@ -654,6 +654,8 @@ help:
 	@echo
 	@echo 'Build:'
 	@echo '  all                    - make world'
+	@echo '  <package>-rebuild      - force recompile <package>'
+	@echo '  <package>-reconfigure  - force reconfigure <package>'
 	@echo
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index 9a41a88..f247dd0 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -15,6 +15,10 @@ The easiest way to rebuild a single package from scratch is to remove
 its build directory in +output/build+. Buildroot will then re-extract,
 re-configure, re-compile and re-install this package from scratch.
 
+For convenience, most packages support the special make targets
+<package>-reconfigure and <package>-rebuild to repeat the configure
+and build steps.
+
 However, if you don't want to rebuild the package completely from
 scratch, a better understanding of the Buildroot internals is
 needed. Internally, to keep track of which steps have been done and
-- 
1.7.0.4
