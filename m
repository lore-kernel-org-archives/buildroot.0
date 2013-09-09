From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 9 Sep 2013 11:40:44 +0200
Subject: [Buildroot] [git commit] package: don't use .xz format for github
Message-ID: <20130909094042.7C4B39A530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b17472e1fbd51c600304f9e2b060117a89b7646f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/955/955ed1af28f6ff9912adddc0342d1f3ca65e5b4d/

Commit 62146ea3ad7 (change package tarball compression to xz whenever possible)
changed a number of packages to use .xz format tarballs. Unfortunately this
doesn't work for packages from github, as it delivers gzip compressed tarballs
even when a .xz is requested.

Fix it by reverting this change for the packages using github.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cpuload/cpuload.mk                       |    2 --
 package/fb-test-app/fb-test-app.mk               |    1 -
 package/input-event-daemon/input-event-daemon.mk |    1 -
 3 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/cpuload/cpuload.mk b/package/cpuload/cpuload.mk
index c8d1d0c..e0b8ccf 100644
--- a/package/cpuload/cpuload.mk
+++ b/package/cpuload/cpuload.mk
@@ -5,10 +5,8 @@
 ################################################################################
 
 CPULOAD_VERSION = v0.3
-CPULOAD_SOURCE = cpuload-$(CPULOAD_VERSION).tar.xz
 CPULOAD_SITE = http://github.com/kelvincheung/cpuload/tarball/$(CPULOAD_VERSION)
 CPULOAD_LICENSE = GPLv2
 CPULOAD_LICENSE_FILES = COPYING
 
-
 $(eval $(autotools-package))
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index 5b95c29..a2183e0 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 FB_TEST_APP_VERSION = v1.0.0
-FB_TEST_APP_SOURCE = fb-test-app-$(FB_TEST_APP_VERSION).tar.xz
 FB_TEST_APP_SITE = http://github.com/prpplague/fb-test-app/tarball/$(FB_TEST_APP_VERSION)
 FB_TEST_APP_LICENSE = GPLv2
 FB_TEST_APP_LICENSE_FILES = COPYING
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index cbcc2df..762d3c2 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 INPUT_EVENT_DAEMON_VERSION = v0.1.3
-INPUT_EVENT_DAEMON_SOURCE = input-event-daemon-$(INPUT_EVENT_DAEMON_VERSION).tar.xz
 INPUT_EVENT_DAEMON_SITE = http://github.com/gandro/input-event-daemon/tarball/$(INPUT_EVENT_DAEMON_VERSION)
 INPUT_EVENT_DAEMON_LICENSE = input-event-daemon license
 INPUT_EVENT_DAEMON_LICENSE_FILES = README
