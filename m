From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 22:53:31 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/wmctrl:
 x-includes and x-libraries must be set for cross-compiling
Message-ID: <20180501073415.C5DAD890ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba7372fcd2b46a1617336bd422490533edd9f14d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

set x-includes and x-libraries configure option for cross-compiling.
wmctrl can use poisoned paths if these options are not passed to
configure script.

Fixes:
http://autobuild.buildroot.net/results/7e5/7e5cba8a5650a00e10d1a5528f38cb2bf772aee1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 046c5e25634bbf827c43617bf1967ab469418908)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wmctrl/wmctrl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wmctrl/wmctrl.mk b/package/wmctrl/wmctrl.mk
index 0d4aeebc1d..36ad3513ff 100644
--- a/package/wmctrl/wmctrl.mk
+++ b/package/wmctrl/wmctrl.mk
@@ -11,4 +11,8 @@ WMCTRL_LICENSE_FILES = COPYING
 
 WMCTRL_DEPENDENCIES = libglib2 xlib_libX11 xlib_libXmu
 
+WMCTRL_CONF_OPTS = \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+
 $(eval $(autotools-package))
