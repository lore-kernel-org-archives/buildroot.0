From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:08:19 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/live555: license
 is now LGPL-3.0+ and not LGPL-2.1+
Message-ID: <20200828160349.23BDE81931@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa1773ea21954283c3b4ca59d4e6a719cb6251f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The live555 source code includes both a COPYING file (with the GPL-3.0
license text) and a COPYING.LESSER file (with the LGPL-3.0 license
text). However, all source files indicate a LGPL-3.0 license, and none
of them indicate a GPL-3.0 license. In addition,
http://live555.com/liveMedia/faq.html#copyright-and-license says the
source code is under the LGPL.

So, we:

- Bump LGPL License to 3.0+
- Add a comment about the GPL-3.0 license

Fixes:

- https://bugs.busybox.net/show_bug.cgi?id=13156

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 650c5408bd944270f965b4ee5cbc6126c332fc9f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.hash | 4 ++--
 package/live555/live555.mk   | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index f5df69f24f..2072b0ddfc 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,5 +1,5 @@
 # From http://www.live555.com/liveMedia/public/live555-latest-md5.txt
 md5 12e105c8fef9d34658d68367dc26a3d9 live.2019.09.30.tar.gz
 # Locally generated
-sha256 ef44f48a84324525cebc2081dd2d0f1e908f2d0a79d9d30dd41967e142dfb06b  live.2019.09.30.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  ef44f48a84324525cebc2081dd2d0f1e908f2d0a79d9d30dd41967e142dfb06b  live.2019.09.30.tar.gz
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index cbe1c1bc0d..81c8b3de8d 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -7,8 +7,12 @@
 LIVE555_VERSION = 2019.09.30
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
-LIVE555_LICENSE = LGPL-2.1+
-LIVE555_LICENSE_FILES = COPYING
+# There is a COPYING file with the GPL-3.0 license text, but none of
+# the source files appear to be released under GPL-3.0, and the
+# project web site says it's licensed under the LGPL:
+# http://live555.com/liveMedia/faq.html#copyright-and-license
+LIVE555_LICENSE = LGPL-3.0+
+LIVE555_LICENSE_FILES = COPYING.LESSER
 LIVE555_INSTALL_STAGING = YES
 
 LIVE555_CFLAGS = $(TARGET_CFLAGS)
