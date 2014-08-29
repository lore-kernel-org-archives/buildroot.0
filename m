From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Aug 2014 10:00:43 +0200
Subject: [Buildroot] [git commit] lftp: add missing host-pkgconf dependency
Message-ID: <20140829080058.B4CFD9D537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9ad5ddfb1544a61c271354a1070edfec730bda4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lftp configure.ac uses PKG_CHECK_MODULES, so it must have host-pkgconf
in its dependency, otherwise the autoreconf step fails due to the lack
of pkg.m4.

Fixes:

  http://autobuild.buildroot.org/results/b16/b16d964f275d4d8703665236b969cc19f7ef20be/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lftp/lftp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 431fadb..ac0f63b 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -9,7 +9,7 @@ LFTP_SITE    = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
 LFTP_LICENSE_FILES = COPYING
 LFTP_AUTORECONF = YES
-LFTP_DEPENDENCIES  = readline zlib
+LFTP_DEPENDENCIES = readline zlib host-pkgconf
 
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
 LFTP_CONF_OPT += --with-modules
