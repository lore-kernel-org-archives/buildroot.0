From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu,  4 Apr 2019 16:31:32 +0200
Subject: [Buildroot] [PATCH] package/gettext-tiny: bump version to add
 --template option
Message-ID: <20190404143132.7416-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some package(i.e. rygel) uses gettext-tiny msgfmt with --template option
to build, but current version(0.3.1) doesn't support --template flag and
exits giving:
"fopen: No such file or directory"
On master branch they've added support for --template after lot of
modifications, so it's hard to produce a patch to be applied against
0.3.1.

Then bump version to latest master branch commit.

Fixes:
http://autobuild.buildroot.net/results/77b/77b1854c914915d3205d915a0f01001f6f3555df/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/gettext-tiny/gettext-tiny.hash | 2 +-
 package/gettext-tiny/gettext-tiny.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index 672e964186..7d13054144 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -1,5 +1,5 @@
 # Locally Computed:
-sha256 654dcd52f2650476c8822b60bee89c20a0aa7f6a1bf6001701eeacd71a9e388b  gettext-tiny-v0.3.1.tar.gz
+sha256 00b03b08d909021aa5580fb45b6cf0ec45e9084ef94c26f034f03a64a69942bc  gettext-tiny-c6dcdcdef801127549d3906d153c061880d25a73.tar.gz
 sha256 b57aa4fdc1c614c28d41c1e2d5c4090935964c5f86291ba7d1c99ffd1d698b34  LICENSE
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  extra/COPYING
 # From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00008.html
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 881edc6f35..e3a6d11399 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_TINY_VERSION = v0.3.1
+GETTEXT_TINY_VERSION = c6dcdcdef801127549d3906d153c061880d25a73
 GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
 GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)
 GETTEXT_TINY_INSTALL_STAGING = YES
-- 
2.17.1
