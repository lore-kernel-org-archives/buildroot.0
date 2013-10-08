From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 16:55:32 +0200
Subject: [Buildroot] [git commit] mediastreamer: bump to version 2.9.0
Message-ID: <20131008150944.1A1529B8FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5be8de0a5d78df60e3cbd24be31f9f434cab4763
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the fallout from commit 280a387737ed72a2dd844253eeb64cc373ca7656
which didn't test building things that links against ortp, fixing:
http://autobuild.buildroot.net/results/ac6/ac69ff3332713e3a6681fd1d418f1cb9c1941098

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mediastreamer/mediastreamer.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 5093df7..52a5b5a 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-MEDIASTREAMER_VERSION = 2.8.2
+MEDIASTREAMER_VERSION = 2.9.0
 MEDIASTREAMER_SITE = http://download.savannah.nongnu.org/releases/linphone/mediastreamer
 MEDIASTREAMER_INSTALL_STAGING = YES
 MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkgconf ortp host-gettext
 # tests fail linking on some architectures, so disable them
-MEDIASTREAMER_CONF_OPT = --disable-tests
+MEDIASTREAMER_CONF_OPT = --disable-tests --disable-glx --disable-strict
 MEDIASTREAMER_LICENSE = GPLv2+
 MEDIASTREAMER_LICENSE_FILES = COPYING
 
