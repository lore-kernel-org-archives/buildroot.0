From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Mar 2014 16:44:43 +0100
Subject: [Buildroot] [git commit] mtools: fix target compilation
Message-ID: <20140320155006.1E0DF9C1EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42aca737b4520d457bea59dc9cb421a0ae6255bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It needs some help regarding setpgrp, fixes:
http://autobuild.buildroot.net/results/33e/33e38bf1c30cc09dbe992dfb95c48997ca860212/
Also disable X11 support since it picks up the host variant.
And use normal indentation for variables.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtools/mtools.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 6d8f44b..4880245 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-MTOOLS_VERSION       = 4.0.18
-MTOOLS_SOURCE        = mtools-$(MTOOLS_VERSION).tar.bz2
-MTOOLS_SITE          = $(BR2_GNU_MIRROR)/mtools/
-MTOOLS_LICENSE       = GPLv3+
+MTOOLS_VERSION = 4.0.18
+MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.bz2
+MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools/
+MTOOLS_LICENSE = GPLv3+
 MTOOLS_LICENSE_FILES = COPYING
+MTOOLS_CONF_ENV = ac_cv_func_setpgrp_void=yes
+MTOOLS_CONF_OPT = --without-x
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
