From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 23:47:28 +0100
Subject: [Buildroot] [git commit master 1/1] findutils: bump to version 4.4.2
Message-ID: <20101222232248.D2CCD8E20B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cd66493d4f698aa227386f157e301ef7cd39c0cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/findutils/findutils.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index a1893ad..7ab6b0b 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -3,8 +3,10 @@
 # findutils
 #
 #############################################################
-FINDUTILS_VERSION:=4.2.31
-FINDUTILS_SOURCE:=findutils-$(FINDUTILS_VERSION).tar.gz
-FINDUTILS_SITE:=$(BR2_GNU_MIRROR)/findutils/
+
+FINDUTILS_VERSION = 4.4.2
+FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
+FINDUTILS_CONF_ENV = gl_cv_func_stdin=yes \
+			gl_cv_func_wcwidth_works=yes
 
 $(eval $(call AUTOTARGETS,package,findutils))
-- 
1.7.2.2
