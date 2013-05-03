From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  3 May 2013 18:49:02 +0100
Subject: [Buildroot] [PATCH] inotify-tools: install to staging
Message-ID: <1367603342-19774-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

inotify-tools includes a shared library, which should be installed in the
staging directory

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/inotify-tools/inotify-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.8.1.2
