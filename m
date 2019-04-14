From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun, 14 Apr 2019 11:51:52 +0200
Subject: [Buildroot] [PATCH v2] package/gettext-tiny: bump version for
 having msgmerge working
In-Reply-To: <dc436ca2-f08b-2d6f-582f-3229bf2cfd3d@micronovasrl.com>
References: <dc436ca2-f08b-2d6f-582f-3229bf2cfd3d@micronovasrl.com>
Message-ID: <20190414095152.18557-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On current version msgmerge doesn't work properly. It exits giving:
fopen: No such file or directory
The problem has been signalled:
https://github.com/sabotage-linux/gettext-tiny/issues/42
and fixed with this commit:
https://github.com/sabotage-linux/gettext-tiny/commit/a597aaebd15ef73a65d67f0d6f746ca7ca812d51

Bump version to latest commit.

Fixes:
http://autobuild.buildroot.net/results/92a/92a43f5dfe4a6df7ab5de7defe078fac58c99d75/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
Changes:
V1->V2: improved commit log

 package/gettext-tiny/gettext-tiny.hash | 2 +-
 package/gettext-tiny/gettext-tiny.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index 7d13054144..4de837da46 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -1,5 +1,5 @@
 # Locally Computed:
-sha256 00b03b08d909021aa5580fb45b6cf0ec45e9084ef94c26f034f03a64a69942bc  gettext-tiny-c6dcdcdef801127549d3906d153c061880d25a73.tar.gz
+sha256 ba7b6960018022d876e39aa723d40b6745823b2ff71dae591d05bbd1b8ec180f  gettext-tiny-73fc3e7ef7e016a3874b632fd0475969d288f309.tar.gz
 sha256 b57aa4fdc1c614c28d41c1e2d5c4090935964c5f86291ba7d1c99ffd1d698b34  LICENSE
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  extra/COPYING
 # From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00008.html
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 7db478d845..23a9d9a057 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_TINY_VERSION = c6dcdcdef801127549d3906d153c061880d25a73
+GETTEXT_TINY_VERSION = 73fc3e7ef7e016a3874b632fd0475969d288f309
 GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
 GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)
 GETTEXT_TINY_INSTALL_STAGING = YES
-- 
2.17.1
