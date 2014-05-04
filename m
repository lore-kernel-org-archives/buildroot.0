From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 May 2014 20:53:46 +0200
Subject: [Buildroot] [git commit] libfribidi: bump version
Message-ID: <20140504192453.2DCE79CACC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5693f236a2a0e3ec0a5166b403eec1c350a2d7c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch also call autoreconf in order to use buildroot's libtool as
buildroot's libtool patch doesn't apply to the upstream ltmain.sh.

[Peter: clarified the need for AUTORECONF]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfribidi/libfribidi.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 99005c2..c9130fe 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 0.19.5
+LIBFRIBIDI_VERSION = 0.19.6
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
 LIBFRIBIDI_SITE = http://www.fribidi.org/download/
 LIBFRIBIDI_LICENSE = LGPLv2.1+
 LIBFRIBIDI_LICENSE_FILES = COPYING
 LIBFRIBIDI_INSTALL_STAGING = YES
+# BR's libtool patch doesn't apply
+LIBFRIBIDI_AUTORECONF = YES
 
 $(eval $(autotools-package))
