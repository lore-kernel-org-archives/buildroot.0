From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 4 May 2013 13:28:02 +0200
Subject: [Buildroot] [git commit] inotify-tools: install to staging
Message-ID: <20130504113318.1A2A899AA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae47deffa16d5a78e790696a189bfb023c3754cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

inotify-tools includes a shared library, which should be installed in the
staging directory

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/inotify-tools/inotify-tools.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index deb8a8c..a5668a3 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -3,9 +3,11 @@
 # inotify-utils
 #
 #############################################################
+
 INOTIFY_TOOLS_VERSION = 3.14
 INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
 INOTIFY_TOOLS_LICENSE = GPL
 INOTIFY_TOOLS_LICENSE_FILES = COPYING
+INOTIFY_TOOLS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
