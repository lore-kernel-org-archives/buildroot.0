From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 7 Apr 2012 19:38:44 +0200
Subject: [Buildroot] [git commit] Add documentation for <pkg>-rebuild and
	<pkg>-reconfigure
Message-ID: <20120407182718.D081E96A35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=040f6a325f7b62c178fb6d17480adbae4e42e745
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since these two special make targets are very useful but not yet
mentioned in the documentation I added them to the make help and
the manual.

Signed-off-by: Stephan Hoffmann <sho@reLinux.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
