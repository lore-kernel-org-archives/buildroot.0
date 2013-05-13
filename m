From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 May 2013 21:36:39 +0200
Subject: [Buildroot] [git commit] sylpheed: disable gpgme support
Message-ID: <20130513193839.3AF7E9A172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9947ee9fbb94af800b8b054262734e0f81f32250
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a build failure when the build host has gpgme installed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sylpheed/sylpheed.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 12fc18b..1da63de 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -3,6 +3,7 @@
 # sylpheed
 #
 #############################################################
+
 SYLPHEED_VERSION_MAJOR = 3.2
 SYLPHEED_VERSION_MINOR = 0
 SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
@@ -10,9 +11,7 @@ SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
 SYLPHEED_LICENSE = GPLv2+ (executables), LGPLv2.1+ (library, attachment plugin)
 SYLPHEED_LICENSE_FILES = COPYING COPYING.LIB
-
-SYLPHEED_CONF_OPT = --disable-gtkspell
-
+SYLPHEED_CONF_OPT = --disable-gtkspell --disable-gpgme
 SYLPHEED_DEPENDENCIES = host-pkgconf libgtk2
 
 # Remove the -I$(includedir) from the Makefiles
