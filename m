From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Oct 2015 22:23:07 +0200
Subject: [Buildroot] [git commit] sconeserver: use direct imagemagick disable
Message-ID: <20151015202351.7671781ED4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a41594ae2c1c9f5d773162e42bd992dbc21c16d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disabling sconesite image isn't enough to avoid imagemagick
autodetection, and if it's present in the host (distro) but not in the
target it gets automatically picked up. Fixes:
http://autobuild.buildroot.net/results/377/37705926f3023395c54af0532ff95f0125fbaa66/

Also add a comment about autoreconf.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sconeserver/sconeserver.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index beca926..2072142 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -10,7 +10,7 @@ SCONESERVER_VERSION = 3b886c3dda6eda39bcb27472d29ed7fd3185ba1d
 SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
 SCONESERVER_LICENSE = GPLv2+
 SCONESERVER_LICENSE_FILES = COPYING
-
+# For 0001-fix-ssl-libs-ordering.patch and configure isn't up to date
 SCONESERVER_AUTORECONF = YES
 SCONESERVER_DEPENDENCIES += pcre
 SCONESERVER_CONF_OPTS += --with-ip --with-local --with-ip6
@@ -50,7 +50,7 @@ SCONESERVER_CONF_OPTS += \
 	--with-sconesite-image \
 	--with-Magick++-config="$(STAGING_DIR)/usr/bin/Magick++-config"
 else
-SCONESERVER_CONF_OPTS += --without-sconesite-image
+SCONESERVER_CONF_OPTS += --without-sconesite-image --with-Magick++-config=no
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
