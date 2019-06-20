From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jun 2019 13:30:22 +0200
Subject: [Buildroot] [git commit] package/haveged: bump to version 1.9.4
Message-ID: <20190620113224.1B7968212D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bc4189b82ae19e7718ed0dcdefcec0f03233132
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://github.com/jirka-h/haveged/releases/tag/1.9.4

Also change the site location, upstream release
mechanism has switched to using github.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haveged/haveged.hash | 4 ++--
 package/haveged/haveged.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index d1133b6931..d98e1d984b 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,2 +1,2 @@
-# From http://www.issihosts.com/haveged/verify/haveged-1.9.1.sha1
-sha1	ab7234b7f57dbb7d500a5ab3cbf0494715ce6499	haveged-1.9.1.tar.gz
+# Locally calculated
+sha256  c4959d3cb1fa6391d16a3aa1ba4d82cd3a0d497206ae4b87d638088c0664e5aa	haveged-1.9.4.tar.gz
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index a645557bc4..bc1bb2d3ac 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.1
-HAVEGED_SITE = http://www.issihosts.com/haveged
+HAVEGED_VERSION = 1.9.4
+HAVEGED_SITE = $(call github,jirka-h,haveged,$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
 
